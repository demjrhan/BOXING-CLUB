CREATE TABLE WIN_TYPE
(
    ID INT PRIMARY KEY,
    DESCRIPTION VARCHAR(100)
);

INSERT INTO WIN_TYPE (ID, DESCRIPTION)
VALUES
  (1, 'Knock-out'),
  (2, 'Normal'),
  (3, 'Draw'),
  (4, 'Injury');


---

CREATE TABLE LEAGUE
(
    ID INT PRIMARY KEY,
    NAME VARCHAR(100),
    DESCRIPTION VARCHAR(500),
    START_DATE DATE,
    END_DATE DATE
);

INSERT INTO LEAGUE (ID, NAME, DESCRIPTION, START_DATE, END_DATE)
VALUES
  (1, 'Championship League', 'Annual boxing championship', '2024-01-01', '2024-04-01'),
  (2, 'Regional League', 'Regional boxing competition', '2024-02-01', '2024-05-01'),
  (3, 'International League', 'Global boxing tournament', '2024-03-01', '2024-06-01');

---

CREATE TABLE WEIGHT_CLASS
(
    ID INT PRIMARY KEY,
    NAME VARCHAR(100),
    DESCRIPTION VARCHAR(500),
    UPPER_LIMIT DECIMAL(10, 2),
    LOWER_LIMIT DECIMAL(10, 2)
);

INSERT INTO WEIGHT_CLASS (ID, NAME, DESCRIPTION, UPPER_LIMIT, LOWER_LIMIT)
VALUES
  (1, 'Heavyweight', 'Over 200 lbs', 300.00, 201.00),
  (2, 'Middleweight', '150-160 lbs', 160.00, 150.00),
  (3, 'Lightweight', '135-145 lbs', 145.00, 135.00),
  (4, 'Welterweight', '145-155 lbs', 155.00, 145.00),
  (5, 'Featherweight', '125-135 lbs', 135.00, 125.00);


----

CREATE TABLE SPONSOR
(
    ID INT PRIMARY KEY,
    NAME VARCHAR(100),
    DESCRIPTION VARCHAR(500),
    MONEY DECIMAL(10, 2)
);

INSERT INTO SPONSOR (ID, NAME, DESCRIPTION, MONEY)
VALUES
  (1, 'ABC Corp', 'Financial sponsor', 1000.25),
  (2, 'XYZ Inc', 'Equipment sponsor', 500.24),
  (3, 'Sports Gear Ltd', 'Clothing sponsor', 950.00),
  (4, 'Nutrition Plus', 'Nutrition sponsor', 1500.24),
  (5, 'Tech Solutions', 'Technology sponsor', 990.21);

----

CREATE TABLE TRAINER
(
    ID INT PRIMARY KEY,
    NAME VARCHAR(100),
    SURNAME VARCHAR(100),
    AGE DATE
);

INSERT INTO TRAINER (ID, NAME, SURNAME, AGE)
VALUES
  (1, 'John', 'Doe', '1987-01-01'),
  (2, 'Jane', 'Smith', '1994-01-01'),
  (3, 'Alice', 'Johnson', '1981-01-01'),
  (4, 'Bob', 'Williams', '1989-01-01'),
  (5, 'Eva', 'Miller', '1996-01-01');


----


CREATE TABLE BOXER
(
    ID INT PRIMARY KEY,
    NAME VARCHAR(100),
    SURNAME VARCHAR(100),
    AGE DATE,
    WEIGHT DECIMAL(10, 2),
    WEIGHT_CLASS_ID INT,
    TRAINER_ID INT,
    FOREIGN KEY (TRAINER_ID) REFERENCES TRAINER (ID),
    FOREIGN KEY (WEIGHT_CLASS_ID) REFERENCES WEIGHT_CLASS (ID)
);

INSERT INTO BOXER (ID, NAME, SURNAME, AGE, WEIGHT, WEIGHT_CLASS_ID, TRAINER_ID)
VALUES
  (1, 'Mike', 'Tyson', '1991-01-01', 250.8, 1, 1),
  (2, 'Muhammad', 'Ali', '1989-01-01', 155.3, 2, 2),
  (3, 'George', 'Foreman', '1976-01-01', 260.4, 1, 1),
  (4, 'Floyd', 'Mayweather', '1993-01-01', 152.2, 2, 2),
  (5, 'Manny', 'Pacquiao', '1986-01-01', 290.4, 1, 3),
  (6, 'Canelo', 'Alvarez', '1992-01-01', 156.8, 2, 4),
  (7, 'Miguel', 'Cotto', '1984-01-01', 149.8, 4, 3),
  (8, 'Vasyl', 'Lomachenko', '1989-01-01', 138.1, 3, 5),
  (9, 'Terence', 'Crawford', '1992-01-01', 146.4, 4, 4),
  (10, 'Gennady', 'Golovkin', '1982-01-01', 153.7, 2, 1),
  (11, 'Connor', 'McGregor', '1988-05-01', 139.7, 2, 1);


-----


CREATE TABLE RECORD
(
    ID INT PRIMARY KEY,
    WINS INT,
    LOSES INT,
    MATCH_PLAYED INT,
    DRAW INT,
    FOREIGN KEY (ID) REFERENCES BOXER (ID)
);

INSERT INTO RECORD (ID, WINS, LOSES, MATCH_PLAYED, DRAW)
VALUES
  (1, 8, 2, 15, 5),
  (2, 10, 2, 13, 1),
  (3, 6, 2, 11, 3),
  (4, 14, 1, 17, 2),
  (5, 15, 3, 21, 3),
  (6, 18, 2, 20, 0),
  (7, 20, 5, 25, 0),
  (8, 14, 1, 16, 1),
  (9, 16, 2, 19, 1),
  (10, 20, 2, 25, 3),
  (11, 25, 11, 37, 1);


-----

CREATE TABLE BOXER_SPONSOR
(
    ID INT PRIMARY KEY,
    BOXER_ID INT,
    SPONSOR_ID INT,
    SIGNING_DATE DATE,
    FOREIGN KEY (BOXER_ID) REFERENCES BOXER (ID),
    FOREIGN KEY (SPONSOR_ID) REFERENCES SPONSOR (ID)
);

INSERT INTO BOXER_SPONSOR (ID, BOXER_ID, SPONSOR_ID, SIGNING_DATE)
VALUES
  (1, 1, 1, '2022-03-15'),
  (2, 2, 2, '2022-04-20'),
  (3, 3, 3, '2022-05-25'),
  (4, 4, 4, '2022-06-30'),
  (5, 5, 5, '2022-07-05'),
  (6, 6, 1, '2022-08-10'),
  (7, 7, 2, '2022-09-15'),
  (8, 8, 3, '2022-10-20'),
  (9, 9, 4, '2022-11-25'),
  (10, 10, 5, '2022-12-30'),
  (11, 11, 4, '2022-10-11'),
  (12, 11, 3, '2022-10-11');


----

CREATE TABLE WEIGHT_CLASS_LEAGUE
(
    ID INT PRIMARY KEY,
    LEAGUE_ID INT,
    WEIGHT_CLASS_ID INT,
    FOREIGN KEY (LEAGUE_ID) REFERENCES LEAGUE (ID),
    FOREIGN KEY (WEIGHT_CLASS_ID) REFERENCES WEIGHT_CLASS (ID)
);

INSERT INTO WEIGHT_CLASS_LEAGUE (ID, LEAGUE_ID, WEIGHT_CLASS_ID)
VALUES
  (1, 1, 1),
  (2, 1, 2),
  (3, 2, 3),
  (4, 2, 4),
  (5, 3, 5),
  (6, 2, 2),
  (7, 3, 4),
  (8, 3, 3),
  (9, 1, 4),
  (10, 2, 2);


----

CREATE TABLE MATCH
(
    ID INT PRIMARY KEY,
    MATCH_DATE DATE,
    PLACE VARCHAR(100),
    WEIGHT_CLASS_ID INT,
    BOXER_1_ID INT,
    BOXER_2_ID INT,
    WIN_TYPE_ID INT,
    WINNER_ID INT,
    LOSER_ID INT,
    FOREIGN KEY (WEIGHT_CLASS_ID) REFERENCES WEIGHT_CLASS (ID),
    FOREIGN KEY (BOXER_1_ID) REFERENCES BOXER (ID),
    FOREIGN KEY (BOXER_2_ID) REFERENCES BOXER (ID),
    FOREIGN KEY (WIN_TYPE_ID) REFERENCES WIN_TYPE (ID)
);

INSERT INTO MATCH (ID, MATCH_DATE, PLACE, WEIGHT_CLASS_ID, BOXER_1_ID, BOXER_2_ID, WIN_TYPE_ID, WINNER_ID, LOSER_ID)
VALUES
  (1, '2024-01-10', 'Arena A', 1, 1, 3, 1, 1, 3),
  (2, '2024-01-15', 'Stadium B', 2, 2, 10, 4, null, null),
  (3, '2024-02-01', 'Arena C', 1, 3, 5, 2, 3, 5),
  (4, '2024-02-10', 'Stadium D', 2, 4, 2, 4, null, null),
  (5, '2024-02-20', 'Arena E', 1, 5, 1, 2, 5, 1),
  (6, '2024-03-10', 'Stadium F', 2, 6, 4, 3, null, null),
  (7, '2024-03-15', 'Arena G', 4, 7, 9, 3, null, null),
  (8, '2024-04-01', 'Stadium H', 3, 8, 11, 2, 8, 11),
  (9, '2024-04-10', 'Arena I', 4, 9, 7, 2, 9, 7),
  (10, '2024-04-20', 'Stadium J', 2, 10, 6, 2, 10, 6);
