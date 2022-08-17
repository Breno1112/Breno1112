import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-resume-wide-screen',
  templateUrl: './resume-wide-screen.component.html',
  styleUrls: ['./resume-wide-screen.component.css']
})
export class ResumeWideScreenComponent implements OnInit {

  constructor() { }

  @Input("data") public data: any;

  ngOnInit(): void {
  }

}
