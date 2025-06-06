CREATE TABLE clientes(
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    num_contacto INT(4) NOT NULL,
    direccion VARCHAR(70) NOT NULL
);

CREATE TABLE facturacion(
    id_facturacion INT(4) AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT(4),
    metodo_pago VARCHAR(50) NOT NULL,
    costo_total DECIMAL(10,2) NOT NULL,
    hora_recogida TIMESTAMP NOT NULL,
    ingredientes_adicionales VARCHAR(50),
    CONSTRAINT fk_cliente_id_facturacion
        FOREIGN KEY(cliente_id)
        REFERENCES clientes (cliente_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE pedidos(
    pedido_id INT(4) AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE detalles_pedido(
    id_detalles_pedido INT(4) AUTO_INCREMENT PRIMARY KEY,
    estado_pedido VARCHAR(50) NOT NULL,
    costo_suma DECIMAL(10, 2) NOT NULL,
    pedido_id INT(4),
    id_facturacion INT(4),
    CONSTRAINT fk_pedido_id_detalles
        FOREIGN KEY(pedido_id)
        REFERENCES pedidos(pedido_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_id_facturacion_detalles
        FOREIGN KEY (id_facturacion)
        REFERENCES facturacion(id_facturacion)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);






CREATE TABLE pedido_producto(
    id_pedido_producto INT(4) AUTO_INCREMENT PRIMARY KEY,
    producto_id INT(4),
    pedido_id INT(4),
    CONSTRAINT fk_producto_id_pedido
        FOREIGN KEY(producto_id)
        REFERENCES productos(producto_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_pedido_id_producto
        FOREIGN KEY (pedido_id)
        REFERENCES pedidos(pedido_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE pedido_combo(
    pedido_combo_id INT(4) AUTO_INCREMENT PRIMARY KEY,
    combo_id INT(4),
    pedido_id INT(4),
    CONSTRAINT fk_combo_id_pedido
        FOREIGN KEY(combo_id)
        REFERENCES combos(combo_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_pedido_id_combos
        FOREIGN KEY (pedido_id)
        REFERENCES pedidos(pedido_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE combos(
    combo_id INT(4) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);


CREATE TABLE productos(
    producto_id INT(4) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);



CREATE TABLE combos_productos(
    combos_productos_id INT(4) AUTO_INCREMENT PRIMARY KEY,
    producto_id INT(4),
    combo_id INT(4),
    CONSTRAINT fk_combo_id_productos
        FOREIGN KEY(combo_id)
        REFERENCES combos(combo_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_producto_id_combos
        FOREIGN KEY (producto_id)
        REFERENCES productos(producto_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);



CREATE TABLE productos_bebidas(
    id_productos_bebidas INT(4) AUTO_INCREMENT PRIMARY KEY,
    bebida_id INT(4),
    producto_id INT(4),
    CONSTRAINT fk_bebida_id_productos
        FOREIGN KEY(bebida_id)
        REFERENCES bebida(bebida_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_producto_id_bebidas
        FOREIGN KEY (producto_id)
        REFERENCES productos(producto_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE bebida(
    bebida_id INTEGER(4) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    marca VARCHAR(40) NOT NULL,
    sabor VARCHAR(40) NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    stock INTEGER(5) NOT NULL
);




CREATE TABLE productos_pizzas(
    id_productos_pizzas INT(4) AUTO_INCREMENT PRIMARY KEY,
    id_pizza INT(4),
    id_producto INT(4),
    CONSTRAINT fk_id_pizza_producto
        FOREIGN KEY(id_pizza)
        REFERENCES pizza(pizza_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_id_producto_pizza
        FOREIGN KEY(id_producto)
        REFERENCES productos(producto_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE pizza(
    pizza_id INTEGER(4) AUTO_INCREMENT PRIMARY KEY,
    precio DECIMAL(10,2) NOT NULL,
    id_tamaño INTEGER(2),
    tipo_porcion ENUM('entera','individual') NOT NULL DEFAULT 'entera',
    CONSTRAINT fk_id_tamaño_pizza
        FOREIGN KEY(id_tamaño)
        REFERENCES tamaño(id_tamaño)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE tamaño(
    id_tamaño INTEGER(2) AUTO_INCREMENT PRIMARY KEY,
    is_disponible SMALLINT(1) NOT NULL,
    tipo_tamaño VARCHAR(40) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL
);



CREATE TABLE pizza_ingredientes(
    id_pizza_ingredientes INTEGER(4) AUTO_INCREMENT PRIMARY KEY,
    pizza_id INTEGER(4),
    ingrediente_id INTEGER(4),
    CONSTRAINT fk_pizza_id_ingrediente
        FOREIGN KEY(pizza_id)
        REFERENCES pizza(pizza_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_ingrediente_id_pizza
        FOREIGN KEY(ingrediente_id)
        REFERENCES ingredientes(ingrediente_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE ingredientes(
    ingrediente_id INTEGER(4) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    fecha_vencimiento DATE NOT NULL
);