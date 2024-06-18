CREATE TABLE Customers (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(255),
    Shipping_Name VARCHAR(255),
    Shipping_Street VARCHAR(255),
    Shipping_Address1 VARCHAR(255),
    Shipping_Address2 VARCHAR(255),
    Shipping_City VARCHAR(255),
    Shipping_Zip VARCHAR(10),
    Shipping_Province VARCHAR(100),
    Shipping_Country VARCHAR(100)
);

CREATE TABLE Orders (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    Financial_Status VARCHAR(100),
    Fulfillment_Status VARCHAR(100),
    Subtotal DECIMAL(10, 2),
    Shipping_Cost DECIMAL(10, 2),
    Taxes DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    Discount_Code VARCHAR(100),
    Discount_Amount DECIMAL(10, 2),
    Shipping_Method VARCHAR(100),
    Notes TEXT,
    Payment_Method VARCHAR(100),
    Refunded_Amount DECIMAL(10, 2),
    Risk_Level VARCHAR(100),
    Source VARCHAR(100),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

CREATE TABLE Line_Items (
    Lineitem_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT,
    Lineitem_Name VARCHAR(255),
    Lineitem_Quantity INT,
    Lineitem_Price DECIMAL(10, 2),
    Lineitem_Requires_Shipping BOOLEAN,
    Lineitem_Taxable BOOLEAN,
    Lineitem_Fulfillment_Status VARCHAR(100),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

CREATE TABLE Taxes (
    Tax_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT,
    Tax_Name VARCHAR(255),
    Tax_Value DECIMAL(10, 2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);
