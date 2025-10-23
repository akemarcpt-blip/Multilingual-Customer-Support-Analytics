-- ============================================
-- CULTURAL COMMUNICATION INSIGHTS
-- ============================================

-- Agent performance across cultural styles
SELECT 
    Agent_id,
    Cultural_Communication_Style,
    COUNT(*) as tickets_handled,
    ROUND(AVG(Satisfaction), 2) as avg_satisfaction,
    ROUND(AVG([Resolution Time]), 2) as avg_resolution
FROM Helpdesk_Raw_Data
WHERE Cultural_Communication_Style IS NOT NULL
GROUP BY Agent_id, Cultural_Communication_Style
HAVING COUNT(*) >= 3
ORDER BY avg_satisfaction DESC;

-- Cultural style by language correlation
SELECT 
    Customer_Language,
    Cultural_Communication_Style,
    COUNT(*) as frequency,
    ROUND(AVG(Satisfaction), 2) as avg_satisfaction
FROM Helpdesk_Raw_Data
GROUP BY Customer_Language, Cultural_Communication_Style
ORDER BY Customer_Language, frequency DESC;
