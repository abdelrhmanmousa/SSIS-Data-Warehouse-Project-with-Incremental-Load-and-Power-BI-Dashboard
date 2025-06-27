# 🚀 SSIS Data Warehouse Project with Incremental Load and Power BI Dashboard

## 📅 Description

This project demonstrates a complete end-to-end ETL pipeline using SQL Server Integration Services (SSIS) to extract, transform, and load data from an OLTP database into a star schema data warehouse. An incremental load mechanism is implemented to track changes efficiently, and a Power BI dashboard is used for business reporting.

---

## 📚 Tech Stack

* **SSIS** for ETL pipeline
* **SQL Server** (OLTP + OLAP)
* **Power BI** for reporting and KPIs
* **Git & GitHub** for version control
* Optional: Python for data preprocessing (cleaning if needed)

---

## 🛋️ Project Architecture

1. **Source**: Normalized OLTP (Northwind-like)
2. **SSIS ETL Process**:

   * Full and Incremental Loads
   * Lookup transformations for foreign keys
   * Conditional Split and Update strategies for address dimensions
3. **Star Schema Design**:

   * FactOrders
   * DimCustomer, DimProduct, DimDate, DimShippers, DimSupplier, DimEmployee, DimAddress
     ## Diagram Preview
     ![image](https://github.com/user-attachments/assets/c7ba9f25-257b-4f42-8aa4-abc4c7d41d63)

4. **Power BI Dashboard**:

   * KPIs: Total Orders, Return Rate (%), Avg Freight
   * Top Customers by Total Spend
   * Shipments by Country
   * Return Trends Over Time

---

## 📂 Folder Structure

```
SSIS-Incremental-ETL-Project/
├── SSIS_Package/
│   └── Final_ETL_Package.dtsx
├── SQL/
│   ├── Create_DWH_Tables.sql
│   ├── Incremental_Load_Tracking.sql
│   └── Source_Queries.sql
├── PowerBI/
│   └── Final_Dashboard.pbix
├── Documentation/
│   └── PowerBI_Screenshots/
│       └── Dashboard_Overview.png
└── README.md
```

---

## 🚀 How to Run the Project

1. Restore source OLTP and DW databases from backup or scripts.
2. Open the `Final_ETL_Package.dtsx` in Visual Studio (SQL Server Data Tools).
3. Set up your database connections.
4. Run the package:

   * Step 1: Get `LastOrderID`
   * Step 2: Run Fact and Address data flows
   * Step 3: Update `Last_Load_Tracking`
5. Open the Power BI dashboard and refresh the dataset.

---

## 📊 Measures Created in Power BI

* `Total Orders` = COUNTROWS(FactOrders)
* `Return Rate (%)` = DIVIDE(COUNT(Returns), COUNT(FactOrders))
* `Avg Freight` = AVERAGE(FactOrders\[freight])
* `Top Customer by Spend` = RANKX over Total Amount
* `KPI: Total Returned Orders`

---

## 📈 Dashboard Features

* **Overview Section**: Total Orders, Average Freight, Return Rate
* **Charts**:

  * Bar chart: Top 5 Customers
  * Line chart: Orders Trend over Time
  * Map: Orders by Country
  * Pie chart: Shipment Method Breakdown

---
## 📊 Dashboard Preview

![Dashboard Screenshot]('![Northwind dashboard](https://github.com/user-attachments/assets/1eed256d-f03e-42e7-8540-27f3552c2250)
')

---

## 💼 Author

**Abdelrahman Mousa**
*Aspiring Data Engineer | Big Data | SQL | Python | SSIS | Power BI*
[LinkedIn](https://www.linkedin.com/in/abdulrahman-mousa-2283211ba?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3B%2F3G1I06IT9mXEfyJntSfOA%3D%3D/) | [GitHub](https://github.com/abdelrhmanmousa/)

---

## 📄 License

This project is for educational purposes. Feel free to fork and build on top of it.
