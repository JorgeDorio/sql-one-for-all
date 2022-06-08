SELECT users.name AS usuario, IF(MAX(YEAR(music_history.date)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM SpotifyClone.users
INNER JOIN SpotifyClone.music_history
ON users.user_id=music_history.user_id
GROUP BY music_history.user_id
ORDER BY users.name;