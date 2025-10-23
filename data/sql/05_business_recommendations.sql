-- ============================================
-- DATA-DRIVEN BUSINESS RECOMMENDATIONS
-- ============================================

-- Hiring priority matrix
WITH language_metrics AS (
    SELECT 
        Customer_Language,
        COUNT(*) as total_demand,
        ROUND(AVG([Resolution Time]), 2) as avg_wait,
        ROUND(AVG(Satisfaction), 2) as current_satisfaction,
        COUNT(DISTINCT Agent_id) as current_agents
    FROM Helpdesk_Raw_Data
    WHERE Customer_Language IS NOT NULL
    GROUP BY Customer_Language
)
SELECT 
    Customer_Language,
    total_demand,
    current_agents,
    ROUND(total_demand * 1.0 / NULLIF(current_agents, 0), 2) as demand_per_agent,
    avg_wait as avg_wait_time_minutes,
    current_satisfaction,
    CASE 
        WHEN avg_wait > 70 AND current_satisfaction < 5.5 THEN 'URGENT HIRING'
        WHEN avg_wait > 60 OR current_satisfaction < 5.8 THEN 'HIGH PRIORITY'
        WHEN total_demand / NULLIF(current_agents, 0) > 20 THEN 'SCALE UP'
        ELSE 'MONITOR'
    END as action_required,
    CASE 
        WHEN Customer_Language IN ('fr', 'pt') THEN 'Recruit 2-3 bilingual agents'
        WHEN avg_wait > 65 THEN 'Add 1-2 agents or improve routing'
        ELSE 'Maintain current staffing'
    END as recommendation
FROM language_metrics
ORDER BY 
    CASE 
        WHEN avg_wait > 70 AND current_satisfaction < 5.5 THEN 1
        WHEN avg_wait > 60 OR current_satisfaction < 5.8 THEN 2
        ELSE 3
    END,
    avg_wait DESC;
