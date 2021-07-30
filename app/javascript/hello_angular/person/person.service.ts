import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';
import { Observable } from 'rxjs';

import { Person } from './person.class';

@Injectable({
  providedIn: 'root'
})

export class PersonService {
  constructor(private http: HttpClient) { }

  getPersons(): Observable<Person[]> {
    return this.http
      .get('/people.json')
      .pipe(
        map((people: Person[]) => people.map(person => {
        return new Person(
          person.id,
          person.first_name,
          person.last_name,
          person.phone,
          person.email,
        )
    })));
  }
}