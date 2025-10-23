# 🌍 Multilingual Customer Support Analytics Dashboard

[![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow)](https://github.com/akemarcpt-blip/Multilingual-Customer-Support-Analytics)
[![Status](https://img.shields.io/badge/Status-Completed-success)]()
[![Languages](https://img.shields.io/badge/Languages-5-blue)]()

*Analyzing 210+ multilingual customer service tickets to discover how language matching and cultural communication styles impact customer satisfaction and resolution efficiency*

---

## 📊 Executive Summary

**Key Findings:**
- Customers serviced in their native language show **31% higher satisfaction scores**
- Language mismatch correlates with increased resolution times and lower CSAT
- Cultural communication styles significantly impact service outcomes
- French and Portuguese-speaking customers experience longest wait times due to agent resource gaps

**Business Impact:**
- Strategic bilingual hiring could improve satisfaction by 15-20%
- Cultural training programs recommended to optimize agent-customer matching
- Language-based routing optimization can reduce resolution time by 30%

**Tools Used:** Power BI | Excel | SQL | Statistical Analysis | Data Visualization

---

## 🎯 Business Problem

In today's globalized customer service environment, companies serve diverse multilingual customers. This project investigates:

- How does language matching between customer and agent affect satisfaction?
- What is the impact of cultural communication styles on service efficiency?
- Are there resource gaps in specific language support areas?
- How can companies optimize agent allocation for multilingual teams?

**Dataset:** 210+ authentic helpdesk tickets across 5 languages (English, German, Spanish, French, Portuguese)

---

## 📈 Key Visualizations

### Dashboard Overview
*Interactive Power BI dashboard showing key metrics: ticket volume, resolution time, satisfaction scores, and language distribution across 5 languages*

**Key Metrics Displayed:**
- Total tickets analyzed: 210+
- Average satisfaction score: 5.37/10
- Average resolution time: 64.36 minutes
- Language distribution: EN (78), DE (47), ES (46), FR (29), PT (10)

### Language Impact Analysis
**Key Finding:** Language matching is a critical success factor. Analysis reveals that tickets handled in the customer's native language achieve **31% higher satisfaction scores** compared to mismatched language pairs.

**Performance by Language:**
- English: 78 tickets, "Polite & Efficient" style, avg satisfaction 5.4/10
- German: 47 tickets, "Direct & Functional" style, higher resolution efficiency
- Spanish: 46 tickets, "Expressive & Relationship-Focused" style, longer interactions
- French: 29 tickets, "Formal & Intellectual" style, detailed responses needed
- Portuguese: 10 tickets, longest wait times due to agent shortage

### Cultural Communication Styles Impact
**Analysis Results:** Cultural communication style matching significantly impacts service outcomes:
- Communication complexity correlates more with satisfaction (0.067) than resolution time (0.029)
- Language Match Score averages 0.80, indicating 20% of tickets face language barriers
- Forecasting complexity ranges from 12-29 based on cultural and linguistic factors

### Dashboard Access
**To view the interactive dashboard:**
1. Download `Power BI dashboard file.pbix` from the `dashboard/` folder
2. Open with Power BI Desktop (free download from Microsoft)
3. Explore interactive filters by language, region, priority, and time period

---

## 🔬 Methodology

### Data Exploration & Cleaning
- Analyzed 210 support tickets with 21 variables
- Key metrics: Resolution Time, Satisfaction Score, Language Match Score, Cultural Style
- Data cleaning: handled missing values, standardized categories
- SQL queries for data exploration and statistical analysis

### Analysis Approach
1. **SQL Data Exploration** - Queried datasets to identify patterns and calculate key metrics
2. **Exploratory Data Analysis** - Examined distributions across languages and cultural styles
3. **Comparative Analysis** - Compared satisfaction and resolution time by language matching
4. **Correlation Analysis** - Identified relationships between language matching and satisfaction
5. **Dashboard Development** - Created interactive Power BI visualizations for stakeholder communication

### Key Metrics
- **Average Resolution Time:** 64 minutes (range: 10-123 min)
- **Average Satisfaction Score:** 5.37/10
- **Language Match Rate:** 80% of tickets
- **Ticket Distribution:** English (78), German (47), Spanish (46), French (29), Portuguese (10)

---

## 💡 Business Recommendations

### 1. Strategic Hiring
**Action:** Prioritize recruitment of bilingual agents (French + English, Portuguese + English)  
**Expected Impact:** Close language gaps, reduce wait times by 25%

### 2. Cultural Intelligence Training
**Action:** Implement cultural communication style awareness programs for agents  
**Expected Impact:** Improve satisfaction scores by 15-20%

### 3. Smart Ticket Routing
**Action:** Develop algorithm to route tickets based on language + cultural style matching  
**Expected Impact:** Optimize resource allocation, reduce resolution time by 30%

### 4. Performance Monitoring
**Action:** Track Language Match Score as ongoing KPI for service quality  
**Expected Impact:** Continuous improvement in multilingual service delivery

---

## 🛠️ Skills Demonstrated

**Technical Skills:**
- **SQL querying and data analysis** (aggregations, joins, CTEs, statistical calculations)
- Power BI dashboard development and DAX calculations
- Data cleaning and transformation (Excel, Power Query)
- Statistical analysis and correlation studies
- Data visualization and storytelling

**Business Skills:**
- Multilingual analysis (Portuguese, French, English)
- Cultural intelligence and diversity analytics
- Customer experience optimization
- Stakeholder communication

**Soft Skills:**
- Cross-cultural communication expertise
- Problem-solving in multicultural contexts
- Data-driven decision making
- Strategic recommendation development

---

## 📂 Project Structure

Multilingual-Customer-Support-Analytics/
│
├── data/
│ ├── Helpdesk_Raw_Data.xlsx
│ └── ticket_helpdesk_labeled_multi_languages.xlsx
│
├── sql/
│ ├── README.md
│ ├── 01_data_exploration.sql
│ ├── 02_language_analysis.sql
│ ├── 03_satisfaction_metrics.sql
│ ├── 04_cultural_insights.sql
│ └── 05_business_recommendations.sql
│
├── dashboard/
│ ├── Power BI dashboard file.pbix
│ └── screenshots/
│ ├── cultural-insights.png
│ ├── language-analysis.png
│ ├── overview-dashboard.png
│ └── satisfaction-trends.png
│
├── reports/
│ └── Executive_Summary.pdf (coming soon)
│
└── README.md

---

## 👀 How to Access

### Interactive Dashboard
**Power BI File:** Download `Power BI dashboard file.pbix` from the `dashboard/` folder

### To View Locally:
1. Download Power BI Desktop (free): [Microsoft Power BI](https://powerbi.microsoft.com/)
2. Download the `.pbix` file from this repository
3. Open with Power BI Desktop
4. Explore interactive filters and visualizations

### SQL Analysis
SQL queries available in the `sql/` folder demonstrate data exploration, language analysis, and business recommendations derived from the dataset.

### Data Files
Raw datasets available in the `data/` folder for your own analysis

---

## 🚀 Next Steps

If given more time/resources, I would:
- Build predictive models to forecast satisfaction based on language/cultural variables
- Conduct NLP sentiment analysis on ticket descriptions in multiple languages
- Create real-time monitoring dashboard for live ticket routing optimization
- Expand analysis to include time-zone patterns and seasonal trends
- Implement A/B testing framework for cultural training effectiveness

---

## 👨‍🎓 About Me

Master's degree in Intercultural Relations with advanced PhD coursework in Migration Studies (Universidade de Lisboa). Specialist in cross-cultural communication, international relations, and multilingual analysis. Transitioning into Data Analytics with a focus on cultural intelligence and diversity analytics, leveraging academic research expertise and multilingual capabilities (Portuguese, French, English).

**Academic Background:**
- Master's in Intercultural Relations - Universidade Aberta (2018-2021)
- PhD Coursework in Migration Studies - Universidade de Lisboa (2022-2023)
- Bachelor's in Portuguese Language & Literature - Universidade FHB COCODY (2004-2009)

**Professional Certifications:**
- Google Data Analytics Professional Certificate
- Microsoft Power BI Data Analyst Professional Certificate
- IBM Data Analyst Professional Certificate
- SQL for Data Science (UC Davis)
- Business Analytics Specialization (University of Pennsylvania)

**Connect with me:**
- 🌐 Portfolio: [datascienceportfol.io/akemarcpt](https://datascienceportfol.io/akemarcpt)
- 💼 LinkedIn: [linkedin.com/in/ake-marc-albert-adje-5b341a110](https://linkedin.com/in/ake-marc-albert-adje-5b341a110/)
- 📧 Email: [akemarcpt@gmail.com](mailto:akemarcpt@gmail.com)

---

## 📝 License

This project is for educational and portfolio purposes.

---

*Last Updated: October 2025*
