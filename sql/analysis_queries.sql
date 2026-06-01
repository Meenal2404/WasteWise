-- WasteWise SQL Analysis Queries
USE wastewise;

-- 1. Total waste by area
SELECT area, ROUND(SUM(quantity_kg), 2) AS total_waste_kg
FROM waste_data
GROUP BY area
ORDER BY total_waste_kg DESC;

-- 2. Waste type distribution
SELECT waste_type, COUNT(*) AS count,
ROUND(SUM(quantity_kg), 2) AS total_kg
FROM waste_data
GROUP BY waste_type
ORDER BY total_kg DESC;

-- 3. Monthly waste trend
SELECT month, ROUND(SUM(quantity_kg), 2) AS total_kg
FROM waste_data
GROUP BY month, month_num
ORDER BY month_num;

-- 4. Collection rate
SELECT collection_done,
COUNT(*) AS count,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM waste_data), 1) AS percentage
FROM waste_data
GROUP BY collection_done;

-- 5. Top complaint areas
SELECT area, ROUND(AVG(complaints), 2) AS avg_complaints
FROM waste_data
GROUP BY area
ORDER BY avg_complaints DESC;



