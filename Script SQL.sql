DROP DATABASE IF EXISTS alke_wallet;
CREATE DATABASE alke_wallet;
USE alke_wallet;
CREATE TABLE usuario (
	user_id int auto_increment primary key,
    nombres varchar(100) not null,
    apellidos varchar(100) not null,
    correo_electronico varchar(50) not null,
    contrasena varchar(255),
    saldo int);

CREATE TABLE moneda (
	moneda_id int auto_increment primary key,
    moneda_nombre varchar(50),
    moneda_simbolo varchar(1));
    
CREATE TABLE transaccion (
	transaccion_id int auto_increment key,
    emisor_user_id int,
    receptor_user_id int,
    moneda_id int,
    importe int not null,
    transaccion_date datetime not null,
    constraint fk_emisor_user_id foreign key (emisor_user_id) references usuario(user_id),
    constraint fk_receptor_user_id foreign key (receptor_user_id) references usuario(user_id),
    constraint fk_modena_id foreign key (moneda_id) references moneda(moneda_id)
    );
    
insert into usuario (nombres,apellidos,correo_electronico,contrasena,saldo) values ("Federico","Gacía","federico.garcia@gcorreo_electronico.com","micontraseña",20000);
insert into usuario (nombres,apellidos,correo_electronico,contrasena,saldo) values ("Federico","Gacía","federico.garcia@gcorreo_electronico.com","micontraseña",20000);
insert into usuario (nombres,apellidos,correo_electronico,contrasena,saldo) values ("Marcelo","Carvajal","marcelo.carvajal@gcorreo_electronico.com","passinco",30000);

insert into moneda (moneda_nombre,moneda_simbolo) values ("Dolar","$");
insert into moneda (moneda_nombre,moneda_simbolo) values ("Dolar","€");

insert into transaccion (emisor_user_id, receptor_user_id, moneda_id, importe, transaccion_date) values (2,3,2,250000,"2024-04-10 13:21:05");
insert into transaccion (emisor_user_id, receptor_user_id, moneda_id, importe, transaccion_date) values (1,3,1,40000,"2024-02-11 08:11:02");
insert into transaccion (emisor_user_id, receptor_user_id, moneda_id, importe, transaccion_date) values (2,1,1,460000,"2023-02-18 22:01:05");

#Consulta para obtener las transacciones realizadas por un usuario específico
select * from transaccion where emisor_user_id=2;

#Consulta para obtener todos los usuarios registrados
select * from usuario;

#Consulta para obtener todas las monedas registradas
select * from moneda;

#Consulta para obtener todas las transacciones registradas
select * from transaccion;

#Consulta para obtener todas las transacciones realizadas por un usuario específico
select * from transaccion where emisor_user_id=2;

#Consulta para obtener todas las transacciones recibidas por un usuario específico
select * from transaccion where receptor_user_id=3;

#Sentencia DML para modificar el campo correo electrónico de un usuario específico
update usuario set correo_electronico="nuevocorreoelectronico@gmail.com" where user_id=3;

#Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)
delete from transaccion where transaccion_id=5;

#Sentencia para DDL modificar el nombre de la columna correo_electronico por email
alter table usuario rename column correo_electronico to email;
