# energy-consumption-analytics
Energy Consumption Analytics: Steel Plant (2018)
Overview: Analysis of one year of 15-minute electricity readings from a steel plant to find peak-usage patterns and the operating conditions that drive energy use and CO2 emissions.
Dataset: Steel Industry Energy Consumption, UCI Machine Learning Repository (CC BY 4.0). 35,040 rows covering 1 Jan to 31 Dec 2018.
Tools: MySQL (data preparation and analysis), Power BI (dashboard).
Process:
• Loaded the CSV into MySQL and converted the day/month/year text dates to DATETIME with STR_TO_DATE.
• Wrote eight SQL queries covering totals, day of week, weekday vs weekend, load type, monthly totals, hourly pattern, top days and month-over-month change.
• Exported the prepared table and built a one-page Power BI dashboard with KPI cards, four charts and a slicer.
Key findings: (paste the four findings from section 5)
Files: energy_project.sql (all queries), energy_dashboard.pbix (Power BI file), dashboard.png (screenshot), the dataset file or a link to the source.
Limitations: One plant, one year, no weather or production data, so the findings describe patterns, not causes.
Credit: Dataset from the UCI Machine Learning Repository.
8. Resume
Project title: Energy Consumption Analytics: Steel Plant Dashboard
Bullets (adjust the wording to match what you actually did):
• Analysed 35,040 15-minute energy readings from a steel plant in MySQL, converting text dates with STR_TO_DATE and using GROUP BY aggregations and window functions to find peak-usage patterns.
• Built a Power BI dashboard (KPI cards, monthly trend, hourly peak, load-type and day-of-week charts, slicer) showing that maximum-load operation is about 21% of readings but about 45% of energy and about 48% of CO2.
• Found weekday usage averages about 2.9 times weekend usage and peaks around 9am, pointing to load-shifting opportunities to reduce peak demand and emissions.
