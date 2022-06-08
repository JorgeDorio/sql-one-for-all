SELECT artists.name AS artista, albuns.name AS album
FROM SpotifyClone.artists
INNER JOIN SpotifyClone.albuns
ON artists.artist_id=albuns.artist_id 
WHERE artists.name = 'Walter Phoenix'
ORDER BY albuns.name ASC;