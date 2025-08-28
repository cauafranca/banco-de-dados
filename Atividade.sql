select nome
from clientes
where nome like 'A%';

explain select * from produtos where preco > 100;
create index idx_preco on produtos(preco);
explain select * from produtos where preco > 100;

alter table clientes 
alter column cpf type int using cpf::int;
 
alter table produtos 
alter column estoque type varchar;

create user caua with password '12345';
grant all privileges on database db_revenda to caua;
create user joao with password '12345';
grant select on clientes to joao;

select v.vendas_id, c.nome, v.valor_pago
from vendas v
inner join clientes c on v.clientes_id = c.clientes_id;

select v.vendas_id, c.nome, v.valor_pago
from vendas v
left join clientes c on v.clientes_id = c.clientes_id;

select v.vendas_id, c.nome, v.valor_pago
from vendas v
right join clientes c on v.clientes_id = c.clientes_id;

select co.compras_id, f.nome, co.valor_total
from compras co
inner join fornecedores f on co.fornecedores_id = f.fornecedores_id;

select co.compras_id, f.nome, co.valor_total
from compras co
left join fornecedores f on co.fornecedores_id = f.fornecedores_id;

select co.compras_id, f.nome, co.valor_total
from compras co
right join fornecedores f on co.fornecedores_id = f.fornecedores_id;

select v.vendas_id, vp.produtos_id
from vendas v
inner join vendas_produtos vp on v.vendas_id = vp.vendas_id;

select v.vendas_id, vp.produtos_id
from vendas v
left join vendas_produtos vp on v.vendas_id = vp.vendas_id;

select v.vendas_id, vp.produtos_id
from vendas v
right join vendas_produtos vp on v.vendas_id = vp.vendas_id;

select p.nome, vp.vendas_id
from produtos p
inner join vendas_produtos vp on p.produtos_id = vp.produtos_id;

select p.nome, vp.vendas_id
from produtos p
left join vendas_produtos vp on p.produtos_id = vp.produtos_id;

select p.nome, vp.vendas_id
from produtos p
right join vendas_produtos vp on p.produtos_id = vp.produtos_id;

update clientes set email = null where clientes_id <= 3;
update funcionarios set email = null where funcionarios_id in (2,4,6);
