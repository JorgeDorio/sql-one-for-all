SELECT artists.name AS artista, albuns.name AS album, COUNT(folowwing_artists.artist_id) AS seguidores
FROM SpotifyClone.artists
INNER JOIN SpotifyClone.albuns
ON artists.artist_id=albuns.artist_id
INNER JOIN folowwing_artists
ON artists.artist_id=folowwing_artists.artist_id
GROUP BY albuns.album_id
ORDER BY COUNT(folowwing_artists.artist_id) DESC, artists.name ASC, albuns.name ASC;