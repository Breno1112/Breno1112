import { Component, OnInit, HostListener } from '@angular/core';
import { ScreenType } from '../../enums/screen-type.enum';
import { collection, doc, DocumentData, Firestore, getDoc, getDocs, getFirestore, query, QuerySnapshot, where, orderBy } from "firebase/firestore";
import { ResumeMainDTO } from 'src/app/types/resume-main-dto.type';
import { ProfileData } from 'src/app/types/profile-data.type';
import { SkillData } from 'src/app/types/skill-data.type';
import { Education } from 'src/app/types/education.type';
import { Award } from 'src/app/types/award.type';
import { Certification } from 'src/app/types/certification.type';
import { FrameworkAndTool } from 'src/app/types/frameworks-and-tools.type';
import { Language } from 'src/app/types/language.type';
import { ProgrammingLanguage } from 'src/app/types/programming-language.type';
import { WorkExperience } from 'src/app/types/work.experience.type';

@Component({
  selector: 'app-resume-main-screen',
  templateUrl: './resume-main-screen.component.html',
  styleUrls: ['./resume-main-screen.component.css']
})
export class ResumeMainScreenComponent implements OnInit {
  public loaded = false;
  public screenType: ScreenType | undefined = undefined;
  private db: Firestore;
  public resumeMainDTO: ResumeMainDTO

  constructor() {
    this.db = getFirestore();
    this.resumeMainDTO = {};
  }

  @HostListener('window:resize', ['$event'])
  onResize(event: any) {
    this.setScreenType();
  }

  ngOnInit(): void {
    this.setScreenType();
    this.queryData();
  }

  setScreenType() {
    if (window.innerWidth <= 480) {
      this.screenType = ScreenType.MOBILE;
    } else if (window.innerWidth > 480 && window.innerWidth <= 768) {
      this.screenType = ScreenType.DESKTOP;
    } else {
      this.screenType = ScreenType.WIDE;
    }
  }

  checkScreenType(screenType: ScreenType | undefined) {
    if(screenType === undefined) {
      return "";
    }
    const values = Object.values(ScreenType);
    const result = values.indexOf(screenType);
    const to_return = Object.keys(ScreenType)[result];
    this.resumeMainDTO.screenType = to_return;
    return to_return;
  }

  queryData() {
    const promises: Promise<void>[] = [];
    promises.push(this.loadSegments());
    promises.push(this.getProfileData());
    Promise.all(promises).then(_ => {
      this.loaded = true;
    });
  }

  async loadSegments(): Promise<void> {
    const promises: Promise<QuerySnapshot<DocumentData>>[] = [];
    promises.push(this.getProfileSubcollectionData("skills"));
    promises.push(this.getProfileSubcollectionData("education", true));
    promises.push(this.getProfileSubcollectionData("awards", true));
    promises.push(this.getProfileSubcollectionData("certifications", true));
    promises.push(this.getProfileSubcollectionData("frameworks_and_tools"));
    promises.push(this.getProfileSubcollectionData("languages"));
    promises.push(this.getProfileSubcollectionData("programming_languages"));
    promises.push(this.getProfileSubcollectionData("work_experience", true));
    const out = await Promise.all(promises);
    this.resumeMainDTO.skills = out[0].docs.map(item => item.data() as SkillData);
    this.resumeMainDTO.education = out[1].docs.map(item_1 => item_1.data() as Education);
    this.resumeMainDTO.awards = out[2].docs.map(item_2 => item_2.data() as Award);
    this.resumeMainDTO.certifications = out[3].docs.map(item_3 => item_3.data() as Certification);
    this.resumeMainDTO.frameworks_and_tools = out[4].docs.map(item_4 => item_4.data() as FrameworkAndTool);
    this.resumeMainDTO.languages = out[5].docs.map(item_5 => item_5.data() as Language);
    this.resumeMainDTO.programming_languages = out[6].docs.map(item_6 => item_6.data() as ProgrammingLanguage);
    this.resumeMainDTO.work_experience = out[7].docs.map(item_7 => item_7.data() as WorkExperience);
    await this.getWorkExperienceDetails();
  }

  async getProfileData(): Promise<void> {
    const profile_collection_query = doc(this.db, "profile/data")
    const profile = await getDoc(profile_collection_query);
    this.resumeMainDTO.profile_data = profile.data() as ProfileData;
  }

  getProfileSubcollectionData(subcollection_name: string, order: boolean = false) {
    if (order) {
      return getDocs(query(collection(this.db, `profile/data/${subcollection_name}`), orderBy("start_date", "desc")));
    }
    return getDocs(query(collection(this.db, `profile/data/${subcollection_name}`)))
  }

  async getWorkExperienceDetails() {
    const workExperienceTaskPromises: any[] = [];
    this.resumeMainDTO.work_experience?.forEach((element, idx) => {
      workExperienceTaskPromises.push(
        this.getProfileSubcollectionData(`work_experience/${element.id}/tasks`)
          .then(task_snap_data => this.resumeMainDTO.work_experience!![idx].tasks = task_snap_data.docs.map(single_task_data_snap => single_task_data_snap.data() as WorkExperience))
        );
    });
    await Promise.all(workExperienceTaskPromises);
  }
}
