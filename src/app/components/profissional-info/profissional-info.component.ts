import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-profissional-info',
  templateUrl: './profissional-info.component.html',
  styleUrls: ['./profissional-info.component.css']
})
export class ProfissionalInfoComponent implements OnInit {
  @Input() data: any;

  constructor() { }

  ngOnInit(): void {
  }

  parse_date(str: string) {
    const result = new Date(str);
    result.setDate(result.getDate() + 1);
    return result;
  }

}
