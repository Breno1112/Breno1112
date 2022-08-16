import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ResumeMainScreenComponent } from './resume-main-screen.component';

describe('ResumeMainScreenComponent', () => {
  let component: ResumeMainScreenComponent;
  let fixture: ComponentFixture<ResumeMainScreenComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ResumeMainScreenComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ResumeMainScreenComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
