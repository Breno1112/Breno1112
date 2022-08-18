import { Component, Input, OnInit } from '@angular/core';
import { MatIconRegistry } from '@angular/material/icon';
import { DomSanitizer } from '@angular/platform-browser';

@Component({
  selector: 'app-profissional-info',
  templateUrl: './profissional-info.component.html',
  styleUrls: ['./profissional-info.component.css']
})
export class ProfissionalInfoComponent implements OnInit {
  @Input() data: any;

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

  parse_date(str: string) {
    const result = new Date(str);
    result.setDate(result.getDate() + 1);
    return result;
  }

}
