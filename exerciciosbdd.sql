--1. Quantos filmes há em português?
select count(*) from film f
inner join "language" l
on l.language_id = f.language_id 
where l."name" = 'Português';

--2 Quantos clientes alugaram o filme de id=7?
select count(customer_id) from rental join inventory on rental.inventory_id = inventory.inventory_id
	where film_id = 7;
	
--3 quantos alugueis foram feitos no total?
select count(*) as "Qtd aluguéis" from rental;

--4 qual foi o custo do filme de id = 600?
select title as "Título do filme", replacement_cost as "Custo de reposição" from film where film_id = 600;

--5 qual funcionario alugou mais filmes?
select s.first_name, s.last_name from staff s join rental r on s.staff_id = r.staff_id group by s.first_name, s.last_name order by count(r.rental_id) desc limit 1;

--6 quantos funcionarios tem em cada loja?
select a.address, count(*) from staff sta inner join store sto on sta.store_id = sto.store_id inner join address a on a.address_id = sto.address_id group by a.address;


--7 liste as seguintes colunas: título do filme, idioma, custo, data do ultimo aluguel, nome do cliente do ultimo aluguel, funcionario que alugou, loja do aluguel e preço do aluguel.
select
	f.title as "Titulo do filme",
	l."name" as "Idioma",
	f.replacement_cost as "Custo do aluguel",
	r.rental_date as "Data do aluguel",
	c.first_name as "Nome do cliente",
	s.first_name as "Nome do funcionário",
	s2.store_id as "Id da loja",
	f.rental_rate as "Valor do aluguel"
from film f inner join "language" l on l.language_id = f.language_id inner join inventory i on i.film_id = f.film_id inner join rental r on r.inventory_id = i.inventory_id inner join customer c on c.customer_id = r.customer_id inner join staff s on s.staff_id = r.staff_id inner join store s2 on s2.store_id = s.store_id order by r.rental_date desc limit 1; 

--8 quantos atores participam do filme de id=1?
select count(*) as "Qtd. de atores"
from film_actor fa where fa.film_id = 1;

--9 qual loja possui mais inventarios?
select s.store_id as "Id da loja", count(i.inventory_id) from store s inner join staff s2 on s2.store_id = s.store_id inner join rental r on r.staff_id = s2.staff_id inner join inventory i on i.inventory_id = r.inventory_id group by s.store_id order by count(i.invent  ory_id) desc limit 1;
