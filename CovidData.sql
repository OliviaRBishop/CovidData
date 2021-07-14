-- Checking to see the data was loaded correctly

Select *
From CovidData.coviddeaths
Order by 3,4;

Select *
From CovidData.covidvaccinations
Order by 3,4;

-- Choosing the data I wanted to work with

Select location, population, total_cases, new_cases, total_deaths, date
From CovidData.coviddeaths;

-- Calculating total cases vs. total deaths in the US

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercent
From CovidData.coviddeaths
Where location = 'United States';

-- Calculating total cases vs total deaths for the countries bordering the US

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercent
From CovidData.coviddeaths
Where location = 'Mexico';

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercent
From CovidData.coviddeaths
Where location = 'Canada';

-- What percentage of the population has contracted Covid

Select location, date, total_cases, population, (total_cases/population)*100 as PopulationPercent
From CovidData.coviddeaths
Where location = 'United States';

Select location, date, total_cases, population, (total_cases/population)*100 as PopulationPercent
From CovidData.coviddeaths
Where location = 'Mexico';

Select location, date, total_cases, population, (total_cases/population)*100 as PopulationPercent
From CovidData.coviddeaths
Where location = 'Canada';

-- Countries with the highest & lowest infection rates

Select location, population, MAX(total_cases) as MaximumTotalCases, MAX(total_cases/population)*100 as PopulationPercent
From CovidData.coviddeaths
Group by population, location
Order by PopulationPercent DESC;

Select location, population, MIN(total_cases) as MinimumTotalCases, Min(total_cases/population)*100 as PopulationPercent
From CovidData.coviddeaths
Group by population, location
Order by PopulationPercent;

-- Countries with the highest & lowest death rates (caused by Covid)

Select location, MAX(cast(total_deaths as decimal)) as MaximumTotalDeaths
From CovidData.coviddeaths
Where continent is not null
Group by location
Order by MaximumTotalDeaths DESC;

Select location, MIN(cast(total_deaths as decimal)) as MinimumTotalDeaths
From CovidData.coviddeaths
Where continent is not null
Group by location
Order by MinimumTotalDeaths;



-- Globally

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as decimal)) as total_deaths, SUM(cast(new_deaths as decimal))/SUM(new_cases)*100 as DeathPercent
From CovidData.coviddeaths
Where continent is not null;

-- World population vs. vaccination

Select death.location, death.date, death.population, vax.total_vaccinations
From CovidData.coviddeaths death
	join CovidData.covidvaccinations vax
		on death.location = vax.location
        and death.date = vax.date
Where death.continent is not null;















	








