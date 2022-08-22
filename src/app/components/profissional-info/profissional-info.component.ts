import { NestedTreeControl } from '@angular/cdk/tree';
import { Component, Input, OnChanges, OnInit, SimpleChanges } from '@angular/core';
import { MatIconRegistry } from '@angular/material/icon';
import { MatTreeNestedDataSource } from '@angular/material/tree';
import { DomSanitizer } from '@angular/platform-browser';
import { WorkExperience } from 'src/app/types/work.experience.type';

@Component({
  selector: 'app-profissional-info',
  templateUrl: './profissional-info.component.html',
  styleUrls: ['./profissional-info.component.css']
})
export class ProfissionalInfoComponent implements OnInit, OnChanges {
  @Input() data: any;

  public treeControl = new NestedTreeControl<WorkExperience>(node => node.tasks);
  public dataSource = new MatTreeNestedDataSource<WorkExperience>();

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
  ngOnChanges(changes: SimpleChanges): void {
    console.log(changes);
  }

  ngOnInit(): void {
    this.dataSource = this.data["work_experience"];
  }

  parse_date(str: string) {
    const result = new Date(str);
    result.setDate(result.getDate() + 1);
    return result;
  }

  hasChild = (_: number, node: WorkExperience) => !!node.tasks && node.tasks.length > 0;

}
