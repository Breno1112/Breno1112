import { Component, Input, OnInit } from '@angular/core';
import { MatIconRegistry } from '@angular/material/icon';
import { DomSanitizer } from '@angular/platform-browser';

@Component({
  selector: 'app-resume-mobile-screen',
  templateUrl: './resume-mobile-screen.component.html',
  styleUrls: ['./resume-mobile-screen.component.css']
})
export class ResumeMobileScreenComponent implements OnInit {
  @Input() data: any;
  public profile_image: string = "";
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
    this.profile_image = this.data["profile_image"];
    console.log(this.data);
  }

  parse_date(str: string) {
    const result = new Date(str);
    result.setDate(result.getDate() + 1);
    return result;
  }

}
