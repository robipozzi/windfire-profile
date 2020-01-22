import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LayoutComponent } from './layout/layout.component';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { AppRoutingModule } from '../app-routing.module';
import { ProfileComponent } from './profile/profile.component';
import { TravelComponent } from './travel/travel.component';
import { ActivityComponent } from './activity/activity.component';
import { HomeComponent } from './home/home.component';
import { TravelDetailComponent } from './travel-detail/travel-detail.component';

@NgModule({
  imports: [
    CommonModule,
    AppRoutingModule
  ],
  declarations: [
    LayoutComponent, HeaderComponent, FooterComponent, ProfileComponent,
    TravelComponent, ActivityComponent, HomeComponent, TravelDetailComponent],
  exports: [LayoutComponent]
})
export class UiModule { }
