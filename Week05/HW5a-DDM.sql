USE DWBI;

SELECT TOP 10 ProviderName, 
	   SUM(CAST(ResidentsTotalCOVID19Deaths AS INT)) AS TotalResidentsDeaths
FROM COVID19NursingHome
GROUP BY ProviderName
ORDER BY 2 DESC;


SELECT TOP 10 ProviderState,
	   SUM(CAST(TotalResidentsCOVID19DeathsAsAPercentageOfConfirmedCOVID19Cases AS FLOAT)) AS DeathsPerConfirmed
FROM COVID19NursingHome
GROUP BY ProviderState
ORDER BY 2 DESC;