import { Timestamp } from "firebase/firestore";

export type Certification = {
    description?: string,
    issuer: string,
    name: String,
    start_date: Timestamp
};