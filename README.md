# Store procedures o procedimiento almacenado

Elaborar un procedimiento almacenado el cual retorne todas aquellas entradas dependiente de una fecha

```
DROP PROCEDURE IF EXISTS entradas; 

DELIMITER // 
CREATE PROCEDURE entradas(IN fecha date, OUT total INT) 

BEGIN 

 -- entradas
 SELECT
            count(*) INTO total
        FROM
            tb_pernocta
        WHERE
            fecha_llegada = fecha;

END 

// 
DELIMITER ;
```

Ejemplo de uso

```
call entradas('2016-09-10', @total);
select @total;
```

Elaborar un proceso que retorne el numero de pasajeros de entrada y salida de acuerdo a un aeropuerto en especifico en una fecha en especifico

```
DROP PROCEDURE IF EXISTS totalPasajeros; 

DELIMITER // 
CREATE PROCEDURE totalPasajeros(IN idaeropuerto int, IN fecha date, OUT total INT) 

BEGIN 

 -- entradas
 SELECT
            sum(num_pasajeros) INTO total
        FROM
            tb_pernocta
        WHERE
            fecha_llegada = fecha
				AND id_aeropuerto = idaeropuerto;

END 

// 
DELIMITER ; 
```

Ejemplo de uso

```
call totalPasajeros(1, '2016-09-10', @total);
select @total;
```


Elaborar un SP que me regrese el monto total para facturar a cada aerolinea por fecha

```
DROP PROCEDURE IF EXISTS facturar; 

DELIMITER // 
CREATE PROCEDURE facturar(IN idaerolinea int, IN fecha date, OUT totalFacturar DECIMAL(10,2)) 

BEGIN 

 -- entradas
  SELECT
            sum(TIMESTAMPDIFF(HOUR , hora_llegada, hora_salida ) * tb_aerolineas.tarifapernocta) INTO totalFacturar
        FROM
            tb_pernocta
         LEFT JOIN
         	tb_aerolineas
         	on tb_aerolineas.id_aerolinea = tb_pernocta.id_aerolinea    	
        WHERE
            tb_pernocta.fecha_llegada = fecha
				AND tb_pernocta.id_aerolinea = idaerolinea;

END 

// 
DELIMITER ;
```

Ejemplo de uso

```
call facturar(1, '2016-09-10', @totalFacturar);
select @totalFacturar;
```