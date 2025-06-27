CREATE TABLE DimCustomer (
    CustomerSK INT IDENTITY(1,1) PRIMARY KEY,
    customer_id_BK INT ,
    company_name VARCHAR (225) ,
	contact_name VARCHAR (225) ,
	contact_title VARCHAR (225) ,
	StartDate DATE ,
	EndDate DATE ,
	IsCurrent BIT
   
);

CREATE TABLE DimEmployee(
	EmployeeSK INT IDENTITY(1,1) PRIMARY KEY,
	employee_id_BK INT ,
	last_name VARCHAR(225) NOT NULL ,
	first_name VARCHAR(225) NOT NULL ,
	title VARCHAR(225),
	title_of_courtesy VARCHAR (225) ,
	birth_date DATE , 
	hire_date DATE ,
	reports_to  INT , 
	territory_id_BK INT ,
	territory_description VARCHAR(225) Not NULL,
	region_id_BK INT,
	region_description VARCHAR(225) NOT NULL,
	StartDate DATE ,
	EndDate DATE ,
	IsCurrent BIT
	
);

CREATE TABLE DimShippers(
	ShipperSK INT IDENTITY(1,1) PRIMARY KEY ,
	shipper_id_BK INT , 
	company_name VARCHAR(40) NOT NULL 

);

CREATE TABLE DimSupplier(
	SupplierSK INT IDENTITY(1,1) PRIMARY KEY,
	supplier_id_BK INT,
	company_name VARCHAR(30) NOT NULL,
	contact_title VARCHAR(30)  NULL 
);

CREATE TABLE DimProduct(
	ProductSK INT IDENTITY(1,1) PRIMARY KEY,
	product_id_BK INT ,
	product_name VARCHAR(225) NOT NULL ,
	category_id_Bk INT ,
	category_name VARCHAR(225) NOT NULL ,
	description VARCHAR(max) ,
	unit_price REAL ,
	StartDate DATE ,
	EndDate DATE ,
	IsCurrent BIT
);
CREATE TABLE DimAddress(
	AddressSk INT IDENTITY(1,1) PRIMARY KEY ,
	Address_type CHAR(50) NOT NULL,
	address VARCHAR(225) ,
	city VARCHAR(225) ,
	region VARCHAR(225) ,
	postal_code VARCHAR(225) ,
	country VARCHAR(225) ,
	phone VARCHAR(225) ,
	StartDate DATE,
	EndDate DATE ,
	IsCurrent BIT 
);

CREATE TABLE FactOrders(
	Sales_SK INT IDENTITY (1,1) PRIMARY KEY,
	Order_id_BK INT,
	shipname VARCHAR(40)  ,
	ShipperSK_FK INT ,
	Shipper_ADD_id_FK INT ,
	ProductSK_FK INT , 
	SupplierSK_FK INT, 
	Supplier_ADD_id_FK INT ,
	EmployeeSK_FK INT , 
	Employee_ADD_id_FK INT , 
	CustomerSK_FK INT ,
	Customer_ADD_id_FK INT,
	OrderDate_FK INT ,
	ShippedDate_FK INT ,
	RequiredDate_FK INT,
	ReturnDate_FK INT ,
	quantity INT NOT NULL ,
	dicount REAL NOT NULL ,
	freight REAL ,
	order_price REAL ,
	total_amount REAL NOT NULL ,
	Delivery BIT NOT NULL ,
	Shipping BIT NOT NULL ,
	IsReturned BIT NOT NULl ,



);