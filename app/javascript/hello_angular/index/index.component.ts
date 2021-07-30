import { Component, OnInit } from '@angular/core';

import templateString from './index.component.html';
import { Person }  from '../person/person.class';
import { PersonService } from 'hello_angular/person/person.service';

@Component({
  selector: 'people',
  template: `<section>‍
    <table>‍
      <tr>‍
        <th>Id</th>‍
        <th>First Name</th>‍
        <th>Last Name</th>
        <th>Phone</th>‍
        <th>Email</th>‍
      </tr>
      <tbody>‍
        <tr *ngFor="let person of people">
          <td>{{person.id}}</td>‍
          <td>{{person.first_name}}</td>‍
          <td>{{person.last_name}}</td>
          <td>{{person.phone}}</td>‍
          <td>{{person.email}}</td>‍‍
        </tr>‍
     </tbody>‍
    </table>‍
</section>`,
})

export class PersonIndexComponent implements OnInit {
  people: Person[];

  constructor(
    private personService: PersonService,
  ) {
    this.personService.getPersons().subscribe(people => {
      this.people = people;
    });
  }

  ngOnInit() { }
}