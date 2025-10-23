-- ============================================
-- LANGUAGE MATCHING IMPACT ANALYSIS
-- Analyzing how language matching affects customer satisfaction
-- ============================================

-- ==========================================
-- 1. LANGUAGE MATCH SCORE DISTRIBUTION
-- ==========================================

-- Categorize tickets by language match quality
SELECT 
    CASE 
        WHEN [Language_Match_Score ] >= 0.9 THEN 'Excellent Match (0.9-1.0)'
        WHEN [Language_Match_Score ] >= 0.8 THEN 'Good Match (0.8-0.89)'
        WHEN [Language_Match_Score ] >= 0.7 THEN 'Fair Match (0.7-0.79)'
        WHEN [Language_Match_Score ] >= 0.5 THEN 'Poor Match (0.5-0.69)'
        ELSE 'No Match (< 0.5)'
    END as match_category,
    COUNT(*) as ticket_count,
    ROUND(AVG(Satisfaction), 2) as avg_satisfaction,
    ROUND(AVG([Resolution Time]), 2) as avg_resolution_time,
    ROUND(AVG([Language_Match_Score ]), 3) as avg_match_score,
    ROUND(AVG([Communication_Complexity ]), 2) as avg_comm_complexity
FROM Helpdesk_Raw_Data
WHERE [Language_Match_Score ] IS NOT NULL
GROUP BY 
    CASE 
        WHEN [Language_Match_Score ] >= 0.9 THEN 'Excellent Match (0.9-1.0)'
        WHEN [Language_Match_Score ] >= 0.8 THEN 'Good Match (0.8-0.89)'
        WHEN [Language_Match_Score ] >= 0.7 THEN 'Fair Match (0.7-0.79)'
        WHEN [Language_Match_Score ] >= 0.5 THEN 'Poor Match (0.5-0.69)'
        ELSE 'No Match (< 0.5)'
    END
ORDER BY avg_satisfaction DESC;


-- ==========================================
-- 2. LANGUAGE DEMAND VS AGENT SUPPLY
-- ==========================================

-- Identify languages with insufficient agent coverage
SELECT 
    Customer_Language,
    COUNT(*) as customer_demand,
    COUNT(DISTINCT Agent_id) as agents_available,
    ROUND(COUNT(*) * 1.0 / NULLIF(COUNT(DISTINCT Agent_id), 0), 2) as tickets_per_agent,
    ROUND(AVG([Resolution Time]), 2) as avg_wait_time,
    ROUND(AVG(Satisfaction), 2) as avg_satisfaction,
    CASE 
        WHEN AVG([Resolution Time]) > 70 AND AVG(Satisfaction) < 5.5 THEN 'CRITICAL'
        WHEN AVG([Resolution Time]) > 60 OR AVG(Satisfaction) < 6.0 THEN 'HIGH PRIORITY'
        WHEN AVG([Resolution Time]) > 50 THEN 'MONITOR'
        ELSE 'ADEQUATE'
    END as resource_status
FROM Helpdesk_Raw_Data
WHERE Customer_Language IS NOT NULL
GROUP BY Customer_Language
HAVING COUNT(*) > 5  -- Focus on languages with significant volume
ORDER BY avg_wait_time DESC;


-- ==========================================
-- 3. LANGUAGE MISMATCH IMPACT
-- ==========================================

-- Compare perfect match vs mismatch scenarios
SELECT 
    CASE 
        WHEN [Language_Match_Score ] = 1.0 THEN 'Perfect Language Match'
        ELSE 'Language Mismatch'
    END as match_status,
    COUNT(*) as tickets,
    ROUND(AVG(Satisfaction), 2) as avg_satisfaction,
    ROUND(AVG([Resolution Time]), 2) as avg_resolution_time,
    ROUND(
        (MAX(CASE WHEN [Language_Match_Score ] = 1.0 THEN Satisfaction END) - 
         AVG(CASE WHEN [Language_Match_Score ] < 1.0 THEN Satisfaction END)) * 100.0 / 
         NULLIF(AVG(CASE WHEN [Language_Match_Score ] < 1.0 THEN Satisfaction END), 0), 
    1) as satisfaction_improvement_percentage
FROM Helpdesk_Raw_Data
WHERE [Language_Match_Score ] IS NOT NULL
GROUP BY 
    CASE 
        WHEN [Language_Match_Score ] = 1.0 THEN 'Perfect Language Match'
        ELSE 'Language Mismatch'
    END;


-- ==========================================
-- 4. BILINGUAL AGENT EFFECTIVENESS
-- ==========================================

-- Analyze agents who serve multiple languages
SELECT 
    Agent_languages,
    COUNT(*) as tickets_handled,
    COUNT(DISTINCT Customer_Language) as languages_served,
    ROUND(AVG(Satisfaction), 2) as avg_satisfaction,
    ROUND(AVG([Resolution Time]), 2) as avg_resolution_time,
    ROUND(AVG([Language_Match_Score ]), 3) as avg_match_score
FROM Helpdesk_Raw_Data
WHERE Agent_languages IS NOT NULL
GROUP BY Agent_languages
HAVING COUNT(*) >= 5  -- Minimum threshold for meaningful analysis
ORDER BY avg_satisfaction DESC, languages_served DESC;


-- ==========================================
-- 5. LANGUAGE COMPLEXITY FACTOR
-- ==========================================

-- Examine how language complexity affects outcomes
SELECT 
    Customer_Language,
    ROUND(AVG(Language_Complexity_Factor), 2) as avg_language_complexity,
    ROUND(AVG([Communication_Complexity ]), 2) as avg_comm_complexity,
    ROUND(AVG(Satisfaction), 2) as avg_satisfaction,
    ROUND(AVG([Resolution Time]), 2) as avg_resolution_time,
    COUNT(*) as sample_size
FROM Helpdesk_Raw_Data
WHERE Language_Complexity_Factor IS NOT NULL
GROUP BY Customer_Language
ORDER BY avg_language_complexity DESC;


-- ==========================================
-- 6. SATISFACTION DELTA BY LANGUAGE MATCH
-- ==========================================

-- Calculate satisfaction difference between matched and mismatched languages
WITH matched AS (
    SELECT AVG(Satisfaction) as avg_sat
    FROM Helpdesk_Raw_Data
    WHERE [Language_Match_Score ] >= 0.8
),
mismatched AS (
    SELECT AVG(Satisfaction) as avg_sat
    FROM Helpdesk_Raw_Data
    WHERE [Language_Match_Score ] < 0.8
)
SELECT 
    ROUND(m.avg_sat, 2) as matched_avg_satisfaction,
    ROUND(mm.avg_sat, 2) as mismatched_avg_satisfaction,
    ROUND(m.avg_sat - mm.avg_sat, 2) as satisfaction_delta,
    ROUND(((m.avg_sat - mm.avg_sat) / NULLIF(mm.avg_sat, 0)) * 100, 1) as improvement_percentage
FROM matched m, mismatched mm;

-- ==========================================
-- END OF LANGUAGE ANALYSIS QUERIES
-- ==========================================
