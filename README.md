## Product Export Analysis

Analysis of **New Zealand Aquaculture Export Data (FY23–FY25)** to identify market opportunities, product performance, and optimal pricing strategies.

---

## Project Overview

This project analyses seafood export data across multiple years to identify trends in **export volume, value, pricing, and country-level demand**.

The goal of this project is to answer three key business questions:

* **Right Market:** Which countries generate the highest export revenue?
* **Right Product:** Which species and products perform best?
* **Right Price:** Which markets pay the highest price per kg?

---

## Tech Stack / Tools

* **SQL Server** – Data cleaning, transformation, and modeling
* **Power BI** – Data visualization and dashboard creation
* **CSV Data Sources** – Raw export datasets
* **GitHub** – Version control and project documentation

---

## Project Flow

```
Raw CSV Files
      ↓
SQL Data Cleaning & Transformation
      ↓
Dimensional Data Model (Star Schema)
      ↓
Power BI Dashboard
```

---

## Methodology

1. Import CSV datasets
2. Create ETL SQL scripts for transformation
3. Combine data and calculate price per kg
4. Build Power BI dashboards for business insights

---

## Data

The dataset contains the following fields:

* **Species**
* **Product**
* **Country**
* **Volume (kg)**
* **Value (NZD)**

---

## Data Processing (SQL)

The SQL scripts perform the following steps:

### 1. Combine Multiple Yearly Datasets

Export datasets from **FY2023 – FY2025** are merged into a single staging table.

Key transformations:

* Combined all datasets using `UNION ALL`
* Added `Year` column
* Standardized numeric fields

Table created:

```
stg_exports
```

---

### 2. Data Quality Checks

The script checks for **NULL values** in:

* Species
* Product
* Country

These checks ensure the dataset used for analysis is clean and reliable.

---

### 3. Dimension Tables

To support analytics and reporting, dimension tables are created:

* `dim_country`
* `dim_product`

---

### 4. Fact Table

The **fact_exports** table stores measurable export metrics.

Price per kg is calculated using:

```
Price_per_kg = Value / Volume
```

---

## Power BI Dashboard

The Power BI dashboard provides insights such as:

* Export volume trends by year
* Export value by country
* Product and species level performance
* Price per kg comparison
* Country-level export distribution

### Key Dashboard Features

* Interactive filters
* Drill-down by product/species
* Country comparison visuals
* Time trend analysis

---

## How to Use

1. Open the Power BI file located in the **powerbi** folder.
2. Refresh the dataset if needed.
3. Use filters such as **Country** and **Year** to explore trends and insights.

---

## Key Findings & Insights

### 1. Right Market – Best Export Destinations

* The **United States** is the largest export market, contributing the highest share of total export revenue.
* **China and Australia** are also major markets with strong demand for seafood products.
* Smaller markets such as **French Polynesia and Switzerland** demonstrate **higher price per kilogram**, indicating premium market opportunities.

---

### 2. Right Product – Most Valuable Products

* **Salmon dominates export value**, making it the most commercially significant species.
* Among product formats, **Frozen Half Shell products generate the highest revenue**, indicating strong international demand for processed seafood products.

---

### 3. Right Price – Pricing Strategy Insights

* The **average export price across all markets is approximately $15.14 per kg**.
* Premium pricing opportunities exist in **high-price, low-volume markets** where seafood products command higher value.
* High-volume markets such as the **United States and China** provide strong scale but often at **moderate price levels**, suggesting a balance between volume-driven and premium strategies.

---

## Strategic Implications

* Focus on **high-volume markets (USA, China)** to sustain revenue growth.
* Expand presence in **premium-price markets** to improve profitability.
* Continue prioritising **mussel-based products and frozen processed formats**, which generate the majority of export revenue.
