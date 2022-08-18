import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfissionalInfoComponent } from './profissional-info.component';

describe('ProfissionalInfoComponent', () => {
  let component: ProfissionalInfoComponent;
  let fixture: ComponentFixture<ProfissionalInfoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ProfissionalInfoComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ProfissionalInfoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
