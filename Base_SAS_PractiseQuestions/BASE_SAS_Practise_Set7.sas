*=========================================================================================
Question - 1
*=========================================================================================
*Write a SAS program to extract the numeric exam result from the COMMENT variable. 
Use the INDEXC function instead of the INDEX function when performing the extraction;

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

Data math;
set MathExam;
Ind = Indexc(Comment, "1234567890");
Result = substr(Comment, ind);
Run;

*=========================================================================================
Question - 2
*=========================================================================================
The SYMPTOMS data set contains 2 variables:- Sickness: Type of sickness, Symptoms: The symptoms from each sickness
Write a SAS program to find out which sickness(s) causes fatigue as a symptom.
Please note that the symptoms are not reported in a standardized case;

Data Symptoms;
Infile datalines dsd dlm="~";
Length Sickness $15 Symptoms $100;
Input Sickness $ Symptoms $;
Datalines;
Nausea~headache,vomiting,Dizziness,lightheadedness,Diarrhea,abdominal pain
Asthma~Coughing,shortness of breath,Chest Tightness,Wheezing
Diabetes~Weight change,Extreme FATIGUE,Unusual thirst,frequent urination
Hepatitis~fatigue,poor appetite,belly Pain,Mild fever
;
Run;

Data sym;
set Symptoms;
Up = Upcase(Symptoms);
Ind = Index(Up, "FATIGUE");
Run;

*Fatigue is identified as a symptom if the IND variable returns a non-zero value (e.g. 23, 1)
*===============================================================================================
Question - 3
*=========================================================================================
Locate the MARGARIN data set from the SASHELP library.
The MARGARIN data set contains 7 variables.
Write a SAS program to create a data set that contains only the HOUSEID, CHOICE and BRAND variables. 
Rename the HOUSEID variable to just ID;

Data mar;
set SASHELP.MARGARIN ;
keep  HOUSEID CHOICE BRAND;
rename HOUSEID = ID;
run;

*===============================================================================================
Question - 4
*==============================================================================================
Locate the CARS data set from the SASHELP library.
Write a SAS program to classify each car as either Economy or Luxury. 
The Economy cars have the MSRP (Manufacturer's Suggested Retail Price) below $40,000. 
The Luxury cars have the MSRP above $40,000;

Data cars;
set sashelp.cars(keep = make MSRP) ;
if MSRP lt 40000 then car = 'Economy';
else if MSRP gt 40000 then car = 'Luxury';
run;
*OR;

if msrp < 40000 then Class = "Economy";
else Class = "Luxury";

*Saving Lux & Economy cars to diff datasets and finding the counts;

Data carseco carslux;
set sashelp.cars(keep = make MSRP) ;
if MSRP lt 40000 then output carseco;
else if MSRP gt 40000 then output carslux;
run;

*To find counts;
proc contents data = carseco;
run;

proc contents data = carslux;
run;

*OR;

title'economy cars';
proc print data = carseco  n;
run;

title'lux cars';
proc print data =  carslux n;
run;

*===============================================================================================
Question - 5
*===============================================================================================
The PHONEBILL data set contains 4 variables related to the mobile phone usage:

BillNo: Bill Number
Minutes: Number of minutes used
Messages: Number of text messages sent and received
Data: The amount of data used (in MB)
The $30 monthly plan includes 200 minutes, 25 text messages and 1000 MB data usage.

Below is the additional charges incurred when the usage exceeds the monthly limit:

Minutes: $0.1 per minute when over 200 minutes
Messages: $0.5 per message when over 25 messages
Data: $0.05 per MB when over 1000 MB
Write a SAS program to calculate the total amount for each bill;


Data Phonebill;
Input BillNo $ Minutes Messages Data;
Datalines;
B001 238 15 670
B002 323 39 1300
B003 89 2 230
B004 124 22 890
B005 156 34 1290
B006 122 22 1180
B007 211 26 450
B008 189 28 990
B009 123 23 220
B010 101 7 330
;
Run;

Data bill;
set Phonebill;
Base = 30;
Add_Min = Max(Minutes-200, 0);
Add_Meg = Max(Messages-25, 0);
Add_Dat = Max(Data-1000, 0);
run;
Amount = 30 + Add_Min*0.1 + Add_Meg*0.5 + Add_Dat*0.05;
Run;

*===============================================================================================
Question - 6
*===============================================================================================
The RACE data set contains 6 variables related to a car racing event.

CAR: Car ID Number
Lap1: Lap 1 Completion Time
Lap2: Lap 2 Completion Time
Lap3: Lap 3 Completion Time
Lap4: Lap 4 Completion Time
Lap5: Lap 5 Completion Time
Write a SAS program to calculate the average completion time for each car;

Data Race;
Input Car $ Lap1 Lap2 Lap3 Lap4 Lap5;
Datalines;
CAR001 390.31 410.9 460.8 380.56 470.27
CAR002 410.19 440.99 390.61 400.14 430.62
CAR003 420.86 410.68 400.61 390.29 460.16
CAR004 390.65 380.87 430.19 380.82 470.54
CAR005 420.62 430.82 430.15 400.95 430.33
;
Run;

Data car;
set race;
avgtime = mean(of lap1-lap5); *OR avgtime = mean(lap1,lap2,lap3,lap4,lap5);
run;

*===============================================================================================
Question - 7
*===============================================================================================
The EXPENSE data set contains a list of expense claims from a company's accounting department.
The accounting department is carrying out an audit on the expense claims. 
They'd like to randomly select a sample of the claims requested for auditing purposes.
Write a SAS program and randomly assign an integer to each claim. The integer should be:
randomly generated based on a uniform distribution
between 1 to 10 (inclusive)
The claims that are assigned the integer of five (5) will be selected for auditing purposes.
The final data set should includes ONLY the claims that are assigned the integer value of 5;

*Run the code before working on this exercise;

Data Expense;
do i = 101 to 200;
Claim = "CLAIM" || put(i, 3.0);
output;
end;
drop i;
Run;


Data Expense2;
Set Expense;
RandInt = Floor(Rand('uniform')*10) + 1;
If RandInt = 5;
Run;


*===============================================================================================
Question - 8
*==============================================================================================

The DATE data set contains the date of marriage information from a list of survey participants:

ID: Survey Participant's Identification
BIRTHDATE: Date of Birth
MARRIAGEDATE: Date of marriage
To calculate the marriage age for each participant, we can use the equation below:

Age of Marriage = (Date of Marriage - Date of Birth)/365.25

However, the age must be rounded down to the nearest integer.

Write a SAS program to calculate the marriage age for each survey participants.
*Run the code before working on this exercise;

Data Date;
Input ID $ BirthDate MarriageDate;
Format BirthDate MarriageDate yymmdd10.;
Datalines;
ID001 4423 19215
ID002 3234 19216
ID003 3242 19215
ID004 5124 19217
ID005 4921 19216
ID006 2772 19215
ID007 4212 19216
ID008 3821 19215
ID009 2412 19216
ID010 4124 19217
;
Run;

Data Dat;
set Date;
Age_Marriage = floor ((MarriageDate - BirthDate)/365.25);
run;
*========================================================================================
Question - 9
*=========================================================================================
The NAME data set contains a list of names.
Write a SAS program to extract the first name and last name from the Name variable;

Data Name;
Infile Datalines dlm=",";
Length Name $30;
Input Name $;
Datalines;
Nancie Strohl
Janee Salvaggio
Annabelle Schwanke
Marybelle Holtsclaw
Art Dahlen
Barrie Bianco
Barbera Deltoro
Launa Gaudreau
Isabelle Tiernan
Annamae Bellin
;
Run;

Data nam;
set Name;
first = scan(Name,1);
last = scan(Name,2);
run;

*OR;

Data Name1;
Set Name;
Ind_space = indexc(Name, " ");
First = substr(Name, 1, Ind_Space-1);
Last = substr(Name, Ind_Space);
Run;
*========================================================================================
Question - 10
*=========================================================================================
The PRODUCT data set contains a list of UPC (Universal Product Code) barcode.
The UPC-A is the most common form of barcode used in North America. 
It consists of 12 numerical digits. 
The first digit of the barcode represents the product type:

2 = Meats, Fruits, Vegetables
3 = Drug
4 = Loyalty Card
5, 9 = Coupon
0, 1, 6, 7, 8 = General
Write a SAS program to classify the products based on the first digit of the UPC barcode;
*=======================================================================================;
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

Data Product2;
Set Product;
Length class $30;
d1 = substr(barcode, 1, 1);
if d1 = 2 then class = "Meat, Fruits, Vegetables";
else if d1 = 3 then class = "Drug";
else if d1 = 4 then class = "Loyalty Card";
else if d1 = 5 or d1 = 9 then class = "Coupon";
else if d1 in (0, 1, 6, 7, 8) then class = "General";
Run;