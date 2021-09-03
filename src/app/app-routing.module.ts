import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { ProfileComponent } from './ui/profile/profile.component';
import { ActivityComponent } from './ui/activity/activity.component';
import { TravelComponent } from './ui/travel/travel.component';
import { HomeComponent } from './ui/home/home.component';
import { TravelDetailComponent } from './ui/travel-detail/travel-detail.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'myprofile', component: ProfileComponent },
  { path: 'myactivities', component: ActivityComponent },
  { path: 'mytravels', component: TravelComponent },
  { path: 'mytravel/:destinationId', component: TravelDetailComponent }
];

@NgModule({
  imports: [
    CommonModule,
    RouterModule.forRoot(routes, { relativeLinkResolution: 'legacy' })
  ],
  exports: [ RouterModule ],
  declarations: []
})
export class AppRoutingModule { }

