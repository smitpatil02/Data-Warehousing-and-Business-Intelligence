/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      project_model.DM1
 *
 * Date Created : Tuesday, December 15, 2020 09:31:27
 * Target DBMS : Microsoft SQL Server 2016
 */

/* 
 * TABLE: DIM_Authors 
 */

CREATE DATABASE Books_DW
go

USE Books_DW
go

CREATE TABLE DIM_Authors(
    DIM_AUTHORS_SK    int             IDENTITY(1,1),
    DIM_ROLES_SK      int             NOT NULL,
    Author_ID         int             NOT NULL,
    author_name       varchar(120)    NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (DIM_AUTHORS_SK)
)
go



IF OBJECT_ID('DIM_Authors') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_Authors >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_Authors >>>'
go

/* 
 * TABLE: DIM_Books 
 */

CREATE TABLE DIM_Books(
    DIM_BOOK_SK             int              IDENTITY(1,1),
    DIM_ROLES_SK            int              NULL,
    DIM_Genre_ID            int              NULL,
    DIM_POPULAR_SHELF_SK    int              NULL,
    Book_ID                 int              NOT NULL,
    country_code            varchar(10)      NULL,
    language_code           varchar(80)      NULL,
    [asin]                  varchar(80)      NULL,
    kindle_asin             varchar(80)      NULL,
    is_ebook                varchar(20)      NULL,
    [description]           varchar(8000)    NULL,
    [format]                varchar(100)     NULL,
    link                    varchar(500)     NULL,
    publisher               varchar(200)     NULL,
    isbn13                  varchar(80)      NULL,
    edition_information     varchar(300)     NULL,
    [url]                   varchar(500)     NULL,
    image_url               varchar(400)     NULL,
	title					varchar(700)	 NULL,
    title_without_series    varchar(700)     NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (DIM_BOOK_SK)
)
go



IF OBJECT_ID('DIM_Books') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_Books >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_Books >>>'
go

/* 
 * TABLE: DIM_Date 
 */

CREATE TABLE DIM_Date(
    DIM_DATE_SK                   int     IDENTITY(1,1),
    publication_date     date    NOT NULL,
    publication_year     int     NULL,
    publication_month    int     NULL,
    publication_day      int     NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (DIM_DATE_SK)
)
go



IF OBJECT_ID('DIM_Date') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_Date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_Date >>>'
go

/* 
 * TABLE: DIM_Genre 
 */

CREATE TABLE DIM_Genre(
    DIM_Genre_ID    int             IDENTITY(1,1),
    Book_ID         int             NOT NULL,
    genre           varchar(100)    NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (DIM_Genre_ID)
)
go



IF OBJECT_ID('DIM_Genre') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_Genre >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_Genre >>>'
go

/* 
 * TABLE: DIM_Popular_Shelves 
 */

CREATE TABLE DIM_Popular_Shelves(
    DIM_POPULAR_SHELF_SK    int             IDENTITY(1,1),
    Book_ID                 int             NOT NULL,
    popular_shelf_name      varchar(500)    NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (DIM_POPULAR_SHELF_SK)
)
go



IF OBJECT_ID('DIM_Popular_Shelves') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_Popular_Shelves >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_Popular_Shelves >>>'
go

/* 
 * TABLE: DIM_Role 
 */

CREATE TABLE DIM_Role(
    DIM_ROLES_SK    int             IDENTITY(1,1),
    Book_ID         int             NOT NULL,
    Author_ID       int             NOT NULL,
    [role]          varchar(100)    NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (DIM_ROLES_SK)
)
go



IF OBJECT_ID('DIM_Role') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_Role >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_Role >>>'
go

/* 
 * TABLE: DIM_Series 
 */

CREATE TABLE DIM_Series(
    DIM_SERIES_SK			int              IDENTITY(1,1),
    Series_ID				int              NOT NULL,
    series_title			varchar(250)     NULL,
    numbered				varchar(50)      NULL,
    note					varchar(3000)    NULL,
    series_description      varchar(8000)    NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (DIM_SERIES_SK)
)
go



IF OBJECT_ID('DIM_Series') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_Series >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_Series >>>'
go

/* 
 * TABLE: FACT_Book_Ratings 
 */

CREATE TABLE FACT_Book_Ratings(
    DIM_DATE_SK					int              NULL,
    DIM_SERIES_SK				int              NULL,
    DIM_AUTHORS_SK				int              NULL,
    DIM_WORKS_SK				int              NULL,
    DIM_POPULAR_SHELF_SK		int              NULL,
    DIM_BOOK_SK					int              NULL,
    Book_ID						int              NULL,
    Author_ID					int              NULL,
    Series_ID					int              NULL,
    Work_ID						int              NULL,
    Publication_Date			date             NULL,
    book_text_review_count      int              NULL,
    book_ratings_count          int              NULL,
    book_average_rating         decimal(3, 2)    NULL,
	author_text_reviews_count	int				 NULL,
	author_ratings_count		int				 NULL,
	author_average_rating		decimal(3,2)	 NULL,
	work_reviews_count			int              NULL,
	work_text_reviews_count		int				 NULL,
	work_ratings_sum			int				 NULL,
	work_books_count			int				 NULL,
    series_work_count		    int              NULL,
    primary_work_count			int              NULL,
    num_pages					int              NULL,
    shelf_count					int              NULL
)
go



IF OBJECT_ID('FACT_Book_Ratings') IS NOT NULL
    PRINT '<<< CREATED TABLE FACT_Book_Ratings >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FACT_Book_Ratings >>>'
go

/* 
 * TABLE: DIM_Works 
 */

CREATE TABLE DIM_Works(
    DIM_WORKS_SK                         int             IDENTITY(1,1),
    Work_ID                              int             NOT NULL,
    default_chaptering_book_id           int             NULL,
    original_language_id                 int             NULL,
    best_book_id                         int             NULL,
    default_description_language_code    int             NULL,
    work_original_title                  varchar(800)    NULL,
    rating_dist                          varchar(250)    NULL,
    media_type                           varchar(100)    NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (DIM_WORKS_SK)
)
go



IF OBJECT_ID('DIM_Works') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_Works >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_Works >>>'
go

/* 
 * TABLE: DIM_Authors 
 */

ALTER TABLE DIM_Authors ADD CONSTRAINT RefDIM_Role14 
    FOREIGN KEY (DIM_ROLES_SK)
    REFERENCES DIM_Role(DIM_ROLES_SK)
go


/* 
 * TABLE: DIM_Books 
 */

ALTER TABLE DIM_Books ADD CONSTRAINT RefDIM_Popular_Shelves7 
    FOREIGN KEY (DIM_POPULAR_SHELF_SK)
    REFERENCES DIM_Popular_Shelves(DIM_POPULAR_SHELF_SK)
go

ALTER TABLE DIM_Books ADD CONSTRAINT RefDIM_Genre15 
    FOREIGN KEY (DIM_Genre_ID)
    REFERENCES DIM_Genre(DIM_Genre_ID)
go

ALTER TABLE DIM_Books ADD CONSTRAINT RefDIM_Role16 
    FOREIGN KEY (DIM_ROLES_SK)
    REFERENCES DIM_Role(DIM_ROLES_SK)
go


/* 
 * TABLE: FACT_Book_Ratings 
 */

ALTER TABLE FACT_Book_Ratings ADD CONSTRAINT RefDIM_Date8 
    FOREIGN KEY (DIM_DATE_SK)
    REFERENCES DIM_Date(DIM_DATE_SK)
go

ALTER TABLE FACT_Book_Ratings ADD CONSTRAINT RefDIM_Series9 
    FOREIGN KEY (DIM_SERIES_SK)
    REFERENCES DIM_Series(DIM_SERIES_SK)
go

ALTER TABLE FACT_Book_Ratings ADD CONSTRAINT RefDIM_Authors10 
    FOREIGN KEY (DIM_AUTHORS_SK)
    REFERENCES DIM_Authors(DIM_AUTHORS_SK)
go

ALTER TABLE FACT_Book_Ratings ADD CONSTRAINT RefWorks11 
    FOREIGN KEY (DIM_WORKS_SK)
    REFERENCES DIM_Works(DIM_WORKS_SK)
go

ALTER TABLE FACT_Book_Ratings ADD CONSTRAINT RefDIM_Popular_Shelves12 
    FOREIGN KEY (DIM_POPULAR_SHELF_SK)
    REFERENCES DIM_Popular_Shelves(DIM_POPULAR_SHELF_SK)
go

ALTER TABLE FACT_Book_Ratings ADD CONSTRAINT RefDIm_Books13 
    FOREIGN KEY (DIM_BOOK_SK)
    REFERENCES DIM_Books(DIM_BOOK_SK)
go