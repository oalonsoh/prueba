USE `EMPLEADOS_MODELOS` ;
--        Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.

--        1.     Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
select * from empleado E inner join departamento D
on E.codigo_departamento = D.codigo;


--        2.     Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. 
--               Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) 
--               y en segundo lugar por los apellidos y el nombre de los empleados.
select * from empleado E inner join departamento D
on E.codigo_departamento = D.codigo
order by D.nombre asc, E.apellido1, E.apellido2, E.nombre;

--        3.     Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
select D.codigo, D.nombre from empleado E inner join departamento D
on E.codigo_departamento = D.codigo where E.nombre is not null 
group by D.nombre;

--        4.     Devuelve un listado con el código, el nombre del departamento y el valor del presupuesto actual del que dispone, 
--               solamente de aquellos departamentos que tienen empleados. 
--               El valor del presupuesto actual lo puede calcular restando al valor del presupuesto inicial 
--               (columna presupuesto) el valor de los gastos que ha generado (columna gastos).
select D.codigo, D.nombre from empleado E inner join departamento D
on E.codigo_departamento = D.codigo where E.nombre is not null 
group by D.nombre;

--        5.     Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
select D.codigo, D.nombre from empleado E inner join departamento D
on E.codigo_departamento = D.codigo where  E.nifl ="00000000A";

--        6.     Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
select D.codigo, D.nombre from empleado E inner join departamento D
on E.codigo_departamento = D.codigo where E.nombre = "Oscar" and E.Apellido1 = "Alonso" and E.Apellido2 = "Hervas";

--        7.     Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
select E.* from empleado E inner join departamento D on E.codigo_departamento = D.codigo 
where D.nombre = "Compras" order by E.nombre,  E.Apellido1, E.Apellido2  asc;

--        8.     Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. 
--               Ordena el resultado alfabéticamente.
select E.* from empleado E inner join departamento D on E.codigo_departamento = D.codigo 
where  D.nombre in ("Compras", "Logistica", "Contabilidad") order by E.nombre,  E.Apellido1, E.Apellido2  asc;
--        9.     Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
select E.nombre, E.Apellido1, E.Apellido2 from empleado E inner join departamento D on E.codigo_departamento = D.codigo 
where D.presupuesto not between 100000 and 200000;

--        10.    Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL. 
--               Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.

select D.nombre as 'Departamento' from empleado E inner join departamento D on E.codigo_departamento = D.codigo 
where E.Apellido2 is NULL group by D.nombre;
