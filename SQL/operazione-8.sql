-- 8. Visualizzare i concessionari che vendono un particolare modello
-- nel raggio di X kilometri dalla posizione di un certo utente

SELECT id,nome,distance(latitudine, longitudine, LatUtente, LongUtente)AS Distanza
FROM concessionario,(SELECT latitudine AS LatUtente, longitudine AS LongUtente
		 FROM utente
		 WHERE utente.username = 'donato') as foo
WHERE distance (latitudine, longitudine, LatUtente, LongUtente)<100 and id in (SELECT concessionario
										  FROM vendita
										  WHERE veicolo = 'Carbon Zero')