--Задача 1
--Найти сотрудников, которые в данный момент находятся без машины
-- с left join'ом сложнее
select e.id, e.name
from employee e
where not exists (
	select 1 from car_owner_period op
	where op.owner_id = e.id and op.end_date >= now()
);

--Задача 2
--Вывести сотрудников и машины, которыми они в данный момент владеют. 
--Должны быть также выведены сотрудники, которые в данный момент находятся без машин и машины, которые в данный момент не имеют владельцев

-- сотрудники с машинами
select e.id, e.name, c.car_id, c.model
from employee e
join car_owner_period op on op.owner_id = e.id
join car c on c.car_id = op.car_id
where op.start_date <= now() and now() <op.end_date
union -- + сотрудники без машин
select e.id, e.name, NULL, NULL
from employee e
where not exists (
	select 1 from car_owner_period op
	where op.owner_id = e.id and op.end_date >= now()
)
union -- + машины без владельца
select NULL, NULL, c.car_id, c.model
from car c
where not exists (
	select 1 from car_owner_period op
	where op.car_id = c.car_id and op.end_date >= now()
);


--Задача 3
--Вывести имена сотрудников, которые на данный момент владеют более чем одной машиной. Вывести количество машин для таких сотрудников
select e.id, e.name, count(op.owner_id)
from employee e
join car_owner_period op on op.owner_id = e.id
where op.start_date <= now() and now() <op.end_date
group by e.id
having count(op.owner_id) > 1;


--Задача 4
--Найти модель первой машины каждого из сотрудников. Вывести в этих полях null, если у сотрудника никогда не было машины
select e.id, e.name, c.car_id, c.model
from employee e
left join (
	select op.owner_id, op.car_id
	from car_owner_period op
	join (
		select op.owner_id, min(op.start_date) as first_date
		from car_owner_period op
		group by op.owner_id
	) as first_op on first_op.owner_id = op.owner_id and first_op.first_date = op.start_date
) as first_car on e.id = first_car.owner_id
left join car c on c.car_id = first_car.car_id


--Задача 5
--Вывести имя сотрудника, который на данный момент владеет самой дорогой машиной. Вывести также модель машины. При наличии нескольких вариантов, вывести первый вариант отсортированный по возрастанию по id сотрудника

select e.id, e.name, c.car_id, c.model, c.price
from employee e
join car_owner_period op on op.owner_id = e.id
join car c on c.car_id = op.car_id
where op.start_date <= now() and now() <op.end_date
order by c.price desc, e.id asc
limit 1

--Задача 6
--Вывести id и модель машины, которая больше других меняла сотрудников. При наличии нескольких вариантов, вывести первый вариант отсортированный по возрастнаию по id машины
select c.car_id, c.model
from car c
join (
select op.car_id, count(op.car_id)
from car_owner_period op
group by op.car_id
order by op.car_id
limit 1
) as popular_car on c.car_id = popular_car.car_id
