-------------------------------------------------BASIC QUERIES---------------------------------------------------

--Query 1: Select all columns and all rows from one table - EXHIBITION table.

SELECT * FROM exhibition;

-----------------------------------------------------------------------------------------------------------------

--Query 2: Select five columns(first_name, last_name, email, phone, zip) and all rows from one table - ARTIST table.

SELECT 
	first_name, 
	last_name, 
	email, 
	phone, 
	zip
FROM artist;

-----------------------------------------------------------------------------------------------------------------

--Query 3: Select all columns from all rows from one view - ArtistPortfolio

SELECT * FROM ArtistPortfolio;

-----------------------------------------------------------------------------------------------------------------

--Query 4: Using a join on 2 tables - ARTIST and ARTWORK tables, select all columns and all rows from the tables without the use of a Cartesian product

SELECT * FROM artist 
JOIN artwork
USING (artist_id);

-----------------------------------------------------------------------------------------------------------------

--Query 5: Select and order data - based on date retrieved from one table - EXHIBITION table

SELECT * FROM exhibition
ORDER BY date ASC;

-----------------------------------------------------------------------------------------------------------------

--Query 6: Using a join on 3 tables - EXHIBITION, BOOKING and VISITOR tables, select 5 columns - exhibition name, visitor first name, visitor last name, slot start and payment method from the 3 tables.
--Use syntax that would limit the output to 10 rows

SELECT name AS "Exhibition Name", first_name, last_name, slot_start, payment_method FROM booking 
JOIN exhibition USING (exhibition_id) 
JOIN visitor USING (visitor_id)
LIMIT 10;

-----------------------------------------------------------------------------------------------------------------

--Query 7: Select distinct rows - art_id, title, description, exhibition_id, name using joins on 3 tables - ARTWORK, DISPLAY and EXHIBTION tables

SELECT DISTINCT 
	A.art_id, A.title, A.description, E.exhibition_id, E.name
FROM display
JOIN artwork A USING (art_id)
JOIN exhibition E USING (exhibition_id);

-----------------------------------------------------------------------------------------------------------------

--Query 8: Use GROUP BY and HAVING in a select statement using one or more tables - ARTWORK table

SELECT artist_id, COUNT(artist_id)
FROM artwork 
GROUP BY artist_id
HAVING COUNT(artist_id)>2;

-----------------------------------------------------------------------------------------------------------------

--Query 9: Use IN clause to select data from one or more tables - ARTWORK table

SELECT title, description, medium 
FROM artwork
WHERE medium IN ('Oil', 'Acrylic', 'Watercolor');

-----------------------------------------------------------------------------------------------------------------

--Query 10: Select length of one column from one table - ARTWORK table (use LENGTH function)

SELECT art_id, title, LENGTH(title) AS "Length OF Title" FROM artwork;

-----------------------------------------------------------------------------------------------------------------

--Query 11: Delete one record from one table. Use select statements to demonstrate the table contents before and after the DELETE statement.

SELECT * FROM booking;

BEGIN;

DELETE FROM booking 
WHERE booking_id = 1;

SELECT * FROM booking;

ROLLBACK;

SELECT * FROM booking;

-----------------------------------------------------------------------------------------------------------------

--Query 12: Update one record from one table. Use select statements to demonstrate the table contents before and after the UPDATE statement.

SELECT * FROM display;

BEGIN;

UPDATE display 
SET location = 'N/A'
WHERE display_id = 1;

SELECT * FROM display;

ROLLBACK;

SELECT * FROM display;

-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------ADVANCED QUERIES--------------------------------------------------

--Query 13: Find out the visitor who can visit the maximum number of artworks across all exhibitions. Display visitor_id, visitor name, Number of artworks they could visit and the number of exhibitions that facilitate this.

SELECT 
	v.first_name || ' ' || v.last_name AS "Visitor Name", 
	COUNT(DISTINCT(b.exhibition_id)) AS "Number of Exhibitions", 
	COUNT(art_id) AS "Number of Artworks" 
FROM booking b
JOIN display d USING (exhibition_id)
JOIN visitor v USING (visitor_id)
WHERE 
	slot_start < end_time  AND slot_end > start_time
GROUP BY 
	v.visitor_id, v.first_name || ' ' || v.last_name
ORDER BY COUNT(art_id) DESC
LIMIT 1;

-----------------------------------------------------------------------------------------------------------------
--Query 14: Display the Exhibition name, number of visitors for each exhibition and the number of artists that were present to display their work in the exhibitions. Order the exhibitions by total people who were present at some point in the exhibition

SELECT 
	name AS "Exhibition Name",
	COUNT(DISTINCT(visitor_id)) AS "Visitor Count",
	COUNT(DISTINCT(artist_id, exhibition_id)) AS "Present Artist Count",
	COUNT(DISTINCT(visitor_id)) + COUNT(DISTINCT(artist_id, exhibition_id)) AS "Total People Count"
	FROM booking
JOIN exhibition e USING (exhibition_id)
JOIN display USING (exhibition_id)
JOIN artwork USING (art_id)
WHERE artist_presence = TRUE
GROUP BY e.name
ORDER BY COUNT(DISTINCT(visitor_id)) + COUNT(DISTINCT(artist_id, exhibition_id)) DESC;
