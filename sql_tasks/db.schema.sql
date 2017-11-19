create table car (
car_id integer primary key,
model varchar(30) not null,
price numeric(10, 2) not null
);

create table employee (
id integer primary key,
name varchar(30) not null
);

create table car_owner_period (
car_id integer not null references car (car_id),
owner_id integer not null references employee (id),
start_date date not null,
end_date date not null,
primary key (car_id, owner_id, start_date)
);

insert into car (car_id, model, price) values (1, 'Volvo XC90', 5678.23);
insert into car (car_id, model, price) values (2, 'Volvo XC60', 3837.10);
insert into car (car_id, model, price) values (15, 'Volvo XC90', 5678.23);
insert into car (car_id, model, price) values (29, 'Lada Kalina', 378.15);
insert into car (car_id, model, price) values (34, 'Opel Zafira', 900.56);
insert into car (car_id, model, price) values (45, 'Opel Astra', 1200.34);

insert into employee (id, name) values (1, 'John');
insert into employee (id, name) values (2, 'Kim');
insert into employee (id, name) values (3, 'Smith');
insert into employee (id, name) values (4, 'Paul');

insert into car_owner_period (car_id, owner_id, start_date, end_date) values (1, 1, to_date('12.04.2016', 'DD.MM.YYYY'), to_date('17.10.2016', 'DD.MM.YYYY'));
insert into car_owner_period (car_id, owner_id, start_date, end_date) values (1, 2, to_date('17.10.2016', 'DD.MM.YYYY'), to_date('19.12.2016', 'DD.MM.YYYY'));
insert into car_owner_period (car_id, owner_id, start_date, end_date) values (1, 3, to_date('19.12.2016', 'DD.MM.YYYY'), to_date('31.12.9999', 'DD.MM.YYYY'));
insert into car_owner_period (car_id, owner_id, start_date, end_date) values (15, 2, to_date('12.04.2016', 'DD.MM.YYYY'), to_date('31.12.9999', 'DD.MM.YYYY'));
insert into car_owner_period (car_id, owner_id, start_date, end_date) values (34, 3, to_date('12.04.2016', 'DD.MM.YYYY'), to_date('31.12.9999', 'DD.MM.YYYY'));
insert into car_owner_period (car_id, owner_id, start_date, end_date) values (45, 1, to_date('17.10.2016', 'DD.MM.YYYY'), to_date('31.12.9999', 'DD.MM.YYYY'));

