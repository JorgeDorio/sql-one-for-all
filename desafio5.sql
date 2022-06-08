SELECT songs.name AS cancao, COUNT(music_history.song_id) AS reproducoes
FROM SpotifyClone.songs
INNER JOIN SpotifyClone.music_history
ON songs.song_id=music_history.song_id
GROUP BY music_history.song_id
ORDER BY COUNT(music_history.song_id) DESC, songs.name ASC
LIMIT 2;