-- Quick-Commerce Operations Analytics
-- SQL Server starter schema
-- IMPORTANT: This dataset is fully synthetic and is not official Flipkart data.

CREATE DATABASE QuickCommerceOperations;
GO
USE QuickCommerceOperations;
GO

CREATE TABLE Stores (
    store_id VARCHAR(10) PRIMARY KEY,
    store_name VARCHAR(150), city VARCHAR(50), zone VARCHAR(80), pincode VARCHAR(10),
    launch_date DATE, store_format VARCHAR(30), sampled_capacity_orders_per_shift INT,
    service_radius_km DECIMAL(6,2), operating_start VARCHAR(5), operating_end VARCHAR(5),
    manager_id VARCHAR(20), active_flag CHAR(1), latitude DECIMAL(10,6), longitude DECIMAL(10,6)
);

CREATE TABLE Products (
    product_id VARCHAR(12) PRIMARY KEY,
    product_name VARCHAR(180), category VARCHAR(80), subcategory VARCHAR(80), brand VARCHAR(80),
    unit_size VARCHAR(30), mrp DECIMAL(12,2), cost_price DECIMAL(12,2),
    perishable_flag CHAR(1), temperature_zone VARCHAR(30), shelf_life_days INT,
    supplier_id VARCHAR(12), active_flag CHAR(1)
);

CREATE TABLE Customers (
    customer_id VARCHAR(15) PRIMARY KEY,
    customer_name VARCHAR(120), city VARCHAR(50), signup_date DATE, membership_flag CHAR(1),
    acquisition_channel VARCHAR(50), preferred_payment_method VARCHAR(50),
    customer_segment VARCHAR(30), lifetime_orders INT, last_order_date DATE, total_spend DECIMAL(14,2)
);

CREATE TABLE Delivery_Partners (
    rider_id VARCHAR(12) PRIMARY KEY,
    rider_name VARCHAR(120), city VARCHAR(50), hub_store_id VARCHAR(10), onboarding_date DATE,
    vehicle_type VARCHAR(30), primary_shift VARCHAR(20), active_flag CHAR(1),
    rider_rating DECIMAL(4,2), experience_months INT,
    FOREIGN KEY (hub_store_id) REFERENCES Stores(store_id)
);

CREATE TABLE Orders (
    order_id VARCHAR(15) PRIMARY KEY,
    order_date DATE, order_timestamp DATETIME2, order_hour INT, day_of_week VARCHAR(15),
    weekend_flag CHAR(1), shift VARCHAR(20), customer_id VARCHAR(15), store_id VARCHAR(10),
    rider_id VARCHAR(12) NULL, city VARCHAR(50), channel VARCHAR(30), payment_method VARCHAR(50),
    campaign VARCHAR(50), weather_condition VARCHAR(30), peak_hour_flag CHAR(1), order_status VARCHAR(30),
    items_ordered INT, items_fulfilled INT, stockout_line_items INT,
    subtotal_before_discount DECIMAL(14,2), item_discount_amount DECIMAL(14,2),
    order_discount_amount DECIMAL(14,2), delivery_fee DECIMAL(12,2), tax_amount DECIMAL(12,2),
    gross_order_value DECIMAL(14,2), refund_amount DECIMAL(14,2), net_revenue DECIMAL(14,2),
    gross_margin DECIMAL(14,2), distance_km DECIMAL(8,2), promised_delivery_minutes INT,
    picking_start_timestamp DATETIME2 NULL, picking_end_timestamp DATETIME2 NULL,
    packing_end_timestamp DATETIME2 NULL, rider_assigned_timestamp DATETIME2 NULL,
    dispatch_timestamp DATETIME2 NULL, delivered_timestamp DATETIME2 NULL,
    cancelled_timestamp DATETIME2 NULL, picking_minutes DECIMAL(8,2) NULL,
    packing_minutes DECIMAL(8,2) NULL, rider_assignment_minutes DECIMAL(8,2) NULL,
    travel_minutes DECIMAL(8,2) NULL, actual_delivery_minutes DECIMAL(8,2) NULL,
    sla_status VARCHAR(30), cancellation_stage VARCHAR(40) NULL,
    cancellation_reason VARCHAR(80) NULL, customer_rating DECIMAL(3,1) NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (store_id) REFERENCES Stores(store_id),
    FOREIGN KEY (rider_id) REFERENCES Delivery_Partners(rider_id)
);

CREATE TABLE Order_Items (
    order_item_id VARCHAR(25) PRIMARY KEY,
    order_id VARCHAR(15), product_id VARCHAR(12), quantity_ordered INT, quantity_fulfilled INT,
    unit_mrp DECIMAL(12,2), unit_selling_price DECIMAL(12,2), line_discount_amount DECIMAL(12,2),
    item_revenue DECIMAL(14,2), item_cost DECIMAL(14,2), gross_margin DECIMAL(14,2),
    stock_available_at_order INT, substitution_flag CHAR(1),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Load order: Stores, Products, Customers, Delivery_Partners, Orders, Order_Items,
-- Inventory_Weekly, Returns_Complaints, Store_Shift_Operations.
-- SQL Server Import Wizard can be used to import each CSV after table creation.
