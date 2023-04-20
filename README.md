# MySQL_Libreria
	
***Descripción del modelo de negocio***
La librería que se desea modelar tiene varias tiendas físicas y opera bajo el modelo de negocio "Long Tail", lo que significa que se enfoca en ofrecer una gran variedad de libros, incluyendo aquellos que no son populares o bestsellers. Además, la librería también ofrece servicios de venta en línea a través de su sitio web.

***Identificación de entidades y atributos***
Para poder modelar correctamente la base de datos de la librería, es necesario identificar las entidades principales y sus atributos correspondientes. Entre las entidades se encuentran: los libros, los clientes, los empleados, los proveedores, los locales, las Compras, las Ciudades, los Países, los Bancos, las Formas de pago y las Ventas.

***Diseño del diagrama entidad-relación (DER)***
Una vez identificadas las entidades y sus atributos, se procede a diseñar el diagrama entidad-relación (DER) que represente de manera visual las relaciones entre las diferentes entidades. En este paso se definirán las claves primarias y foráneas, así como las cardinalidades de las relaciones.

***Creación de tablas en el sistema gestor de base de datos (SGBD)***
El siguiente paso es crear las tablas correspondientes en MySQL que es el gestor de base de datos (SGBD) que se eligió para la implementación de la base de datos. En esta etapa se definirán los tipos de datos para cada atributo y se establecerán las restricciones de integridad necesarias para garantizar la consistencia y fiabilidad de la base de datos.

***Carga de datos en la base de datos***
Una vez creadas las tablas, se procede a la carga de los datos en la base de datos. En este paso se ingresarán los datos de prueba para asegurarse de que la base de datos funciona correctamente y cumple con los requisitos establecidos.

***Implementación de consultas y generación de informes***
Finalmente, se implementan las consultas necesarias para obtener la información requerida por la librería y se generan los informes correspondientes para apoyar la toma de decisiones de la empresa. En esta etapa se pueden implementar también algunas funcionalidades adicionales, como la gestión de inventario y el procesamiento de pagos en línea.

***CREACIÓN DE OBJETOS DE LA BASE DE DATOS E INFORMES***
***VISTAS***
***vventas_clientes***
Se muestra el total de las ventas acumuladas por cliente, lo que permite a la librería categorizar a los clientes en función de su nivel de compra y generar campañas de marketing personalizadas para incentivar la lealtad y las compras repetidas. Esta vista es útil para identificar a los clientes más valiosos y recompensarlos con descuentos exclusivos o beneficios adicionales, lo que a su vez puede aumentar las ventas y mejorar la rentabilidad de la librería.

***vlibros_local***
Muestra la lista de los libros vendidos por local. Permite que se pueda confeccionar un pedido de reposición para cada local y también conocer cuales son los libros más vendidos por local. 

***vventas_local***
Muestra la facturación acumulada por local. Permite controlar la facturación de cada local y visualizar la participación de cada uno en la facturación total.

***vlibro_local***
Muestra en que locales se vendió un libro puntual.

***vventa_empleado***
Muestra las ventas acumuladas por empleado. Permite controlar la facturación por empleado.


***FUNCIONES***
***Consulta_comision***
Permite ingresar el ID de un Empleado y me devuelve la comisión que tiene para cobrar.

***Precio_publico***
Permite ingresar el margen de utilidad al costo de ventas para determinar el precio de venta al público (PVP). La función tiene seteado 40% de margen sobre costo.


***STORED PROCEDURES***
***Sp_altacliente***
Este procedimiento permite dar de alta de una forma más ágil a un cliente, al ingresar todos los datos necesarios en una sola query.
Estos son los datos requeridos y deben ser escritos en este orden:
Id_Cliente, Identificacion, Nombre_Cliente, Apellido_Cliente, Id_Pais, Id_Ciudad, Direccion, Codigo_Postal, Email, Telefono


***TRIGGER***
***tr_nuevo_libro***
Permite registrar una bitácora del ingreso de nuevos libros al catálogo de ventas, mostrando quién realizó el ingreso y en que fecha y hora. De esta forma podemos tener trazabilidad de un proceso tan delicado como el manejo del catálogo de la empresa y cuidar que el ingreso de nuevos productos se realice de acuerdo con las políticas definidas. El trigger se activará automáticamente cada vez que se inserte un nuevo registro en la tabla de libros


 
