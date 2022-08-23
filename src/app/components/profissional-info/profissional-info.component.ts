import { NestedTreeControl } from '@angular/cdk/tree';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { MatIconRegistry } from '@angular/material/icon';
import { MatTreeNestedDataSource } from '@angular/material/tree';
import { DomSanitizer } from '@angular/platform-browser';
import { Timestamp } from 'firebase/firestore';
import { ResumeMainDTO } from 'src/app/types/resume-main-dto.type';
import { WorkExperience } from 'src/app/types/work.experience.type';

@Component({
  selector: 'app-profissional-info',
  templateUrl: './profissional-info.component.html',
  styleUrls: ['./profissional-info.component.css']
})
export class ProfissionalInfoComponent implements OnInit {
  @Input() data?: ResumeMainDTO;
  @Output() public onSelectedWorkOption = new EventEmitter<number>();

  public treeControl = new NestedTreeControl<WorkExperience>(node => node.tasks);
  public dataSource = new MatTreeNestedDataSource<WorkExperience>();
  public selectedWorkOption: number | undefined;

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
    this.dataSource.data = this.data!!.work_experience!!;
  }

  parse_date(date: Timestamp) {
    // const result = new Date(str);
    // result.setDate(result.getDate() + 1);
    // return result;
    return "data a calcular";
  }

  hasChild = (_: number, node: WorkExperience) => !!node.tasks && node.tasks.length > 0;

  choseOption(idx: number) {
    this.selectedWorkOption = idx;
    this.onSelectedWorkOption.emit(this.selectedWorkOption);
  }

}
