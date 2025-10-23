-- ============================================
-- MULTILINGUAL CUSTOMER SUPPORT ANALYTICS
-- SQL Data Exploration Queries
-- Author: Ake Marc Albert Adje
-- Date: October 2025
-- ============================================

-- ==========================================
-- 1. DATASET OVERVIEW
-- ==========================================

-- Get basic statistics about the entire dataset
SELECT 
    COUNT(*) as total_tickets,
    COUNT(DISTINCT Customer_Language) as languages_supported,
    COUNT(DISTINCT Agent_id) as total_agents,
    COUNT(DISTINCT Region) as regions_covered,
    MIN([Resolution Time]) as min_resolution_minutes,
    MAX([Resolution Time]) as max_resolution_minutes,
    ROUND(AVG([Resolution Time]), 2) as avg_resolution_minutes,
    ROUND(AVG(Satisfaction), 2) as avg_satisfaction_score,
    MIN(Satisfaction) as min_satisfaction,
    MAX(Satisfaction) as max_satisfaction
FROM Helpdesk_Raw_Data
WHERE [Resolution Time] IS NOT NULL;


-- ==========================================
-- 2. LANGUAGE DISTRIBUTION ANALYSIS
-- ==========================================

-- Comprehensive breakdown by customer language
SELECT 
    Customer_Language,
    COUNT(*) as ticket_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Helpdesk_Raw_Data WHERE Customer_Language IS NOT NULL), 2) as percentage_of_total,
    ROUND(AVG([Resolution Time]), 2) as avg_resolution_time,
    ROUND(AVG(Satisfaction), 2) as avg_satisfaction_score,
    MIN(Satisfaction) as min_satisfaction,
    MAX(Satisfaction) as max_satisfaction,
    COUNT(DISTINCT Agent_id) as agents_serving
FROM Helpdesk_Raw_Data
WHERE Customer_Language IS NOT NULL
GROUP BY Customer_Language
ORDER BY ticket_count DESC;


-- ==========================================
-- 3. ISSUE TYPE BREAKDOWN
-- ==========================================

-- Analyze tickets by issue type
SELECT 
    Issue_Type,
    COUNT(*) as total_tickets,
    ROUND(AVG([Resolution Time]), 2) as avg_resolution_time,
    ROUND(AVG(Satisfaction), 2) as avg_satisfaction,
    ROUND(AVG(Complexity_Score), 2) as avg_complexity
FROM Helpdesk_Raw_Data
WHERE Issue_Type IS NOT NULL
GROUP BY Issue_Type
ORDER BY total_tickets DESC;


-- ==========================================
-- 4. PRIORITY LEVEL ANALYSIS
-- ==========================================

-- Examine how priority affects resolution and satisfaction
SELECT 
    Priority,
    COUNT(*) as ticket_count,
    ROUND(AVG([Resolution Time]), 2) as avg_resolution_time,
    ROUND(AVG(Satisfaction), 2) as avg_satisfaction,
    ROUND(AVG([Language_Match_Score ]), 2) as avg_language_match
FROM Helpdesk_Raw_Data
WHERE Priority IN ('1', '2', '3')  -- Filter out invalid priority values
GROUP BY Priority
ORDER BY Priority;


-- ==========================================
-- 5. REGIONAL DISTRIBUTION
-- ==========================================

-- Analyze tickets by region
SELECT 
    Region,
    COUNT(*) as total_tickets,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Helpdesk_Raw_Data WHERE Region IS NOT NULL), 2) as percentage,
    ROUND(AVG([Resolution Time]), 2) as avg_resolution,
    ROUND(AVG(Satisfaction), 2) as avg_satisfaction,
    COUNT(DISTINCT Customer_Language) as languages_in_region
FROM Helpdesk_Raw_Data
WHERE Region IS NOT NULL
GROUP BY Region
ORDER BY total_tickets DESC;


-- ==========================================
-- 6. DATA QUALITY CHECK
-- ==========================================

-- Identify missing or null values
SELECT 
    'Total Records' as metric,
    COUNT(*) as count
FROM Helpdesk_Raw_Data

UNION ALL

SELECT 
    'Missing Customer Language' as metric,
    COUNT(*) as count
FROM Helpdesk_Raw_Data
WHERE Customer_Language IS NULL

UNION ALL

SELECT 
    'Missing Resolution Time' as metric,
    COUNT(*) as count
FROM Helpdesk_Raw_Data
WHERE [Resolution Time] IS NULL

UNION ALL

SELECT 
    'Missing Satisfaction Score' as metric,
    COUNT(*) as count
FROM Helpdesk_Raw_Data
WHERE Satisfaction IS NULL

UNION ALL

SELECT 
    'Missing Agent ID' as metric,
    COUNT(*) as count
FROM Helpdesk_Raw_Data
WHERE Agent_id IS NULL;


-- ==========================================
-- 7. SUMMARY STATISTICS
-- ==========================================

-- Quick summary of key metrics
SELECT 
    'Resolution Time' as metric,
    ROUND(MIN([Resolution Time]), 2) as minimum,
    ROUND(MAX([Resolution Time]), 2) as maximum,
    ROUND(AVG([Resolution Time]), 2) as average,
    ROUND(STDEV([Resolution Time]), 2) as std_deviation
FROM Helpdesk_Raw_Data
WHERE [Resolution Time] IS NOT NULL

UNION ALL

SELECT 
    'Satisfaction Score' as metric,
    ROUND(MIN(Satisfaction), 2) as minimum,
    ROUND(MAX(Satisfaction), 2) as maximum,
    ROUND(AVG(Satisfaction), 2) as average,
    ROUND(STDEV(Satisfaction), 2) as std_deviation
FROM Helpdesk_Raw_Data
WHERE Satisfaction IS NOT NULL;

-- ==========================================
-- END OF DATA EXPLORATION QUERIES
-- ==========================================
