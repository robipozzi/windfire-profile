import { Component, OnInit } from '@angular/core';
import { Home } from '../home/home';

@Component({
  selector: 'app-layout',
  templateUrl: './layout.component.html',
  styleUrls: ['./layout.component.css']
})
export class LayoutComponent implements OnInit {
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
