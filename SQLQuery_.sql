                                 ----- ASSIGNMENT  # 2 ----
                                 ----- QUERY # 1 -----
                                
/*	For each record, label the sale as 'High', 'Medium', or 'Low' based on its SalesAmount 
(e.g., High if above 5,000; Medium if between 2,000 and 5,000; Low if below 2,000)
 and display the SalesOrderNumber with the label from FactInternetSales*/
                              

SELECT SalesOrderNumber,
       SalesAmount,
       CASE 
           WHEN SalesAmount > 5000 THEN 'High'
           WHEN SalesAmount BETWEEN 2000 AND 5000 THEN 'Medium'
           ELSE 'Low'
       END AS SalesLabel
FROM FactInternetSales;

                                              ----- QUERY # 2 -----

/*	Compare each sale’s SalesAmount to its TotalProductCost; label the sale as 'Profitable' if SalesAmount exceeds TotalProductCost, 
and 'Not Profitable' otherwise. Display the SalesOrderNumber and the assigned label from FactInternetSales.  */                                         


 SELECT SalesOrderNumber,
       SalesAmount,
       TotalProductCost,
       CASE 
           WHEN SalesAmount > TotalProductCost THEN 'Profitable'
           ELSE 'Not Profitable'
       END AS Profitability
FROM FactInternetSales;                                             

                                           ----- QUERY # 3 ----

3./*	Retrieve sales where the UnitPrice is greater than 1000 and the DiscountAmount is zero.*/
 
 SELECT *
FROM FactInternetSales
WHERE UnitPrice > 1000
  AND DiscountAmount = 0;                                          

                                      ----- QUERY # 4 ----

	/*Select records where either the Freight cost is above 1000 a specified threshold or the TaxAmt is above 200 from FactInternetSales*/

 SELECT *
FROM FactInternetSales
WHERE Freight > 1000
   OR TaxAmt > 200                                     

                                    ----- QUERY # 5 ----

	/*Filter out sales where the OrderQuantity does not equal 1 from FactInternetSales. */    

  SELECT *
FROM FactInternetSales
WHERE OrderQuantity <> 1;                             
                                
                                 ----- QUERY # 6 ----
       
/*	For each sale, check the OrderDate and assign a label based on between the dates of 2010-12-20 and 2010-12-31 (for example, 'Holiday Sale' if the order date falls within the given range, 
else 'Regular Sale').
 Display the SalesOrderNumber with its corresponding label from FactInternetSales.8*/

 SELECT SalesOrderNumber,
       OrderDate,
       CASE 
           WHEN OrderDate BETWEEN '2010-12-20' AND '2010-12-31' THEN 'Holiday Sale'
           ELSE 'Regular Sale'
       END AS SaleLabel
FROM FactInternetSales;

                                ----- QUERY # 7 ----

/*	Classify each sale by evaluating UnitPriceDiscountPct: if zero, label as 'No Discount'; if between 0 and 0.1, 
label as 'Low Discount'; if greater than 0.1, label as 'High Discount'.
 Return the SalesOrderNumber and classification from FactInternetSales.*/


  SELECT SalesOrderNumber,
       UnitPriceDiscountPct,
       CASE 
           WHEN UnitPriceDiscountPct = 0 THEN 'No Discount'
           WHEN UnitPriceDiscountPct > 0 AND UnitPriceDiscountPct <= 0.1 THEN 'Low Discount'
           WHEN UnitPriceDiscountPct > 0.1 THEN 'High Discount'
       END AS DiscountLabel
FROM FactInternetSales;

                                 ----- QUERY # 8 ----

/*	Retrieve records where either the SalesAmount is between 2,000 and 4,000 or the Freight is below 5 from FactInternetSales.*/


SELECT *
FROM FactInternetSales
WHERE (SalesAmount BETWEEN 2000 AND 4000)
   OR (Freight < 5);

                                  ----- QUERY # 9 ----

 /*	For each sale, check whether SalesAmount is less than 250. If so, label the sale as 'Low SalesAmount; otherwise,
  label it as 'High SalesAmount, 
 and display the SalesOrderNumber with the label from FactInternetSales. */

 SELECT SalesOrderNumber,
       SalesAmount,
       CASE 
           WHEN SalesAmount < 250 THEN 'Low SalesAmount'
           ELSE 'High SalesAmount'
       END AS SalesLabel
FROM FactInternetSales;         

                                ----- QUERY # 10 ----

  /*	Select records where the combination of CustomerKey is higher than 25000 and ProductKey exceeds 100. */

  SELECT *
FROM FactInternetSales
WHERE CustomerKey > 25000
  AND ProductKey > 100                             


                               ----- QUERY # 11 ----

/*	Determine if the ShipDate is later than the DueDate. If it is, label the sale as 'Late Ship'; otherwise,
  label it as 'On Time', and display the SalesOrderNumber with the label.*/

  SELECT SalesOrderNumber,
       ShipDate,
       DueDate,
       CASE 
           WHEN ShipDate > DueDate THEN 'Late Ship'
           ELSE 'On Time'
       END AS ShippingStatus
FROM FactInternetSales;

                                  ---- QUERY # 12 ----

 12.	/*Evaluate the TaxAmt: if it is greater than 7.5% of the SalesAmount, label the sale as 'High Tax'; otherwise,
  label it as 'Low Tax'. Display the SalesOrderNumber with the corresponding label.  */                              
 
 SELECT SalesOrderNumber,
       SalesAmount,
       TaxAmt,
       CASE 
           WHEN TaxAmt > (SalesAmount * 0.075) THEN 'High Tax'
           ELSE 'Low Tax'
       END AS TaxLabel
FROM FactInternetSales;

                            ---- QUERY # 13 ----

/*Check if the ProductStandardCost is greater than 50% of the UnitPrice. If true, label the sale as 'Break-even'; otherwise,
  label it as 'Profit/Loss',
  and display the SalesOrderNumber with this label.      */

  SELECT SalesOrderNumber,
       ProductStandardCost,
       UnitPrice,
       CASE 
           WHEN ProductStandardCost > (UnitPrice * 0.5) THEN 'Break-even'
           ELSE 'Profit/Loss'
       END AS CostLabel
FROM FactInternetSales;
                     

                                      ---- QUERY # 14 ----

 /*	Use nested conditions to first check if SalesAmount is above 1,000; within those,
  check if Freight exceeds 50. Then, assign a combined label (e.g., 'High Sale, High Freight' or 'High Sale, Low Freight')
  and display the SalesOrderNumber with the label.       */

  SELECT SalesOrderNumber,
       SalesAmount,
       Freight,
       CASE 
           WHEN SalesAmount > 1000 THEN
               CASE
                   WHEN Freight > 50 THEN 'High Sale, High Freight'
                   ELSE 'High Sale, Low Freight'
               END
           ELSE
               CASE
                   WHEN Freight > 50 THEN 'Low Sale, High Freight'
                   ELSE 'Low Sale, Low Freight'
               END
       END AS SaleFreightLabel
FROM FactInternetSales;
                              