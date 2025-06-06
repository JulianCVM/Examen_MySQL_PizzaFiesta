

1. **Registrar un nuevo cliente:**

INSERT INTO clientes(nombre, direccion, num_contacto)
VALUES ('Julian', 'Provenza', 101010);



2. **Agregar un nuevo producto (pizza) al menú:**

INSERT INTO tamaño(is_disponible, tipo_tamaño, costo)
VALUES (1, 'grande', 10000),
 (1, 'mediana', 7000),
 (1, 'pequeña', 5000);


INSERT INTO ingredientes(nombre, tipo, fecha_vencimiento, stock, disponible)
VALUES ('Peperoni', 'Carne fria', '2030-01-01', 100, 1),
 ('Queso', 'Lacteo', '2030-01-01', 100, 1),
 ('Sardinas', 'Mariscos', '2030-01-01', 100, 1),
 ('Salsa de tomate', 'Salsas', '2030-01-01', 100, 0);



SELECT * FROM tamaño;

INSERT INTO pizza(precio, id_tamaño, tipo_porcion)
VALUES(23000, 1, 'entera');

SELECT * FROM pizza;
SELECT * FROM ingredientes;

INSERT INTO pizza_ingredientes(pizza_id, ingrediente_id)
VALUES (1, 2),
 (1, 3),
 (1, 4),
 (1, 5);




SELECT * FROM pizza_ingredientes;


INSERT INTO productos(nombre, precio)
VALUES('Pizza de todo', 23000);


SELECT * FROM productos;


INSERT INTO productos_pizzas(id_pizza, id_producto)
VALUES(1, 2);

SELECT * FROM productos_pizzas;



3. **Registrar una bebida en el menú:**

INSERT INTO bebida(nombre, marca, sabor, fecha_vencimiento, stock)
VALUES('inca cola', 'pe causa', 'uva uwu', '2030-01-01', 100);

SELECT * FROM bebida;

INSERT INTO productos(nombre, precio)
VALUES('inca colita uwu', 100);

SELECT * FROM productos;

INSERT INTO productos_bebidas(bebida_id, producto_id)
VALUES(1, 3);






4. **Agregar un ingrediente a la base de datos:**

INSERT INTO ingredientes(nombre, tipo, fecha_vencimiento, stock, disponible)
VALUES ('Albaaca', 'Vegetales', '2030-01-01', 100, 1);


5. **Crear un pedido para un cliente:**

INSERT INTO pedidos(generated_AT)
VALUES('2020-01-01');

SELECT * FROM pedidos;


SELECT * FROM productos;
INSERT INTO pedido_producto(producto_id, pedido_id)
VALUES(2,1);






-- En la logica de un sistema funcional, el mismo sistema primero calcula cuanto vale el pedido en total, aca se va a poner un valor fijo como ejemplo, pero como tal, en un ejemplo practico se toma el valor de los productos y se calcula el valor total para asi poder luego crear un pedido
SELECT * FROM clientes;
INSERT INTO facturacion(cliente_id, metodo_pago, costo_total, hora_recogida)
VALUES(1, 'efectivo', 23000, '01:01:01');

SELECT * FROM facturacion;

INSERT INTO detalles_pedido(estado_pedido, costo_suma, pedido_id, id_facturacion)
VALUES('en preparacion', 23000, 1, 1);


SELECT * FROM detalles_pedido;




6. **Añadir productos a un pedido específico:**

SELECT * FROM pedidos;
SELECT * FROM productos;
INSERT INTO pedido_producto(producto_id, pedido_id)
VALUES(3,1);

SELECT * FROM pedido_producto;




7. **Añadir ingredientes adicionales a una pizza en un pedido:**


-- En la logica de negocio funcional, primero se genera la facturacion para asi tener cuales son los ingredientes que se van a agregar:
INSERT INTO facturacion(cliente_id, metodo_pago, costo_total, hora_recogida, ingredientes_adicionales)
VALUES(1, 'efectivo', 500, '01:01:01', 'Albaaca');

INSERT INTO pedidos(generated_AT)
VALUES('2025-06-01');

SELECT * FROM pedidos;
SELECT * FROM facturacion;

INSERT INTO detalles_pedido(estado_pedido, costo_suma, pedido_id, id_facturacion)
VALUES('en preparacion', 1, 2, 2);


SELECT * FROM pedido_producto;

INSERT INTO pedido_producto(producto_id, pedido_id)
VALUES(2, 2);



8. **Consultar el detalle de un pedido (productos y sus ingredientes):**

SELECT id_detalles_pedido FROM detalles_pedido;

SELECT pr.nombre, ing.nombre
FROM detalles_pedido AS dp
JOIN pedidos AS pe 
ON dp.pedido_id = pe.pedido_id
JOIN pedido_producto AS pp
ON pe.pedido_id = pp.pedido_id
JOIN productos AS pr
ON pr.producto_id = pp.producto_id
JOIN productos_pizzas AS pz
ON pz.id_producto = pr.producto_id
JOIN pizza
ON pizza.pizza_id = pz.id_pizza
JOIN pizza_ingredientes AS pizi
ON pizi.pizza_id = pizza.pizza_id
JOIN ingredientes AS ing
ON ing.ingrediente_id = pizi.ingrediente_id
WHERE dp.id_detalles_pedido = 2;



9. **Actualizar el precio de una pizza en el menú:**

SELECT * FROM pizza;
UPDATE pizza 
SET precio = 10
WHERE pizza_id = 1;

UPDATE pizza 
SET precio = 100
WHERE pizza_id = 1;


10. **Actualizar la dirección de un cliente:**

SELECT * FROM clientes;
UPDATE clientes 
SET direccion = 'Campuslands'
WHERE cliente_id = 1;

UPDATE clientes 
SET direccion = 'Provenza'
WHERE cliente_id = 1;


11. **Eliminar un producto del menú (bebida):**

SELECT * FROM productos;

DELETE FROM productos WHERE producto_id = 1;



12. **Eliminar un ingrediente de la base de datos:**

SELECT * FROM ingredientes;
DELETE FROM ingredientes WHERE ingrediente_id = 4;



13. **Consultar todos los pedidos de un cliente:**

SELECT cliente_id FROM clientes;
SELECT cl.nombre, ped.pedido_id
FROM clientes AS cl
JOIN facturacion AS fac
ON fac.cliente_id = cl.cliente_id
JOIN detalles_pedido AS dp
ON dp.id_facturacion = fac.id_facturacion
JOIN pedidos AS ped
ON ped.pedido_id = dp.pedido_id
WHERE cl.cliente_id = 1;



14. **Listar todos los productos disponibles en el menú (pizzas y bebidas):**

SELECT * FROM productos;






15. **Listar todos los ingredientes disponibles para personalizar una pizza:**

SELECT * FROM ingredientes;
SELECT * FROM ingredientes WHERE disponible = 1;



16. **Calcular el costo total de un pedido (incluyendo ingredientes adicionales):**




17. **Listar los clientes que han hecho más de 5 pedidos:**



18. **Buscar pedidos programados para recogerse después de una hora específica:**



19. **Listar todos los combos de pizzas con bebidas disponibles en el menú:**



20. **Buscar pizzas con un precio mayor a $100:**

SELECT * FROM pizza WHERE precio > 100;


21. calcular el total de ingresos por día, semana y mes. 



**Ingresos por Día:**



**Ingresos por Semana:**



**Ingresos por Mes:**


