*-------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
(Q1)What is the value of the variable JOBCATEGORY in the output data set ;FA

data work.staff;
JobCategory = 'FA';
JobLevel = '1';
JobCategory = JobCategory || JobLevel;
run;

*-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
(Q2)What output is generated?; obs date 1 monday, july4, 2005;

data one;
date = ‘04juI2005’d;
format date weekdate.;
run;
proc print data = one;
run;


*-------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
(Q3) Given the SAS data set WORK.ONE:

Id    Char1
111  A
158  B
329  C
644  D

and the SAS data set WORK.TWO:

Id    Char2
111  E
538  F
644  G


The following program is submitted;

data WORK.BOTH;
set WORK.ONE WORK.TWO;
by Id;
run;

*What is the first observation in SAS data set WORK.BOTH?  111 A .

set WORK.ONE WORK.TWO will concatanate 2 datasets one below the other, so charcter2 
has missing value in the first 4 observations

Id    Char1 Char1
111  A       .
158  B       .
329  C       .
644  D       .
111          E
538          F
644          G
*-------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
(Q4) What is value of the variable named description when the value for salary is 30000? 
Under6 - bcs description takes the length 7 ( of Over 60);

data fltaten;
input jobcode $ salary name $;
cards;
FLAT1 70000 Bob
FLAT2 60000 Joe
FLAT3 30000 Ann
;
run;

data desc;
set fltaten;
if salary>60000 then description='Over 60';
else description='Under 60';
run;

*-------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
(Q5) The following program is submitted,What is the value of the variable AVERAGE?;

data test;
average = mean(6,4,.,2);
run;



data test;
average = mean(6,4,.,2);
run;

*-------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
(Q6) What is the value of the variable CITY_COUNTRY in the output data set?; Ipswich         , England

data work.test;
First = 'Ipswich, England';
City = substr(First,1,7);
City_Country = City!!', '!!'England';
run;

*-------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
(Q6)What results occurs when this program is submitted?

libname temp 'SAS-data-library';
data temp.sales;
merge temp.sales
work.receipt;
by names;
run;

*Program excecutes successfully 
*-------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
(Q7)The SAS data set WORK.PEOPLE has 5 observations, and the data set WORK.MONEY has 7 observations.
How many observations will the data set WORK.EMPSALARY contain? 0;

data work.empsalary;
set work.people (in = inemp)
work.money (in = insal);
if insal and inemp;
run;

*-------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
(Q8) The SAS data set named WORK.TEST is listed below:

capacity airplanetype staff
150 Large 10

Which one of the following SAS programs created this data set?
data work.test;

data test;
capacity = 150;
if 100 le capacity le 200
then do;
airplanetype = 'large';
staff = 10;
end;
else do;
airplanetype = 'small';
staff = 5;
end;
run;

*-------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
(Q9)  Variable X contains what value? 0;

data WORK.DATE_INFO;
X=”01Jan1960″D ;
run;


*-------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
(Q10)  The variable NEWDATE contains the SAS date value for April 15, 2000.
     What output is produced if April 15, 2000 falls on a Saturday; 
     
libname temp 'SAS-data-library';
data work.new;
set temp.jobs;
format newdate mmddyy10.;
qdate = qtr(newdate);
ddate = weekday(newdate);
run;
proc print data = work.new;
run;

Ans:
newdate     qdate ddate
04/15/2000  2      7 ;

*-------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
(Q11) Which one of the following is the length of the variable CITY_COUNTRY in the output data set? 25;

data work.test;
First = 'Ipswich, England';
City_Country = substr(First,1,7)!!', '!!'England';
run;

*-------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
(Q12) The variable Count is created using a sum statement. Which statement regarding this variable is true?;

data WORK.NEW;
set WORK.OLD;
Count+1;
run;

*it is assigned a value 0 at compile time;


*-------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
(Q13)How many observations are in data set WORK.ALL after submitting the program?; 2

Name EmpID
Jill 1864
Jack 2121
Joan 4698
John 5463

WORK.EMP_DEPT:

EmpID Department
2121 Accounting
3567 Finance
4698 Marketing
5463 Accounting;


data WORK.ALL;
merge WORK.EMP_NAME(in=Emp_N)
WORK.EMP_DEPT(in=Emp_D);
by Empid;
if (Emp_N and not Emp_D) or (Emp_D and not Emp_N);
run;

*-------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
(Q14)What will be the output of variable sex in the following code?; 
Since the Variable SEX has no 'm', but has 'M', No o/p will be displayed - So UNKNOWN;

Data class;
set sashelp.class;
if sex = 'm';
run;
