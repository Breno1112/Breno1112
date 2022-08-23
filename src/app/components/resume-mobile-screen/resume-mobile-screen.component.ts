import { Component, Input, OnInit } from '@angular/core';
import { MatIconRegistry } from '@angular/material/icon';
import { DomSanitizer } from '@angular/platform-browser';
import { ResumeMainDTO } from 'src/app/types/resume-main-dto.type';

@Component({
  selector: 'app-resume-mobile-screen',
  templateUrl: './resume-mobile-screen.component.html',
  styleUrls: ['./resume-mobile-screen.component.css']
})
export class ResumeMobileScreenComponent implements OnInit {
  @Input() data?: ResumeMainDTO;
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

  ngOnInit(): void {
  }
}
