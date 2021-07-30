import { RouterModule, Routes } from '@angular/router';
import { NgModule } from '@angular/core';
import { PersonIndexComponent } from 'hello_angular/index/index.component';

const appRoutes: Routes = [
  { path: 'people', component: PersonIndexComponent },
  { path: '', redirectTo: '/people', pathMatch: 'full' },
];

@NgModule({
  imports: [
    RouterModule.forRoot(appRoutes, { scrollPositionRestoration: 'enabled' }),
  ],
  exports: [RouterModule]
})

export class AppRoutingModule { }