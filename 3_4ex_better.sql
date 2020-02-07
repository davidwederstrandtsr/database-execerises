# set database to use
USE albums_db;

# list current tables
SHOW TABLES;

# show the structure of albums table
SHOW CREATE TABLE albums;

# show albums table structure
DESCRIBE albums;

# list all of Pink Floyd's albums
SELECT * 
FROM albums
WHERE artist = 'Pink Floyd';

# better way
SELECT NAME AS "Albums by Pink Floyd"
FROM albums
WHERE artist = "Pink Floyd";
# The Dark Side of the Moon, The Wall

# Year SGT Pepper's Lonely Hearts Club
SELECT release_date 
FROM albums
WHERE NAME = "Sgt. Pepper's Lonely Hearts Club Band";
# 1967

# genre for Nevermind album
SELECT genre 
FROM albums
WHERE NAME = 'Nevermind';
# Grunge, Alternative rock

# albums released in 1990's
SELECT NAME , artist, release_date
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;
# 11 albums

# albums with less then 20 million in sales
SELECT * 
FROM albums
WHERE sales < 20;
# 13 albums

# genre Rock. why not Hard or Progessive Rock
SELECT * 
FROM albums
WHERE genre = 'Rock';
# because we are not looking for a wild card first
# are search is for exactly Rock

SELECT *
FROM albums
WHERE genre LIKE '%rock%';
