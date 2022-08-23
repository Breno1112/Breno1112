import { Component, Input, OnInit } from '@angular/core';
import { MatIconRegistry } from '@angular/material/icon';
import { DomSanitizer } from '@angular/platform-browser';
import { ResumeMainDTO } from 'src/app/types/resume-main-dto.type';

@Component({
  selector: 'app-resume-desktop-screen',
  templateUrl: './resume-desktop-screen.component.html',
  styleUrls: ['./resume-desktop-screen.component.css']
})
export class ResumeDesktopScreenComponent implements OnInit {
  private lastCalculatedLeastHeight: number | undefined = undefined;

  constructor(
    private matIconRegistry: MatIconRegistry,
    private domSanitizer: DomSanitizer
  ) { 
    this.matIconRegistry.addSvgIcon(
      "trophy",
      this.domSanitizer.bypassSecurityTrustResourceUrl("assets/icons/trophy.svg")
    );
    this.matIconRegistry.addSvgIcon(
      "certificate-outline",
      this.domSanitizer.bypassSecurityTrustResourceUrl("assets/icons/certificate-outline.svg")
    );
  }

  @Input("data") public data?: ResumeMainDTO;

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
