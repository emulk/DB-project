CREATE OR REPLACE FUNCTION distance(lat1 FLOAT, lon1 FLOAT, lat2 FLOAT, lon2 FLOAT) RETURNS FLOAT AS $$
DECLARE                                                   
    x float = 69.1 * (lat2 - lat1);                           
    y float = 69.1 * (lon2 - lon1) * cos(lat1 / 57.3);        
BEGIN                                                     
    RETURN sqrt(x * x + y * y)*1.60934;                               
END  
$$ LANGUAGE plpgsql;

-- 7.Visualizzare le colonnine elettriche nel raggio di X kilometri dalla posizione di un certo utente

SELECT id,distance(latitudine, longitudine, LatUtente, LongUtente)as Distance
FROM colonnina, (SELECT latitudine AS LatUtente, longitudine AS LongUtente
					FROM utente
					WHERE utente.username = 'donato') as foo
WHERE distance (latitudine, longitudine, LatUtente, LongUtente)<42

-- Bisogna capire come passare dei parametri alla query sql. Nell'esempio ho messo donato ma bisogna poterlo inserire manualmente.
