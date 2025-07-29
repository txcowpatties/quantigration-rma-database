# Quantigration RMA Database (MySQL)

This project contains a MySQL database simulating a Return Merchandise Authorization (RMA) system. It includes core entities such as customers, orders, and RMA requests.

## 📁 Project Structure

- `schema/` – SQL scripts for table structure and views
- `queries.sql` – Sample queries for retrieving and analyzing data

## 📦 Tables Included

- `customers`: Customer contact and account data
- `orders`: Orders placed by customers
- `rma`: Product return records
- `collaborator`: View or routine related to internal collaboration

- ## 🗺️ Entity Relationship Diagram (ERD)

This diagram illustrates the relationships between customers, orders, and RMA records.

![ERD](diagrams/ERD.png)

## 🚀 Getting Started

To explore or test the database:

1. Open MySQL Workbench or your preferred SQL client.
2. Import each `.sql` file from the `schema/` folder.
3. Use `queries.sql` to run sample SELECTs and JOINs.

## 🧰 Tools Used

- MySQL 8.0
- MySQL Workbench

## 📄 License

This project is open-source and available for use in academic, demo, or training purposes.
