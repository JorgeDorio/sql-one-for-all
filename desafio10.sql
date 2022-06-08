SELECT songs.name AS nome, COUNT(music_history.song_id) AS reproducoes

FROM SpotifyClone.songs
	INNER JOIN SpotifyClone.music_history
	ON songs.song_id=music_history.song_id
	INNER JOIN SpotifyClone.users
	ON music_history.user_id=users.user_id

WHERE users.plan_id = 1 OR users.plan_id = 4

GROUP BY music_history.song_id
ORDER BY songs.name ASC;
