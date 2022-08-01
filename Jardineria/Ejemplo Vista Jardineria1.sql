CREATE OR REPLACE VIEW resumen_pedidos AS
SELECT
pedido.codigo_pedido,
pedido.fecha_pedido,
cliente.nombre_cliente,
SUM(detalle_pedido.cantidad * detalle_pedido.precio_unidad) AS total
FROM
cliente INNER JOIN pedido
ON cliente.codigo_cliente = pedido.codigo_cliente
INNER JOIN detalle_pedido
ON pedido.codigo_pedido = detalle_pedido.codigo_pedido
GROUP BY pedido.codigo_pedido