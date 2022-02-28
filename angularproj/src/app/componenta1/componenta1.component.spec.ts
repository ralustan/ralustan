import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Componenta1Component } from './componenta1.component';

describe('Componenta1Component', () => {
  let component: Componenta1Component;
  let fixture: ComponentFixture<Componenta1Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Componenta1Component ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Componenta1Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('test', () => {
    var paragraph=fixture.nativeElement.querySelector('#super');
    expect(paragraph.textContent).toBe("componenta1 works!");
  });
});
