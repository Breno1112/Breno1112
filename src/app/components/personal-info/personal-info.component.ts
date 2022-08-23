import { Component, Input } from '@angular/core';
import { ResumeMainDTO } from 'src/app/types/resume-main-dto.type';

@Component({
  selector: 'app-personal-info',
  templateUrl: './personal-info.component.html',
  styleUrls: ['./personal-info.component.css']
})
export class PersonalInfoComponent {
  @Input() data?: ResumeMainDTO;

  constructor() { }

  mailMe(email: string) {
    window.location.href = `mailto:${email}`;
  }

  phoneMe(phone: string) {
    window.location.href = `tel:${phone}`;
  }

}
