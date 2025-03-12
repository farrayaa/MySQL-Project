# 🛒 Sales Database System

📌 **Overview**  
This is a **Sales Database System** that manages products, customers, suppliers, staff, and transactions. It includes stored procedures and triggers for efficient data handling.

## 🚀 Features  
- Retrieve product, customer, supplier, and staff information  
- Update stock automatically after new stock entry  
- Generate sales receipts  
- Manage transactions with suppliers  

## 🗃️ Database Structure  
- `Tabel_Barang` → Stores product data  
- `Tabel_Pelanggan` → Stores customer details  
- `Tabel_Member` → Manages membership & discounts  
- `Tabel_Pemasok` → Stores supplier data  
- `Tabel_Petugas` → Stores staff details  
- `Tabel_Penjualan` → Records sales transactions  
- `Tabel_Barang_Masuk` → Manages stock entries  

## ⚙️ Setup  
1. Import the SQL script into your MySQL database  
2. Run stored procedures using `CALL ProcedureName(parameters)`  

## 📌 Usage  
- **Get product info:** `CALL GetBarangInfo('T01SHP');`  
- **Get customer details:** `CALL GetPelangganInfo('GW01');`  
- **View supplier transactions:** `CALL GetTransPemasok('2023-11-20');`  
- **Generate sales receipt:** `CALL GetStrukPenjualan('010-231-512');`  

📌 *Feel free to customize and expand the system as needed!* 🚀  
