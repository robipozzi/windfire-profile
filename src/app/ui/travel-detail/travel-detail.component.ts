import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Travel } from './travel';
import { DomSanitizer, SafeUrl } from '@angular/platform-browser';

/*@Pipe({ name: 'safe' })
export class SafePipe implements PipeTransform {
  constructor(private sanitizer: DomSanitizer) { }
  transform(url) {
    return this.sanitizer.bypassSecurityTrustResourceUrl(url);
  }
}*/

@Component({
  selector: 'app-travel-detail',
  templateUrl: './travel-detail.component.html',
  styleUrls: ['./travel-detail.component.css']
})
export class TravelDetailComponent implements OnInit {
  videoUrl: SafeUrl;
  travel: Travel = {
    destinationId : '',
    destinationName : '',
    destinationVideoURL : ''
  };

  constructor(
    private route: ActivatedRoute,
    private sanitizer: DomSanitizer
  ) { }

  ngOnInit() {
    const destinationId = this.route.snapshot.paramMap.get('destinationId');
    this.travel.destinationId = destinationId;
    this.getDestination(destinationId);
    this.videoUrl = this.sanitizer.bypassSecurityTrustResourceUrl(this.travel.destinationVideoURL);
  }

  getDestination(destinationId) {
    console.log('getDestination --> ' + destinationId);
    switch (destinationId) {
      case 'greece':
        this.travel.destinationName = 'Grecia 2018';
        this.travel.destinationVideoURL = 'https://www.youtube.com/embed/6xkNYeUQZyI?autoplay=1';
        break;
      case 'monaco':
        this.travel.destinationName = 'Monaco di Baviera 2018';
        this.travel.destinationVideoURL = 'https://www.youtube.com/embed/1xSuk5ek8Dk?autoplay=1';
        break;
      case 'puglia':
        this.travel.destinationName = 'Puglia 2017';
        this.travel.destinationVideoURL = 'https://www.youtube.com/embed/tLWCrk80P5s?autoplay=1';
        break;
      default:
        break;
    }
  }

}
