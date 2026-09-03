# ⚡ Quick Commerce Operations & Fulfillment Intelligence Dashboard

An end-to-end data analytics project monitoring real-time order fulfillment, dark store stockout risks, delivery SLA compliance, and customer return drivers across 25,000+ orders. 

This repository documents the full lifecycle of an enterprise analytics product: **Relational Database Design (SQL Server)** $\rightarrow$ **Data Profiling & Auditing (EDA)** $\rightarrow$ **Executive Reporting (Power BI)**.

---

## 📸 Dashboard Previews

### Page 1: Executive Overview
![Executive Overview](images/page1_executive_overview.png)

### Page 2: Fulfillment Efficiency & Delivery SLA Performance
![Delivery & SLA Performance](images/page2_delivery_sla.png)

### Page 3: Dark Store Fulfillment & Inventory Health
![Inventory Operations](images/page3_inventory_operations.png)

### Page 4: Customer Experience, Returns & Quality Overview
![Customer Experience](images/page4_customer_experience.png)

---

## 🎯 Business Context & Operational Problems

Quick Commerce relies on ultra-compressed fulfillment cycles (10–15 minutes). Latency across warehouse staging or transit cascades into breached SLAs, stockouts, customer dissatisfaction, and refund-driven financial leakage.

This project delivers operational intelligence across four critical pillars:
1. **Executive Operations:** Macro monitoring of order volume, Net Revenue, Gross Margin %, and SLA adherence across geographies.
2. **Delivery & SLA:** Isolating operational bottlenecks across picking, packing, rider assignment, and transit durations cross-referenced against distance bands.
3. **Inventory & Dark Store Health:** Real-time visibility into stockout units, warehouse fulfillment rates, and shift capacity utilization.
4. **Customer Experience:** Root cause analysis for customer complaints, refund leakage, and dark store quality risk matrices.

---

## 📊 Dashboard Modules & Key Performance Indicators (KPIs)

| Page # | Focus Area | Primary KPIs | Key Visuals & Analysis |
| :--- | :--- | :--- | :--- |
| **1** | **Executive Overview** | Total Orders, Net Revenue, AOV, Gross Margin %, Fulfillment vs. SLA % | Daily Order Volume vs. SLA dual-axis trend, City-level outcome mix (100% stacked), Store scorecard matrix |
| **2** | **Delivery & SLA** | On-Time Rate %, SLA Breach %, Avg Delivery / Pick / Pack / Assignment Mins | Stage-wise duration breakdown, SLA breach rate by distance bands, Hourly SLA adherence heatmap |
| **3** | **Inventory Operations** | Ordered vs. Fulfilled Items, Stockout Units, Item Fulfillment Rate % | Stockout risk level donut chart, Store-level stockout unit ranking, Shift utilization capacity matrix |
| **4** | **Customer Experience** | Total Complaints, Total Refund Amount, Complaint Rate %, Return Rate % | Complaint category breakdown, City refund impact vs. complaint rate scatter, Store quality risk matrix |

---

## 🛠️ End-to-End Analytics Workflow

### 1. Database Architecture & Schema Design (SQL Server)
- **Script:** [`Quick_Commerce_SQL_Server_Schema.sql`](Quick_Commerce_SQL_Server_Schema.sql)
- Normalized relational database schema with Primary Key (PK) and Foreign Key (FK) constraints.
- Integrated fact tables (`Orders`, `order_items`, `returns_complaints`, `inventory_weekly`, `store_shift_operations`) and dimension tables (`stores`, `products`, `customers`, `delivery_partners`).

### 2. Exploratory Data Analysis (EDA)
- **File:** [`Quick_Commerce_Beginner_EDA`](Quick_Commerce_Beginner_EDA)
- Audited 25,000+ transactional records for data integrity, missing values, and anomalies.
- Identified correlation between dark store packing latency and transit distance breach thresholds.

### 3. Business Intelligence & Modeling (Power BI)
- **File:** [`Quick_Commerce_Operations.pbix`](Quick_Commerce_Operations.pbix)
- Modeled a Star Schema with bidirectional filter control where necessary.
- Formatted clean Indian Rupee (₹) / currency standards across metrics.
- Developed 24 custom DAX measures utilizing time intelligence, multi-condition filters, and dynamic ratio logic.

---

## 📁 Repository Structure

```text
├── data/                                 # Raw source CSV datasets (9 tables)
│   ├── Orders.csv
│   ├── customers.csv
│   ├── delivery_partners.csv
│   ├── inventory_weekly.csv
│   ├── order_items.csv
│   ├── products.csv
│   ├── returns_complaints.csv
│   ├── store_shift_operations.csv
│   └── stores.csv
├── images/                               # High-resolution dashboard screenshots
│   ├── page1_executive_overview.png
│   ├── page2_delivery_sla.png
│   ├── page3_inventory_operations.png
│   └── page4_customer_experience.png
├── Quick_Commerce_Beginner_EDA           # Exploratory data analysis file
├── Quick_Commerce_SQL_Server_Schema.sql  # Database schema & DDL scripts
├── Quick_Commerce_Operations.pbix        # Interactive Power BI report file
└── README.md                             # Project documentation
