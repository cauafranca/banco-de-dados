--1. Quantos filmes há em português?
select count(*) from film f
inner join "language" l
on l.language_id = f.language_id 
where l."name" = 'Português';

--2 Quantos clientes alugaram o filme de id=7?
select count(customer_id) from rental join inventory on rental.inventory_id = inventory.inventory_id
	where film_id = 7;
	
--3 quantos alugueis foram feitos no total?
select count(*) from rental;

--4 qual foi o custo do filme de id = 600?
select title, replacement_cost from film where film_id = 600;

--5 qual funcionario alugou mais filmes?
select s.first_name, s.last_name from staff s join rental r on s.staff_id = r.staff_id group by s.first_name, s.last_name limit 1;

--6 quantos funcionarios tem em cada loja?
select a.address, count(*) from staff sta inner join store sto on sta.store_id = sto.store_id inner join address a on a.address_id = sto.address_id group by a.address;


--7 liste as seguintes colunas: título do filme, idioma, custo, data do ultimo aluguel, nome do cliente do ultimo aluguel, funcionario que alugou, loja do aluguel e preço do aluguel.
select f.title from film f;
select f.language_id from film f;
select f.replacement_cost from film f;
select last_update from rental;
select first_name, last_name from customer;
select first_name, last_name from staff;
select store_id from store;
select customer_id from rental;

--8 quantos atores que participam do filme de id=1 começam com a letra P?
select store_id, count(*)
from staff 
group by store_id 
order by count(*) desc 
limit 1
