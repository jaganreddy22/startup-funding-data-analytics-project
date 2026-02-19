--1️⃣ What is the Total Funding Raised in India?--
select sum(amount_in_usd) as total_funding from startup_fund;

--2️⃣ which are the Top 5 Cities by Total Funding?--
select city_location,sum(amount_in_usd) as total_fund from startup_fund 
group by(city_location) order by total_fund desc limit 5;

--3️⃣ Which City Has the Most Startups?--
select city_location,count(DISTINCT startup_name) as Total_startups from startup_fund group by(city_location) order by Total_startups desc limit 5;

--4️⃣ Which Industry Attracts the Highest Funding?--
select industry_vertical,sum(amount_in_usd) as Total_Amount from startup_fund GROUP BY(industry_vertical) ORDER BY Total_Amount desc limit 10;

--5️⃣ What is the Year-wise Funding Trend?--
select year,sum(amount_in_usd) as yearly_funding from startup_fund
GROUP BY year ORDER BY year;

--6️⃣ Who are the Top 5 Most Active Investors?--
select investors_name,count(*) AS investment_count from startup_fund GROUP BY investors_name ORDER BY investment_count desc limit 5;

--7️⃣ Which Startup Received the Highest Single Funding?--
select startup_name,amount_in_usd from startup_fund order BY amount_in_usd desc limit 1;

--8️⃣ What is the Average Funding by Investment Type?--
select investmentntype,Avg(amount_in_usd) as average_funding from startup_fund GROUP BY investmentntype ORDER BY average_funding desc;

--9️⃣ Rank Startups by Total Funding--
select startup_name,sum(amount_in_usd) as total_funding ,Rank() Over(ORDER BY sum(amount_in_usd) desc) as funding_rank  from startup_fund GROUP BY startup_name;


-- 10 Month Wise Funding --
SELECT month,
       SUM(amount_in_usd) AS monthly_funding
FROM startup_fund
GROUP BY month
ORDER BY month;

-- 11 Year-over-Year Funding Growth --
SELECT year,
       SUM(amount_in_usd) AS yearly_funding,
       LAG(SUM(amount_in_usd)) OVER (ORDER BY year) AS previous_year
FROM startup_fund
GROUP BY year;

-- 12 Highest Funded Startup in Each City
SELECT city_location, startup_name, MAX(total_funding) AS max_funding
FROM (
    SELECT city_location, startup_name, SUM(amount_in_usd) AS total_funding
    FROM startup_fund
    GROUP BY city_location, startup_name
) AS city_startups
GROUP BY city_location
ORDER BY max_funding DESC;

--13 Top industry --
select industry_vertical from startup_fund GROUP BY industry_vertical ORDER BY sum(amount_in_usd) desc limit 1;


--14 Top investor --
select investors_name from startup_fund GROUP BY investors_name ORDER BY sum(amount_in_usd) desc limit 1;

--15 Top city --
select city_location from startup_fund GROUP BY city_location  ORDER BY sum(amount_in_usd) desc limit 1;

