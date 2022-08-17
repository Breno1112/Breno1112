import { Component, OnInit, HostListener } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { ScreenType } from '../../enums/screen-type.enum';

@Component({
  selector: 'app-resume-main-screen',
  templateUrl: './resume-main-screen.component.html',
  styleUrls: ['./resume-main-screen.component.css']
})
export class ResumeMainScreenComponent implements OnInit {
  public loaded = false;
  public screenType: ScreenType | undefined = undefined;
  public data: any;

  constructor(
    private httpClient: HttpClient
  ) {
  }

  @HostListener('window:resize', ['$event'])
  onResize(event: any) {
    this.setScreenType();
  }

  ngOnInit(): void {
    this.setScreenType();
    this.httpClient.get("assets/contents.json").subscribe((data) => {
      this.data = data;
      this.loaded = true;
    });
  }

  setScreenType() {
    if (window.innerWidth <= 480) {
      this.screenType = ScreenType.MOBILE;
    } else if (window.innerWidth > 480 && window.innerWidth <= 768) {
      this.screenType = ScreenType.DESKTOP;
    } else {
      this.screenType = ScreenType.WIDE;
    }
  }

  checkScreenType(screenType: ScreenType | undefined) {
    if(screenType === undefined) {
      return "";
    }
    const values = Object.values(ScreenType);
    const result = values.indexOf(screenType);
    const to_return = Object.keys(ScreenType)[result];
    return to_return;
  }
}
