*----------------------------------------------------------------------------------------------------------
(1) Which statement specifies that records 1 through 10 are to be read from the raw data file customer.txt?
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------;
Data Sales;
infile '/home/u60674716/Datasets/Roncody_dataset/Sales.txt' obs=15; 
run;

Which statement specifies that records 1 through 10 are to be read from the raw data file customer.txt?
A. input 'customer.txt' stop=10;

B. infile 'customer.txt' 1-10;

C. infile 'customer.txt' obs=10;

D. input 'customer.txt' stop@10;

*----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
(2) By default, which variables and data values are used to calculate statistics in the MEANS procedure?
    ANS : All non-missing numeric variable values
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
(3) The contents of the raw data file TEAM are listed below:
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
Janice 10
Henri 11
Michael 11
Susan 12;
data group;
infile 'team';
input name $15. age 2.;
file 'file-specification';                    
put name $15. +5 age 2.;
run;
*Which one of the following describes the output created?
(a)SAS data set named GROUP and a raw data file
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
(4) How many observations are in data set profile_exam after submitting the program?;

Data Profile;
Input Student $ Gender $ Grade;
file '/home/u60674716/GIT_Upload/txtfile.txt';
put Student $ Gender $ Grade;
Datalines;
SID0001 M 7
SID0004 F 7
SID0002 F 7
SID0003 M 8
SID0007 M 6
SID0008 M 6
run;

Data Exam;
Input Student $ Result;
Datalines;
SID0009 70
SID0001 78
SID0004 99
SID0002 90
SID0003 81
SID0007 67
run;

proc sort data=profile;
by student;
run;

proc sort data=Exam;
by student;
run;

Data profile_exam;
merge profile( in = P) exam (in = E);
by student;
if (P and not E ) and ( E and not P );
run;

*-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
(5) What is the value of the variable Prod in the output data set?;

data WORK.PRODUCTS;
Prod=1;
do while (Prod LE 7); *loop will run till while is true. when prod is 7, 7 LE 7 > condition is TRUE, So 7+ 1 = 8 then end;
Prod + 1;
end;
run;

*output - 8;
*-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
(6) Which title/footnote(s) is/are displayed in the report?
-----------------------------------------------------------------------------------------------------------
NOTE :If you submit a new TITLEn statement, it replaces the current TITLEn statement and all TITLE lines with
higher values of n.
------------------------------------------------------------------------------------------------------------;
*Here title2 is skipped to add a blank line between TITLE1 & title3;
title1 'this is title1';
title3 'this is title3';
proc print data = sashelp.class; 
run;

*Redefining a title or footnote line cancels any higher numbered title or footnote lines respectively.
Here adding footnote3 cancelled 4 & 5 ;

footnote1 'footnote1';    
footnote2 'footnote3';
footnote4 'footnote5';
footnote6 'footnote6'; 
proc print data = sashelp.class;
footnote 'footnote';
run; 

*Title is same as title1. adding title cancels title 1,2 &4; ;
title1 'title1';
title2 'title2';
title4 'title4'; 
title 'title'; 
proc print data = sashelp.class;
run;


title1 'title1';
title2 'title2';
title3 'Title3'; 
proc print data = sashelp.class;
title4 'Title4'; 
run;

title1 'title1';
title3 'title3';
title4 'title4'; 
proc print data = sashelp.class;
title3 'title3'; 
run;


title1 'title1';
title3 'title3';
title4 'title4';
footnote2 'footnote2' ;
proc print data = sashelp.class;
footnote 'footnote';
title1 'title'; 
run;

**specifying a NULL TITLE or FOOTNOTE statement cancels all previous titles or footnotes
A null TITLE or FOOTNOTE statement does not contain any number or text and cancels all
footnotes and titles that are in effect;
footnote1 'footnote1';
title1 'title1';
title3 'title3';
title4 'title4'; 
proc print data = sashelp.class;
title3 'title3'; 
title; *null title;
footnote; *null footnote;
run;
*-----------------------------------------------------------------------------------------------------------
(7) Given the following raw data record - 07Jan2005
Which INFORMAT reads this raw data and stores it as a SAS date value? 

OUTPUT - Date9.

*-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
(8) The variable age has a value of 55. How will it be displayed in output?;

data survey;
input s_no gender$ age salary Ques1$ Ques2$ Ques3$ Ques4$ Ques5$ ;
cards;
001 M 23 28000 1 2 1 2 3
002 F 55 76123 4 5 2 1 1
003 M 38 36500 2 2 2 2 1
004 F 67 12000 5 3 2 2 4
005 M 22 23060 3 3 3 4 2
006 M 63 10000 2 3 5 4 3
007 F 45 76100 5 3 4 3 3
;
run;

proc format;
value age_group
low - < 25 = "youngage"
25 - < 50 = "Middleage"
60 - high = "Seniors"  *55 is not added in any of the age-groups,so it will appear as 55 in the report;
;
run;

*OUPUT - 55;

*-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
(9) The following SAS DATA step executes on Monday, April 25, 2000
	Which one of the following is the value of the variable START_DATE in the output data set?;

data newstaff
set staff;
start_date = today();
run;

*Output - the numeric value 14725, representing the SAS date for April 25, 2000
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
(10) The following SAS program is submitted:
Which one of the following is produced as output?;

proc contents data = sashelp.class;
run;

*output - The descriptor portion of the data set SASUSER.AIRPLANES only
Descriptor portion includes - Alphabetic List of Variables,Attributes,Length,Num of variables,
Num of observations, created date,label etc.......
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

(11) *The SAS data set sashelp.pricedata is currently ordered by productname.
What is the value of the variable 'amount' before the first iteration of the data step?
Cannot be determined from the information given ;

Data price_out;
set sashelp.pricedata;
run;

proc sort data = price_out out = price_sorted ;
by productname;
run;                                  

Data price;
retain amount ;
set price_sorted (keep = productname sale);
by productname;
if first.productname then amount = 0;
amount = sum(amount,sale);
if last.productname;
run;
*---------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
(12) What value will SAS assign to Total?  4.8 ;

data WORK.one;      
input Revenue2008 Revenue2009 Revenue2010;      
Total=sum(Rev:);   
Datalines;  
1.2 1.6 2.0 
; 
run; 

*OR 
Total= sum(of Revenue2008 - Revenue2010)
Total = sum(Revenue2008, Revenue2009, Revenue2010);
*----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
(13) How many observations will be in data set WORK.ONE?
-----------------------------------------------------------------------------------------------------------  
*----------------------------------------------------------------------------------------------------------
 Var1   Var2 
 A      one 
 A      two 
 B      three 
 C      four 
 A      five ;


 data WORK.ONE WORK.TWO; 
 set WORK.INPUT; 
 if Var1='A' then output WORK.ONE; *This ouput is same as implicit o/p which gives subset o/p;
 output; *this output gives all the obs in the dataset;
 run; 
 
 *8 observations;
