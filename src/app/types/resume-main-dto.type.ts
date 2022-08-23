import { Award } from "./award.type"
import { Certification } from "./certification.type"
import { Education } from "./education.type"
import { FrameworkAndTool } from "./frameworks-and-tools.type"
import { Language } from "./language.type"
import { ProfileData } from "./profile-data.type"
import { ProgrammingLanguage } from "./programming-language.type"
import { SkillData } from "./skill-data.type"
import { WorkExperience } from "./work.experience.type"

export type ResumeMainDTO = {
    profile_data?: ProfileData,
    awards?: Award[],
    certifications?: Certification[],
    education?: Education[],
    frameworks_and_tools?: FrameworkAndTool[],
    languages?: Language[],
    programming_languages?: ProgrammingLanguage[],
    skills?: SkillData[],
    work_experience?: WorkExperience[],
    screenType?: string
}