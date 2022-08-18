import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ResumeMainScreenComponent } from './components/resume-main-screen/resume-main-screen.component';
import { HttpClientModule } from '@angular/common/http';
import {MatProgressSpinnerModule} from '@angular/material/progress-spinner';
import {MatIconModule} from '@angular/material/icon';
import {MatListModule} from '@angular/material/list';
import {MatProgressBarModule} from '@angular/material/progress-bar';
import {MatGridListModule} from '@angular/material/grid-list';
import {MatCardModule} from '@angular/material/card';
import { ResumeMobileScreenComponent } from './components/resume-mobile-screen/resume-mobile-screen.component';
import { ResumeDesktopScreenComponent } from './components/resume-desktop-screen/resume-desktop-screen.component';
import { ResumeWideScreenComponent } from './components/resume-wide-screen/resume-wide-screen.component';
import { PersonalInfoComponent } from './components/personal-info/personal-info.component';
import { ProfissionalInfoComponent } from './components/profissional-info/profissional-info.component';


@NgModule({
  declarations: [
    AppComponent,
    ResumeMainScreenComponent,
    ResumeMobileScreenComponent,
    ResumeDesktopScreenComponent,
    ResumeWideScreenComponent,
    PersonalInfoComponent,
    ProfissionalInfoComponent
  ],
  imports: [
    HttpClientModule,
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatProgressSpinnerModule,
    MatIconModule,
    MatListModule,
    MatProgressBarModule,
    MatGridListModule,
    MatCardModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
