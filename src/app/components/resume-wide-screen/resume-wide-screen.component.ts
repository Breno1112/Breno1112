import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-resume-wide-screen',
  templateUrl: './resume-wide-screen.component.html',
  styleUrls: ['./resume-wide-screen.component.css']
})
export class ResumeWideScreenComponent implements OnInit {
  private lastCalculatedLeastHeight: number | undefined = undefined;

  constructor() { }

  @Input("data") public data: any;

  ngOnInit(): void {
  }

  calculateHeight() {
    const got = window.innerHeight;
    if(!this.lastCalculatedLeastHeight || got < this.lastCalculatedLeastHeight) {
      this.lastCalculatedLeastHeight = got;
    }
    return `${this.lastCalculatedLeastHeight}px`;
  }

}
