USE titanic_db;
DESCRIBE passengers;
SELECT survived, passenger_id FROM passengers;
SELECT * FROM passengers
WHERE class = 'First'
AND embark_town = "Southampton"
AND age < 10;

SELECT * FROM passengers
WHERE age BETWEEN 20 AND 30
AND sex = "male";