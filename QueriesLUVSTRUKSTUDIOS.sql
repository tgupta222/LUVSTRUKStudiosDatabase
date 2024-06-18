SELECT COUNT(*) AS Total_Orders
FROM Orders;

SELECT SUM(Total) AS Total_Revenue
FROM Orders
WHERE Financial_Status = 'paid';

SELECT AVG(Total) AS Average_Order_Value
FROM Orders
WHERE Financial_Status = 'paid';

SELECT Customer_ID, SUM(Total) AS Total_Spent
FROM Orders
GROUP BY Customer_ID
ORDER BY Total_Spent DESC
LIMIT 5;

SELECT Fulfillment_Status, COUNT(*) AS Order_Count
FROM Orders
GROUP BY Fulfillment_Status;

SELECT SUM(Discount_Amount) AS Total_Discounts
FROM Orders;

SELECT Shipping_Method, COUNT(*) AS Frequency
FROM Orders
GROUP BY Shipping_Method
ORDER BY Frequency DESC
LIMIT 1;

SELECT AVG(Lineitem_Count) AS Average_Line_Items_Per_Order
FROM (SELECT Order_ID, COUNT(*) AS Lineitem_Count
      FROM Line_Items
      GROUP BY Order_ID) AS Lineitem_Summary;

SELECT Order_ID, Refunded_Amount
FROM Orders
WHERE Refunded_Amount > 100;

SELECT Discount_Code, COUNT(*) AS Usage_Count, SUM(Discount_Amount) AS Total_Discount_Provided
FROM Orders
WHERE Discount_Code IS NOT NULL AND Discount_Code <> ''
GROUP BY Discount_Code
ORDER BY Usage_Count DESC;

