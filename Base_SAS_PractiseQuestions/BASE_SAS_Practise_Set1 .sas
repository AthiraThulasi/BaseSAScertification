*-------------------------------------------------------------------
(1) How many observations are written to the WORK SALES data set?;

data work.sales;
do year = 1 to 5; *year & month  = index variable;*1 - start var for year, 5 - stop value for year;
do month=1 to 12; *1 - start var for month, 12 - stop value for month;
x+1;
output; *12*5 = 60 obsrvs;
end;
end;
run;

*Output - For a duration of 5 years, each year comprising 12 months
the output will consist of 12 * 5 = 60 observations;

*-------------------------------------------------------------------
(2) How many observations are written to the WORK SALES data set?
-------------------------------------------------------------------;

data work.sales;
do year = 1 to 5; *year & month  = index variable;
do month=1 to 12; 
x+1;
output   * 0 observations as 1 unclosed "DO LOOP";
end;
run;

*-----------------------------------------------------------------------------------------------------------------------
(3) The SAS data set SASUSER.HOUSES contains a variable PRICE which has been assigned a permanent label of “Asking Price”.
what code temporarily replaces the label “Asking Price” with the label “Sale Price” in the output?;

proc print data = SAShelp.heart label;
where DeathCause = 'Other'; * 'WHERE' statement works with both DATA step & PROC step, but 'IF' works only with DATA step;
label DeathCause = 'Cause';
run;

*----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
(4) The SAS data sets WORK.EMPLOYEE and WORK.SALARY are shown below:
Which one of the following statements completes the merge of the two data sets by the FNAME variable?;

Data work.employee;
input Fname$ Age;
Datalines;    
Bruce  30      
Dan    40      
Dan  25000
;
run;
 
 
Data work.salary;
input Name$ salary;
Datalines;
Bruce   25000
Bruce   35000
;
run;

Proc sort data = employee out = emp_sort;
by  Fname;
run;

Proc sort data = salary out = sal_sort;
by  Name;
run;

data work.empdata;
merge emp_sort sal_sort (rename = (name = fname));
by fname; *Since renamed as fname, group by 'fname';
run;

*OR ;

data work.empdata;
merge sal_sort emp_sort  (rename = (fname = name));
by name; *Since renamed as name, group by 'name';
run;
*----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
(5) The following SAS program is submitted:
The value for the variable JOBCODE is: chem2
What is the value of the variable DESCRIPTION?;

data test;
set chemists;
if jobcode = ‘Chem2’
then description = ‘Senior Chemist’;
else description = ‘Unknown’;
run;

*----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
(6) The following SAS program is submitted:
What are the values of the AMOUNT and WORD variables in SAS dataset work.new?;

data work.new;
length word $7;
amount = 4;
if amount = 4 then word = 'FOUR';
else if amount = 7 then word = 'SEVEN';
else word = ‘NONE!!’;
amount = 7;
run;

*----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
(7) The following SAS program is submitted:
Which statement successfully completes the program so that TOTAL has a value of 505-6465-09090??;

data combine;
prefix=’505’;
middle=’6465 ‘;
end=’09090’;
<insert statement here>;
run;

total = catx(’-’, prefix, middle, end);

*----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
(8) How many observations will be displayed? ;

proc print data=SASHELP.CLASS(firstobs=5 obs=15); *output 11;
where Sex='M';
run;

*Total 19 observations in SASHELP.class. How many observations in the output?
if obs is not given, default obs is total num of observations in the dataset;
proc print data=SASHELP.CLASS(firstobs = 5) N; *output - 15 obs;
run;

options firstobs=10 obs=15;
proc print data=SASHELP.CLASS;
run;

proc freq data = SASHELP.CLASS;
run;
*----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
(9) What types of variables are DayOfMonth, MonthOfYear, and Year? Type - Numerical ;

Data type;
x = '20feb2024'd;
dayofmonth = day(x);*Returns the day of the month from a SAS date value - 11;
dayofweek = weekday(x) ; *Returns the day of the week from a SAS date value - 3;
MonthOfyear = month(x); *returns the month from a SAS date value - 12;
Year = year(x);*Returns the year from a SAS date value - 2024;
run;

*----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
(10) What will the variable 'AMOUNT' represent in the following code? Dataset - sashelp.pricedata;

Data price_out;
set sashelp.pricedata;
run;

proc sort data = price_out out = price_sorted ;
by productname;
run;

Data price;
set price_sorted (keep = productname sale);
by productname;
if first.productname then amount = 0 ;
amount + sale; *The values of the variable 'AMOUNT' represent the total for each 'PRODUCT' in the price_sorted data set;
if last.productname ; *????? wat is the output?why 10 observations in o/p;
run;       * sale is 373 for prod 1 , then amount should be 373 + 0 = 373...rt?? how come 23769;


proc print data = price (firstobs = 100 obs = 200) n; *starting from 100th obs till 500th;
run;

*----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
(11) The Excel workbook REGIONS.XLSX contains the following four worksheets;

EAST
WEST
NORTH
SOUTH
The following program is submitted:
libname MYXLS XLSX 'c:\ data\ regions.xlsx'.Which PROC PRINT step correctly displays the NORTH worksheet;

proc print data=MYXLS.'NORTH$'n;
run;

*----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
(12) Will the column names change, if label is not given in proc print statement? No;

Data price_out;
set sashelp.pricedata;
run;

proc sort data = price_out out = price_sorted (keep= date sale price);
by productname;
run;

proc print data = price_sorted label n='obs';*Label should be present in proc print otherwise variable name remains the same;
label date = 'newdate';              *No error message will be displayed in LOG;
run;
*----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
(13)When the following SAS program is submitted, the data set sashelp.heart contains 5209 observations:
 How many observations are processed by each procedure?;

libname Lib '/home/u60674716/Lib';
options obs = 500; *starting from first till 500 th obs;
proc print data = sashelp.heart (firstobs = 100) n; *starting from 100th obs till 500th;
run;                                              *n - prints the number of observations in the data set;
options obs = max;  * max means - all the obs in the datset;
proc means data = sashelp.heart (firstobs = 500) n ; 
run;

*----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
(14)What is the value of the variable FOUND in the output data set for each case?;

data combine;
country = 'Italy, Russia, ireland';
found = find(country, 'i'); 
run;


Data string;
string  = 'abcxyzabc';
s = find(string,"abc"); * find the first occurence of abc;
run;

Data string;
string  = 'abcxyzabc';
s = find(string,"abc",4); *4 is the index here, so starting from 4, find the first occurence of abc;
run;

Data string;
string  = 'abcxyzabc';
s = find(string,"Abc",4); *There is no 'Abc' here;
run;
*----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
(15)What is the value of the variable FOUND in the output data set for each case?
Which statement successfully completes the program so that TOTAL has a value of 505-6465-09090?;

data combine;
prefix='505';
middle='6465 ';
end='09090';
<insert statement here>; *total = catx('-', prefix, middle, end);
run;

*CATX is a concatenation function 
Syntax 
--------
delimiter followed by comma separated variable names
OR 
(delimiter , of firstvariablename--lastvariablename);

data combine;
prefix='505';
middle='6465 ';
end='09090';
comb = catx('-', of prefix--end);
run;