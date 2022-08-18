import { Component, Input, OnInit } from '@angular/core';
import { MatIconRegistry } from '@angular/material/icon';
import { DomSanitizer } from '@angular/platform-browser';

@Component({
  selector: 'app-resume-desktop-screen',
  templateUrl: './resume-desktop-screen.component.html',
  styleUrls: ['./resume-desktop-screen.component.css']
})
export class ResumeDesktopScreenComponent implements OnInit {

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

  @Input("data") public data: any;

  ngOnInit(): void {
  }

}
