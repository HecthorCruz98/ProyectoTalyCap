create table tipo_documento(
id_tipodocumento int primary key identity,
tipo_documento varchar(50) not null
);

insert into tipo_documento values('Pasaporte')

create table usuario(
id_usuario int primary key identity,
id_tipodocumento int not null,
documento int not null,
nombre varchar(50) not null,
apellido varchar(50) not null,
usuario varchar(510) not null,
pass varchar(10) not null,
correo varchar(50) not null,
celular varchar(10) not null,
foreign key (id_tipodocumento) references tipo_documento(id_tipodocumento)
);
select * from tipo_documento
insert into usuario values(2,'53905556','Ana','Castillo','AnaC','147258','hcruz5785@gmail.com','3219856584')

create table jornada(
id_jornada int primary key identity,
jornada varchar(50) not null
);
insert into jornada values('Noche')


create table estacion(
id_estacion int primary key identity,
nombre_estacion varchar(50) not null
);
insert into estacion values('Primavera')

create table tipo_temperatura(
id_tipotemperatura int primary key identity,
nombre_temperatura varchar(50) not null
);
insert into tipo_temperatura values('Lluvia')

create table tipo_clima(
id_tipoclima int primary key identity,
nombre_clima varchar(50) not null
);
insert into tipo_clima values('°Farenheit')

create table clima(
id_clima int primary key identity,
id_tipoclima int not null,
id_tipotemperatura int not null,
velocidad_viento varchar(50) not null,
id_usuario int not null,
medida_temperatura int not null,
fecha_clima datetime not null,
fecha_registro datetime null,
id_estacion int not null,
id_jornada int not null,
foreign key (id_clima) references tipo_clima(id_tipoclima),
foreign key (id_tipotemperatura) references tipo_temperatura(id_tipotemperatura),
foreign key (id_usuario) references usuario(id_usuario),
foreign key (id_estacion) references estacion(id_estacion),
foreign key (id_jornada) references jornada(id_jornada),
);
select * from tipo_temperatura
select * from tipo_clima
select * from estacion



insert into clima values(1,1,'10',1,10,'2022-09-20','2022-09-20',1,1)

CREATE PROC CRUD_CLIMA

@IdClima INT,
@IdTipoClima INT,
@IdTipoTemperatura INT,
@VelocidadViento VARCHAR(10),
@IdUsuario INT,
@MedidaTemperatura INT,
@FechaClima DATETIME,
@FechaRegistro DATETIME,
@IdEstacion INT,
@IdJornada INT,
@TipoProceso INT


AS
	BEGIN
	
		
		--SI EL TIPO DE PROCESO ES: 1 - GUARDAR, 2 - ACTUALIZAR, 3 - ELIMINAR
	IF (@TipoProceso = 1) 

		BEGIN
		   --INSERTAR EL REGISTRO EN LA BASE DE DATOS.
		   INSERT INTO clima VALUES(@IdTipoClima,@IdTipoTemperatura,@VelocidadViento,@IdUsuario,
		   @MedidaTemperatura,@FechaClima,@FechaRegistro,@IdEstacion,@IdJornada);

		END
		
	ELSE IF(@TipoProceso = 2)	
		
		BEGIN
		   --ACTUALIZAR EL REGISTRO EN LA BASE DE DATOS.
		   UPDATE clima
		   SET id_tipoclima = @IdTipoClima, id_tipotemperatura = @IdTipoTemperatura, velocidad_viento = @VelocidadViento, 
		   id_usuario = @IdUsuario, medida_temperatura = @MedidaTemperatura,fecha_clima=@FechaClima,@FechaRegistro=getdate(),
		   id_estacion=@IdEstacion,id_jornada = @IdJornada
		   WHERE id_clima = @IdClima;

		  END

	ELSE IF(@TipoProceso = 3)	

		BEGIN
		   --ELIMINAR EL REGISTRO EN LA BASE DE DATOS.

		   DELETE clima
		   WHERE id_clima = @IdClima;

		  END


END;
