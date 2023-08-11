--Aquellas usadas para insertar, modificar y eliminar un Customer, Staff y Actor.
--INSERT  
insert into customer (store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active)
values (1,'Damaris', 'Leiva','d.leiva_contreras@outlook.es', 22, true, '2023-06-14', '2023-06-14 14:49:45.738', 1);

insert into staff (first_name, last_name, address_id, email, store_id, active, username, password, last_update, picture)
values ('Damaris', 'Leiva', 2, 'd.leiva_contreras@outlook.es', 3, true, 'Damy', 'margarina21', '2023-06-14 16:13:11.793', null);

insert into actor (first_name, last_name, last_update)
values ('Carlos', 'García', '2023-06-14 14:47:57.620');


--MODIFICAR
update customer 
set email = 'damisakura@gmail.com'
where customer_id = 600;

update staff 
set password = 'rollodecanela35'
where staff_id = 3;

update actor 
set first_name = 'Manuel'
where actor_id = 201;


--ELIMINAR
delete from customer 
where customer_id = 600;

delete from staff 
where staff_id = 3;

delete from actor 
where actor_id = 201;


--Listar todas las “rental” con los datos del “customer” dado un año y mes.
select * 
from rental r
join customer c 
on r.customer_id  = c.customer_id 
where r.rental_date between  '2005-05-01' and '2005-06-01';


--Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”
select payment_id as Número, payment_date as Fecha, amount as Total 
from payment p ;


--Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0.
select *
from film f 
where rental_rate >= 4.0
and release_year = 2006;


--Realiza un Diccionario de datos que contenga el nombre de las tablas y columnas, si éstas pueden ser nulas, y su tipo de dato correspondiente.
SELECT
    t1.TABLE_NAME AS tabla_nombre,
    t1.COLUMN_NAME AS columna_nombre,
    t1.COLUMN_DEFAULT AS columna_defecto,
    t1.IS_NULLABLE AS columna_nulo,
    t1.DATA_TYPE AS columna_tipo_dato,
    COALESCE(t1.NUMERIC_PRECISION,
    t1.CHARACTER_MAXIMUM_LENGTH) AS columna_longitud,
    PG_CATALOG.COL_DESCRIPTION(t2.OID,
    t1.DTD_IDENTIFIER::int) AS columna_descripcion,
    t1.DOMAIN_NAME AS columna_dominio
FROM 
    INFORMATION_SCHEMA.COLUMNS t1
    INNER JOIN PG_CLASS t2 ON (t2.RELNAME = t1.TABLE_NAME)
WHERE 
    t1.TABLE_SCHEMA = 'public'
ORDER BY
    t1.TABLE_NAME;
