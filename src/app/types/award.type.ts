import { Timestamp } from "firebase/firestore";

export type Award = {
    company_name: string,
    description?: string,
    name: string,
    start_date: Timestamp
};