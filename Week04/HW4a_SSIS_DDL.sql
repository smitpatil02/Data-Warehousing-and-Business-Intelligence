USE DWBI
GO

CREATE TABLE owid_covid_data
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
human_development_index				FLOAT
);
