import { Component, Input, OnInit } from '@angular/core';
import { fromWorkExperiencesToItemDetails, fromWorkExperienceToItemDetail } from 'src/app/helpers/mappers';
import { ItemDetailViewerType } from 'src/app/types/item.detail.viewer.type';
import { ResumeMainDTO } from 'src/app/types/resume-main-dto.type';

@Component({
  selector: 'app-resume-wide-screen',
  templateUrl: './resume-wide-screen.component.html',
  styleUrls: ['./resume-wide-screen.component.css']
})
export class ResumeWideScreenComponent implements OnInit {
  private lastCalculatedLeastHeight: number | undefined = undefined;
  private selectedWorkOptionReceived: number | undefined;
  public viewingdata: ItemDetailViewerType | undefined;

  constructor() { }

  @Input("data") public data?: ResumeMainDTO;

  ngOnInit(): void {
  }

  calculateHeight() {
    const got = window.innerHeight;
    if(!this.lastCalculatedLeastHeight || got < this.lastCalculatedLeastHeight) {
      this.lastCalculatedLeastHeight = got;
    }
    return `${this.lastCalculatedLeastHeight}px`;
  }

  selectWorkOption(idx: number) {
    this.selectedWorkOptionReceived = idx;
    this.viewingdata = fromWorkExperienceToItemDetail(this.data!!.work_experience!![this.selectedWorkOptionReceived]);
  }

}
