# Store procedures

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