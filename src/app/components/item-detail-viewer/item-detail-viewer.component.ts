import { Component, Input, OnChanges, OnInit, SimpleChanges } from '@angular/core';

@Component({
  selector: 'app-item-detail-viewer',
  templateUrl: './item-detail-viewer.component.html',
  styleUrls: ['./item-detail-viewer.component.css']
})
export class ItemDetailViewerComponent implements OnInit, OnChanges {

  @Input("data") public data: any;

  constructor() { }
  ngOnChanges(changes: SimpleChanges): void {
    console.log(changes);
  }

  ngOnInit(): void {
  }

}
