*------------------------------------------------------------------------------------------------------
                                      PROJECT 1
--------------------------------------------------------------------------------------------------------
Project uses sashelp.shoes

Write a SAS program that will:
Read SASHELP.SHOES as input
Create a new sas dataset work.salesrange
create a new character variable salescat that will be used to categorize  the observations into 3 groups
Set the value of salecat to the following:
(1) CLASS_A when sales are less than 100,000
(2) CLASS_AA when sales are between 100,000 and 200,000 inclusively
(3) CLASS_AAA when sales are greater than 200,000
(4) How many obsrvns r classified into CLASS_A group?
(5) What is the mean values of obs in salescat = Class_AA. Round your answer to nearest whole number?
-----------------------------------------------------------------------------------------------------------;

Data work.salesrange;
 set sashelp.shoes (keep = sales product);
 length salescat $10;    * Adding LENGTH to newly created variable is very imp otherwise subset o/p gets wrong;
 if sales lt 100000 and sales ne . then salescat = 'class_A';
 else if sales le 200000 then salescat = 'class_AA';          
 else if sales > 200000 then salescat = 'class_AAA';
run;

proc contents data = work.salesrange; * to see the structure of the dataset(Length of variable);
run;

proc print data = work.salesrange;
run;

*How many obsrvns r classified into CLASS_A group?;

proc freq data = work.salesrange;
 table salescat;
run;

*What is the mean values of obs in salescat = Class_AA. Round your answer to nearest whole number?;

proc means data = work.salesrange;
 var sales;
 class salescat;
run;

*------------------------------------------------------------------------------------------------------
                                      PROJECT 2
--------------------------------------------------------------------------------------------------------
 Write a SAS program that will: 
 Read sashelp.shoes as input. 
 Create the SAS data set work.sortedshoes.
 Sort the sashelp.shoes data set - 
 First by variable product in descending order. 
 Second by variable sales in ascending order.
 
 Question 1: What is the value of the product variable in observation 148?  slipper
 Question 2: What is the value of the Region variable in observation 130?   
 -----------------------------------------------------------------------------------------------------;
 Data work.shoes;
 set sashelp.shoes;
 run;
 
 proc sort data = work.shoes out = work.sortedshoes1 (keep = product region sales);
 by descending product;
 runn;
 
 proc print data = work.sortedshoes1;
 run;
 
 proc sort data = work.sortedshoes1 out = work.sortedshoes2 (keep = product region sales);
 by sales;
 run;
 
 proc print data = work.sortedshoes2;   
 run;
 
*------------------------------------------------------------------------------------------------------
                                      PROJECT 3
--------------------------------------------------------------------------------------------------------
Write a SAS program that will: 
Read sashelp.shoes as input. 
Create a new SAS data set - work.shoerange. 
Create a new character variable SalesRange that will be used to categorize the observations into three groups.
Set the value of SalesRange to the following
Lower when Sales are less than $100,000. 
Middle when Sales are between $100,000 and $200,000, inclusively. 
Upper when Sales are above $200,000.
Run the program, then use additional SAS procedures to answer the following questions
Question 1: How many observations are classified into the “Lower” group? 288
Question 2: What is the mean value of the Sales variable for observations in the “Middle” group? Round 
135127   
-----------------------------------------------------------------------------------------------------;
Data work.shoerange;
 set sashelp.shoes;
 if sales lt 100000 then salesrange = "lower";
 else if sales le 200000 then salesrange = "middle";
 else if sales gt 200000 then salesrange = "upper";
run;
 
proc freq data = work.shoerange;
tables  salesrange;
run;
 
proc means data = work.shoerange;
var sales;
class salesrange;
run;
*------------------------------------------------------------------------------------------------------
                                      PROJECT 4
--------------------------------------------------------------------------------------------------------;
 data work.lowchol work.highchol
 set sashelp.heart;     
 if cholesterol lt 200 output work.lowchol;     
 if cholesterol ge 200 output work.highchol;     
 if cholesterol is missing output work.misschol; 
 run;
 
*This program is intended to: 
Divide the observations of sashelp.heart into three data sets - work.highchol, work.lowchol, and work.misschol  
 • Only observations with cholesterol below 200 should be in the work.lowchol data set. 
 • Only Observations with cholesterol that is 200 and above should be in the work.highchol data set.  
 • Observations with missing cholesterol values should only be in the work.misschol data set.
Fix the errors in the above program. There may be multiple errors in the program. 
Errors may be syntax errors, program structure errors, or logic errors. 
In the case of logic errors, the program may not produce an error in the log. 
After fixing all of the errors in the program, answer the following questions: 
Question 1: How many observations are in the work.highchol data set?  3652
Question 2:How many observations are in the work.lowchol data set?  1405  
*--------------------------------------------------------------------------------------------------------;
 data work.lowchol work.highchol work.misschol;
 set sashelp.heart; 
 if cholesterol eq . then output work.misschol; 
 else if cholesterol lt 200 then output work.lowchol;     
 else if cholesterol ge 200 then output work.highchol;     
 run;
 
 proc print data = work.highchol n;
 run;
 
 proc print data = work.lowchol n;
 run;
 
*-------------------------------------------------------------------------------------------
								PROJECT 5
--------------------------------------------------------------------------------------------
This project will use data set cert.input13. At any time, you may save your program as program13 in C:\cert\programs.

This data set contains 1001 observations and 2 variables:

Date1, a numeric variable representing an unformatted SAS date value. Example: 12001.
Charnum, a character variable representing a monetary amount. Example: $50,000.
Write a SAS program that will:

Save the new data set as results.output13.
Create a new variable Chdate that converts the date1 variable to a character variable that is in the format ddmonyyyy, such as 11NOV1992.
Create a new variable num1 that converts the Charnum variable to a numeric variable.
Run the program and use additional SAS procedure steps to answer the next  question.

8.What is the value of Chdate for observation 52?;

libname Datasets '/home/u60674716/GIT_Upload/Datasets' ;
Data in13;
Set Datasets.input13;
run;


libname results '/home/u60674716/GIT_Upload/results' ;
Data results.output13;
Set Datasets.input13;
Chdate = put(date1,date9.);
num = input(charnum,dollar7.);
run;



date1 variable to a character variable that is in the format ddmonyyyy, such as 11NOV199

data results.output13;
  set cert.input13;
  Chdate=put(date1,date9.);
  num1=input(Charnum,dollar7.);
run;
proc print data=results.output13 (firstobs=52 obs=52);
run;

*----------------------------------------------------------------------------------------------
                               PROJECT 6
-----------------------------------------------------------------------------------------------
This project will use data set cert.input08a and cert.input08b. At any time, you may save your
program as program08 in C:\cert\programs. Both data sets contain a common numeric variable named ID.

Write a program that will use a SAS DATA Step to:

Combine data sets cert.input08a and cert.input08b by matching values of the ID variable.
Write only observations that are in both data sets to a new data set named results.match08.
Write all other non-matching observations from either data set to a new data set named results.nomatch08.
Exclude all variables that begin with “ex” from results.nomatch08.

Run the program and use the results to answer the next question.

4.How many variables (columns) are in results.match08?117
How many observations (rows) are in results.match08 ? 1200;


libname datasets '/home/u60674716/GIT_Upload/Datasets' ;
Data onea;
set datasets.input08a;
run;

libname datasets '/home/u60674716/GIT_Upload/Datasets' ;
Data oneb;
set datasets.input08b;
run;

proc sort data = onea out = work.sorted_a;
by ID;
run;

proc sort data = oneb out = work.sorted_b;
by ID;
run;

libname results '/home/u60674716/GIT_Upload/results' ;
Data results.match08 results.nomatch08(drop = ex:);
merge work.sorted_a (in = a) work.sorted_b (in = b);
by iD;
if a and b then output results.match08;
else if a or b then output results.nomatch08; *else output results.nomatch08;
run;


proc contents data = results.match08;
run;

proc contents data = results.nomatch08;
run;


*----------------------------------------------------------------------------------------------
                               PROJECT 7 
-----------------------------------------------------------------------------------------------
This project will use data set cert.input12. At any time, you may save your program as program12 in C:\cert\programs.
cert.input12 contains a single observation with two variables: salary, year
Write a SAS program that will:
Create an output data set results.output12.
Read cert.input12 as input.
Increase the salary variable by 5.65% annually until it is greater than $500,000.
Increment the year variable by 1 with each annual increase.
Create an output data set results.output12 that has one observation for each value of year. 
Each observation should have a year and salary variable;

libname datasets '/home/u60674716/GIT_Upload/Datasets' ;
Data Salary;
set datasets.input12;
run;

libname results '/home/u60674716/GIT_Upload/results' ;
Data results.output12;
set Salary;
output;
do until (salary * 1.0565 gt 500000);
year + 1;
salary = salary * 1.0565; 
output;
end;
run;

*----------------------------------------------------------------------------------------------
                               PROJECT 8
-----------------------------------------------------------------------------------------------
This project will use data set cert.input04. 
Write a SAS program that will:create data set results.output04
In this program, complete the following mathematical actions, in the following order:
Round VAR1 and VAR2 to the nearest integer values.
Multiply the rounded VAR1 by the rounded VAR2 and assign the new value to VAR3.
Add VAR12 through VAR19 (8 variables) together, ignoring missing values. Assign the sum to VAR20.
Run the program and use the results to answer the next question.

2.For observation 16, what is the value of VAR20?  
Enter your numeric answer in the space below. Round your answer to the nearest whole number;



Libname  datasets '/home/u60674716/GIT_Upload/Datasets'; *this is right????;
libname results '/home/u60674716/GIT_Upload/results' ;
Data results.output04;
set datasets.input04;
var1 = round (var1,1);
var2 = round (var2,1);       *variable1 = floor(var1) , variable2 = floor(var2);
var3 = var1*var2;
var20 = sum(of var12 - var19);                  * OR var3=round(var1,1)*round(var2,1);                      
run;


proc print data = results.output04 (firstobs = 1 obs = 17);
var Var3 var20;
run;

*[ANS:3174.78 = 3175];

*Using round();

Libname  datasets '/home/u60674716/GIT_Upload/Datasets'; *this is right????;
libname results '/home/u60674716/GIT_Upload/results' ;
Data results.output04;
set datasets.input04;
var1 = round(var1,3); *Try round (var1,3);
run;

