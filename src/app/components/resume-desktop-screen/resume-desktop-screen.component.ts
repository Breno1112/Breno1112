import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-resume-desktop-screen',
  templateUrl: './resume-desktop-screen.component.html',
  styleUrls: ['./resume-desktop-screen.component.css']
})
export class ResumeDesktopScreenComponent implements OnInit {

  constructor() { }

  @Input("data") public data: any;

  ngOnInit(): void {
  }

}
