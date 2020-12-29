USE DWBI;


DROP TABLE IF EXISTS stg_owid_covid_data;

--Creating a table will all data types as VARCHAR(255) for staging area
CREATE TABLE stg_owid_covid_data
(
iso_code							VARCHAR(255),
continent							VARCHAR(255),
[location]							VARCHAR(255),
[date]								VARCHAR(255),
total_cases							VARCHAR(255),
new_cases							VARCHAR(255),
new_cases_smoothed					VARCHAR(255),
total_deaths						VARCHAR(255),
new_deaths							VARCHAR(255),
new_deaths_smoothed					VARCHAR(255),
total_cases_per_million				VARCHAR(255),
new_cases_per_million				VARCHAR(255),
new_cases_smoothed_per_million		VARCHAR(255),
total_deaths_per_million			VARCHAR(255),
new_deaths_per_million				VARCHAR(255),
new_deaths_smoothed_per_million		VARCHAR(255),
total_tests							VARCHAR(255),
new_tests							VARCHAR(255),
new_tests_smoothed					VARCHAR(255),
total_tests_per_thousand			VARCHAR(255),
new_tests_per_thousand				VARCHAR(255),
new_tests_smoothed_per_thousand		VARCHAR(255),
tests_per_case						VARCHAR(255),
positive_rate						VARCHAR(255),
tests_units							VARCHAR(255),
stringency_index					VARCHAR(255),
[population]						VARCHAR(255),
population_density					VARCHAR(255),
median_age							VARCHAR(255),
aged_65_older						VARCHAR(255),
aged_70_older						VARCHAR(255),
gdp_per_capita						VARCHAR(255),
extreme_poverty						VARCHAR(255),
cardiovasc_death_rate				VARCHAR(255),
diabetes_prevalence					VARCHAR(255),
female_smokers						VARCHAR(255),
male_smokers						VARCHAR(255),
handwashing_facilities				VARCHAR(255),
hospital_beds_per_thousand			VARCHAR(255),
life_expectancy						VARCHAR(255),
human_development_index				VARCHAR(255)
);

SELECT * FROM stg_owid_covid_data;


--Creating a SELECT statement to convert VARCHAR data type to their respective data types in SSIS OLE DB Source
--Also creating a logs column with the timestamp for the most recent load
SELECT iso_code
, continent
, [location]
, CONVERT(DATE, [date], 5) AS [date]
, CAST(total_cases AS INT) AS total_cases	
, CAST(new_cases AS INT) AS new_cases
, CAST(new_cases_smoothed AS FLOAT) AS new_cases_smoothed
, CAST(total_deaths AS INT) AS total_deaths
, CAST(new_deaths AS INT) AS new_deaths
, CAST(new_deaths_smoothed AS FLOAT) AS new_deaths_smoothed
, CAST(total_cases_per_million AS FLOAT) AS total_cases_per_million
, CAST(new_cases_per_million AS FLOAT) AS new_cases_per_million
, CAST(new_cases_smoothed_per_million AS FLOAT) AS new_cases_smoothed_per_million
, CAST(total_deaths_per_million AS FLOAT) AS total_deaths_per_million
, CAST(new_deaths_per_million AS FLOAT) AS new_deaths_per_million
, CAST(new_deaths_smoothed_per_million AS FLOAT) AS new_deaths_smoothed_per_million
, CAST(total_tests AS INT) AS total_tests
, CAST(new_tests AS INT) AS new_tests
, CAST(new_tests_smoothed AS FLOAT) AS new_tests_smoothed
, CAST(total_tests_per_thousand AS FLOAT) AS total_tests_per_thousand
, CAST(new_tests_per_thousand AS FLOAT) AS new_tests_per_thousand
, CAST(new_tests_smoothed_per_thousand AS FLOAT) AS new_tests_smoothed_per_thousand
, CAST(tests_per_case AS FLOAT) AS tests_per_case
, CAST(positive_rate AS FLOAT) AS positive_rate
, tests_units
, CAST(stringency_index AS FLOAT) AS stringency_index
, CAST(population AS BIGINT) AS population
, CAST(population_density AS FLOAT) AS population_density
, CAST(median_age AS FLOAT) AS median_age
, CAST(aged_65_older AS FLOAT) AS aged_65_older
, CAST(aged_70_older AS FLOAT) AS aged_70_older
, CAST(gdp_per_capita AS FLOAT) AS gdp_per_capita
, CAST(extreme_poverty AS FLOAT) AS extreme_poverty
, CAST(cardiovasc_death_rate AS FLOAT) AS cardiovasc_death_rate
, CAST(diabetes_prevalence AS FLOAT) AS diabetes_prevalence
, CAST(female_smokers AS FLOAT) AS female_smokers
, CAST(male_smokers AS FLOAT) AS male_smokers
, CAST(handwashing_facilities AS FLOAT) AS handwashing_facilities
, CAST(hospital_beds_per_thousand AS FLOAT) AS hospital_beds_per_thousand
, CAST(life_expectancy AS FLOAT) AS life_expectancy
, CAST(human_development_index AS FLOAT) AS human_development_index
, GETDATE() AS owid_covid_data_log
FROM stg_owid_covid_data;

TRUNCATE TABLE stg_owid_covid_data;



DROP TABLE IF EXISTS dst_owid_covid_data;

--Finally creating a destination table will all the correct data types
CREATE TABLE dst_owid_covid_data
(
iso_code							VARCHAR(255),
continent							VARCHAR(255),
[location]							VARCHAR(255),
[date]								DATE,
total_cases							INT,
new_cases							INT,
new_cases_smoothed					FLOAT,
total_deaths						INT,
new_deaths							INT,
new_deaths_smoothed					FLOAT,
total_cases_per_million				FLOAT,
new_cases_per_million				FLOAT,
new_cases_smoothed_per_million		FLOAT,
total_deaths_per_million			FLOAT,
new_deaths_per_million				FLOAT,
new_deaths_smoothed_per_million		FLOAT,
total_tests							INT,
new_tests							INT,
new_tests_smoothed					FLOAT,
total_tests_per_thousand			FLOAT,
new_tests_per_thousand				FLOAT,
new_tests_smoothed_per_thousand		FLOAT,
tests_per_case						FLOAT,
positive_rate						FLOAT,
tests_units							VARCHAR(255),
stringency_index					FLOAT,
[population]						BIGINT,
population_density					FLOAT,
median_age							FLOAT,
aged_65_older						FLOAT,
aged_70_older						FLOAT,
gdp_per_capita						FLOAT,
extreme_poverty						FLOAT,
cardiovasc_death_rate				FLOAT,
diabetes_prevalence					FLOAT,
female_smokers						FLOAT,
male_smokers						FLOAT,
handwashing_facilities				FLOAT,
hospital_beds_per_thousand			FLOAT,
life_expectancy						FLOAT,
human_development_index				FLOAT,
owid_covid_data_log					DATETIME
);

SELECT * FROM dst_owid_covid_data;

TRUNCATE TABLE dst_owid_covid_data;


-- Code Review DDL/DQL

TRUNCATE TABLE stg_owid_covid_data;
TRUNCATE TABLE dst_owid_covid_data;

SELECT * FROM stg_owid_covid_data;
SELECT * FROM dst_owid_covid_data;