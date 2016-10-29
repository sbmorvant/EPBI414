/***************************************

CWRU - EPBI414
Unit 8 - Introduction to SAS
Examples

Thomas A. Rehman, MA, MPH
Adjunct Instructor, School of Medicine
tar9@case.edu

***************************************/

/* Here, I am creating a temporary dataset for this example.*/
/* You should feel free to look at this, but it won't be covered until next week.*/
DATA WORK.example;
	RETAIN id name team age;
	LENGTH name $128. team $128.;
	INFILE DATALINES DELIMITER=',';
	INPUT id name $ team $ age;
	DATALINES;
	101,John Wright,Development,32
	102,Sally Smith,Development,22
	103,Robert Jeffry,Research,40
	104,Yvonne Yttries,Sales,57
	105,Corbin Ulrich,Executive,61
	106,Takeshi Sugori,Human Resources,36
	107,Michael Fasschin,Security,48
	108,Thurgood Hobin,Security,31
	109,Samson Patridies,Executive,55
	;
RUN;

/* Printing what we have now.*/
PROC PRINT DATA=example NOOBS;
RUN;

/* Now, I declare a library for this file.*/
LIBNAME EXAMPDTA "U:\Users\Tom\Desktop";

/* Next, I create a permanent dataset from the temporary one.*/
DATA EXAMPDTA.example;
	SET example;
RUN;

/* We print our new permanent dataset, then sort the temporary one and print that as well.*/
PROC PRINT DATA=EXAMPDTA.example NOOBS;
RUN;

PROC SORT DATA=example;
	BY DESCENDING age;
RUN;

PROC PRINT DATA=example;
RUN;
