-- Populating all tables:
 
-- ARTIST Table:

INSERT INTO artist(email, first_name, last_name, office_address, phone, zip)
VALUES('f.piper@ucohio.edu', 'Florence', 'Piper', '670 East Renner Road, Richardson', 4697652413,75080);
INSERT INTO artist(email, first_name, last_name, office_address, phone, zip)
VALUES('a.rosario@gmail.com', 'Anna', 'Rosario', '201 N Shady Shores Rd #36 Lake Dallas',9543427886, 75065);
INSERT INTO artist(email, first_name, last_name, office_address, phone, zip)
VALUES('wang_r@gmail.com', 'Riley', 'Wang', '2307 W Water Creek Dr, Frisco', 4653782883, 75034);
INSERT INTO artist(email, first_name, last_name, office_address, phone, zip)
VALUES('lily.fer9@gmail.com', 'Lily', 'Fernandez', '16577 Griswold Springs Rd, Plano', 9546712117, 74032);
INSERT INTO artist(email, first_name, last_name, office_address, phone, zip)
VALUES('m.wu987@neu.edu','Marcus','Wu', '905 West Georgebush Street, Little Elm', 9543671993, 75065);
INSERT INTO artist(email, first_name, last_name, office_address, phone, zip)
VALUES('reedbutler@hotmail.com','Reed','Butler','800 West Hillory Road, Plano', 9548612650, 74031);
INSERT INTO artist(email, first_name, last_name, office_address, phone, zip)
VALUES('wesfox32@hotmail.com', 'Wes', 'Fox', '2822 Independence Pkwy, Frisco', 4692815361, 75031);
INSERT INTO artist(email, first_name, last_name, office_address, phone, zip)
VALUES('leoperez1@hotmail.com', 'Leonardo','Perez', '301 Bushpark Crest, Denton', 4698412817, 75024);
INSERT INTO artist(email, first_name, last_name, office_address, phone, zip)
VALUES('andrewand@gmail.com', 'Andrew', 'Anderson', '9553 Lake Avenue, Grand Prairie', 4698156204, 75032);
INSERT INTO artist(email, first_name, last_name, office_address, phone, zip)
VALUES('calhounsana@gmail.com','Sana', 'Calhoun', '3 Cobblestone Avenue, Irving', 9543718254, 75060);
INSERT INTO artist(email, first_name, last_name, office_address, phone, zip)
VALUES('shopkins@hotmail.com', 'Sydney', 'Hopkins', '681 Pin Oak Ave. Dallas', 9543819258, 75065);
INSERT INTO artist(email, first_name, last_name, office_address, phone, zip)
VALUES('reiner@hotmail.com', 'Reiner', 'Braun', '913 Marley Ave. Dallas', 9543578925, 75063);
INSERT INTO artist(first_name)
VALUES('UNKNOWN/ANONYMOUS');

-- ARTWORK Table:

INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(1, 'Lonely Flame', 'A solitary, flickering flame against a backdrop of profound darkness, symbolizing isolation and resilience in the face of solitude, evoking a sense of introspection and contemplation within the viewer', 'Oil', '02/16/2023');
 INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(1, 'The Story of the Void', 'A cosmic narrative, inviting contemplation on the mysteries within the vast emptiness of space, creating an expansive yet intimate visual experience', 'Acrylic', '03/13/2021');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(1, 'Summer Mistress', 'A captation of the essence of the season in a vibrant dance of warm hues, depicting nature’s beauty as a captivating and ephermal enchantress', 'Watercolor', '11/21/2015');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(2, 'Whispers of the Breeze', 'A serene landscape painting depicting a gentle meadow where delicate flowers sway in harmony with a soft breeze, capturing the ephemeral beauty of nature', 'Oil', '02/16/2023');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(2, 'Mechanical Symphony', 'A futuristic composition of metallic structures and intricate machinery, reflecting the harmonious dance of technology in an industrial landscape', 'Acrylic', '12/25/2021');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(2, 'Urban Symphony', 'An abstract cityscape pulsating with vibrant colors and dynamic lines, illustrating the rhythmic energy of urban life in a bustling metropolis', 'Oil', '11/16/2023');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(3, 'Silent Reflections', 'A tranquil seascape portraying a lone sailboat adrift on calm waters, inviting viewers to contemplate the serenity found in solitary moments', 'Watercolor', '03/15/2023');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(3, 'Ethereal Dreams', 'A surreal artwork featuring floating clouds and surreal landscapes, evoking a dreamlike atmosphere that blurs the boundaries between reality and fantasy', 'Gouache', '01/04/2020');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(4, 'Metamorphosis', 'An abstract piece showcasing the transformative power of vibrant colors and bold strokes, symbolizing personal growth and change', 'Acrylic', '05/27/2019');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(4, 'Whimsical Wonderland', 'A whimsical and playful painting depicting a fantastical world filled with imaginative creatures and vibrant, otherworldly landscapes', 'Gouache', '07/23/2021');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(5, 'Melancholy Melodies', 'A poignant portrait capturing the emotions of a musician lost in thought, surrounded by the haunting beauty of melancholic melodies', 'Charcoal', '04/21/2012');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(5, 'Celestial Reverie', 'A cosmic artwork that explores the mysteries of the universe, with swirling galaxies and ethereal lights that invite contemplation on the infinite', 'Spray Paint', '10/10/2009');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(5, 'Harmony in Chaos', 'An abstract expressionist piece featuring a symphony of chaotic brushstrokes and vibrant colors, symbolizing the beauty that can emerge from disorder', 'Oil', '02/12/2023');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(7, 'Serenitys Embrace', 'A tranquil depiction of a peaceful lake surrounded by lush mountains, capturing the calming embrace of nature', 'Pastels', '06/12/2023');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(8, 'Midnight Reverie', 'A nocturnal scene featuring a mysterious moonlit forest, where shadows and silver light create an enchanting atmosphere', 'Oil Pastels', '11/30/2023');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(8, 'Floating Gardens', 'Imaginary floating islands adorned with vibrant, fantastical flora, inviting viewers into a world of whimsy and color', 'Watercolor', '01/15/2023');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(11, 'Rhythmic Ripples', 'An interpretation of waters movement, with concentric circles expanding from a single droplet, symbolizing the interconnectedness of life', 'Alcohol Inks', '04/23/2014');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(11, 'Nebulous Odyssey', 'An abstract representation of a cosmic journey through swirling nebulae and celestial wonders', 'Alcohol Inks', '05/27/2019');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(12, 'Enigmatic Echoes', 'A portrait shrouded in mystery, with obscured features and deep shadows, leaving room for interpretation and introspection', 'Charcoal', '07/21/2021');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(12, 'Harvest Harmony', 'A vibrant depiction of a bountiful harvest, celebrating the abundance of nature and the cycles of growth', 'Acrylics', '02/27/2022');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(12, 'Infinite Echo', 'An exploration of symmetry and reflection, creating an illusion of endless corridors and repeating patterns', 'Oil', '10/29/2005');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(12, 'Sunset Sonata', 'A warm and vibrant portrayal of a sun setting over a serene landscape, capturing the poetic beauty of the evening sky', 'Oil', '03/14/2013');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(12, 'Metropolis Mirage', 'An abstract cityscape with distorted perspectives and vivid colors, reflecting the dynamic energy of an ever-evolving urban environment', 'Acrylic', '03/13/2019');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(12, 'Cerulean Dreams', 'A tranquil seascape featuring shades of blue and turquoise, conveying a dreamlike atmosphere of calm and introspection', 'Gouache', '08/05/2020');
INSERT INTO artwork(title, description, medium, first_display)
VALUES('Luminous Nexus', 'An exploration of light and shadow, where intersecting beams create a mesmerizing play of illumination and darkness', 'Oil', '10/14/2008');
INSERT INTO artwork(title, description, medium, first_display)
VALUES('Verdant Reverie', 'A lush and verdant forest scene, where vibrant greenery and dappled sunlight invite viewers into a world of natural splendor', 'Acrylic', '11/23/2020');
INSERT INTO artwork(title, description, medium, first_display)
VALUES('Transcendent Tides', 'A dynamic representation of ocean waves in various states, symbolizing the relentless ebb and flow of life’s experiences', 'Watercolour', '09/18/2017');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(5, 'Crimson Whispers', 'An abstract expressionist piece dominated by deep red tones, evoking passion and intensity in a visual symphony of emotions', 'Acrylic', '09/26/2019');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(4, 'Galactic Embrace', 'A cosmic scene where celestial bodies intertwine, symbolizing the interconnectedness of the universe and cosmic relationships', 'Gouache', '07/27/2023');
INSERT INTO artwork(artist_id, title, description, medium, first_display)
VALUES(6, 'Parallel Realms', 'An imaginative depiction of overlapping realities, where dreamlike landscapes coexist with everyday scenes, blurring the boundaries of perception', 'Charcoal', '01/31/2011');
INSERT INTO artwork(title, description, medium, first_display)
VALUES('The Scream', 'An expressionistic construction based on a scream piercing through nature while on a walk, after two companions leave someone.', 'Oil', '06/16/2018');
INSERT INTO artwork(title, description, medium, first_display)
VALUES('Silent Night', 'A tranquil landscape in the wintery landscapes of The Alps', 'Acrylic', '05/18/2020');

--EXHIBITION Table

INSERT INTO exhibition(name, venue, date, mode) 
VALUES('Artist Mart','1500, Grapevine Estate, TX, 71311', '2023-02-16', 'Offline');
INSERT INTO exhibition(name, venue, date, mode)
VALUES('Art Synergy', '1800, South Lake, TX, 70912', '2023-03-15', 'Offline');
INSERT INTO exhibition(name, venue, date, mode) 
VALUES('Decora', '2000, Eastside Blvd, TX, 70111', '2023-12-01', 'Offline');
INSERT INTO exhibition(name, venue, date, mode) 
VALUES('Craftric', '3000, Wellington, TX, 70112', '2023-12-04', 'Offline');
INSERT INTO exhibition(name, venue, date, mode)
VALUES('Galleria', '2001, Eastside Blvd, TX, 70111', '2023-12-08', 'Offline');
INSERT INTO exhibition(name, venue, date, mode)
VALUES('Wall Craft', '3001, Wellington, TX, 70112', '2023-12-11', 'Offline');
INSERT INTO exhibition(name, venue, date, mode) 
VALUES('Villareal', '2310, Eastside Blvd, TX, 70121', '2023-12-11', 'Offline');
INSERT INTO exhibition(name, venue, date, mode)
VALUES('Cisernos', 'Zoom', '2023-12-23', 'Online');
INSERT INTO exhibition(name, venue, date, mode)
VALUES('Art Ally', '1000, Park Woods, TX, 71211', '2023-12-23', 'Offline');
INSERT INTO exhibition(name, venue, date, mode)
VALUES('Hues','Google Meet', '2024-01-09', 'Online');
INSERT INTO exhibition(name, venue, date, mode)
VALUES('Artistry', 'Zoom', '2024-01-25', 'Online');
INSERT INTO exhibition(name, venue, date, mode) 
VALUES('Wall Art', '3001, Frisco, TX, 75032', '2024-02-05', 'Offline');

--DISPLAY Table

INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('11:00:00', '18:00:00', 'A21', TRUE, 1, 1);
INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('12:00:00', '17:00:00', 'B34', TRUE, 2, 1);
INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('10:00:00', '19:00:00', 'C42', FALSE, 3, 1);
INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('09:00:00', '17:00:00', 'A18', TRUE, 4, 1);
INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('10:00:00', '19:00:00', 'D13', TRUE, 5, 1);
INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('11:00:00', '19:00:00', 'A05', TRUE, 1, 2);
INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('12:00:00', '19:00:00', 'C18', FALSE, 2, 2);
INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('09:00:00', '14:00:00', 'B18', FALSE, 3, 2);
INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('14:00:00', '20:00:00', 'A31', TRUE, 4, 2);
INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('10:00:00', '14:00:00', 'C42', FALSE, 5, 2);
INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('09:00:00', '15:00:00', 'B37', TRUE, 7, 2);
INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('15:00:00', '21:00:00', 'C29', TRUE, 15, 3);
INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('16:00:00', '21:00:00', 'B12', TRUE, 10, 3);
INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('09:00:00', '14:00:00', 'D21', TRUE, 12, 3);
INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('12:00:00', '22:00:00', 'C04', FALSE, 16, 4);
INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('10:00:00', '19:00:00', 'D09', FALSE, 26, 5);
INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('13:00:00', '22:00:00', 'D16', FALSE, 25, 6);
INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('19:00:00', '22:00:00', 'B19', TRUE, 32, 7);
INSERT INTO display(start_time, end_time, location, artist_presence, art_id, exhibition_id)
VALUES('13:00:00', '20:00:00', 'C30', TRUE, 27, 8);

--VISITOR Table

INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Jenny', 'Evans', 9549934987, 'jennyeve09@gmail.com.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Monica', 'Anderson', 4698885208, 'monicand1@hotmail.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Kate', 'William', 9547793731, 'katewilliam02@outlook.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Chris', 'Renner', 9546696813, 'chrisrenner39@gmail.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Ryan', 'Ray', 4698989648, 'rr1999@hotmail.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Paul', 'Johnson', 4699794581, 'pjhonson12@outlook.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Rose', 'Collins', 9543373931, 'rose.collins@gmail.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Lauren', 'Jee', 4693456722, 'lauren.lee@hotmail.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Marshal', 'Jose', 3435677890, 'marshal.jose@gmail.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Amber', 'Jenner', 3439898981, 'amber.jenner@outlook.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Lily', 'Cooper', 3431987098, 'lily.cooper@hotmail.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Penny', 'Liam', 4691112346, 'penny.liam@gmail.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Liam', 'Downey', 3435182663, 'liamdow@uta.edu');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Scarlet', 'Robinson', 4696193551, 'scarobin@neu.edu');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Saranya', 'Kumar', 9541925193, 'saranyak91@usc.edu');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Satya', 'Khan', 4691483013, 'khansat@icloud.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Sharon', 'White', 3432017962, 'whsharon23@utd.edu');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Leslie', 'Kyte', 9548571852, 'leskyte342@outlook.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Mike', 'Jackson', 3432198548, 'mikejackson981@hotmail.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Chuck', 'Wilson', 9549991672, 'cxw21054@ucsd.edu');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Serena', 'Ohario', 3436153926, 'soha999@icloud.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Sally', 'Pritt', 9542719643, 'salpritt21@gmail.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Lucy', 'Song', 9546719453, 'lucysonggl@icloud.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Rishi', 'Patel', 3439127835, 'rishipatel@icloud.com');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Lily', 'Potter', 3432718945, 'lxp23106@utd.edu');
INSERT INTO visitor(first_name, last_name, phone, email)
VALUES('Lucy', 'Woo', 9543628156, 'woolucy@icloud.com');


--BOOKING Table

INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('13:00:00', '9:30:00', '12:00:00', 'card', 1, 1);
INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('14:20:00', '10:00:00', '13:00:00', 'cash', 1, 2);
INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('15:00:00', '11:00:00', '13:30:00', 'cash', 1, 3);
INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('15:45:00', '14:30:00', '17:30:00', 'card', 1, 4);
INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('16:30:00', '10:00:00', '18:00:00', 'card', 1, 5);
INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('17:00:00', '9:30:00', '17:00:00', 'card', 2, 2);
INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('17:45:00','10:30:00', '18:00:00', 'cash', 2, 5);
INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('18:00:00', '11:30:00', '13:00:00', 'card', 2, 10);
INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('11:43:00', '10:20:00', '11:30:00', 'cash', 2, 19);
INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('21:00:00', '11:15:00', '13:10:00', 'card', 2, 4);
INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('22:00:00', '18:00:00', '20:00:00', 'card', 11, 21);
INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('17:45:00', '16:00:00', '17:45:00', 'cash', 12, 15);
INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('18:03:00', '11:00:00', '14:00:00', 'card', 4, 21);
INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('19:00:00', '10:00:00', '12:00:00', 'card', 7, 7);
INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('12:00:00', '10:00:00', '12:00:00', 'cash', 5, 26);
INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('13:00:00', '15:30:00', '18:00:00', 'card', 3, 4);
INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('20:00:00', '17:00:00', '20:00:00', 'card', 1, 7);
INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('21:25:00', '19:30:00', '21:00:00', 'card', 2, 15);
INSERT INTO booking(time, slot_start, slot_end, payment_method, exhibition_id, visitor_id)
VALUES('13:30:00', '10:30:00', '13:20:00', 'card', 3, 9);