SELECT users.name AS usuario, COUNT(music_history.user_id) AS qtde_musicas_ouvidas, ROUND((SUM(songs.duration_sec) / 60),2) AS total_minutos
FROM SpotifyClone.users
INNER JOIN SpotifyClone.music_history
ON users.user_id=music_history.user_id
INNER JOIN SpotifyClone.songs
ON music_history.song_id=songs.song_id
GROUP BY music_history.user_id
ORDER BY users.name