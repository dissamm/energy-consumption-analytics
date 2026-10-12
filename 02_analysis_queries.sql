USE energy_project;
SELECT ROUND(SUM(usage_kwh),0) AS total_kwh,
       ROUND(SUM(co2_tco2),1) AS total_co2,
       ROUND(AVG(usage_kwh),2) AS avg_kwh
FROM energy;
SELECT day_of_week, ROUND(AVG(usage_kwh),2) AS avg_kwh
FROM energy
GROUP BY day_of_week
ORDER BY avg_kwh DESC;
SELECT week_status, ROUND(AVG(usage_kwh),2) AS avg_kwh,
       ROUND(SUM(usage_kwh),0) AS total_kwh
FROM energy
GROUP BY week_status;
SELECT load_type,
       COUNT(*) AS readings,
       ROUND(SUM(usage_kwh),0) AS total_kwh,
       ROUND(SUM(co2_tco2),1) AS total_co2,
       ROUND(SUM(usage_kwh) * 100 / SUM(SUM(usage_kwh)) OVER (), 1) AS pct_of_energy
FROM energy
GROUP BY load_type

SELECT MONTH(ts) AS month, ROUND(SUM(usage_kwh),0) AS total_kwh
FROM energy
GROUP BY MONTH(ts)
ORDER BY month;

SELECT HOUR(ts) AS hour_of_day, ROUND(AVG(usage_kwh),1) AS avg_kwh
FROM energy
GROUP BY HOUR(ts)
ORDER BY hour_of_day;

SELECT DATE(ts) AS day, ROUND(SUM(usage_kwh),0) AS total_kwh
FROM energy
GROUP BY DATE(ts)
ORDER BY total_kwh DESC
LIMIT 10;

WITH monthly AS (
    SELECT MONTH(ts) AS month, SUM(usage_kwh) AS total_kwh
    FROM energy
    GROUP BY MONTH(ts)
)
SELECT month,
       ROUND(total_kwh,0) AS total_kwh,
       ROUND((total_kwh - LAG(total_kwh) OVER (ORDER BY month)) * 100
             / LAG(total_kwh) OVER (ORDER BY month), 1) AS pct_change
FROM monthly;