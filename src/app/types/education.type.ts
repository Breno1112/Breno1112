import { Timestamp } from "firebase/firestore"

export type Education = {
    end_date?: Timestamp,
    start_date: Timestamp,
    school_name: string,
    subject: string,
    type: string
}