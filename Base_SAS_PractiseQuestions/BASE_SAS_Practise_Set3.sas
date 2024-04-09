*=========================================================================================
(Q1)How many steps are in the program shown below?
*=========================================================================================;
proc print data=sashelp.cars;
    var make model msrp mpg_city
    mpg_highway horsepower weight;
    format weight comma8.;
run;

*Answer - 1;

*=========================================================================================
(Q2)what is the final value of the variable i in the output data set work.mydata?
*=========================================================================================;


data work.mydata;
    do i=0 to 10 by 2;
        equation=i/2;
    end;

* Answer - 12 ;

*=========================================================================================
NOTE - VALIDVARNAME=ANY
*=========================================================================================
With system option VALIDVARNAME=ANY, the name can begin with or contain any characters, including 
blanks, national characters, special characters, and multi-byte characters;

*=========================================================================================
(Q3)Which SAS statement completes the program and results in a value of ‘Printing750’ for the
DEPARTMENT variable?
*=========================================================================================
Given the raw data record DEPT:
—-|—-10—|—-20—|—-30
Printing 750
The following SAS program is submitted;
data bonus;
infile ‘dept’;
inputdept$ 1-11 number 13- 15;
<insert statement here>
run;

Answer
department = trim(dept)|| put(number,3.);

*=========================================================================================
(Q4) Assume that Work.Ds1 and Work.Ds2 exist and the following SAS program is submitted:
How many PDF files are created?
*=========================================================================================;
ods pdf file='results.pdf';
proc print data=work.ds1;
run;
proc freq data=work.ds1;
proc freq data=work.ds2;
run;
ods pdf close;

*Answer - 1 PDF file with all the output combined;

*=========================================================================================
NOTE : When you are using the default engine, you do not have to specify the engine name in the 
LIBNAME statement.However, you do have to specify the libref and the SAS data library name.
*=========================================================================================

(Q5) What is the value of the variable PROD in the output data set?
*=========================================================================================;
data work.sets;
do until (prod gt 6);
prod + 1;
end;                          *answer - 7;
run;
*=========================================================================================
(Q6) How many program steps are executed when the program below is processed? 3
*=========================================================================================

When it encounters a DATA, PROC, or RUN statement, SAS stops reading statements and executes 
the previous step in the program.This program contains one DATA step and two PROC steps, 
for a total of three program steps;

data user.tables;
set work.jobs;
run;
proc sort data=user.tables;
by name;
run;
proc print =user.tables;
run;

*=========================================================================================
(Q7) Which footnote(s) is/are displayed in the report?
*=========================================================================================
The following SAS program is submitted:
footnote 1 ‘Sales Report for Last Month’;


footnote2 ‘Selected Products Only’;

footnote3 ‘All Regions’;

footnote4 ‘All Figures in Thousands of Dollars’;

proc print data = sasuser.shoes;

footnote2 ‘All Products’;

run;

