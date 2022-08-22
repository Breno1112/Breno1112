import { ItemDetailViewerType } from "../types/item.detail.viewer.type";
import { WorkExperience } from "../types/work.experience.type";

export function fromWorkExperienceToItemDetail(work_experience: WorkExperience): ItemDetailViewerType {
    return {
        title: `${work_experience.job_title} at ${work_experience.company_name}`,
        subtitle: `From ${work_experience.start_date} to ${work_experience.end_date}`,
        description_data: work_experience.tasks.map(item => {
            return {
                description: item.description
            }
        })
    };
}

export function fromWorkExperiencesToItemDetails(work_experiences: WorkExperience[]): ItemDetailViewerType[] {
    return work_experiences.map(item => fromWorkExperienceToItemDetail(item));
}