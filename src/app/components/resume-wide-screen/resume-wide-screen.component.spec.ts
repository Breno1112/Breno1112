import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ResumeWideScreenComponent } from './resume-wide-screen.component';

describe('ResumeWideScreenComponent', () => {
  let component: ResumeWideScreenComponent;
  let fixture: ComponentFixture<ResumeWideScreenComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ResumeWideScreenComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ResumeWideScreenComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
