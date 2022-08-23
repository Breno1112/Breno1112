import { Component, Input, OnChanges, OnInit, SimpleChanges } from '@angular/core';

@Component({
  selector: 'app-item-detail-viewer',
  templateUrl: './item-detail-viewer.component.html',
  styleUrls: ['./item-detail-viewer.component.css']
})
export class ItemDetailViewerComponent {

  @Input("data") public data: any;

}
