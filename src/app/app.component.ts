import { Component, OnInit } from '@angular/core';

// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit{
  title = 'Breno resumé';

  // Initialize Firebase
  private app = initializeApp(environment.firebaseConfig);
  private analytics = getAnalytics(this.app);

  ngOnInit(): void {
    this.analytics.app.automaticDataCollectionEnabled = true;
  }
}
