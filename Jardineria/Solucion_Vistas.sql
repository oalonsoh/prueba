-- 1. Escriba una vista que se llame listado_pagos_clientes que muestre un listado donde aparezcan todos los
-- clientes y los pagos que ha realizado cada uno de ellos. La vista deberá tener las siguientes columnas:
-- nombre y apellidos del cliente concatenados, teléfono, ciudad, pais, fecha_pago, total del pago, id de la
-- transacción  
create view listado_pagos_clientes as
select concat_ws(" ", C.nombre_contacto, C.apellido_contacto), C.telefono, C.ciudad, C.pais, P.fecha_pago,
		P.total, P.id_transaccion from cliente C left join pago P on P.codigo_cliente = C.codigo_cliente;

select * from listado_pagos_clientes;

-- 2. Escriba una vista que se llame listado_pedidos_clientes que muestre un listado donde aparezcan todos
-- los clientes y los pedidos que ha realizado cada uno de ellos. La vista debe tener las siguientes
-- columnas: nombre y apellidos del cliente concatenados, teléfono, ciudad, país, código del pedido, fecha
-- del pedido, fecha esperada, fecha de entrega y la cantidad total del pedido, que será la suma del producto
-- de todas las cantidades por el precio de cada unidad, que aparecen en cada línea de pedido.
-- create view listado_pedidos_clientes as
select concat_ws(" ", C.nombre_contacto, C.apellido_contacto) as nombre, C.telefono, C.ciudad, C.pais, P.codigo_pedido,
      fecha_pedido, fecha_esperada, fecha_entrega, sum(DP.cantidad * DP.precio_unidad) as total_pedido
      from cliente C left join pedido P on P.codigo_cliente = C.codigo_cliente
      join detalle_pedido DP on DP.codigo_pedido = P.codigo_pedido group by P.codigo_pedido
      order by C.nombre_contacto, P.codigo_pedido;

select * from listado_pedidos_clientes;

-- 3. Utilice las vistas que ha creado en los pasos anteriores para devolver un listado de los clientes de 
-- la ciudad de Madrid que han realizado pagos.
select * from listado_pagos_clientes where ciudad = "Madrid" and total is not null;

-- 4. Utilice las vistas que ha creado en los pasos anteriores para devolver un listado de los clientes 
-- que todavía no han recibido su pedido.
select * from listado_pedidos_clientes where fecha_entrega is null;

-- 5. Utilice las vistas que ha creado en los pasos anteriores para calcular el número de pedidos que se ha
-- realizado cada uno de los clientes.
select nombre, count(codigo_pedido) from listado_pedidos_clientes group by nombre;

-- 6. Utilice las vistas que ha creado en los pasos anteriores para calcular el valor del pedido máximo y 
-- mínimo que ha realizado cada cliente.
select nombre, max(total_pedido), min(total_pedido) from listado_pedidos_clientes group by nombre;

-- 7. Modifique el nombre de las vista listado_pagos_clientes y asígnele el nombre listado_de_pagos. 
-- Una vez que haya modificado el nombre de la vista ejecute una consulta utilizando el nuevo nombre de 
-- la vista para comprobar que sigue funcionando correctamente.
rename table listado_pagos_clientes to listado_de_pagos;

-- 8. Elimine las vistas que ha creado en los pasos anteriores.
drop view listado_pedidos_clientes;
drop view listado_de_pagos;