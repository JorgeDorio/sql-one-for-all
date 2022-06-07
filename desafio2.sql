SELECT
  (SELECT Count(song_id) FROM songs) AS cancoes,
  (SELECT Count(artist_id) FROM artists) AS artistas,
  (SELECT Count(album_id) FROM albuns) AS albuns;