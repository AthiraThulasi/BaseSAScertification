*-----------------------------------------------------------------------------------------------------
*(Q1) The first digit of the barcode represents the product type:
*-----------------------------------------------------------------------------------------------------
2 = Meats, Fruits, Vegetables
3 = Drug
4 = Loyalty Card
5, 9 = Coupon
0, 1, 6, 7, 8 = General
The 7th to 11th digits of the barcode represent the product number.
Write a SAS program that identify the barcode associated with the product # 67503.
Create any data set or variable if needed;

Data Product;
Input Barcode $12.;
Datalines;
584563449723
584563358735
384563675036
084563154684
084563447166
984563804834
284563674476
884563657341
784563480621
384563604852
;
run;

Data prod_num;
set product;
pr = substr(Barcode,7,5);
if pr = 67503 then display = Barcode;
run;

*OR - More efficient code;

Data Product4;
Set Product;
Ind = Index(barcode, "67503");
Run;
*-----------------------------------------------------------------------------------------------------
(Q2) The last digit of the barcode is called the Check Digit. It is used as an error detection for the 
barcode.

It is calculated as follow:
ExampleBarcode without check digit: 

54156897431x
​1. Add the digits in the odd-numbered positions 
(5+1+6+9+4+1 = 26)

2. Multiply the Sum by 3. 
(26x3 = 78)

3. Add the digits in the even-numbered positions 
(4+5+8+7+3 = 27)

4. Add up the two values 
(78+27 = 105). Calculating modulo ten 
(105 mod 10 = 5)

5. If the result is not zero, subtract the result from ten. 
(10-5 = 5)

The check digit for 54156897431x is 5.

For more details about the check digit calculation, please visit here. 

Write a SAS program to check if the check digit is reported correctly for each barcode.

Create any data set or variable if needed.
*-----------------------------------------------------------------------------------------------------
*-----------------------------------------------------------------------------------------------------
(Q3) Locate the FISH data set from the SASHelp library.
List the 6 attributes assigned to  Species variable?
Display the list of variable and their respective attributes using Proc Contents.
How many numeric variables are there in the data set?;

Data Fish;
set sashelp.fish;
run;

*6 Attributes - Name, Label,Type, length, format,Informat;

Proc contents data = sashelp.fish;
run;

*6 Numeric Variables;
*-----------------------------------------------------------------------------------------------------
*-----------------------------------------------------------------------------------------------------
(Q4) Label Crit1, Crit2 and Crit3 as below:

Crit1: Applicant's GPA above 3.5
Crit2: Applicant's did not fail more than 4 courses
Crit3: Applicant's has a Bachelor of Science degree;

Data Admission;
Input Applicant $ Crit1 $ Crit2 $ Crit3 $;
Datalines;
P00851 Met Met Met
P00852 Met NotMet Met
P00853 Met Met Met
P00854 NotMet NotMet NotMet
P00855 Met Met NotMet
P00856 Met Met Met
P00857 NotMet Met Met
P00858 Met NotMet Met
P00859 Met Met Met
P00860 Met Met Met
;
Run;

proc contents data = Admission;
run;

Data ad;
Input Applicant $ Crit1 $ Crit2 $ Crit3 $;
label Crit1 = "Applicant's GPA above 3.5"
      Crit2 = "Applicant's did not fail more than 4 courses"
      Crit3 = "Applicant's has a Bachelor of Science degree";
      run;



Proc print data = Admission label;
var Crit1 Crit2 Crit3;
run;


*Tried using Datalines, worked;

Data ad;
Input Applicant $ Crit1 $ Crit2 $ Crit3 $;
label Crit1 = "Applicant's GPA above 3.5"
      Crit2 = "Applicant's did not fail more than 4 courses"
      Crit3 = "Applicant's has a Bachelor of Science degree";
Datalines;
P00851 Met Met Met
P00852 Met NotMet Met
P00853 Met Met Met
P00854 NotMet NotMet NotMet
P00855 Met Met NotMet
P00856 Met Met Met
P00857 NotMet Met Met
P00858 Met NotMet Met
P00859 Met Met Met
P00860 Met Met Met
;

*-----------------------------------------------------------------------------------------------------
*-----------------------------------------------------------------------------------------------------

(Q5) Assign the appropriate formats to the Date, Time and Total variable. 
Create any data set or variable if needed;

Data Transac;
Input Order $ Date Time Total;
Datalines;
BA00001 19000 40143 1432
BA00002 19000 51865 1455
BA00003 19000 68954 2435
BA00004 19000 49865 894
BA00005 19000 53214 1745
BA00006 19000 64521 997
BA00007 19000 74521 562
BA00008 19000 56321 132
BA00009 19000 51236 987
BA00010 19000 45698 562
;
Run;


Data trans;
set Transac;
format Date mmddyy10. Time time10. Total Dollar5.;
run;
*-----------------------------------------------------------------------------------------------------
*-----------------------------------------------------------------------------------------------------
(Q6)Display the NUM1 variable at 4 decimal places;

Data RNumber;
Input Num1;
Datalines;
23483.8492342
432.2348934
5489345.23423
432.53242
98349.2343
45893495.2343
45489.3454
6845984.234
58498349.543
25484.23545
;
Run;

Data Num;
set RNumber;
Format Num1 13.4; 
run;
*-----------------------------------------------------------------------------------------------------
*-----------------------------------------------------------------------------------------------------
(Q7)The sales tax is 14.75%.Create a new variable that computes the total after tax:
Total(After tax) = Total(Before tax) x 14.75%. Display the after-tax total at 2 decimal places;

Data Transac;
Input Order $ Date Time Total;
Datalines;
BA00001 19000 40143 1432
BA00002 19000 51865 1455
BA00003 19000 68954 2435
BA00004 19000 49865 894
BA00005 19000 53214 1745
BA00006 19000 64521 997
BA00007 19000 74521 562
BA00008 19000 56321 132
BA00009 19000 51236 987
BA00010 19000 45698 562
;
Run;

Data sales_tax;
set Transac;
total_tax = Total * 14.75;
Format total_tax  dollar9.2;
run;

*-----------------------------------------------------------------------------------------------------
*-----------------------------------------------------------------------------------------------------
(Q8)Find out the dates for the next appointments.
Given >> Date: Date of current visit​, Time: Time of current visit, NumDays: The number of days for the next appointment;

Data DenAppt;
Input Date Time NumDays;
Format Date yymmdd10. time time5.;
Datalines;
20100 30000 30
20110 40000 60
20115 46000 14
20103 36000 90
20120 42000 60
20117 44000 30
20111 38000 14
20109 37000 21
20102 33000 28
;
Run;

Data appointment;
set DenAppt;
app_date = Date + NumDays;
format app_date date11.;
run;
*-------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
(Q9)The date and time variables are not formatted properly.
1. Format the Date and Time variables with the proper formats. 
2. An employee is considered late if they arrive after 9 a.m. Find out which employee is late;

Data Attendance;
Input EmpID $ Date In Out;
Datalines;
ID501 20010 28800 61200
ID502 20010 30400 63200
ID503 20010 29800 61800
ID504 20010 33600 61700
ID505 20010 27800 60200
ID506 20010 29400 61900
ID507 20010 29300 61850
ID508 20010 31600 62930
ID509 20010 32400 62300
ID510 20010 31200 61590
;
Run;

Data att;
set Attendance;
format Date mmddyy10. In Out time8.;
If In>32400 then Late = "Yes";
Run;
*-------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
(Q10) The Gender and Race are stored under a character variable, which is not preferred in the analysis.
Create two new variables for Gender and Race that contain the Gender and Race information in numeric values. 
Assign a proper format to the newly created variables; 

Data Profile;
Length ID Gender Race $20.;
Input ID Gender $ Race $;
Datalines;
ID001 Male Caucasian
ID002 Female Asian
ID003 Female Black
ID004 Male Asian
ID005 Male Caucasian
ID006 Female Caucasian
ID007 Male Black
ID008 Female Black
ID009 Male Caucasian
ID010 Male Caucasian
;
Run;

Proc Format;
Value Gender 1 = "Male"
2 = "Female";
Value Race 1 = "Caucasian"
2 = "Black"
3 = "Asian";
Run;

Data Profile2;
Set Profile;
Format Gender2 Gender. Race2 Race.;
If Gender = "Male" then Gender2 = 1;
else if Gender = "Female" then Gender2 = 2;
If Race = "Caucasian" then Race2 = 1;
else if Race = "Black" then Race2 = 2;
else if Race = "Asian" then Race2 = 3;
Drop Gender Race;
Run;

*-------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
(Q11) The variables Q1 to Q4 are formatted with the (QUES.) format.
However, you need to find out the coded values before conducting the analysis.
Format the variables Q1, Q2, Q3 and Q4 so that they show the internal values stored in SAS.
Create any data set or variables if needed;

Proc Format;
Value Ques
1 = "Strongly Disagree"
2 = "Disagree"
3 = "Neutral"
4 = "Agree"
5 = "Strongly Agree";
Run;

Data Survey;
Input Q1 Q2 Q3 Q4;
Format Q1 Q2 Q3 Q4 Ques.;
Datalines;
3 1 2 4 5
1 1 1 1 1
5 3 5 5 5
4 5 3 2 2
1 3 5 4 5
2 3 5 4 5
3 4 5 2 3
2 4 1 3 5
5 4 4 4 4
1 1 2 5 4
;
Run;

Data Survey2;
Set Survey;
Format Q1 Q2 Q3 Q4 best.;
Run;
*-------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
(Q12) Before receiving the treatment, each patient must sign a form of informed consent.
The informed consent form should provide adequate information for the patient to make an 
informed decision about the participation of the treatment.
As a clinical researcher, you noticed that some patients received treatments before they sign the informed consent form.
Find out which patient violated the procedure. Create a data set that contains the Patient ID, as well as a comment in the structure below:
Patient xx received his/her first treatment on MM-DD-YYYY. However, the treatment is received prior to the date of informed consent (MM-DD-YYYY)."
variables : PATID: Patient ID, INFDT: Date of Informed Consent, TRTDT: Date of Treatment;

Data Trtment;
Input PATID $Infdt TrtDt;
Format Infdt Trtdt Date9.;
Datalines;
PAT1001 20100 20102
PAT1002 20101 20102
PAT1003 20103 20102
PAT1004 20102 20102
PAT1005 20100 20102
PAT1006 20101 20102
PAT1007 20103 20102
PAT1008 20100 20102
PAT1009 20102 20102
PAT1010 20100 20102
;
Run;

Data treat;
set Trtment;
format Infdt TrtDt date11. ;
length comment $ 190;
if Infdt gt TrtDt then comment = "Patient " ||PATID|| "received his/her first treatment on "||Put(TrtDt, MMDDYY10.)|| ". However, the treatment is received prior to the date of informed consent(" || put(Infdt, MMDDYY10.) || ").";
Keep Patid comment;
Run;


*-------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
(Q13)Convert the AMOUNT variable into numeric using the Input function.;

Data Char;
Length Date $12 Time $8 Amount $15;
Input Date $ Time $ Amount $;
Datalines;
2015-01-01 8:00:00 $10,100
2015-01-02 8:05:00 $9,500
2015-01-03 8:05:00 $12,600
2015-01-04 8:10:00 $12,800
2015-01-05 8:15:00 $13,100
2015-01-06 8:05:00 $11,700
2015-01-07 8:03:00 $15,900
2015-01-08 8:02:00 $15,400
2015-01-09 8:04:00 $14,200
2015-01-10 8:05:00 $13,400
;
Run;

Data amount;
set Char;
amount_out = input(amount,dollar8.);
run;


