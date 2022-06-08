DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plans(
    plan_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    plan_value DECIMAL(5,2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
    user_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    age INT NOT NULL,
    plan_id INT NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans (plan_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artists(
	artist_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	name VARCHAR(45) NOT NULL
) engine = InnoDb;

CREATE TABLE SpotifyClone.albuns(
	album_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,	
	artist_id INT NOT NULL,
	name VARCHAR(45) NOT NULL,
	release_year INT NOT NULL,
	FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists (artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs(
	song_id INT PRIMARY KEY NOT NULL,
	artist_id INT NOT NULL,
	album_id INT NOT NULL,
	name VARCHAR(90) NOT NULL,
	duration_sec INT NOT NULL,
	FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns (album_id),
  	FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists (artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.music_history(
        user_id INT NOT NULL,
        song_id INT NOT NULL,
        `date` DATETIME NOT NULL,
        CONSTRAINT PRIMARY KEY(user_id, song_id),
        FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (user_id),
        FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs (song_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.folowwing_artists(
	user_id INT NOT NULL,
	artist_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY(user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (user_id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists (artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plans (name, plan_value)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);
 
INSERT INTO SpotifyClone.users (user_id, name, age, plan_id)
VALUES
  (1, 'Thati', 23, 1),
  (2, 'Cintia', 35, 2),
  (3, 'Bill', 20, 4),
  (4, 'Roger', 45, 3),
  (5, 'Norman', 58, 3),
  (6, 'Patrick', 33, 2),
  (7, 'Vivian', 26, 4),
  (8, 'Carol', 19, 4),
  (9, 'Angelina', 42, 2),
  (10, 'Paul', 46, 2);
 
INSERT INTO SpotifyClone.artists (artist_id, name)
VALUES
  (1, 'Walter Phoenix'),
  (2, 'Peter Strong'),
  (3, 'Lance Day'),
  (4, 'Freedie Shannon'),
  (5, 'Tyler Isle'),
  (6, 'Fog');
 
INSERT INTO SpotifyClone.albuns (album_id, name, release_year, artist_id)
VALUES
  (1, 'Envious', 1990, 1),
  (2, 'Exuberant', 1993, 1),
  (3, 'Hallowed Steam', 1995, 2),
  (4, 'Incandescent', 1998, 3),
  (5, 'Temporary Culture', 2001, 4),
  (6, 'Library of liberty', 2003, 4),
  (7, 'Chained Down', 2007, 5),
  (8, 'Cabinet of fools', 2012, 5),
  (9, 'No guarantees', 2015, 5),
  (10, 'Apparatus', 2015, 6);
 
INSERT INTO SpotifyClone.songs (song_id, name, duration_sec, album_id, artist_id)
VALUES
  (1, 'Soul For Us', 200, 1, 1),
  (2, 'Reflections Of Magic', 163, 1, 1),
  (3, 'Dance With Her Own', 116, 1, 1),
  (4, 'Troubles Of My Inner Fire', 203, 2, 1),
  (5, 'Time Fireworks', 152, 2, 1),
  (6, 'Magic Circus', 105, 3, 2),
  (7, 'Honey, So Do I', 207, 3, 2),
  (8, "Sweetie, Let's Go Wild", 139, 3, 2),
  (9, 'She Knows', 244, 3, 2),
  (10, 'Fantasy For Me', 100, 4, 3),
  (11, 'Celebration Of More', 146, 4, 3),
  (12, 'Rock His Everything', 223, 4, 3),
  (13, 'Home Forever', 231, 4, 3),
  (14, 'Diamond Power', 241, 4, 3),
  (15, "Let's Be Silly", 132, 4, 3),
  (16, 'Thang Of Thunder', 240, 5, 4),
  (17, 'Words Of Her Life', 185, 5, 4),
  (18, 'Without My Streets', 176, 5, 4),
  (19, 'Need Of The Evening', 190, 6, 4),
  (20, 'History Of My Roses', 222, 6, 4),
  (21, 'Without My Love', 111, 6, 4),
  (22, 'Walking And Game', 123, 6, 4),
  (23, 'Young And Father', 197, 6, 4),
  (24, 'Finding My Traditions', 179, 7, 5),
  (25, 'Walking And Man', 229, 7, 5),
  (26, 'Hard And Time', 135, 7, 5),
  (27, "Honey, I'm A Lone Wolf", 150, 7, 5),
  (28, "She Thinks I Won't Stay Tonight", 166, 8, 5),
  (29, "He Heard You're Bad For Me", 154, 8, 5),
  (30, "He Hopes We Can't Stay", 210, 8, 5),
  (31, 'I Know I Know', 117, 8, 5),
  (32, "He's Walking Away", 159, 9, 5),
  (33, "He's Trouble", 138, 9, 5),
  (34, 'I Heard I Want To Bo Alone', 120, 9, 5),
  (35, 'I Ride Alone', 151, 9, 5),
  (36, 'Honey', 79, 10, 6),
  (37, 'You Cheated On Me', 95, 10, 6),
  (38, "Wouldn't It Be Nice", 213, 10, 6),
  (39, 'Baby', 136, 10, 6),
  (40, 'You Make Me Feel So..', 83, 10, 6);
 
INSERT INTO SpotifyClone.music_history (user_id, song_id, `date`)
VALUES
  (1, 36, '2020-02-28 10:45:55'),
  (1, 25, '2020-05-02 05:30:35'),
  (1, 23, '2020-03-06 11:22:33'),
  (1, 14, '2020-08-05 08:05:17'),
  (1, 15, '2020-09-14 16:32:22'),
  (2, 34, '2020-01-02 07:40:33'),
  (2, 24, '2020-05-16 06:16:22'),
  (2, 21, '2020-10-09 12:27:48'),
  (2, 39, '2020-09-21 13:14:46'),
  (3, 6, '2020-11-13 16:55:13'),
  (3, 3, '2020-12-05 18:38:30'),
  (3, 26, '2020-07-30 10:00:00'),
  (4, 2, '2021-08-15 17:10:10'),
  (4, 35, '2021-07-10 15:20:30'),
  (4, 27, '2021-01-09 01:44:33'),
  (5, 7, '2020-07-03 19:33:28'),
  (5, 12, '2017-02-24 21:14:22'),
  (5, 14, '2020-08-06 15:23:43'),
  (5, 1, '2020-11-10 13:52:27'),
  (6, 38, '2019-02-07 20:33:48'),
  (6, 29, '2017-01-24 00:31:17'),
  (6, 30, '2017-10-12 12:35:20'),
  (6, 22, '2018-05-29 14:56:41'),
  (7, 5, '2018-05-09 22:30:49'),
  (7, 4, '2020-07-27 12:52:58'),
  (7, 11, '2018-01-16 18:40:43'),
  (8, 39, '2018-03-21 16:56:40'),
  (8, 40, '2020-10-18 13:38:05'),
  (8, 32, '2019-05-25 08:14:03'),
  (8, 33, '2021-08-15 21:37:09'),
  (9, 16, '2021-05-24 17:23:45'),
  (9, 17, '2018-12-07 22:48:52'),
  (9, 8, '2021-03-14 06:14:26'),
  (9, 9, '2020-04-01 03:36:00'),
  (10, 20, '2017-02-06 08:21:34'),
  (10, 21, '2017-12-04 05:33:43'),
  (10, 12, '2017-07-27 05:24:49'),
  (10, 13, '2017-12-25 01:03:57');
 
INSERT INTO SpotifyClone.folowwing_artists (user_id, artist_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 3),
  (6, 1),
  (7, 2),
  (7, 5),
  (8, 1),
  (8, 5),
  (9, 6),
  (9, 4),
  (9, 3),
  (10, 2),
  (10, 6); 
