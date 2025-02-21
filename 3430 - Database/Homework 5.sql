-- HOMEWORK 5 - CS 3430 (SP/25) DR. TINGHAO FENG
-- JOHN KEARNEY - 02/21/2025

DROP TABLE IF EXISTS CLUB;
DROP TABLE IF EXISTS TEAM;
DROP TABLE IF EXISTS COACH;
DROP TABLE IF EXISTS PLAYER;

CREATE TABLE CLUB (
	club_name CHAR(100)
);

INSERT INTO CLUB (club_name) VALUES
('Club 1'),
('Club 2');

CREATE TABLE TEAM (
	team_name VARCHAR(100),
    coach VARCHAR(100),
    club varchar(100),
    FOREIGN KEY (club) REFERENCES CLUB(club_name)
);

INSERT INTO TEAM (team_name, coach, club) VALUES
('Team Demons', 'Coach Pellico', 'Club 1'),
('Team Eagles', 'Coach Ciacia', 'Club 1'),
('Team Crashouts', 'Coach Dean', 'Club 1'),

('Team Parrots', 'Coach Jester', 'Club 2'),
('Team Meerkats', 'Coach Orangepeel', 'Club 2'),
('Team Gluten', 'Coach Celia', 'Club 2');

CREATE TABLE COACH (
	coach_name VARCHAR(100),
	team VARCHAR(100),
	FOREIGN KEY (team) REFERENCES TEAM(team_name)
);

INSERT INTO COACH (coach_name, team) VALUES
('Team Demons', 'Coach Pellico'),
('Team Eagles', 'Coach Ciacia'),
('Team Crashouts', 'Coach Dean'),

('Team Parrots', 'Coach Jester'),
('Team Meerkats', 'Coach Orangepeel'),
('Team Gluten', 'Coach Celia');

CREATE TABLE PLAYER (
	player_number INT,
    player_name VARCHAR(100),
    player_salary INT,
    team VARCHAR(100),
    FOREIGN KEY (team) REFERENCES TEAM(team_name)
);

INSERT INTO PLAYER (player_number, player_name, player_salary, team) VALUES
(11, 'Gabe Riel', 1000000, 'Team Demons'),
(12, 'Luci Fur', 1000000, 'Team Demons'),

(13, 'Jeremy Baldhead', 1000000, 'Team Eagles'),
(14, 'Noah Yellowbeak', 1000000, 'Team Eagles'),

(15, 'Sean White', 1000000, 'Team Crashouts'),
(16, 'Tony Hawk', 1000000, 'Team Crashouts'),

(17, 'ilave wyrms', 1700, 'Team Parrots'),
(18, 'ayelave beetles', 2200, 'Team Parrots'),

(19, 'prarye dawg', 1000000, 'Team Meerkats'),
(20, 'miller sandcat', 1000000, 'Team Meerkats'),

(21, 'Bready Waltz', 1000000, 'Team Gluten'),
(22, 'Dave Flouer', 1000000, 'Team Gluten');

SELECT * FROM CLUB;
SELECT * FROM TEAM;
SELECT * FROM COACH;
SELECT * FROM PLAYER;