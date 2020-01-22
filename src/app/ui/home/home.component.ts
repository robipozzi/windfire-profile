import { Component, OnInit } from '@angular/core';
import { Home } from './home';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  home: Home = {
    heading1: '',
    heading2: '',
    heading3: ''
  };
  constructor() { }

  ngOnInit() {
    this.home.heading1 = 'My Profile';
    this.home.heading2 = 'My Projects';
    this.home.heading3 = 'My Travels';
  }

}
