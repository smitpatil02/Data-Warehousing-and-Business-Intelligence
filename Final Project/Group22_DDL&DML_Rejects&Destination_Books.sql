USE Staging_Books


/* 
 * TABLE: DST_Goodreads_Books 
 */

CREATE TABLE DST_Goodreads_Books(
isbn					VARCHAR(80),
text_reviews_count		INT,
country_code			VARCHAR(8),
language_code			VARCHAR(80),
[asin]					VARCHAR(80),
is_ebook				VARCHAR(20),
average_rating			DECIMAL(3,2),
kindle_asin				VARCHAR(80),
[description]			VARCHAR(8000),
[format]				VARCHAR(84),
link					VARCHAR(428),
publisher				VARCHAR(172),
num_pages				INT,
isbn13					BIGINT,
edition_information		VARCHAR(255),
[url]					VARCHAR(428),
image_url				VARCHAR(352),
book_id					INT,
ratings_count			INT,
work_id					INT,
title					VARCHAR(640),
title_without_series	VARCHAR(640),
publication_date		DATE)


/* 
 * TABLE: REJECT_Goodreads_Books 
 */

CREATE TABLE REJECT_Goodreads_Books(
error_output_column		VARCHAR(8000),
ErrorCode				VARCHAR(8000),
ErrorColumn				VARCHAR(8000),
isbn					VARCHAR(8000),
text_reviews_count		VARCHAR(8000),
country_code			VARCHAR(8000),
language_code			VARCHAR(8000),
[asin]					VARCHAR(8000),
is_ebook				VARCHAR(8000),
average_rating			VARCHAR(8000),
kindle_asin				VARCHAR(8000),
[description]			VARCHAR(8000),
[format]				VARCHAR(8000),
link					VARCHAR(8000),
publisher				VARCHAR(8000),
num_pages				VARCHAR(8000),
publication_day			VARCHAR(8000),
isbn13					VARCHAR(8000),
publication_month		VARCHAR(8000),
edition_information		VARCHAR(8000),
publication_year		VARCHAR(8000),
[url]					VARCHAR(8000),
image_url				VARCHAR(8000),
book_id					VARCHAR(8000),
ratings_count			VARCHAR(8000),
work_id					VARCHAR(8000),
title					VARCHAR(8000),
title_without_series	VARCHAR(8000),
publication_date		VARCHAR(8000))

-- DML for DST_Goodreads_Books & REJECT_Goodreads_Books
SELECT * FROM DST_Goodreads_Books
SELECT * FROM REJECT_Goodreads_Books


/* 
 * TABLE: DST_Goodreads_Genres 
 */

CREATE TABLE DST_Goodreads_Genres(
book_id			INT,
genre			VARCHAR(255),
[count]			INT)


/* 
 * TABLE: REJECT_Goodreads_Genres 
 */

CREATE TABLE REJECT_Goodreads_Genres(
book_id			VARCHAR(255),
genre			VARCHAR(255),
[count]			VARCHAR(255))


--DML for DST_Goodreads_Genres & REJECT_Goodreads_Genres
SELECT * FROM DST_Goodreads_Genres
SELECT * FROM REJECT_Goodreads_Genres


/* 
 * TABLE: DST_Goodreads_Authors 
 */

CREATE TABLE DST_Goodreads_Authors(
average_rating		DECIMAL(3,2),
author_id			INT,
text_reviews_count	INT,
author_name			VARCHAR(116),
ratings_count		INT)


/* 
 * TABLE: REJECT_Goodreads_Authors 
 */

CREATE TABLE REJECT_Goodreads_Authors(
average_rating		VARCHAR(255),
author_id			VARCHAR(255),
text_reviews_count	VARCHAR(255),
author_name			VARCHAR(255),
ratings_count		VARCHAR(255))


--DML for DST_Goodreads_Authors & REJECT_Goodreads_Authors
SELECT * FROM DST_Goodreads_Authors
SELECT * FROM REJECT_Goodreads_Authors


/* 
 * TABLE: DST_Goodreads_Works 
 */

CREATE TABLE DST_Goodreads_Works(
books_count							INT,
reviews_count						INT,
original_publication_month			INT,
default_description_language_code	VARCHAR(80),
text_reviews_count					INT,
best_book_id						INT,
original_publication_year			INT,
original_title						VARCHAR(760),
rating_dist							VARCHAR(220),
default_chaptering_book_id			INT,
original_publication_day			INT,
original_language_id				INT,
ratings_count						INT,
media_type							VARCHAR(80),
ratings_sum							INT,
work_id								INT,
original_publication_date			DATE)


/* 
 * TABLE: REJECT_Goodreads_Works 
 */

CREATE TABLE REJECT_Goodreads_Works(
books_count							VARCHAR(16),
reviews_count						VARCHAR(24),
original_publication_month			VARCHAR(80),
default_description_language_code	VARCHAR(80),
text_reviews_count					VARCHAR(20),
best_book_id						VARCHAR(32),
original_publication_year			VARCHAR(80),
original_title						VARCHAR(760),
rating_dist							VARCHAR(220),
default_chaptering_book_id			VARCHAR(80),
original_publication_day			VARCHAR(80),
original_language_id				VARCHAR(80),
ratings_count						VARCHAR(24),
media_type							VARCHAR(80),
ratings_sum							VARCHAR(28),
work_id								VARCHAR(32))


--DML for DST_Goodreads_Works & REJECT_Goodreads_Works
SELECT * FROM DST_Goodreads_Works
SELECT * FROM REJECT_Goodreads_Works


/* 
 * TABLE: DST_Goodreads_Author_Role 
 */

CREATE TABLE DST_Goodreads_Author_Role(
book_id		INT,
author_id	INT,
[role]		VARCHAR(80))


/* 
 * TABLE: REJECT_Goodreads_Author_Role 
 */

CREATE TABLE REJECT_Goodreads_Author_Role(
book_id		VARCHAR(32),
author_id	VARCHAR(32),
[role]		VARCHAR(80))


--DML for DST_Goodreads_Author_Role & REJECT_Goodreads_Author_Role
SELECT * FROM DST_Goodreads_Author_Role
SELECT * FROM REJECT_Goodreads_Author_Role


/* 
 * TABLE: DST_Goodreads_Popular_Shelves 
 */

CREATE TABLE DST_Goodreads_Popular_Shelves(
book_id		INT,
shelf_count	INT,
shelf_name	VARCHAR(136))


/* 
 * TABLE: REJECT_Goodreads_Popular_Shelves 
 */

CREATE TABLE REJECT_Goodreads_Popular_Shelves(
book_id		VARCHAR(28),
shelf_count	VARCHAR(16),
shelf_name	VARCHAR(136))


--DML for DST_Goodreads_Popular_Shelves & REJECT_Goodreads_Popular_Shelves
SELECT * FROM DST_Goodreads_Popular_Shelves
SELECT * FROM REJECT_Goodreads_Popular_Shelves


/* 
 * TABLE: DST_Goodreads_Series 
 */

CREATE TABLE DST_Goodreads_Series(
numbered			VARCHAR(20),
note				VARCHAR(2816),
[description]		VARCHAR(8000),
title				VARCHAR(240),
series_works_count	INT,
series_id			INT,
primary_work_count	INT)


/* 
 * TABLE: REJECT_Goodreads_Series 
 */

CREATE TABLE REJECT_Goodreads_Series(
numbered			VARCHAR(20),
note				VARCHAR(2816),
[description]		VARCHAR(8000),
title				VARCHAR(240),
series_works_count	VARCHAR(12),
series_id			VARCHAR(28),
primary_work_count	VARCHAR(12))


--DML for DST_Goodreads_Series & REJECT_Goodreads_Series
SELECT * FROM DST_Goodreads_Series
SELECT * FROM REJECT_Goodreads_Series