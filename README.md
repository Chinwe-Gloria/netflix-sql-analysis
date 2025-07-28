## Netflix Dataset SQL Analysis 

This is a mini-project as part of my #30DaysOfSQL learning challenge. Over two days (Day 13 and 14), I performed a complete SQL-based data wrangling and analysis on the Netflix dataset using Microsoft SQL Server.

### Objective
To explore trends and patterns in Netflix content using only SQL – no Python, no Excel, just SQL Server!

### Tools Used
- Microsoft SQL Server Management Studio (SSMS)
- SQL
- Dataset from Kaggle

### Dataset
Original source: [Netflix Titles on Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows)
The dataset contains information about movies and TV shows available on Netflix as of 2021.

### What I Did
- Cleaned and handled duplicated records
- Handled missing values (`director`, `country`)
- Extracted year from `date_added`
- Top 10 countries by content volume
- Movie vs TV Show distribution
- Distribution of content by month added
- Top genres (via `listed_in`)
- Most frequent directors
- Year-wise release trends

### SQL Scripts

All scripts used in this project are available in the `sql_queries' folder.

### Sample Insights

- Most content is added to Netflix in **July and October**
- **United States**, **India**, and **UK** dominate the content library
- Most popular genres: **Dramas**, **Comedies**, and **Documentaries**

### Learnings

- SQL is powerful enough for exploratory data analysis
- Data wrangling with text columns in SQL can be tricky but rewarding
- `ROW_NUMBER()`, `TRY_CAST()`, `DATEPART()` and aggregation functions were key to this project

