# 🚖 OLA Data Analyst Project Power BI & SQL

The OLA Data Analyst Project analyzes ride-booking data using SQL and Power BI to track ride volumes, customer behavior, and driver performance. It focuses on booking statuses, revenue breakdowns by payment method, and top customers. SQL queries are used to calculate ride statistics, and the final Power BI dashboard visualizes key data, including ride volumes, vehicle performance, and sales. The analysis helps optimize OLA's services by identifying trends and areas for improvement.

## 🎥 Demo

![Alt Text](https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/Ola%20DA%20Project%20DEMO.gif)

> [!NOTE]
> Click the dropdown list below for more information on SQL or Power BI.

---

<details>
<summary>SQL 📊</summary>

# 🚖 OLA Data Analyst Project SQL

## 📂 Introduction to the Database

This project involves analyzing ride bookings data for a ride-hailing service, "OLA." The database contains various tables (e.g., `bookings`, `customers`, and `drivers`) that store information about ride bookings, customer ratings, driver ratings, vehicle types, payment methods, and more.

The main objective of this project is to extract meaningful insights and statistics using SQL queries. This document showcases a set of queries to answer specific analytical questions about the business performance and customer behavior.

### 🛠️ How the Database Works

- **📊 Tables**: The database is primarily focused on the `bookings` table, which contains the following key columns:

  - `Booking_ID`: Unique identifier for each ride.
  - `Customer_ID`: ID of the customer who booked the ride.
  - `Vehicle_Type`: Type of vehicle used (e.g., Prime Sedan, Auto, etc.).
  - `Booking_Status`: Status of the ride (e.g., `Success`, `Cancelled by Customer`, etc.).
  - `Ride_Distance`: Distance covered in the ride (in kilometers).
  - `Payment_Method`: Mode of payment used for the ride (e.g., UPI, Card, Cash).
  - `Driver_Ratings`: Ratings provided by customers to the drivers (out of 5).
  - `Customer_Rating`: Ratings provided by drivers to the customers (out of 5).
  - `Booking_Value`: Monetary value of the completed ride.
  - `Incomplete_Rides`: A flag to indicate whether the ride was completed or not.
  - `Incomplete_Rides_Reason`: If the ride was incomplete, this column stores the reason.

- **🔍 Views**: This document includes SQL `CREATE VIEW` statements to predefine specific datasets and make querying simpler for repetitive tasks.

- **📈 Key Insights**: Using SQL, we retrieve data that helps us answer questions such as:
  - The top-performing customers.
  - Average ratings and distances.
  - Trends in cancellations by drivers and customers.
  - The total revenue from successful rides.

---

## 🏗️ Database Setup

```sql
CREATE DATABASE Ola;
USE Ola;
```

## 📂 Importing Data into MySQL Workbench

To work with the database, we first need to import the data from the `bookings.csv` file into MySQL Workbench. Follow these steps:

1. **Open MySQL Workbench**:

   - Launch MySQL Workbench and connect to your database server.

2. **Select the Database**:

   - Use the `Ola` database by running:
     ```sql
     USE Ola;
     ```

3. **Go to the Import Section**:

   - Click on the "Server" menu and select "Data Import."

4. **Choose the CSV File**:

   - In the "Import" tab, choose the `bookings.csv` file as the source.
   - Ensure the "Import Data from File" option is selected.

5. **Map the Table**:

   - Select the destination table (`bookings`).
   - Map the CSV columns to the corresponding table columns.

6. **Run the Import**:

   - Click on "Start Import."

7. **Verify the Data**:
   - After importing, verify the data using:
     ```sql
     SELECT * FROM bookings LIMIT 10;
     ```

---

## 📜 SQL Queries & Answers

### 1️⃣ Retrieve all successful bookings:

**📝 Query:**

```sql
CREATE VIEW Successful_Bookings AS
SELECT *
FROM bookings
WHERE Booking_Status = 'Success';
```

**📊 Answer:**

```sql
SELECT * FROM Successful_Bookings;
```

![Description of the screenshot](https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/images/SQL%20images/Screenshot%202024-12-16%20062720.png)

---

### 2️⃣ Find the average ride distance for each vehicle type:

**📝 Query:**

```sql
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance
FROM bookings
GROUP BY Vehicle_Type;
```

**📊 Answer:**

```sql
SELECT * FROM ride_distance_for_each_vehicle;
```

![Description of the screenshot](https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/images/SQL%20images/Screenshot%202024-12-16%20063354.png)

---

### 3️⃣ Get the total number of cancelled rides by customers:

**📝 Query:**

```sql
CREATE VIEW cancelled_rides_by_customers AS
SELECT COUNT(*) AS total_cancelled_rides
FROM bookings
WHERE Booking_Status = 'cancelled by Customer';
```

**📊 Answer:**

```sql
SELECT * FROM cancelled_rides_by_customers;
```

![Description of the screenshot](https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/images/SQL%20images/Screenshot%202024-12-16%20063653.png)

---

### 4️⃣ List the top 5 customers who booked the highest number of rides:

**📝 Query:**

```sql
CREATE VIEW Top_5_Customers AS
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;
```

**📊 Answer:**

```sql
SELECT * FROM Top_5_Customers;
```

![Description of the screenshot](https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/images/SQL%20images/Screenshot%202024-12-16%20063859.png)

---

### 5️⃣ Get the number of rides cancelled by drivers due to personal and car-related issues:

**📝 Query:**

```sql
CREATE VIEW Rides_cancelled_by_Drivers_P_C_Issues AS
SELECT COUNT(*) AS cancelled_by_drivers
FROM bookings
WHERE cancelled_Rides_by_Driver = 'Personal & Car related issue';
```

**📊 Answer:**

```sql
SELECT * FROM Rides_cancelled_by_Drivers_P_C_Issues;
```

![Description of the screenshot](https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/images/SQL%20images/Screenshot%202024-12-16%20064122.png)

---

### 6️⃣ Find the maximum and minimum driver ratings for Prime Sedan bookings:

**📝 Query:**

```sql
CREATE VIEW Max_Min_Driver_Rating AS
SELECT MAX(Driver_Ratings) AS max_rating,
       MIN(Driver_Ratings) AS min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';
```

**📊 Answer:**

```sql
SELECT * FROM Max_Min_Driver_Rating;
```

![Description of the screenshot](https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/images/SQL%20images/Screenshot%202024-12-16%20064314.png)

---

### 7️⃣ Retrieve all rides where payment was made using UPI:

**📝 Query:**

```sql
CREATE VIEW UPI_Payment AS
SELECT *
FROM bookings
WHERE Payment_Method = 'UPI';
```

**📊 Answer:**

```sql
SELECT * FROM UPI_Payment;
```

![Description of the screenshot](https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/images/SQL%20images/Screenshot%202024-12-16%20064820.png)

---

### 8️⃣ Find the average customer rating per vehicle type:

**📝 Query:**

```sql
CREATE VIEW AVG_Cust_Rating AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;
```

**📊 Answer:**

```sql
SELECT * FROM AVG_Cust_Rating;
```

![Description of the screenshot](https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/images/SQL%20images/Screenshot%202024-12-16%20064923.png)

---

### 9️⃣ Calculate the total booking value of rides completed successfully:

**📝 Query:**

```sql
CREATE VIEW total_successful_ride_value AS
SELECT SUM(Booking_Value) AS total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';
```

**📊 Answer:**

```sql
SELECT * FROM total_successful_ride_value;
```

![Description of the screenshot](https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/images/SQL%20images/Screenshot%202024-12-16%20065052.png)

---

### 🔟 List all incomplete rides along with the reason:

**📝 Query:**

```sql
CREATE VIEW Incomplete_Rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';
```

**📊 Answer:**

```sql
SELECT * FROM Incomplete_Rides_Reason;
```

![Description of the screenshot](https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/images/SQL%20images/Screenshot%202024-12-16%20065216.png)

---

## 📥 Ola DA Project SQL.sql File

This project includes an `Ola DA Project SQL.sql` file containing all the SQL queries and view creation statements mentioned in this README. To use this file:

1. **Download the File**:

   - Ensure you have the `Ola DA Project SQL.sql` file in your local directory.

2. **Open in MySQL Workbench**:

   - Open MySQL Workbench and connect to your database server.
   - Go to the "File" menu and select "Open SQL Script."
   - Choose the `Ola DA Project SQL.sql` file.

3. **Run the Script**:

   - Click on the "Execute" button (lightning icon) to run the script.

4. **Verify the Views**:
   - Use queries such as `SELECT * FROM <view_name>` to verify that the views are created successfully.

This file simplifies setting up the project and ensures all queries and views are executed in a single step.

## File Details 📁

- **File Name**: `Ola DA Project SQL.sql` [Download File](https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/Ola%20DA%20Project%20SQL.sql)
- **Size**: `4 KB`

- **File Name**: `Bookings.csv` [Download File](https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/Bookings.csv)
- **Size**: `15.5 MB`

</details>

---

<details>
    <summary>Power BI 📈</summary>

# OLA Data Analysis in Power BI 📊

This Power BI project provides a comprehensive analysis of OLA's operational and customer data, focusing on ride volume, customer ratings, revenue, and performance metrics. The analysis leverages dynamic dashboards, interactive charts, and key performance indicators (KPIs) to identify trends and insights.

## ✨ Key Features

📌 **Ride Volume Analysis**: Tracks ride volume over time, helping to identify peak demand periods.

📌 **Booking Status Breakdown**: Visualizes the proportion of completed, canceled, and pending rides.

📌 **Top 5 Vehicle Types**: Highlights the most popular vehicle types based on ride distance.

📌 **Cancellation Insights**: Analyzes reasons for ride cancellations to improve customer experience.

📌 **Revenue Insights**: Breaks down revenue by payment methods to understand customer preferences.

📌 **Top Customers**: Identifies the top 5 customers based on their total booking value.

📌 **Driver Ratings**: Analyzes driver rating distribution to ensure service quality.

📌 **Customer vs. Driver Ratings**: Compares customer and driver ratings to identify gaps in satisfaction.

---

![App Screenshot](https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/images/Screenshot%202024-12-15%20195004.png)

---

## 🛠️ Tools Used:

**Power BI**: For creating dashboards, visualizations, and interactive reports.

**SQL**: For querying, aggregating, and preparing data for analysis.

**Excel/CSV**: For preprocessing and cleaning raw data.

## 🚀 Steps in Project

✔️ Requirement Gathering / Business Requirements

✔️ Data Extraction

✔️ Data Walkthrough

✔️ Data Cleaning

✔️ Data Modeling

✔️ DAX Calculations

✔️ Dashboard Layout Design

✔️ Chart Development and Formatting

✔️ Dashboard / Report Development

✔️ Insights Generation

✔️ Report Presentation

## 🧑‍💼 Business Requirement

To conduct a comprehensive analysis of OLA's ride data, focusing on key aspects such as ride volume, booking status, and vehicle types. The analysis will also include customer and driver ratings, reasons for canceled rides, and revenue by payment method. Additionally, it will identify the top customers by total booking value and examine the distribution of ride distances per day. The goal is to provide actionable insights that can help optimize OLA's services and improve overall performance.

## 📈 KPI’s Requirements

**1. Total Sales:** The overall revenue generated from all items sold.

**2. Average Sales:** The average revenue per sale.

**3. Number of Items:** The total count of different items sold.

**4. Average Rating:** The average customer rating from items sold.

## 📊 Chart’s Requirements

<ol>  
<h3><li> Overall 📅</li></h3>  
<ul>  
  <li>Ride Volume Over Time: Visualize ride volume trends over time.</li>  
  <li>Booking Status Breakdown: Display the distribution of completed, canceled, and pending bookings.</li>  
  <br>
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
    <img src="https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/images/Screenshot%202024-12-15%20195004.png"  />
</div>
</ul>

<h3><li> Vehicle Type 🚗:</li></h3>  
<ul>  
  <li>Top 5 Vehicle Types by Ride Distance: Show the top 5 vehicle types based on ride distance.</li>  
  <br>
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
    <img src="https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/images/Screenshot%202024-12-15%20201113.png"  />
</div>
</ul>

<h3><li> Revenue 💰:</li></h3>  
<ul>  
  <li>Revenue by Payment Method: Visualize total revenue generated by different payment methods.</li>  
  <li>Top 5 Customers by Total Booking Value: Identify the top 5 customers with the highest total booking value.</li>  
  <li>Ride Distance Distribution Per Day: Display the distribution of ride distances on a daily basis.</li> 
  <br>
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
    <img src="https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/images/Screenshot%202024-12-15%20201137.png"  />
</div> 
</ul>

<h3><li> Cancellation 🚫:</li></h3>  
<ul>  
  <li>Cancelled Rides Reasons (Customer): Show the reasons behind canceled rides by customers.</li>  
  <li>Cancelled Rides Reasons (Driver): Show the reasons behind canceled rides by drivers.</li>  
  <br>
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
    <img src="https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/images/Screenshot%202024-12-15%20201201.png"  />
</div>
</ul>

<h3><li> Ratings 🌟:</li></h3>  
<ul>  
  <li>Driver Ratings: Display the distribution of ratings given to drivers.</li>  
  <li>Customer Ratings: Display the distribution of ratings given by customers.</li>  
  <br>
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
    <img src="https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/images/Screenshot%202024-12-15%20201233.png"  />
</div>
</ul>
</ol>

## Dashboard Insights

### Key Insights 🔑:

1. **Ride Volume Trends 📉**: Identify peak times and demand fluctuations.
2. **Booking Status Insights 📋**: Understand the distribution of booking statuses.
3. **Vehicle Type Performance 🚗**: Discover the most effective vehicle types.
4. **Revenue Patterns 💸**: Track payment method usage and high-value customers.
5. **Cancellation Analysis 🔄**: Pinpoint reasons for ride cancellations.

### 🎛 Interactive Features:

- Drill-through options to explore details at multiple levels.
- Custom slicers for dynamic filtering.
- KPIs displayed in real-time visuals.

## How to Use 📋

1. Download the Power BI file: `Ola DA Project.pbix`
2. Open the file in **Power BI Desktop**.
3. Explore the dashboards and insights interactively.

## File Details 📁

- **File Name**: `Ola DA Project.pbix` [Download File](https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/Ola%20DA%20Project.pbix)
- **Size**: `3.96 MB`

- **File Name**: `Bookings.csv` [Download File](https://github.com/PrajwalGpy/OLA-Data-Analyst-Project-Power-BI-And-SQL/blob/main/Bookings.csv)
- **Size**: `15.5 MB`

</details>

---

## Contact 📧

For any queries or feedback, feel free to reach out:

- **Name**: Aditya Pratap Singh
- **Email**: adityapratapsingh2871@gmail.com

