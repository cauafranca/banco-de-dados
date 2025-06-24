--criação da base de dados
create database aula16;

--criação de tabelas
create table categoria(
	categoria_id serial,
	nome varchar(20),
	ultima_atualizacao timestamp
);
--comando para excluir tabela
--drop table categoria;

create table filme_categoria(
	filme_id int,
	categoria_id int,
	ultima_atualizacao timestamp
);

create table filme (
	filme_id serial,
	titulo varchar(35),
	descricao text,
	ano_lancamento char(4),
	linguaguem_id int,
	duracao_aluguel int,
	preco_aluguel numeric(4,2),
	duracao int,
	multa numeric(4,2),
	classificacao_indicativa int,
	ultima_atualizacao timestamp,
	ocasiao_especial text,
	sinopse text
);

create table linguaguem (
	linguaguem_id serial,
	nome varchar(20),
	ultima_atualizacao timestamp
);

create table ator_filme (
	ator_id int,
	filme_id int,
	ultima_atualizacao timestamp
);

create table inventario (
	inventario_id serial,
	filme_id int,
	loja_id int,
	ultima_atualizacao timestamp
);

create table aluguel (
	aluguel_id serial,
	data_aluguel timestamp,
	inventario_id int,
	cliente_id int,
	data_retorno timestamp,
	funcionario_id int,
);

create table pagamento (
	pagamento_id serial,
	cliente_id int,
	funcionario_id int,
	aluguel_id int,
	preco numeric(4,2)
);

create table funcionario (
+	funcionario_id serial,
	primeiro_nome varchar(20),
	ultimo_nome varchar(20),
	endereco_id int,
	email varchar(60),
	senha char(7),
	usuario varchar(20),
	loja_id int,
	ativo bool,
	ultima_atualizacao timestamp,
	foto bytes
);

create table ator(
	ator_id serial,
	primeiro_nome varchar(20),
	ultimo_nome varchar(20),
	ultima_atualizacao timestamp
);

create table cliente (
	cliente_id serial,
	loja_id int,
	primeiro_nome varchar(20),
	ultimo_nome varcar(20),
	endereco_id int,
	email varchar(60),
	data_criacao timestamp,
	ultima_atualizacao timestamp,
	ativo bool
);

create table endereco (
	endereco_id serial,
	endereco varchar(40),
	endereco2 varchar(40),
	distrito varchar (30),
	cidade_id int,
	cep char(8),
	telefone char(14),
	ultima_atualizacao timestamp
);
	
create table cidade (
	cidade_id serial,
	cidade varchar(30),
	pais_id int,
	ultima_atualizacao timestamp
);

create table pais (
	pais_id serial,
	pais varchar(20),
	ultima_atualizacao timestamp
);

create table loja (
	loja_id serial,
	chefe_equipe_id int,
	endereco_id int,
	ultima_atualizacao timestamp
);

--remover coluna
alter table loja drop column ultima_atualizacao;

--adicionar coluna
alter table loja add column ultima_atualizacao timestamp;

--renomear coluna
alter table loja rename column ult_atual
	to ultima_atualizacao;
	
--alterar o tipo de dado da coluna
alter table loja alter column ultima_atualizacao
	set data type timestamp;

--criação da chaves primárias
alter table categoria add primary key (categoria_id);
alter table filme add primary key (filme_id);
alter table linguagem add primary key (linguaguem_id);
alter table inventario add primary key (inventario_id);
alter table pais add primary key (pais_id);
alter table ator add primary key (ator_id;
alter table cidade add primary key (cidade_id);
alter table loja add primary key (loja_id);
alter table pagamento add primary key (pagamento_id);
alter table endereco add primary key (endereco_id);
alter table cliente add primary key (cliente_id);
alter table funcionario add primary key (funcionario_id);
alter table aluguel add primary key (aluguel_id);

--criação de chaves estrangeirsd
alter table filme_categoria
add constraint fk_categoria
foreign key (categoria_id)
references categoria(categoria_id);

alter table filme_categoria
add constraint fk_filme
foreign key (filme_id)
references filme(filme_id);

alter table filme
add constraint fk_linguaguem
foreign key (linguaguem_id)
references linguaguem(linguaguem_id);

alter table ator_filme
add constraint fk_ator
foreign key (ator_id)
references ator(ator_id);

alter table ator_filme
add constraint fk_filme
foreign key (filme_id)
references filme(filme_id);

alter table inventario --tabela que possui a chave estrangeira
add constraint fk_filme --adiciona a restrição na tabela a ser alterada
foreign key (filme_id) --define a chave estrangeira na tabela a ser alterada
references filme(filme_id); --referencia a tabela que possui a chave primária

alter table aluguel
add constraint fk_inventario
foreign key (inventario_id)
references inventario(inventario_id);

alter table aluguel
add constraint fk_funcionario
foreign key (funcionario_id)
references funcionario(funcionario_id);

alter table pagamento
add constraint fk_aluguel
foreign key (aluguel_id)
references aluguel(aluguel_id);

alter table pagamento
add constraint fk_funcionario
foreign key (funcionario_id)
references funcionario(funcionario_id);






