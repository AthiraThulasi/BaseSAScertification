*-----------------------------------------------------------------------------------------------------
Question 1
------------------------------------------------------------------------------------------------------
(Q1)The FLIGHT data set contains 4 variables:
FROM: the departing city
TO: the arriving city
AIRLINE: the airline
PRICE: the price of the flight ticket
Task
Transpose the data set so that the prices from each airline is listed in individual columns.
Calculate the minimum price among all the airlines in each route.
Create any data set or variable if needed;

Data Flight;
Infile datalines dsd;
Input From : $30. To : $30. Airline : $30. Price;
Datalines;
Toronto,New York,Air_Canada,600
Toronto,New York,American_Airline,400
Toronto,New York,Virgin_Airline,700
Toronto,Calgary,Air_Canada,550
Toronto,Calgary,American_Airline,750
Toronto,Calgary,Air_Transat,600
Toronto,Hong Kong,Air_Canada,1950
Toronto,Hong Kong,Cathay_Pacific,1850
Toronto,Hong Kong,Hainan_Airline,1600
;
Run;

proc sort data = Flight out = flight_sort;
by from to;
run;

Proc transpose data = flight_sort out = flight_out;
ID Airline;
var price;
by from to;
run;

Data Airline;
set flight_out;
min_price = min(Air_Canada, American airline, Air_Transat, Virgin_Airline, Cathay_pacific, Hainan_Airline);
run;

*-----------------------------------------------------------------------------------------------------
Question 2
------------------------------------------------------------------------------------------------------
(Q2)The T_Q2 data set contains the transposed data set from Q2. 
Perform a reverse transpose on T_Q2 and combine the profit from April, May, and June back into one column.
Create any data set or variable if needed;

Data t_q2;
Input Store $ name $ april may june;
Datalines;
Store1 profit 169000 104000 178000
Store2 profit 105000 130000 145000
;
Run;

proc transpose data = t_q2;
var April May June;
by Store;
run;

*----------------------------------------------------------------------------------------------------
Question 3
------------------------------------------------------------------------------------------------------
(Q3)Locate the CARS data set from the SASHelp library.
Create a data set that contains the top 3 cars with the highest horsepower;

Data cars;
set sashelp.cars;
run;

proc sort data = cars out = cars_sort;
by horsepower;
run;

proc print data = cars_sort (keep = make horsepower);
run;

*OR; 

Proc Sort Data=sashelp.cars Out=cars;
By Descending Horsepower;
Run;

Data Cars2;
Set Cars;
if _n_ <=3;
Run;

*-----------------------------------------------------------------------------------------------------
Question 4
------------------------------------------------------------------------------------------------------
(Q4)The INVENTORY data set contains the inventory of a bookshelf from a furniture store.
Compute the total inventory across all of the stores;

Data Inventory;
Infile datalines dsd;
Input Product : $30. Store : $10. Qty;
Datalines;
Billy's Bookshelf,Store 1, 150
Billy's Bookshelf,Store 2, 200
Billy's Bookshelf,Store 3, 230
Billy's Bookshelf,Store 4, 160
Billy's Bookshelf,Store 5, 180
Billy's Bookshelf,Store 6, 220
Billy's Bookshelf,Store 7, 130
Billy's Bookshelf,Store 8, 450
Billy's Bookshelf,Store 9, 260
Billy's Bookshelf,Store 10, 300
;
Run;


Data total;
set Inventory;
retain total 0;
total+Qty;
run;

*OR;

Data Inventory2;
Set Inventory;
Retain Total;
Total = sum(QTY, total);
Run;
*-----------------------------------------------------------------------------------------------------
Question 5
------------------------------------------------------------------------------------------------------
(Q5)The INVENTORY data set contains the inventory of a bookshelf from a furniture store.
The initial inventory of the bookshelf is 1500. 
Compute the total inventory across all of the stores including the initial inventory;

Data Inventory;
Infile datalines dsd;
Input Product : $30. Store : $10. Qty;
Datalines;
Billy's Bookshelf,Store 1, 150
Billy's Bookshelf,Store 2, 200
Billy's Bookshelf,Store 3, 230
Billy's Bookshelf,Store 4, 160
Billy's Bookshelf,Store 5, 180
Billy's Bookshelf,Store 6, 220
Billy's Bookshelf,Store 7, 130
Billy's Bookshelf,Store 8, 450
Billy's Bookshelf,Store 9, 260
Billy's Bookshelf,Store 10, 300
;
Run;


Data total_inven;
set Inventory;
retain total 1500;
total+Qty;
run;


*OR;

Data Inventory2;
Set Inventory;
Retain Total 1500;
Total = sum(QTY, total);
Run;
*-----------------------------------------------------------------------------------------------------
Question 6
------------------------------------------------------------------------------------------------------
(Q6) The INVENTORY data set above contains the inventory of a bookshelf from a furniture store.
Compute the total inventory across all of the stores using the (+) expression;

Data total_inven;
set Inventory;
total+Qty;
run;

*-----------------------------------------------------------------------------------------------------
Question 7
------------------------------------------------------------------------------------------------------
(Q7)Locate the STOCKS data set from the SASHelp library.
The STOCKS data set contains the stock prices from IBM, Intel and Microsoft between August 1986 to December 2015.

Task 1: Sort the data set by the highest selling price (i.e. HIGH) in descending order for each stock;
Data Stocks;
set sashelp.stocks;
run;

proc sort data = stocks out = sort_stock1;
by stock descending high;
run;

*Task 2:Take a look at the variable containing the trade volume (i.e. VOLUME).
Create a data set that contains the highest and lowest trade volume for each stock.
On which date did Intel have the highest trade volume?;

proc sort data = stocks out = sort_stock2;
by stock descending volume;
run;

Data stock_out;
set sort_stock2 (keep = stock date volume);
by stock descending volume;
if first.stock then vol = 'least';
else if last.stock then vol = 'highest';
if vol in ('least','highest');
run;


*Task 3 :An analyst is trying to find out the difference between the highest and lowest selling price for 
each stock between January 1, 1990, to December 1999.
Create a data set that contains the highest selling price, lowest selling price and the difference between
the two for each stock;

proc sort data = stocks out = sort_stock3;
by stock high;
where date>='01JAN1990'D and date<='01DEC1999'D;
run;

Data high1;
set sort_stock3;
by stock high;
if last.stock ;
keep stock high;
run;

proc sort data = stocks out = sort_stock4;
by stock low;
where date>='01JAN1990'D and date<='01DEC1999'D;
run;

Data low1;
set sort_stock4;
by stock low;
if first.stock ;
keep stock low;
run;

data diff;
merge high1 low1;
by stock;
diff = high-low;
run;

*-----------------------------------------------------------------------------------------------------
Question 8
------------------------------------------------------------------------------------------------------
(Q7) Locate the SHOES data set from the SASHelp library.
The SHOES data set contains data from a giant shoes maker.
The data set contains the following variables:

REGION: the region of operation
PRODUCT: the products of focus
SUBSIDIARY: the sub-region or city of the region
STORES: the number of stores that carry the products
SALES: the sales of the products
INVENTORY: the value of the unsold inventory
RETURNS: the value of the returned merchandise

Task 1:
Calculate the return rate for each product:Rate = Returns ÷ Sales;

Data shoes;
set sashelp.shoes;
return_rate = Returns / Sales;
run;


*Task 2: Find out the product that shows the highest return rate across all of the regions.
What's the product that has the highest return? What region was it being sold in?;

Proc sort data = shoes out = shoes_sort;
by region return_rate ;
run;

Data shoes1;
set shoes_sort;
if last.return_rate then status = 1;
run;

*Task 3: Create a data set that contains the product that shows the highest return rate in each region.
What's the product that has the highest return rate in Africa?;

Data Shoes;
Set sashelp.shoes;
rate = returns / sales;
arbi = 1; * Arbitrary variable *;
Run;

Proc sort data=shoes;
by rate;
Run;

Data Shoes2;
Set shoes;
by arbi rate;
if last.arbi;
Run;

*Please note that an arbitrary variable is needed when there is no grouping variable.
----------------------------------------------------------------------------------------
*Task3: Create a data set that contains the top two products that show the highest return rate in each subsidiary.
Which two products are returned the most in Bangkok, Asia? - Slipper and Boot are returned the most in Bangkok, Asia;

Data shoes;
set sashelp.shoes;
return_rate = Returns / Sales;
run;

Proc sort data = shoes out = shoes_sorted1;
by region subsidiary descending return_rate;
run;

Data return1;
set shoes_sorted1 (keep = region subsidiary return_rate product);
by region subsidiary descending return_rate;
if first.subsidiary then num=0;
num+1;
if num in (1, 2);
run;

*Task 5: The CEO of the shoe maker is giving out an annual bonus to the regional managers.
The total bonus to be given out will be 5% of the total sales across all region.
Calculate the total bonus to be given out to all regional managers;

Data bonus;
set sashelp.shoes ;
Total_bonus = sales*(1+5/100);
run;


*Task 6: Calculate the percentage contribution from each region to the total sales.
For example, if the total sales is 150 millions, and the Africa sales is 12 millions, the contribution from Africa to the total sales is:
12m / 150m = 8%. Create any date set or variable if needed;

