import { Timestamp } from "firebase/firestore";

export type WorkExperience = {
    id: string,
    job_title: string,
    company_name: string,
    start_date: Timestamp,
    end_date?: Timestamp,
    description: string,
    tasks: WorkExperience[]
};