# Patient Health Risk Insights from EMR Data

🏥 An end-to-end pipeline to analyze EMR data and predict hospital readmission risk using DBT, R, PostgreSQL, and Looker Studio.

![image](https://github.com/user-attachments/assets/0cc459c7-57ad-4d39-92bf-086f5cafdfea)

## 🛠️ Tools Used
- **PostgreSQL**: EMR dataset warehouse
- **DBT**: Data modeling and transformation
- **R**: Logistic regression & analysis
- **Looker Studio**: Interactive dashboard

## 💡 Key Highlights
- Built DBT models to normalize patient/admission tables
- Trained logistic regression model to identify readmission risk factors
- Looker Studio dashboard with age/gender filters and pie charts

## 📊 Visuals
- Looker Studio:
![image](https://github.com/user-attachments/assets/7032a32e-7739-4526-b462-db9a52308a88)

## 📁 Repository Contents
- `dbt_project/`: DBT models and config for data transformation
- `r_scripts/readmission_analysis.R`: R code for modeling and EDA
- `exports/readmission_cleaned.csv`: Cleaned dataset for visualization
- `dashboard/`: Dashboard assets

## 🧠 Insights
- Age, number of diagnoses, and chronic conditions significantly influenced readmission risk
- Strategic dashboard helps in identifying high-risk patients early for better care delivery
