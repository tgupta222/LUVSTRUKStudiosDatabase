INSERT INTO Customers (Email, Shipping_Name, Shipping_Street, Shipping_Address1, Shipping_Address2, Shipping_City, Shipping_Zip, Shipping_Province, Shipping_Country)
SELECT DISTINCT
    Email,
    `Shipping Name`,
    `Shipping Street`,
    `Shipping Address1`,
    `Shipping Address2`,
    `Shipping City`,
    `Shipping Zip`,
    `Shipping Province`,
    `Shipping Country`
FROM orders_export;

INSERT INTO Orders (Customer_ID, Financial_Status, Fulfillment_Status, Subtotal, Shipping_Cost, Taxes, Total, Discount_Code, Discount_Amount, Shipping_Method, Notes, Payment_Method, Refunded_Amount, Risk_Level, Source)
SELECT 
    c.Customer_ID,
    `Financial Status`,
    `Fulfillment Status`,
    Subtotal,
    Shipping,
    Taxes,
    Total,
    `Discount Code`,
    `Discount Amount`,
    `Shipping Method`,
    Notes,
    `Payment Method`,
    `Refunded Amount`,
    `Risk Level`,
    Source
FROM orders_export oe
JOIN Customers c ON oe.Email = c.Email;

INSERT INTO Line_Items (Order_ID, Lineitem_Name, Lineitem_Quantity, Lineitem_Price, Lineitem_Requires_Shipping, Lineitem_Taxable, Lineitem_Fulfillment_Status)
SELECT 
    o.Order_ID,
    `Lineitem name`,
    `Lineitem quantity`,
    `Lineitem price`,
    `Lineitem requires shipping` = 'True', 
    `Lineitem taxable` = 'True',
    `Lineitem fulfillment status`
FROM orders_export oe
JOIN Orders o ON oe.`Name` = o.Order_ID;  

INSERT INTO Taxes (Order_ID, Tax_Name, Tax_Value)
SELECT 
    o.Order_ID,
    `Tax 1 Name`,
    `Tax 1 Value`
FROM orders_export oe
JOIN Orders o ON oe.`Name` = o.Order_ID
WHERE `Tax 1 Name` IS NOT NULL;

INSERT INTO Taxes (Order_ID, Tax_Name, Tax_Value)
SELECT 
    o.Order_ID,
    `Tax 2 Name`,
    `Tax 2 Value`
FROM orders_export oe
JOIN Orders o ON oe.`Name` = o.Order_ID
WHERE `Tax 2 Name` IS NOT NULL;