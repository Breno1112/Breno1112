import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ItemDetailViewerComponent } from './item-detail-viewer.component';

describe('ItemDetailViewerComponent', () => {
  let component: ItemDetailViewerComponent;
  let fixture: ComponentFixture<ItemDetailViewerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ItemDetailViewerComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ItemDetailViewerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
