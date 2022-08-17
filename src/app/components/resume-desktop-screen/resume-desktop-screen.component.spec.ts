import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ResumeDesktopScreenComponent } from './resume-desktop-screen.component';

describe('ResumeDesktopScreenComponent', () => {
  let component: ResumeDesktopScreenComponent;
  let fixture: ComponentFixture<ResumeDesktopScreenComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ResumeDesktopScreenComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ResumeDesktopScreenComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
