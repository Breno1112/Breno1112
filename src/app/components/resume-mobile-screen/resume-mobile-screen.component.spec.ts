import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ResumeMobileScreenComponent } from './resume-mobile-screen.component';

describe('ResumeMobileScreenComponent', () => {
  let component: ResumeMobileScreenComponent;
  let fixture: ComponentFixture<ResumeMobileScreenComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ResumeMobileScreenComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ResumeMobileScreenComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
