-- 8. Visualizzare i concessionari che vendono un particolare modello
-- nel raggio di X kilometri dalla posizione di un certo utente

SELECT id,nome,distance(latitudine, longitudine, LatUtente, LongUtente)AS Distanza
FROM concessionario JOIN vendita ON concessionario.id=vendita.concessionario,(SELECT latitudine AS LatUtente, longitudine AS LongUtente
		 FROM utente
		 WHERE utente.username = 'donato') AS userPos		 
WHERE distance (latitudine, longitudine, LatUtente, LongUtente)<100 AND veicolo = 'i-Miev'