/*
 Project BAUN 6320 - UTD
 Group 5
 ART GALLERY MANAGEMENT
*/

/* DROP statements to clean up objects from previous run */

-- Triggers

DROP TRIGGER IF EXISTS TRG_VISITOR ON visitor;
DROP TRIGGER IF EXISTS TRG_EXHIBITION ON exhibition;
DROP TRIGGER IF EXISTS TRG_ARTIST ON artist;
DROP TRIGGER IF EXISTS TRG_ARTWORK ON artwork;
DROP TRIGGER IF EXISTS TRG_DISPLAY ON display;
DROP TRIGGER IF EXISTS TRG_BOOKING ON booking;
DROP TRIGGER IF EXISTS TRG_CHECK_DATE ON display;

-- Functions

DROP FUNCTION IF EXISTS TRG_FUN_VISITOR;
DROP FUNCTION IF EXISTS TRG_FUN_EXHIBITION;
DROP FUNCTION IF EXISTS TRG_FUN_ARTIST;
DROP FUNCTION IF EXISTS TRG_FUN_ARTWORK;
DROP FUNCTION IF EXISTS TRG_FUN_DISPLAY;
DROP FUNCTION IF EXISTS TRG_FUN_BOOKING;
DROP FUNCTION IF EXISTS TRG_FUN_CHECK_DATE;

-- Sequences

DROP SEQUENCE IF EXISTS SEQ_VISITOR_visitor_id;
DROP SEQUENCE IF EXISTS SEQ_EXHIBITION_exhibition_id;
DROP SEQUENCE IF EXISTS SEQ_ARTIST_artist_id;
DROP SEQUENCE IF EXISTS SEQ_ARTWORK_art_id;
DROP SEQUENCE IF EXISTS SEQ_DISPLAY_display_id;
DROP SEQUENCE IF EXISTS SEQ_BOOKING_booking_id;

-- Views

DROP VIEW IF EXISTS VisitorInfo;
DROP VIEW IF EXISTS ArtistPortfolio;

-- Indices

DROP INDEX IF EXISTS IDX_VISITOR_visitor_id;

DROP INDEX IF EXISTS IDX_EXHIBITION_exhibition_id;
DROP INDEX IF EXISTS IDX_EXHIBITION_name;

DROP INDEX IF EXISTS IDX_ARTIST_artist_id;
DROP INDEX IF EXISTS IDX_ARTIST_first_name;

DROP INDEX IF EXISTS IDX_ARTWORK_art_id;
DROP INDEX IF EXISTS IDX_ARTWORK_artist_id_FK;
DROP INDEX IF EXISTS IDX_ARTWORK_title;

DROP INDEX IF EXISTS IDX_DISPLAY_art_id_FK;
DROP INDEX IF EXISTS IDX_DISPLAY_exhibition_id_FK;
DROP INDEX IF EXISTS IDX_DISPLAY_location;

DROP INDEX IF EXISTS IDX_BOOKING_booking_id;
DROP INDEX IF EXISTS IDX_BOOKING_visitor_id_FK;
DROP INDEX IF EXISTS IDX_BOOKING_exhibition_id_FK;
DROP INDEX IF EXISTS IDX_BOOKING_slot_start;

-- Tables

DROP TABLE IF EXISTS booking;
DROP TABLE IF EXISTS display;
DROP TABLE IF EXISTS artwork;
DROP TABLE IF EXISTS artist;
DROP TABLE IF EXISTS exhibition;
DROP TABLE IF EXISTS visitor;

-----------------------------------------------------------------------------------------------------------------
/* Creating tables based on entities */

CREATE TABLE visitor(
    visitor_id		INTEGER 		NOT NULL,
    first_name 		VARCHAR(60)		NOT NULL,
	last_name 		VARCHAR(60),
	phone 			VARCHAR(10),
    email			VARCHAR(200)	NOT NULL,

    CONSTRAINT PK_visitor PRIMARY KEY (visitor_id),
	CONSTRAINT chk_phone CHECK (phone LIKE '__________' AND phone NOT LIKE '%[^0-9]%'),
	CONSTRAINT chk_email CHECK (email LIKE '%_@_%._%')
);

CREATE TABLE exhibition(
    exhibition_id	INTEGER 		NOT NULL,
    name	 		VARCHAR(60)		NOT NULL,
	venue	 		VARCHAR(60)		NOT NULL,
    date			DATE			NOT NULL,
	mode			VARCHAR(10)		NOT NULL,

    CONSTRAINT PK_exhibition PRIMARY KEY (exhibition_id)
);

CREATE TABLE artist(
    artist_id 		INTEGER 		NOT NULL,
    email			VARCHAR(200),
    first_name 		VARCHAR(60)		NOT NULL,
	last_name 		VARCHAR(60),
    office_address 	VARCHAR(200),
	phone 			VARCHAR(10),
	zip				VARCHAR(5),

    CONSTRAINT PK_artist PRIMARY KEY (artist_id),
    CONSTRAINT chk_email CHECK (email LIKE '%_@_%._%'),
	CONSTRAINT chk_phone CHECK (phone LIKE '__________' AND phone NOT LIKE '%[^0-9]%'),
	CONSTRAINT chk_zip CHECK (zip LIKE '_____' AND zip NOT LIKE '%[^0-9]%')
);

CREATE TABLE artwork(
	art_id			INTEGER			NOT NULL,
    artist_id 		INTEGER,
	title			VARCHAR(60)		NOT NULL,
    description		VARCHAR(500),
	medium	 		VARCHAR(100)	NOT NULL,
    first_display	DATE			NOT NULL,

    CONSTRAINT PK_artwork PRIMARY KEY (art_id),
	CONSTRAINT FK_ARTIST_artist_id FOREIGN KEY (artist_id) REFERENCES artist
);

CREATE TABLE display(
	display_id		INTEGER			NOT NULL,
	art_id 			INTEGER			NOT NULL,
	exhibition_id	INTEGER			NOT NULL,
	start_time		TIME			NOT NULL,
	end_time		TIME			NOT NULL,
	location		VARCHAR(60)		NOT NULL,
	artist_presence	BOOLEAN			NOT NULL,

    CONSTRAINT PK_display PRIMARY KEY (display_id),
	CONSTRAINT DISPLAY_bridging UNIQUE (art_id, exhibition_id),
	CONSTRAINT CHECK_time CHECK (start_time < end_time),
	CONSTRAINT FK_ARTWORK_art_id FOREIGN KEY (art_id) REFERENCES artwork,
	CONSTRAINT FK_EXHIBITION_EXHIBITION_id FOREIGN KEY (exhibition_id) REFERENCES exhibition
);

CREATE TABLE booking(
	booking_id		INTEGER			NOT NULL,
	visitor_id		INTEGER			NOT NULL,
	exhibition_id	INTEGER			NOT NULL,
	time			TIME			NOT NULL,
	slot_start		TIME			NOT NULL,
	slot_end		TIME			NOT NULL,
	payment_method	VARCHAR(15)		NOT NULL,

    CONSTRAINT PK_booking PRIMARY KEY (booking_id),
	CONSTRAINT BOOKING_bridging UNIQUE (visitor_id, exhibition_id),
	CONSTRAINT CHECK_slot CHECK (slot_start < slot_end),
	CONSTRAINT FK_VISITOR_visitor_id FOREIGN KEY (visitor_id) REFERENCES visitor,
	CONSTRAINT FK_EXHIBITION_EXHIBITION_id FOREIGN KEY (exhibition_id) REFERENCES exhibition
);

-----------------------------------------------------------------------------------------------------------------
/* Create indices for natural keys, foreign keys, and frequently-queried columns */

-- VISITOR
-- Natural Keys
CREATE INDEX IDX_VISITOR_visitor_id 		ON visitor (visitor_id);

-- EXHIBITION
-- Natural Keys
CREATE INDEX IDX_EXHIBITION_exhibition_id 	ON exhibition (exhibition_id);
--  Frequently-queried columns
CREATE INDEX IDX_EXHIBITION_name	 		ON exhibition(name);

-- ARTIST
-- Natural Keys
CREATE INDEX IDX_ARTIST_artist_id 			ON artist (artist_id);
--  Frequently-queried columns
CREATE INDEX IDX_ARTIST_first_name	 		ON artist (first_name);

-- ARTWORK
--  Natural Keys
CREATE INDEX IDX_ARTWORK_art_id 		ON artwork (art_id);
--  Foreign Keys
CREATE INDEX IDX_ARTWORK_artist_id_FK 		ON artwork (artist_id);
--  Frequently-queried columns
CREATE INDEX IDX_ARTWORK_title		 		ON artwork (title);

-- DISPLAY
--  Foreign Keys
CREATE INDEX IDX_DISPLAY_art_id_FK  		ON display (art_id);
CREATE INDEX IDX_DISPLAY_exhibition_id_FK 	ON display (exhibition_id);
--  Frequently-queried columns
CREATE INDEX IDX_DISPLAY_location	      	ON display (location);

-- BOOKING
-- Natural Keys
CREATE INDEX IDX_BOOKING_booking_id 		ON booking (booking_id);
--  Foreign Keys
CREATE INDEX IDX_BOOKING_visitor_id_FK   	ON booking (visitor_id);
CREATE INDEX IDX_BOOKING_exhibition_id_FK  	ON booking (exhibition_id);
--  Frequently-queried columns
CREATE INDEX IDX_BOOKING_slot_start 		ON booking (slot_start);

-----------------------------------------------------------------------------------------------------------------
/* Alter Tables by adding Audit Columns */

ALTER TABLE visitor
	ADD COLUMN created_by    VARCHAR(30),
    ADD COLUMN date_created  DATE,
    ADD COLUMN modified_by   VARCHAR(30),
    ADD COLUMN date_modified DATE;

ALTER TABLE exhibition
	ADD COLUMN created_by    VARCHAR(30),
    ADD COLUMN date_created  DATE,
    ADD COLUMN modified_by   VARCHAR(30),
    ADD COLUMN date_modified DATE;

ALTER TABLE artist
	ADD COLUMN created_by    VARCHAR(30),
    ADD COLUMN date_created  DATE,
    ADD COLUMN modified_by   VARCHAR(30),
    ADD COLUMN date_modified DATE;

ALTER TABLE artwork
	ADD COLUMN created_by    VARCHAR(30),
    ADD COLUMN date_created  DATE,
    ADD COLUMN modified_by   VARCHAR(30),
    ADD COLUMN date_modified DATE;

ALTER TABLE display
	ADD COLUMN created_by    VARCHAR(30),
    ADD COLUMN date_created  DATE,
    ADD COLUMN modified_by   VARCHAR(30),
    ADD COLUMN date_modified DATE;

ALTER TABLE booking
	ADD COLUMN created_by    VARCHAR(30),
    ADD COLUMN date_created  DATE,
    ADD COLUMN modified_by   VARCHAR(30),
    ADD COLUMN date_modified DATE;

-----------------------------------------------------------------------------------------------------------------
/* Create Views */

-- Business purpose: The VisitorInfo view will be used primarily for rapidly fetching the email information of individual visitors to enable easy and efficient communication enablement.
CREATE VIEW VisitorInfo AS
SELECT visitor_id, first_name, email
FROM visitor;

-- Business purpose: The ArtistPorfolio view will be used primarily for fetching all the artwork title of a particular artist.
CREATE VIEW ArtistPortfolio AS
SELECT CASE 
        WHEN artist.last_name IS NOT NULL THEN artist.first_name || ' ' || artist.last_name
        ELSE artist.first_name
    END as "ARTIST", title as "ARTWORK title"
FROM artist
left join artwork on artist.artist_id = artwork.artist_id
order by (artist.first_name || ' ' || artist.last_name), title;

-----------------------------------------------------------------------------------------------------------------
/* Create Sequences */

CREATE SEQUENCE SEQ_VISITOR_visitor_id
    INCREMENT BY 1
    START WITH 1;

CREATE SEQUENCE SEQ_EXHIBITION_exhibition_id
    INCREMENT BY 1
    START WITH 1;

CREATE SEQUENCE SEQ_ARTIST_artist_id
    INCREMENT BY 1
    START WITH 1;

CREATE SEQUENCE SEQ_ARTWORK_art_id
    INCREMENT BY 1
    START WITH 1;

CREATE SEQUENCE SEQ_DISPLAY_display_id
    INCREMENT BY 1
    START WITH 1;

CREATE SEQUENCE SEQ_BOOKING_booking_id
    INCREMENT BY 1
    START WITH 1;

-----------------------------------------------------------------------------------------------------------------
/* Create Triggers */

-- Business purpose: The TRG_VISITOR trigger automatically assigns a sequential visitor_id to a new visitor in the VISITOR table and assigns appropriate values to the created_by and date_created fields also, If the record is being inserted or updated, appropriate values are assigned to the modified_by and modified_date fields.
CREATE OR REPLACE FUNCTION TRG_FUN_VISITOR()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        IF NEW.visitor_id IS NULL THEN
            NEW.visitor_id := nextval('SEQ_VISITOR_visitor_id');
        END IF;
        IF NEW.created_by IS NULL THEN
            NEW.created_by := CURRENT_USER;
        END IF;
        IF NEW.date_created IS NULL THEN
            NEW.date_created := CURRENT_DATE;
        END IF;
    END IF;

    IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
        NEW.modified_by := current_user;
        NEW.date_modified := CURRENT_DATE;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TRG_VISITOR
BEFORE INSERT OR UPDATE ON visitor
FOR EACH ROW
EXECUTE FUNCTION TRG_FUN_VISITOR();

-- Business purpose: The TRG_EXHIBITION trigger automatically assigns a sequential exhibition_id to a new exhibition in the EXHIBITION table and assigns appropriate values to the created_by and date_created fields also, If the record is being inserted or updated, appropriate values are assigned to the modified_by and modified_date fields.
CREATE OR REPLACE FUNCTION TRG_FUN_EXHIBITION()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        IF NEW.exhibition_id IS NULL THEN
            NEW.exhibition_id := nextval('SEQ_EXHIBITION_exhibition_id');
        END IF;
        IF NEW.created_by IS NULL THEN
            NEW.created_by := CURRENT_USER;
        END IF;
        IF NEW.date_created IS NULL THEN
            NEW.date_created := CURRENT_DATE;
        END IF;
    END IF;

    IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
        NEW.modified_by := CURRENT_USER;
        NEW.date_modified := CURRENT_DATE;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TRG_EXHIBITION
BEFORE INSERT OR UPDATE ON exhibition
FOR EACH ROW
EXECUTE FUNCTION TRG_FUN_EXHIBITION();

-- Business purpose: The TRG_ARTIST trigger automatically assigns a sequential artist_id to a new artist in the ARTIST table and assigns appropriate values to the created_by and date_created fields also, If the record is being inserted or updated, appropriate values are assigned to the modified_by and modified_date fields.
CREATE OR REPLACE FUNCTION TRG_FUN_ARTIST()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        IF NEW.artist_id IS NULL THEN
            NEW.artist_id := nextval('SEQ_ARTIST_artist_id');
        END IF;
        IF NEW.created_by IS NULL THEN
            NEW.created_by := CURRENT_USER;
        END IF;
        IF NEW.date_created IS NULL THEN
            NEW.date_created := CURRENT_DATE;
        END IF;
    END IF;

    IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
        NEW.modified_by := CURRENT_USER;
        NEW.date_modified := CURRENT_DATE;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TRG_ARTIST
BEFORE INSERT OR UPDATE ON artist
FOR EACH ROW
EXECUTE FUNCTION TRG_FUN_ARTIST();

-- Business purpose: The TRG_ARTWORK trigger automatically assigns a sequential art_id to a new artwork in the ARTWORK table and assigns appropriate values to the created_by and date_created fields also, If the record is being inserted or updated, appropriate values are assigned to the modified_by and modified_date fields. Further, if there is no reference to any artist, we have it refer to the UNKNOWN/ANONYMOUS ARTIST entry.
CREATE OR REPLACE FUNCTION TRG_FUN_ARTWORK()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        IF NEW.art_id IS NULL THEN
            NEW.art_id := nextval('SEQ_ARTWORK_art_id');
        END IF;
		IF NEW.artist_id IS NULL THEN
            NEW.artist_id := (select artist_id from artist where first_name = 'UNKNOWN/ANONYMOUS');
        END IF;
        IF NEW.created_by IS NULL THEN
            NEW.created_by := CURRENT_USER;
        END IF;
        IF NEW.date_created IS NULL THEN
            NEW.date_created := CURRENT_DATE;
        END IF;
    END IF;

    IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
        NEW.modified_by := CURRENT_USER;
        NEW.date_modified := CURRENT_DATE;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TRG_ARTWORK
BEFORE INSERT OR UPDATE ON artwork
FOR EACH ROW
EXECUTE FUNCTION TRG_FUN_ARTWORK();

-- Business purpose: The TRG_DISPLAY trigger automatically assigns a sequential display_id to a new artist in the DISPLAY table and assigns appropriate values to the created_by and date_created fields also, If the record is being inserted or updated, appropriate values are assigned to the modified_by and modified_date fields.
CREATE OR REPLACE FUNCTION TRG_FUN_DISPLAY()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        IF NEW.display_id IS NULL THEN
            NEW.display_id := nextval('SEQ_DISPLAY_display_id');
        END IF;
        IF NEW.created_by IS NULL THEN
            NEW.created_by := CURRENT_USER;
        END IF;
        IF NEW.date_created IS NULL THEN
            NEW.date_created := CURRENT_DATE;
        END IF;
    END IF;

    IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
        NEW.modified_by := CURRENT_USER;
        NEW.date_modified := CURRENT_DATE;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TRG_DISPLAY
BEFORE INSERT OR UPDATE ON display
FOR EACH ROW
EXECUTE FUNCTION TRG_FUN_DISPLAY();

-- Business purpose: The TRG_BOOKING trigger automatically assigns a sequential booking_id to a new artist in the BOOKING table and assigns appropriate values to the created_by and date_created fields also, If the record is being inserted or updated, appropriate values are assigned to the modified_by and modified_date fields. Further, the time in the booking table is set to the current system time.
CREATE OR REPLACE FUNCTION TRG_FUN_BOOKING()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        IF NEW.booking_id IS NULL THEN
            NEW.booking_id := nextval('SEQ_BOOKING_booking_id');
        END IF;
		IF NEW.time IS NULL THEN
            NEW.time := CURRENT_TIME;
        END IF;
        IF NEW.created_by IS NULL THEN
            NEW.created_by := CURRENT_USER;
        END IF;
        IF NEW.date_created IS NULL THEN
            NEW.date_created := CURRENT_DATE;
        END IF;
    END IF;

    IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
        NEW.modified_by := CURRENT_USER;
        NEW.date_modified := CURRENT_DATE;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TRG_BOOKING
BEFORE INSERT OR UPDATE ON booking
FOR EACH ROW
EXECUTE FUNCTION TRG_FUN_BOOKING();

-- Business purpose: The TRG_CHECK_DATE trigger automatically checks the integrity of the database by verifying if the display is on or after the first_display date of the particular ARTWORK
CREATE OR REPLACE FUNCTION TRG_FUN_CHECK_DATE()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT date FROM exhibition WHERE exhibition_id = NEW.exhibition_id) < (SELECT first_display FROM artwork WHERE art_id = NEW.art_id) THEN
        RAISE EXCEPTION 'exhibition_date must be on or after first_display';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TRG_CHECK_DATE
BEFORE INSERT OR UPDATE ON display
FOR EACH ROW
EXECUTE FUNCTION TRG_FUN_CHECK_DATE();

