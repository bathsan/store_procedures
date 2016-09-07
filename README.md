# Store procedures

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