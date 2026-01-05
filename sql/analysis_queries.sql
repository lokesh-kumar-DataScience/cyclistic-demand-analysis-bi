-- ============================================================
-- Cyclistic Demand Analysis
-- Purpose: Identify high-demand stations and analyze trends
-- ============================================================

-- Query 1: Top stations by total trip starts (overall demand)
SELECT
  start_station_id,
  start_station_name,
  COUNT(*) AS total_trips
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  start_station_id IS NOT NULL
GROUP BY
  start_station_id,
  start_station_name
ORDER BY
  total_trips DESC
LIMIT 20;

-- Query 2: Monthly demand trends by station
SELECT
  start_station_id,
  start_station_name,
  FORMAT_DATE('%Y-%m', DATE(starttime)) AS year_month,
  COUNT(*) AS total_trips
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  start_station_id IS NOT NULL
GROUP BY
  start_station_id,
  start_station_name,
  year_month
ORDER BY
  year_month,
  total_trips DESC;
