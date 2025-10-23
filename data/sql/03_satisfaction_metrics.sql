-- ============================================
-- CUSTOMER SATISFACTION METRICS ANALYSIS
-- ============================================

-- Cultural communication style impact
SELECT 
    Cultural_Communication_Style,
    COUNT(*) as tickets,
    ROUND(AVG(Satisfaction), 2) as avg_satisfaction,
    ROUND(AVG([Resolution Time]), 2) as avg_resolution,
    ROUND(AVG([Communication_Complexity ]), 2) as avg_complexity
FROM Helpdesk_Raw_Data
WHERE Cultural_Communication_Style IS NOT NULL
GROUP BY Cultural_Communication_Style
ORDER BY avg_satisfaction DESC;

-- Satisfaction by priority level
SELECT 
    Priority,
    Customer_Language,
    COUNT(*) as tickets,
    ROUND(AVG(Satisfaction), 2) as avg_satisfaction,
    ROUND(AVG([Resolution Time]), 2) as avg_resolution
FROM Helpdesk_Raw_Data
WHERE Priority IN ('1', '2', '3')
GROUP BY Priority, Customer_Language
ORDER BY Priority, avg_satisfaction DESC;
