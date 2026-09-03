# ⚡ Quick Commerce Operations & Fulfillment Intelligence Dashboard

An end-to-end operational analytics dashboard built in Power BI to monitor real-time order fulfillment, delivery SLA compliance, dark store inventory health, and customer return drivers across 25,000+ orders.

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

## 🎯 Business Problem & Objectives
Quick Commerce models rely on ultra-fast fulfillment cycles (10–15 minutes). Minor inefficiencies in order picking, packing, or rider dispatch directly impact SLA adherence, trigger customer complaints, and create financial leakage through refunds. 

This project delivers full operational visibility across 4 key functional pillars:
1. **Macro Financial & Fulfillment Health:** Monitoring Daily Orders, Net Revenue, AOV, Gross Margin %, and overall SLA adherence.
2. **Dispatch & Transit Bottlenecks:** Isolating latency across picking, packing, assignment, and delivery times, cross-referenced with distance bands.
3. **Inventory & Dark Store Capacity:** Identifying stockout risks, fulfillment rate by warehouse, and shift-level operational load.
4. **Post-Delivery Quality & Unit Economics:** Pinpointing root causes for returns, complaint categories, and refund leakage across dark stores.

---

## 📊 Dashboard Architecture

| Page # | Page Name | Core Focus & KPIs | Key Visuals |
| :--- | :--- | :--- | :--- |
| **1** | **Executive Overview** | Total Orders, Net Revenue, AOV, Gross Margin %, Fulfilment vs SLA % | Dual-axis Daily Volume vs SLA, 100% Stacked City Outcome Mix, Store Performance Matrix |
| **2** | **Delivery & SLA** | On-Time Rate %, SLA Breach %, Avg Delivery / Pick / Pack / Travel Mins | Stage-wise Duration Funnel, Distance Band Breach Impact, Hourly Adherence Heatmap |
| **3** | **Inventory Operations** | Ordered vs Fulfilled Items, Stockout Units, Item Fulfilment Rate % | Inventory Risk Level Donut, Dark Store Stockout Bars, Shift Performance Matrix |
| **4** | **Customer Experience** | Total Complaints, Total Refund Amount, Complaint Rate %, Return Rate % | Complaint Issue Categories Bar, City Refund Impact vs Rate, Store Quality Matrix |

---

## 🛠️ Data Model & Tech Stack
- **BI Tool:** Microsoft Power BI Desktop
- **Data Model:** Relational Star Schema connecting:
  - Fact Tables: `Orders`, `order_items`, `returns_complaints`, `inventory_weekly`, `store_shift_operations`
  - Dimension Tables: `stores`, `products`, `customers`, `delivery_partners`, `Dim_Date`, `Dim_Shift`
- **DAX Calculations:** 24 custom measures utilizing dynamic time intelligence, weighted ratios, and multi-condition filtering.

---

## 📁 Repository Structure
```text
├── data/
│   ├── Orders.csv
│   ├── customers.csv
│   ├── delivery_partners.csv
│   ├── inventory_weekly.csv
│   ├── order_items.csv
│   ├── products.csv
│   ├── returns_complaints.csv
│   ├── store_shift_operations.csv
│   └── stores.csv
├── images/
│   ├── page1_executive_overview.png
│   ├── page2_delivery_sla.png
│   ├── page3_inventory_operations.png
│   └── page4_customer_experience.png
├── Quick_Commerce_Operations.pbix
└── README.md
