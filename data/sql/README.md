# SQL Analysis

This folder contains SQL queries used for data exploration and analysis of the multilingual helpdesk dataset.

## Database Structure

The analysis uses data from two Excel files converted to database tables:
- `Helpdesk_Raw_Data` (215 records, 21 columns)
- `ticket_helpdesk_labeled_multi_languages` (215 records, 21 columns)

## Files Overview

| File | Description | Key Analyses |
|------|-------------|--------------|
| `01_data_exploration.sql` | Dataset overview and basic statistics | Total tickets, language distribution, satisfaction metrics |
| `02_language_analysis.sql` | Language matching impact analysis | Correlation between language match and satisfaction |
| `03_satisfaction_metrics.sql` | Customer satisfaction deep dive | Cultural styles impact, priority analysis |
| `04_cultural_insights.sql` | Cultural communication patterns | Agent performance, multilingual capability |
| `05_business_recommendations.sql` | Data-driven recommendations | Hiring priorities, resource optimization |

## Technologies Used

- **SQL Dialect**: T-SQL (Microsoft SQL Server) / PostgreSQL compatible
- **Data Source**: Excel files from `/data/` folder
- **Integration**: Queries support Power BI dashboard visualizations

## How to Use

### Option 1: SQL Server Management Studio (SSMS)
1. Import Excel files from `/data/` folder into SQL Server
2. Open each `.sql` file in SSMS
3. Execute queries sequentially (01 through 05)
4. Export results for further analysis

### Option 2: Online SQL Editors
1. Use platforms like SQLiteOnline or DB Fiddle
2. Create tables matching the Excel structure
3. Import sample data
4. Run queries to see results

## Key Insights Discovered

Through SQL analysis, we identified:

- **Language Gap**: French and Portuguese customers wait 42% longer than average
- **Satisfaction Driver**: Language Match Score > 0.8 increases satisfaction by 39%
- **Cultural Impact**: Communication complexity correlates more with satisfaction (0.067) than resolution time (0.029)
- **Resource Allocation**: 20% of tickets face language barriers (Match Score 0.80 average)

## Query Complexity Levels

- 🟢 **Beginner**: `01_data_exploration.sql` - Basic SELECT, COUNT, AVG
- 🟡 **Intermediate**: `02_language_analysis.sql`, `03_satisfaction_metrics.sql` - JOINs, GROUP BY, CASE
- 🔴 **Advanced**: `04_cultural_insights.sql`, `05_business_recommendations.sql` - CTEs, Window Functions, Correlations

## Skills Demonstrated

- ✅ Data exploration and profiling
- ✅ Aggregation and grouping
- ✅ Conditional logic (CASE statements)
- ✅ Statistical calculations
- ✅ Business intelligence queries
- ✅ Performance optimization
- ✅ Data-driven recommendations

---

*Last Updated: October 2025*
