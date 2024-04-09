*--------------------------------------------------------------
(Q1) The following SAS program is submitted				
*--------------------------------------------------------------;

data WORK.LOOP;
X = 0;
do Index = 1 to 5 by 2;
output;
X = Index
end;
run;

*X = 5, Index = 7;

*--------------------------------------------------------------
(Q2) What value will SAS assign to Pos? 12 ;

data WORK.ONE;
Text='Australia , US, Denmark';
Pos1=find(Text,'US','i',1); *o/p is 12? 
Pos2=find(Text,'US','t',5);
run;
*--------------------------------------------------------------
(Q3) The variable JOB_CODE is a character variable with a length of 6 bytes.
Which one of the following is the length of the variable DESCRIPTION in the output data set? 14 BYTES;

libname sasdata 'SAS-data-library';
data test;
set sasdata.chemists (keep = job_code);
if job_code = 'chem3'
then description = 'Senior Chemist';
run;

*----------------------------------------------------------------------------------------
(Q4) Which one of the following is the value of the TOTALPASSENGERS variable in the output data set?
Missing Numeric Value;
                                
data work.passengers;
if OrigPassengers = . then OrigPassengers = 100;
TransPassengers = 100;
OrigPassengers = .;
NonPaying = 10;
TotalPassengers =  sum( TransPassengers, OrigPassengers)  ; *O/P - SUM function returns the result even if one of the num is missing;
TotalPassengers =   TransPassengers + OrigPassengers ; *O/P  - missing as one of the variable is missing; 
run;

*---------------------------------------------------------------------------------------
(Q5)How many observations does the HWARE data set contain? 2;

prodid price producttype sales returns
K12S 5.10 NETWORK 15 2
B132S 2.34 HARDWARE 300 10
R18KY2 1.29 SOFTWARE 25 5
3KL8BY 6.37 HARDWARE 125 15
DY65DW 5.60 HARDWARE 45 5
DGTY23 4.55 HARDWARE 67 2


libname company 'SAS-data-library';
data hware inter soft;
set company.prices (keep = producttype price);
if price le 5.00;
if producttype = 'HARDWARE' then output HWARE;
else if producttype = 'NETWORK' then output INTER;
else if producttype = 'SOFTWARE' then output SOFT;
run;
*---------------------------------------------------------------------------------------
(Q6)Which one of the following is the purpose of the VARNUM option?;


proc datasets lib = sasuser;
contents data = class varnum;
quit;

*Answer : To print the list of variables in the order they were created;
*--------------------------------------------------------------------------------------
(Q7)Given the SAS data set WORK.ONE:

N BeginDate
1 09JAN201
2 12JAN201
The data set WORK.TWO is created, where Day would be 1 for Sunday, 2 for Monday, 3 for Tuesday, … 
Which expression successfully completed the program and creates the variable Day?;


data WORK.TWO;
input N BeginDate $10;  
Day=weekday(BeginDate);
format BeginDate date9.;
datalines
;
1 09JAN201
2 12JAN201
;
run;


*Answer : weekday(BeginDate);
*--------------------------------------------------------------------------------------
(Q8) *Which one of the following BY statements completes the program and sorts the data sequentially by descending expense values within
each descending IDNUMBER value?

IDNumber Expenses
2542 100.00
3612 133.15
2198 234.34
2198 111.12
;

proc sort data = employee_info;
run;


*Answer - By descending IDnumber descending expenses
---------------------------------------------------------------------------------
(Q9) What is the value of Char2? ;

data WORK.TEMP;
Char1='0123456789';
Char2=substr(Char1,3,4);
run;

*Answer - 2345
---------------------------------------------------------------------------------
(Q10) The SAS data set WORK.SALARY, currently ordered by DEPARTMENT, contains 100 observations 
for each of 5 departments.Which one of the following represents how many observations the WORK.TOTAL data set contains;

data work.total;
set work.salary(keep = department wagerate);
by department;
if first.department then payroll = 0; 
payroll + wagerate;
if last.department;
run;


*Answer -  5 observations;

Proc sort data = sashelp.cars out = sort_cars;
by make msrp;
run;

proc print data = sort_cars(keep = make MSRP);
run;

data cars;
set sort_cars(keep = make MSRP);
by make msrp;
*if first.make ;      
if last.make or first.make ;      

run;

proc contents data = cars;
run;

proc print data = sashelp.cars;
run;

Proc sort data = sashelp.cars out = sort_cars;
by make ;
run;


data cars;
set sort_cars(keep = make MSRP);
by make;
if first.make then payroll = 0;      *38 obs;
payroll + MSRP;
if first.make;
run;                   

proc print data = sort_cars (keep = make MSRP);
run;
*--------------------------------------------------------------------------------------
(Q11) The following SAS program is submitted at the start of a new SAS session.
The SAS data set Sasdata.Salesdata has ten observations.
Which one of the following explains why a report fails to generate? ;

libname sasdata 'SAS-data-library';
data sasdata.sales;
set sasdata.salesdata;
profit=expenses-revenues;
run;

proc print data=sales;
run;

*Ans : SAS dataset 'SALES' does not exist
-------------------------------------------------------------------------------------
(Q12)Which of the following permanently associates a format with a variable?

Ans - Format statement is right answer

*--------------------------------------------------------------------------------------
(Q13) The data set WORK.REALESTATE has the variable LocalFee with a format of 9. and a variable CountryFee with a format of 7.
What are the formats of the variables LOCALFEE and COUNTRYFEE in the output dataset?;

data WORK.FEE_STRUCTURE;
format LocalFee CountryFee percent7.2;
set WORK.REALESTAT;
LocalFee=LocalFee/100;
CountryFee=CountryFee/100;
run;

*ANS - Both LOCALFEE and COUNTRYFEE have a format of percent 7.2;
*---------------------------------------------------------------------------------
(Q14) The variable EXAM has a value of 50.5.
How will the EXAM variable value be displayed in the REPORT procedure output? ;

proc format;
value score 1 - 50 = 'Fail'
51 - 100 = 'Pass';
run;
proc report data = work.courses nowd;
column exam;
define exam / display format = score.;
run;


*Ans : 50.5 as it is not mentioned in range;
*---------------------------------------------------------------------------------
(Q15)Which one of the following represents the values of the AMOUNT and WORD variables? ;

data work.new;
length word $7;
amount = 7;
if amount = 5 then word = 'CAT';
else if amount = 7 then word = 'DOG';
else word = 'NONE!!!';
amount = 5;
run;

*Ans : Amount - 5 & Word - Dog;
*---------------------------------------------------------------------------------
(Q16)Which one of the following represents the values of the AMOUNT and WORD variables?;
data work.new;
length word $7;
amount = 4;
if amount = 4 then word = 'FOUR';
else if amount = 7 then word = 'SEVEN';
else word = 'NONE!!!';
amount = 7;
run;

*Ans : Amount - 7 & Word - Four;
*-----------------------------------------------------------------------------------
(Q17) A frequency report of the variable Jobcode in the Work.Actors data set is listed below.
Which of the following represents the possible values for the variable JOBLEVEL in the WORK.JOBLEVELS data set?;


data work.joblevels;
input jobcode $10.; 
if jobcode in ('Actor I', 'Actor II') then joblevel = 'Beginner';
if jobcode = 'Actor III' then joblevel = 'Advanced';
else joblevel = 'Unknown';
Datalines;
Actor I
Actor I
Actor II
Actor II
Actor III
;
run;

*Answer -  unknown (Else is missing in second if statement);
*---------------------------------------------------------------------------------
(Q18)Which one of the following is the value of the CITY variable?;

data work.flights;
destination = 'cph';
select(destination);
when('LHR') city = 'London';
when('CPH') city = 'Copenhagen';
otherwise city = 'Other';
end;
run;

*Ans : 'OTHER';
*---------------------------------------------------------------------------------
(Q19) Given the SAS data set WORK.ONE. What value will SAS assign to Total? 1.6?;

data WORK.TWO;
input revenue2008 revenue2009 revenue2010;
Total = mean(of rev:);
datalines
;
1.2 1.6  2
;
run;

*----------------------------------------------------------------------------------
(Q20)The following SAS DATA step executes on Monday, April 25, 2000.
Which one of the following is the value of the variable START_DATE in the output data set?;

data newstaff;
set staff;
start_date = today();
run;

*Ans: Numerical value of 14725 representing sas date for April25
----------------------------------------------------------------------------------
(Q21) Which one of the following is the value of the DATE variable?

data work.new;
mon = 3;
day = 23;
year = 2000;
date = mdy(mon,day,year);
run;

*Ans: Numerical value of 14692, whch represent SAS date value of mar23,2000
----------------------------------------------------------------------------------
(Q22)Which one of the following is the length of the city2 variable? ;

data work.test;
length city $20;
city='Paris';
city2=trim(city);
run;

*Ans: 20, if there is no length statement then 5
-----------------------------------------------------------------------------------
(Q23)Given the raw data record in the file phone.txt:
Which SAS statement completes the program and results in a value of “James Stevens”
for the variable FullName? ;

----|----10---|----20---|----30---|
Stevens James SALES 304-923-3721 14;

data WORK.PHONES;
infile ‘phone.txt’;
input EmpLName $ EmpFName $ Dept $ Phone $ Extension;
<_insert_code_>
run;


*Ans: Fullname = CATX('',EmpFName,EmpLName)
-----------------------------------------------------------------------------------
(Q24) Which one of the following represents how many observations are written to the WORK.SALES data set?; 1

data work.sales;
do year = 1 to 5;
do month = 1 to 12;
x + 1;
end;
end;
run;

*No: of observations : 1;


data work.sales;
do year = 1 to 5;
do month = 1 to 12;
x + 1;
output;
end;
end;
run;

*No: of observations : 60

------------------------------------------------------------------------------------
(Q 25) Which one of the following is the value of the variable N in the output data set?;

data work.pieces;
do while (n lt 6); *"while" stops excecution when condition is FALSE;
n + 1;
end;
run;
*N in the output data set - 6;


data work.pieces;
do until (n gt 6);  *"until" stops excecution when condition is TRUE;
n + 1;
end;
run;

*N in the output data set - 7
------------------------------------------------------------------------------------
(Q 26)The SAS data set WORK.PEOPLE has 5 observations, and the data set 
WORK.MONEY has 7 observations.How many observations will the data set WORK.EMPSALARY contain? ;

data work.empsalary;
set work.people (in = inemp)
work.money (in = insal);
if insal and inemp;
run;


proc freq data = class;
tables gender * age / ;
run;

*0 obs
------------------------------------------------------------------------------------
(Q 26) Which option correctly completes the program and creates the report?

Table of gender by age
gender age Frequency Percent Row Percent Column Percent
F 11 1 10.00 20.00 50.00
12 2 20.00 40.00 40.00
13 2 20.00 40.00 66.67
Total 5 50.00 100.00
-----------------------------------
M 11 1 10.00 20.00 50.00
12 3 30.00 60.00 60.00
13 1 10.00 20.00 33.33
Total 5 50.00 100.00
---------------------------------
Total 11 2 20.00 100.00
12 5 50.00 100.00
13 3 30.00 100.00
Total 10 100.00

Ans : The FREQ Procedure
------------------------------------------------------------------------------------
(Q 27) When the following SAS program is submitted, the data set SASDATA.PRDSALES contains 5000 observations:
How many observations are processed by proc means(4501) & proc print (401);

Iibname sasdata 'SAS-data-Iibrary';
options obs = 500;
proc print data = sasdata.prdsales (firstobs = 100); 
run;

options obs = max;
proc means data = sasdata.prdsales (firstobs = 500);
run;
*------------------------------------------------------------------------------------
(Q.28) A SAS PRINT procedure output of the WORK.LEVELS data set is listed below:
*Which of the following values does the variable EXPERTISE contain?;

data work.expertise;
input name $ level;
if level = . then
expertise = 'Unknown';
else if level = 1 then
expertise = 'Low';
else if level = 2 or 3 then
expertise = 'Medium';
else
expertise = 'High';
Datalines
;
Frank 1
Joan 2
Sui 2
Jose 3
Burt 4
Kelly .
Juan 1
;
run;


*Ans : Low, medium and unknown only;
*---------------------------------------------------------------------------
(Q.29)The SAS data set WORK.SALES_INFO has one observation for each month in the year 2000 
and the variable SALES_DATE which contains a SAS date value for each of the twelve months.
How many of the original twelve observations in WORK.SALES_INFO are written to the WORK.REPORT;

data work.report;
set work.sales_info;
if qtr(sales_date) ge 3;
run;

 data set? 6
---------------------------------------------------------------------------
*(Q.30) Which one of the following is needed to display the standard deviation 
with only two decimal places?;

proc means data = sasuser.houses std mean max;
var sqfeet;
run;

* OPTION maxdec = 2 to the PROC MEANS;


