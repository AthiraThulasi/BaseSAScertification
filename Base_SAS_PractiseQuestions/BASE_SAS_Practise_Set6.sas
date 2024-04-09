*(Q1) Locate the ELECTRIC data set from the SASHelp library.
Export ELECTRIC into an Excel spreadsheet.
Ensure the Excel spreadsheet contains the same rows and columns as the SAS data set;

Proc Export Data=SASHelp.Electric
OutFile='/home/u60674716/Lib/electr.xls'
Replace
Dbms=xls;
Run;

Data Demo;
Length ID $6 Race $9 Gender $6; *Length should me defined before input statement;
Input ID $ Race $ Gender $ Age;
Datalines;
APP001 Black Male 30
APP002 Caucasian Female 25
APP003 Asian Male 24
APP004 Black Female 32
APP005 Caucasian Female 26
;
Run;
*-----------------------------------------------------------------------------
*(Q2) Locate the FISH data set from the SASHelp library. 
Create a subset of the FISH data set and name it as PERCH.
PERCH should contain only the observations where SPECIES is reported as "Perch". 
Save the data set in the WORK library;

Data work.perch;
set sashelp.fish;
if species = 'Perch';
run;
*-----------------------------------------------------------------------------
*(Q3) ACCOUNTING contains 4 variables:EmployeeID: ID, Base: Base Salary, OTHours: Overtime Hours, Rate: Overtime Rate
Employee's salary is calculated as Base Salary + (Overtime Hours x Overtime Rate)
Write a SAS program to calculate the salary for each employee. Create any data set or variables if necessary;

Data Accounting;
Input EmployeeID $ Base OTHours Rate;
Emp_sal = Base  + (OTHours * Rate);
Datalines;
ID0001 6300 4 40
ID0002 4500 8 35
ID0003 8800 5 45
ID0004 8900 4 60
ID0005 5600 3 55
ID0006 6000 9 45
ID0007 7600 2 35
;
Run;
*-----------------------------------------------------------------------------
*(Q4) SALES contains 6 variables: STOREID, MON: SALES (Monday), TUE: SALES (Tuesday)
WED: SALES (Wednesday),THR: SALES (Thursday), FRI: SALES (Friday)
Write a SAS program to calculate the total sales of the week. Create any data set or variables if necessary;

Data Sales;
Input StoreID $ Mon Tue Wed Thr Fri;
total_sales = sum(of Mon,Tue,Wed,Thr,Fri);
Datalines;
STR001 890 750 760 950 1150
STR002 650 450 520 760 970
STR003 1420 1250 1300 1425 1890
STR004 830 . 710 810 1040
STR005 760 550 780 980 1230
STR006 430 530 560 . 970
STR007 1010 980 . 890 1230
STR008 440 740 560 640 740
STR009 670 690 730 950 870
STR0010 570 790 820 810 640
;
Run;
*---------------------------------------------------------------------------------------------------------------
*(Q5) EXAM contains 4 variables: ID: Student ID ,TEST1: First test result, TEST2: Second test result,FINAL: Final exam result
The final score is calculated as: 50% of (the highest of the first and second test) + 50% of the final exam result
Write a SAS program to calculate the final score for each student;

Data Exam;
Input ID $ Test1 Test2 Final;
final = 0.5 * max(Test1,Test2) + 0.5 * final;
Datalines;
9000001 90 87 66
9000002 66 89 98
9000003 20 45 73
9000004 75 74 100
9000005 44 85 76
9000006 71 82 89
9000007 82 83 88
9000008 68 71 54
9000009 36 48 46
9000010 71 73 98
;
Run;
*---------------------------------------------------------------------------------------------------------------
*(Q6) STAT contains 3 variables: PLAYER: The player being analyzed ,STAT: The statistics (points, rebounds, assists, blocks and field goals percentage)
CURRENT: The current statistics from said player
Predict the player's statistics for next season based on a random factor. 
The random factor should be a value between 0.9 to 1.1. Generate the random factor based on a UNIFORM distribution. 
The prediction statistics will be calculated as: Pred = Curr x Random Factor
Write a SAS program to calculate the stat prediction for said player;

Data Stat;
Input Player $ Stat $ Current;
Datalines;
L.James Points 28.6
L.James Rebounds 10.3
L.James Assists 6.4
L.James Blocks 0.8
L.James FG 47.7
;
Run;


Data Pred;
Set Stat;
factor = rand('uniform')*0.2 + 0.9;
Pred = Current * factor;
Run;
*---------------------------------------------------------------------------------------------------------------
*(Q7) GROCERY contains 3 variables: ITEM: Item no. , PRICE: Price of the items, DISCOUNT: Percentage of discount for each item.
Write a SAS program to calculate the updated price based on the discount offered for each item.
The calculation should be as follow: New = Old x (1 - Discount/100), Round the updated price to 2 decimal places. 
Create any data set or variables if necessary;

Data Grocery;
Input Item Price Discount;
New_price1 = price * (1 - Discount/100);
New_price2 = Round(New_price1, 0.01);
Datalines;
1 60.49 10
2 79.99 13
3 47.99 7
4 50.09 0
5 43.99 5
6 81.79 7
7 68.17 3
8 103.49 10
9 121.78 8
10 78.69 8
;
Run;
*---------------------------------------------------------------------------------------------------------------
*(Q8) Write a SAS program to round down the RANDNO variable to 1 decimal place;

Data Numbers;
input randno;
datalines;
7.820995511
5.6069808411
2.6857884419
8.2832695455
4.8186799493
3.1513387109
11.895538688
6.9183423654
5.9589683432
7.7071493822
;
Run;

Data Numbers2;
Set Numbers;
randno = round(randno,0.1);
run;

*OR;

Data Numbers2;
Set Numbers;
Randno2 = Randno*10;
Randno3 = Floor(Randno2) / 10;
Run;
*---------------------------------------------------------------------------------------------------------------
*(Q9) Write a SAS program to extract the area code (first 3 digit) from the variable TEL; 

Data PhoneList;
Input Tel $20.;
datalines;
416-222-2222
905-222-3333
289-222-4444
604-333-2121
780-444-8989
514-555-5959
902-333-1414
204-999-4646
877-111-1212
800-222-8686
;
Run;

Data areacode;
set PhoneList;
code = substr(Tel,1,3);
run;

*---------------------------------------------------------------------------------------------------------------
(Q10) Write a SAS program to find out the length of each name;

Data FirstName;
Input Name $80.;
datalines;
Anna
Christopher
Mary
Jonathan
Tim
Elizabeth
Amy
($##($(#$(#$(#($#($#$#$(#$#$#$#(*$(#
schwarzenegger
Kevin
Porter
;
Run;

Data len;
set FirstName;
leng = length(Name);
run;
*---------------------------------------------------------------------------------------------------------------
*(Q11) Write a SAS program to combine the first name and last name into one variable;

Data FirstLast;
Input First $ Last $;
Datalines;
Justin Jeever
Amy Chang
Alex Toby
Andrew Khan
MaryAnn Garabed
Leslie Song
Jeff Barrett
Jeev Daha
Casey Carson
Ann Chen
;
Run;

Data first_last;
set FirstLast;
name = trim(First)||','||Last;
run;
*---------------------------------------------------------------------------------------------------------------
*---------------------------------------------------------------------------------------------------------------
*(Q12) Write a SAS program to extract the numeric exam result from the COMMENT variable. 
Only the exam result (numeric value) should be extracted;


Data MathExam;
infile datalines dsd;
input Comment $40.;
datalines;
Mary's exam result is 89
Jonathan's exam result is 77
Ann's exam result is 97
Christopher's exam result is 68
Peter's exam result is 90
Jeev's exam result is 55
Tina's exam result is 86
Porter's exam result is 91
MaryAnn's exam result is 69
Tim's exam result is 72
;
Run;

Data exam;
set MathExam;
Ind = Index(Comment, "is ");
pos = Ind+3;
Result = substr(Comment, pos);
Run;

Note: the text in the INDEX function is "is ". There is a space after the word "is".
