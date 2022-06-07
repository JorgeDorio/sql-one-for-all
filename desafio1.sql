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
 
INSERT INTO SpotifyClone.music_history (user_id, song_id)
VALUES
  (1, 36),
  (1, 25),
  (1, 23),
  (1, 14),
  (1, 15),
  (2, 34),
  (2, 24),
  (2, 21),
  (2, 39),
  (3, 6),
  (3, 3),
  (3, 26),
  (4, 2),
  (4, 35),
  (4, 27),
  (5, 7),
  (5, 12),
  (5, 14),
  (5, 1),
  (6, 38),
  (6, 29),
  (6, 30),
  (6, 22),
  (7, 5),
  (7, 4),
  (7, 11),
  (8, 39),
  (8, 40),
  (8, 32),
  (8, 33),
  (9, 16),
  (9, 17),
  (9, 8),
  (9, 9),
  (10, 20),
  (10, 21),
  (10, 12),
  (10, 13);
 
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
