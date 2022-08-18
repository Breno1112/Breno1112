import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-personal-info',
  templateUrl: './personal-info.component.html',
  styleUrls: ['./personal-info.component.css']
})
export class PersonalInfoComponent implements OnInit {
  @Input() data: any;

  constructor() { }

  ngOnInit(): void {
  }

  mailMe(email: string) {
    window.location.href = `mailto:${email}`;
  }

  phoneMe(phone: string) {
    window.location.href = `tel:${phone}`;
  }

}
