CREATE DATABASE final;

USE final;

CREATE TABLE tbl_branch(
branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
branch_name VARCHAR(20),
branch_address VARCHAR(50));

INSERT INTO tbl_branch (branch_name, branch_address)
VALUES ('Sharpstown', '555 NE Example Ave'), ('Central', '222 SE Test St.'), ('Hayden', '123 Filler Blvd.'), ('Barker', '5015 SW Lastone Way')

CREATE TABLE tbl_publisher(
pub_name VARCHAR(40) PRIMARY KEY,
pub_address VARCHAR(50),
pub_phone VARCHAR(15));

INSERT INTO tbl_publisher(pub_name, pub_address, pub_phone)
VALUES ('Penguin Random House LLC', '1 N Z St.', '111-111-1111'), ('Viking Press', '70 NW P St.', '111-111-1112'), ('Doubleday', '20 SW Boo St.', '111-111-1113'),
('New American Library', '14 NW Leo St.', '111-111-1114'), ('Vintage International', '31 NE Folly St.', '111-111-1115'), ('Dover Publications', '2 W Purple St.', '111-111-1116'),
('Picador USA', '2 NE 4th Ave.', '111-111-1117'), ('Bethesda Softworks LLC', '73 NW Commonwealth Ave.', '111-111-1118'), ('Atria Books', '70 SE Colombia St.', '111-111-1119'),
('Alfred A. Knopf', '334 S Angel St.', '111-111-1120'), ('Harper Perennial Modern Classics', '456 NE Cherry St.', '111-111-1121')

CREATE TABLE tbl_books(
book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
book_title VARCHAR(50),
book_publisher VARCHAR(40) FOREIGN KEY REFERENCES tbl_publisher(pub_name));

INSERT INTO tbl_books(book_title, book_publisher)
VALUES ('Rosemarys Baby', 'Penguin Random House LLC'), ('Stepford Wives', 'Penguin Random House LLC'), 
('It', 'Viking Press'), ('Pet Sematary', 'Doubleday'), ('The Shining', 'Doubleday'), ('Carrie', 'Doubleday'), 
('Cujo', 'Viking Press'), ('The Green Mile', 'New American Library'), ('The Wind-Up Bird Chronicle', 'Vintage International'), 
('Norwegian Wood', 'Vintage International'), ('1Q84', 'Vintage International'), ('After Dark', 'Vintage International'), 
('Kafka on the Shore', 'Vintage International'), ('The Conquest of Bread', 'Dover Publications'), ('The Lost Tribe', 'Picador USA'),
('Alduin is Real', 'Bethesda Softworks LLC'), ('The House of the Spirits', 'Atria Books'), ('A Bend in the River', 'Alfred A. Knopf'), 
('The Myth of Sisyphus and Other Essays', 'Vintage International'), ('One Hundred Years of Solitude', 'Harper Perennial Modern Classics')

CREATE TABLE tbl_author(
author_book_id INT FOREIGN KEY REFERENCES tbl_books(book_id),
author_name VARCHAR(40));

INSERT INTO tbl_author(author_book_id, author_name)
VALUES (1, 'Ira Levin'), (2, 'Ira Levin'), (3, 'Stephen King'), (4, 'Stephen King'), (5, 'Stephen King'), (6, 'Stephen King'), (7,'Stephen King'),
(8, 'Stephen King'), (9, 'Haruki Murakami'), (10, 'Haruki Murakami'), (11, 'Haruki Murakami'), (12, 'Haruki Murakami'), (13, 'Haruki Murakami'),
(14, 'Peter Kropotkin'), (15, 'Mark W. Lee'), (16, 'Thromgar Iron-Head'), (17, 'Isabel Allende'), (18, 'V. S. Naipaul'), (19, 'Albert Camus'), (20, 'Gabriel Garcia Marquez')

CREATE TABLE tbl_copies(
copies_book_id INT FOREIGN KEY REFERENCES tbl_books(book_id),
copies_branch INT FOREIGN KEY REFERENCES tbl_branch(branch_id),
copies_num INT);

INSERT INTO tbl_copies(copies_book_id, copies_branch, copies_num)
VALUES (3, 1, 6), (18, 1, 3), (15, 1, 2), (17, 1, 2), (2, 1, 2), (12, 1, 3), (20, 1, 2), (5, 1, 3), (16, 1, 5), (11, 1, 3),
(4, 2, 3), (18, 2, 2), (12, 2, 2), (13, 2, 4), (19, 2, 4), (15, 2, 3), (2, 2, 3), (11, 2, 2), (7, 2, 8), (6, 2, 4), 
(1, 3, 2), (8, 3, 2), (10, 3, 3), (16, 3, 7), (17, 3, 2), (12, 3, 2), (4, 3, 2), (14, 3, 3), (9, 3, 2), (20, 3, 4),
(9, 4, 2), (14, 4, 2), (8, 4, 2), (11, 4, 2), (16, 4, 5), (1, 4, 3), (17, 4, 2), (20, 4, 3), (5, 4, 2), (19, 4, 3)

CREATE TABLE tbl_borrower(
bor_no INT PRIMARY KEY NOT NULL IDENTITY (1,1),
bor_name VARCHAR(40),
bor_address VARCHAR(50),
bor_phone VARCHAR(15));

INSERT INTO tbl_borrower(bor_name, bor_address, bor_phone)
VALUES ('Meera Gregerson', '555 S Boylston St.', '222-222-2222'), ('Kiran Gregerson', '555 S Boylston St.', '222-222-2223'), ('Maya Roy', '333 W Shamas St.', '222-222-2224'),
('Claire Halloran', '999 SW Wilg St.', '222-222-2225'), ('Rayna Higuchi', '666 SE Brittany Way', '222-222-2226'), ('Madlyn Kates', '123 N Rockwell Pl.', '222-222-2227-'), 
('Kenji Lopez', '205 E Janning St.', '222-222-2228'), ('Brad Leone', '123 SE Jersey St.', '222-222-2229'), ('Andy Baraghani', '539 NE Wales St.', '222-222-2230'), 
('Chris Morocco', '429 NE German Ave.', '222-222-2231')

CREATE TABLE tbl_loans(
loan_book_id INT FOREIGN KEY REFERENCES tbl_books(book_id),
loan_branch_id INT FOREIGN KEY REFERENCES tbl_branch(branch_id),
loan_card INT FOREIGN KEY REFERENCES tbl_borrower(bor_no),
loan_date INT,
loan_due INT);

INSERT INTO tbl_loans(loan_book_id, loan_branch_id, loan_card, loan_date, loan_due)
VALUES (12, 1, 2, 20190225, 20190318), (18, 2, 6, 20190225, 20190318), (7, 2, 7, 20190226, 20190319), (15, 1, 8, 20190226, 20190319), (10, 3, 8, 20190226, 20190319),
(7, 2, 2, 20190226, 20190319), (14, 3, 6, 20190226, 20190319), (17, 4, 4, 20190227, 20190320), (6, 2, 2, 20190227, 20190320), (11, 4, 6, 20190227, 20190320),
(5, 1, 7, 20190227, 20190320), (1, 3, 1, 20190228, 20190321), (2, 1, 9, 20190228, 20190321), (18, 2, 8, 20190228, 20190321), (1, 4, 7, 20190301, 20190322),
(7, 2, 9, 20190301, 20190322), (11, 2, 7, 20190301, 20190322), (19, 2, 2, 20190302, 20190323), (19, 4, 3, 20190302, 20190323), (19, 4, 5, 20190302, 20190323), 
(19, 2, 8, 20190303, 20190324), (2, 1, 5, 20190303, 20190324), (6, 2, 10, 20190304, 20190325), (4, 3, 8, 20190304, 20190325), (17, 3, 4, 20190304, 20190325), 
(19, 4, 1, 20190304, 20190325), (10, 3, 7, 20190304, 20190325), (8, 4, 5, 20190305, 20190326), (3, 1, 8, 20190305, 20190326), (9, 3, 3, 20190305, 20190326),
(3, 1, 4, 20190306, 20190327), (5, 1, 8, 20190306, 20190327), (2, 2, 2, 20190306, 20190327), (14, 3, 8, 20190307, 20190328), (3, 1, 3, 20190307, 20190328), 
(7, 2, 1, 20190307, 20190328), (7, 2, 1, 20190308, 20190329), (15, 2, 9, 20190308, 20190329), (8, 3, 3, 20190308, 20190329), (4, 3, 3, 20190309, 20190330),
(11, 4, 4, 20190309, 20190330), (7, 2, 8, 20190309, 20190330), (8, 4, 3, 20190310, 20190331), (18, 1, 1, 20190310, 20190331), (7, 2, 6, 20190310, 20190331), 
(14, 4, 5, 20190311, 20190401), (12, 3, 6, 20190311, 20190401), (6, 2, 8, 20190311, 20190401), (6, 2, 10, 20190312, 20190402), (17, 1, 9, 20190313, 20190403),
(15, 2, 4, 20190314, 20190404)

SELECT * FROM tbl_loans;
