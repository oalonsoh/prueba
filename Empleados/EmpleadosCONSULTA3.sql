USE `EMPLEADOS_MODELOS` ;            
--     Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
--     1.     Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. 
--            Este listado también debe incluir los empleados que no tienen ningún departamento asociado.
select * from empleado E left join departamento D on E.codigo_departamento = D.codigo;

--     2.     Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
select E.* from empleado E left join departamento D on E.codigo_departamento = D.codigo where E.codigo_departamento is null;

--     3.     Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.
select D.* from empleado E Right join departamento D on E.codigo_departamento = D.codigo where E.codigo_departamento is null;

--     4.     Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. 
--            El listado debe incluir los empleados que no tienen ningún departamento asociado
--            y los departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.
select E.* from empleado E left join departamento D on E.codigo_departamento = D.codigo where E.codigo_departamento is Null
union 
select E.* from empleado E right join departamento D on E.codigo_departamento = D.codigo where E.codigo_departamento is null;
--     5.     Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
select E.* from empleado E right join departamento D on E.codigo_departamento = D.codigo where E.Nifl = "00000000A";

--     6.     Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
select D.nombre from empleado E right join departamento D on E.codigo_departamento = D.codigo 
where E.nombre = "Oscar" and E.Apellido1 = "Alonso" and E.Apellido2 = "Hervas";

--     7.     Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. 
--            Ordena el resultado alfabéticamente.
select E.* from empleado E left join departamento D on E.codigo_departamento = D.codigo 
where D.nombre = "Compras" order by E.nombre,  E.Apellido1, E.Apellido2  asc;

--     8.     Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, 
--            Contabilidad o I+D. Ordena el resultado alfabéticamente.
select E.* from empleado E left join departamento D on E.codigo_departamento = D.codigo 
where  D.nombre in ("Compras", "Logistica", "Contabilidad") order by E.nombre,  E.Apellido1, E.Apellido2  asc;

--     9.     Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un pre-
--            supuesto entre 100000 y 200000 euros.
select E.nombre, E.Apellido1, E.Apellido2 from empleado E left join departamento D on E.codigo_departamento = D.codigo 
where D.presupuesto not between 100000 and 200000;

--     10.    Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL. 
--            Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.
select D.nombre as 'Departamento' from empleado E right join departamento D on E.codigo_departamento = D.codigo 
where E.Apellido2 is NULL group by D.nombre;


