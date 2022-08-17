import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-resume-mobile-screen',
  templateUrl: './resume-mobile-screen.component.html',
  styleUrls: ['./resume-mobile-screen.component.css']
})
export class ResumeMobileScreenComponent implements OnInit {
  @Input() data: any;
  public profile_image: string = "";
  constructor() { }

  ngOnInit(): void {
    this.profile_image = this.data["profile_image"];
    console.log(this.data);
  }

}
