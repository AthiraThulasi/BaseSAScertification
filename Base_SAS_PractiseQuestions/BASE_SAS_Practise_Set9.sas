*(Q1) The SURVEY data set above contains 3 variables: Q1, Q2, and Q3.

Label the variables as follow:
Q1: Customer service representatives (CSRs) are well supervised.
Q2: Customer service representatives (CSRs) adhere to professional standards of conduct.
Q3: Customer service representatives (CSRs) act in my best interest.

Task 2

Create and assign a custom format to Q1, Q2, and Q3.
The format should display the data as below:

1: Strongly Disagree
2: Somewhat Disagree
3: Neither Agree nor Disagree
4: Somewhat Agree
5: Strongly Agree;

Data Survey;
Input Q1 Q2 Q3;
Datalines;
1 3 5
2 4 3
1 2 1
5 5 5
4 5 3
4 3 3
2 3 1
1 5 5
2 4 5
4 3 5
;
Run;

Data survey_out;
set Survey;
label Q1= 'Customer service representatives (CSRs) are well supervised'
Q2 = 'Customer service representatives (CSRs) adhere to professional standards of conduct'
Q3 = 'Customer service representatives (CSRs) act in my best interest';
run;

proc format ;
value likert
1 = 'Strongly Disagree'
2 = 'Somewhat Disagree'
3 = 'Neither Agree nor Disagree'
4 = 'Somewhat Agree'
5 = 'Strongly Agree'
;
run;

proc print data = survey_out label;
var Q1 Q2 Q3;
format Q1 Q2 Q3 likert.;
run;

*-----------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
(Q2) The LISTING data set contains a set of real estate data:

Adv_ID: Adv. ID
DateList: The Date the advertisement is listed
NumMth: The number of months the advertisement has been listed.
Price: Sales price of the property
You are about to analyze the relationship between the Number of months listed and the properties' sales price.
However, a junior analyst has mistakenly made all of the variables a character variable.
Convert the DateList, NumMth, and Price variable into numeric using proper informats.
Also, ensure proper formats are assigned to the numeric variables as well;

Data Listing;
Length Adv_ID DateList NumMth Price $15;
Input Adv_ID $ DateList $ NumMth $ Price $;
Datalines;
K9933-00019 01MAR2015 3 $650,000
K9933-00020 15FEB2015 2 $380,000
K9933-00021 12APR2015 4 $890,000
K9933-00022 09MAY2015 3 $890,000
K9933-00023 22FEB2015 2 $450,000
K9933-00024 08APR2015 2 $360,000
K9933-00025 03MAR2015 5 $440,000
K9933-00026 28FEB2015 3 $860,000
K9933-00027 19JAN2015 4 $740,000
K9933-00028 01JAN2015 1 $980,000
;
Run;

Data List;
set Listing;
format DateList date9. NumMth 1. Price dollar8.;
run;

Data list1;
Format DateList2 Date9. NumMth2 Best. Price2 dollar8.;
DateList2 = input(DateList, date9.);
NumMth2 = input(NumMth, best.);
Price2 = input(Price, dollar8.);
Drop DateList NumMth Price;
Run;
*-----------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
(Q3) The TEMP data set contains a list of temperatures in degree Celsius.
Convert it to Fahrenheit using the formula below:°C  x  9/5 + 32 = °F
Display the temperature in Fahrenheit at 1 decimal place;

data temp;
input hour temp;
format T 4.1;
T = (Temp * 9/5) + 32 ;
datalines;
1 19.3
2 18.1
3 19.6
4 20.7
5 22.3
6 21.4
7 19.8
8 18.1
9 16.8
10 17.1
11 17.2
12 15.6
;
run;
*-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
(Q4) Sort the DRINKS data set by FAT in descending order within each drinks type (i.e. Cold and Hot); 

Data Drinks;
Infile Datalines dsd;
Input Type $ Name:$50. Calories Fat;
Datalines;
Cold,Caramel Frappuccino® Light Blended Beverage,100,0
Cold,Coffee Frappuccino® Blended Beverage,180,2.5
Cold,Teavana® Shaken Iced Passion Tango™ Tea,0,0
Cold,Shaken Tazo® Iced Black Tea Lemonade,100,0
Cold,Nonfat Iced Vanilla Latte,120,0
Cold,Nonfat Iced Caramel Macchiato,140,1
Cold,Iced Coffee (with classic syrup),60,0
Cold,Iced Skinny Latte,70,0
Hot,Brewed Coffee,5,0
Hot,Brewed Tea,0,0
Hot,Nonfat Green Tea Latte,210,0
Hot,Nonfat Cappuccino,60,0
Hot,Nonfat Caffè Latte,100,0
Hot,Nonfat Caramel Macchiato,140,1
Hot,Soy Chai Tea Latte,180,2
Hot,Nonfat Caffè Mocha – hold the whip,170,2
Hot,Skinny Vanilla Latte,100,0
Hot,Steamed Apple Juice,170,0
Hot,Caffè Americano,10,0
;
Run;

proc sort data = Drinks out = drinks_sort;
by type descending fat;
run;

*-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
(Q5) Locate the CARS data set from the SASHelp library.
Sort the CARS data set by MSRP in descending order. Keep only BMW, Audi, Lexus, Mercedes-Benz and Porsche 
in the output data set and save the data set in the WORK library. 
Which car maker sells the most expensive car among the five?;


proc sort data = sashelp.cars out = cars_sorted;
by descending msrp;
where make in ('BMW', 'Audi', 'Lexus', 'Mercedes-Benz','Porsche');
run;


Proc print Data=cars_sorted (keep = make msrp);
Run;

*-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
(Q6) The INCOME data set contains 4 variables: HouseHoldID, NumMembers, HomeOwner, Income
Remove any duplicate observation(s) from the INCOME data set;

Data Income;
Input HouseholdID $ NumMembers HomeOwner $ Income $;
Datalines;
HID1001 4 Yes >120000
HID1002 3 No <120000 hid1003 2 yes>120000
HID1004 6 Yes >120000
HID1004 6 Yes >120000
HID1005 6 No <120000 hid1006 4 yes>120000
HID1007 5 Yes <120000 hid1008 3 yes>120000
HID1009 5 Yes <120000 hid1010 4 no>120000
;
Run;

Proc Sort Data=Income Out=Income2 NODUPKEY;
By HouseHoldID NumMembers HomeOwner Income;
Run;

*-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
(Q7) Locate the FISH data set from the SASHelp library. Identify the heaviest fish from each species ;

proc sort data = sashelp.fish out = fish_sort;
by species weight;
run;


*-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
(Q8) Remove any duplicate observation(s) from the INCOME data set;

Data Income;
Input HouseholdID $ NumMembers HomeOwner $ Income $;
Datalines;
HID1001 4 Yes >120000
HID1002 3 No <120000 hid1003 2 yes>120000
HID1004 6 Yes >120000
HID1004 6 Yes >120000
HID1005 6 No <120000 hid1006 4 yes>120000
HID1007 5 Yes <120000 hid1008 3 yes>120000
HID1009 5 Yes <120000 hid1010 4 no>120000
;
Run;

*-----------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
(Q8) Locate the CARS data set from the SASHelp library. 
Identify the most and least powerful cars (HORSEPOWER) from each car maker (MAKE).
Keep only the observations that are flagged and remove the rest of the observations;

proc sort data = sashelp.cars out = sorted_cars;
by make horsepower;
run;

Data cars;
set sorted_cars (keep = make horsepower);
by make horsepower;
if first.make then i=1;
else if last.make then i=2;
if i in(1,2);
run;

*-----------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
(Q10)Locate the PRDSAL2 and PRDSAL3 data sets from the SASHelp library. 
Concatenate the two data sets. Save the data set in the WORK library. 
How many observations are there in the combined data set? ;

Data prdsal2;
set sashelp.prdsal2;
run;

Data prdsal3;
set sashelp.prdsal3;
run;

data prd23;
set PRDSAL2 PRDSAL3;
run;

*-----------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
(Q11) The DESK1 and DESK2 data sets contain a list of IKEA products. Concatenate the two (2) data sets;

data desks1;
infile datalines dsd;
length Brand $10 category $12;
input Brand $ Category $ Price Width Depth Height;
datalines;
MICKE,Desk,59.99,73,50,75
BEKANT,Desk,179.00,140,60,65
MICKE,Work station,149.00,105,50,140
VITTSJÖ,Laptop table,39.99,100,36,74
BESTÅ BURS,Desk,199.00,120,40,74
;
Run;

data desks2;
infile datalines dsd;
length Product $12 Type $28;
input Product $ Type $ Price WGT DPT HGT;
datalines;
HEMNES,Desk with add-on unit,449.00,155,65,137
MALM,Desk with pull-out panele,179.00,151,65,73
IKEA PS 2014,Standing laptop station,69.99,45,34,96
VITTSJÖ,Laptop stand,24.99,55,65,35
MICKE,Desk with integrated storage,99.00,120,50,75
;
Run;

Data desk12;
Length Brand $12 Category $30;
Set Desks1 Desks2 (rename=(product = Brand Type = Category WGT=width DPT=depth HGT=height));
run;

*-----------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
(Q12)A local retail store wants to find out which geographic area responds the best to the marketing campaign.
They have two data sets: 
CUST: the data set that contains the customer ID and their address (zip code)
PURCHASE: the data set that contains the customer ID and the recent purchase amount
Merge the two data sets by the customer ID. 
Create any data set or variable if needed;

Data Cust;
Input ID Zip ;
Datalines;
9000135 14304
9000135 14560
9000133 14300
9000134 14301
9000138 14308
9000136 14308
9000137 14304
9000142 14304
9000139 14300
9000140 14301
9000141 14308
;
Run;

Data Purchase;
Input ID Purchase : dollar5.0;
Datalines;
9000135 720
9000135 790
9000133 1002
9000134 569
9000140 890
9000141 780
9000136 109
9000137 30
9000138 4566
9000139 50
9000142 325
;
Run;

Proc sort data = cust out=cust_sort;
by ID;
run;

Proc sort data = purchase out=pur_sort;
by ID;
run;

Data cust_pur ;
merge cust_sort pur_sort;
by ID;
run;

*-----------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
(Q13) The POPULATION data set contains the population information related to 8 metropolitan cities across North America.
The UBER data set contains the number of Uber drivers in each of the metropolitan cities.
You are interested in analyzing the ratio of Uber driver against the city's population. 
Merge the POPULATION and UBER data set and calculate the Driver to Population ratio:
Ratio = Number of Uber driver / Population. Which city has the highest Uber driver to population ratio?;

Data Population;
Input Country $ City: $30. Population;
Datalines;
Canada Toronto 6000000
Canada Montreal 4000000
Canada Vancouver 2400000
US Chicago 2700000
US New_York 8400000
US Los_Angeles 3800000
Mexico Mexico_City 8500000
Mexico Cancun 620000
;
Run;

Data Uber;
Input Country $ Cities: $30. NumDriver;
Datalines;
US Chicago 20000
US New_York 14000
US Los_Angeles 16000
Canada Toronto 13000
Canada Montreal 5000
Mexico Mexico_City 20000
Mexico Cancun 11000
Canada Vancouver 7000
;
Run;

proc sort data = Population out = pop_Sort ;
by country City;
run;

proc sort data = Uber out = uber_Sort ;
by country Cities;
run;

Data ratio;
merge uber_sort pop_Sort (rename = (city = Cities)) ;
by country Cities;
ratio = NumDriver/population;
run;

*OR;

data ratio;
merge pop_Sort uber_sort (rename=(cities=city));
by country city;
ratio = NumDriver/population;
run;
*-----------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
(Q14)The TRANSAC data set contains 3 variables: ORDER: Order numbeR, PROVINCE:province of the shipping destination
TOTAL: Total sales amount
The sales tax on each transaction depends on the province of the shipping destination.
For example, a sales tax of 13% should be added to orders shipping to Ontario. A tax of 5% should be added to orders shipping to Alberta.
The sales tax information can be found from the TAX data set. 
Task 1
Merge the TRANSAC and TAX data set by matching the province of the shipping destination. ​Flag the observations that don't match.
Task 2
Calculate the after-tax total for each transaction;


Data Transac;
Input Order $ Province : $30. Total;
Datalines;
BA00001 Ontario 1432
BA00002 Ontario 1455
BA00003 Ontario 2435
BA00004 Quebec 894
BA00005 Quebec 1745
BA00006 Quebec 997
BA00007 Alberta 562
BA00008 Alberta 132
BA00009 Alberta 987
BA00010 Manitoba 562
;
Run;

Data Tax;
Input Province : $30. Tax;
Datalines;
Ontario 13
Quebec 14.975
Alberta 5

;
Run;

proc sort data = Transac out = transac_Sort ;
by Province;
run;

proc sort data = Tax out = tax_Sort ;
by Province;
run;

Data total_tax;
merge transac_Sort(in=trans) tax_Sort(in=tax);
by province;
if trans and tax then flag = 1;
else if trans then flag = 2;
else if tax then flag = 3;
after_tax = total * (1+Tax/100);
run;

*-----------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
(Q15) The TEMP data set contains the 24-hour temperature on a particular day. 
Transpose the Temperature into 24 different columns.
Calculate the average temperature before (<12pm) and after noon (>12pm).
Create any variable or data set if needed;

Data TEMP;
Input Hours $ Temperature;
Datalines;
H0 15
H1 13
H2 13
H3 14
H4 14
H5 14
H6 13
H7 14
H8 14
H9 14
H10 14
H11 15
H12 16
H13 17
H14 16
H15 16
H16 16
H17 15
H18 15
H19 14
H20 14
H21 14
H22 14
H23 15
;
Run;

proc sort data = TEMP out = temp_sort;
by hours;
run;
 proc print data = temp_sort;
 run;
 
Proc transpose data = TEMP out = temp_out;
id hours;
var temperature;
run;


Data temp;
set temp_out;
format before12 after12 3.;
before12 = mean (H0 - H11);
after12 = mean(H12 - H23);
run;

