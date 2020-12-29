CREATE DATABASE Staging_Books;
Go

USE Staging_Books;
Go

/* 
 * TABLE: STG_Goodreads_Books 
 */

CREATE TABLE STG_Goodreads_Books(
isbn					VARCHAR(80),
text_reviews_count		VARCHAR(16),
country_code			VARCHAR(8),
language_code			VARCHAR(80),
[asin]					VARCHAR(80),
is_ebook				VARCHAR(20),
average_rating			VARCHAR(16),
kindle_asin				VARCHAR(80),
[description]			VARCHAR(8000),
[format]				VARCHAR(84),
link					VARCHAR(428),
publisher				VARCHAR(172),
num_pages				VARCHAR(80),
publication_day			VARCHAR(80),
isbn13					VARCHAR(80),
publication_month		VARCHAR(80),
edition_information		VARCHAR(255),
publication_year		VARCHAR(80),
[url]					VARCHAR(428),
image_url				VARCHAR(352),
book_id					VARCHAR(32),
ratings_count			VARCHAR(20),
work_id					VARCHAR(32),
title					VARCHAR(640),
title_without_series	VARCHAR(640))


/* 
 * TABLE: STG_Goodreads_Series 
 */

CREATE TABLE STG_Goodreads_Series(
numbered			VARCHAR(20),
note				VARCHAR(2816),
[description]		VARCHAR(8000),
title				VARCHAR(240),
series_works_count	VARCHAR(12),
series_id			VARCHAR(28),
primary_work_count	VARCHAR(12))


/* 
 * TABLE: STG_Goodreads_Works 
 */

CREATE TABLE STG_Goodreads_Works(
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


/* 
 * TABLE: STG_Goodreads_Genres_Initials 
 */

CREATE TABLE STG_Goodreads_Genres_Initials(
book_id									VARCHAR(32),
history_historical_fiction_biography	VARCHAR(50),
fiction									VARCHAR(50),
fantasy_paranormal						VARCHAR(50),
mystery_thriller_crime					VARCHAR(50),
poetry									VARCHAR(50),
romance									VARCHAR(50),
non_fiction								VARCHAR(50),
children								VARCHAR(50),
young_adult								VARCHAR(50),
comics_graphic							VARCHAR(50))


/* 
 * TABLE: STG_Goodreads_Authors 
 */

CREATE TABLE STG_Goodreads_Authors(
average_rating		VARCHAR(16),
author_id			VARCHAR(32),
text_reviews_count	VARCHAR(24),
author_name			VARCHAR(116),
ratings_count		VARCHAR(32))


/* 
 * TABLE: STG_Goodreads_Author_Role 
 */

CREATE TABLE STG_Goodreads_Author_Role(
book_id		VARCHAR(32),
author_id	VARCHAR(32),
[role]		VARCHAR(80))


/* 
 * TABLE: STG_Goodreads_Popular_Shelves 
 */

CREATE TABLE STG_Goodreads_Popular_Shelves(
book_id		VARCHAR(28),
shelf_count	VARCHAR(16),
shelf_name	VARCHAR(136))


/* 
 * TABLE: STG_Goodreads_Books_Series 
 */

CREATE TABLE STG_Goodreads_Books_Series(
book_id			VARCHAR(32),
series_id		VARCHAR(28))


/* 
 * TABLE: STG_Goodreads_Similar_books 
 */

CREATE TABLE STG_Goodreads_Similar_books(
book_id			VARCHAR(32),
similar_book_id	VARCHAR(32))