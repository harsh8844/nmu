1) Shell program to print reverse of command line argument
for i in $*
do
echo $i>>a
done
c=$#
while [ $c -gt 0 ]
do
rev=`head -$c a|tail -1`
echo $rev
c=`expr $c - 1`
done
rm a
Output
sh reverse.sh 1 2 3 a b c
c
b
a
3
2
1






2)Shell program to find factorial of given number

echo enter the number
read n
fact=1
while [ $n -ge 1 ]
do
fact=`expr $fact '*' $n`
n=`expr $n - 1`
done
echo $fact

Output
sh factorial.sh
enter the number
6
720
OR
enter the number
5
120
.





3)Shell program to perform arithmetic operation using case statement

echo enter any two numbers
read a b
i=1
while [ $i -le 50 ]
do
echo "1.Addition"
echo "2.Substraction"
echo "3.Multiplication"
echo "4.Division"
echo "5.Exit"
echo enter your choice
read ch
case $ch in
1)c=`expr $a + $b`
  echo The addition is $c
  ;;
2)c=`expr $a - $b`
  echo The substraction is $c
  ;;
3)c=`expr $a '*' $b`
  echo The multiplication is $c
  ;;
4)c=`expr $a / $b`
  echo The division  is $c
  ;;
5)exit
;;
*) echo "Enter proper value"
;;
esac
i=`expr $i + 1`
done

Output
sh arith.sh 
enter any two numbers
3 5
1.Addition
2.Substraction
3.Multiplication
4.Division
5.Exit
enter your choice
1
The addition is 8








4)Check given string is palindrome or not

clear
echo enter the string
read str
l=`echo $str|wc -c`
while [ $l -gt 0 ]
do
t=`echo $str|cut -c$l`
rev=`echo $rev$t`
echo $rev
l=`expr $l - 1`
done
echo reverse string is $rev
if [ $str == $rev ]
then
echo string is palindrom
else
echo string is not palindrom
fi

Output
sh string.sh 
enter the string
nitin

n
ni
nit
niti
nitin
reverse string is nitin
string is palindrome

enter the string
111

1
11
111
reverse string is 111
string is palindrom






5)--Shell program to find sum of digit of given.....

echo "Enter the number-"
read n
sum=0
while [ $n -gt 0 ]
do
 r=`expr $n % 10`
 sum=`expr $sum + $r`
 n=`expr $n / 10`
done
echo $sum

Output

sh sumofdogit.sh
Enter the number-
132
6
OR
Enter the number-
333
9








6) Write and execute a LINUX shell program that presents multiple choices question, gets the user's answer and reports back whether it is right or wrong. Finally it shall display the score

clear
echo Questions:
sc=0

echo "1 : Which Is The Capital Of India ? "
echo " Options : a) Delhi b) Mumbai c) Nagpur d) Dhule"
read key

if test $key = "a"
then
echo "Your Answer Is Correct "
sc=`expr $sc + 10`
else
echo "Your Answer Is Incorrect "
fi

echo "2 : Which Is The Largest River In World ? "
echo " Options : a) Ganga b) Yamuna c)Nile d)Panzra"
read key

if test $key = "c"
then
echo "Your Answer Is Correct "
sc=`expr $sc + 10`
else
echo "Your Answer Is Incorrect "
fi

echo "3 : How Many Keywords In C Language ? "
echo " Options : a) 40 b) 32 c) 33 d)34 "
read key

if test $key = "b"
then
echo " Your Answer Is Correct "
sc=`expr $sc + 10`
else
echo " Your Answer Is Incorrect "
fi
if [ $sc -gt 0 ]
then
echo "Congratulation"
echo "Your Score :  $sc "
else
echo "Sorry"
echo "Your Score :  $sc"
fi

Output
sh question.sh

Questions:
1 : Which Is The Capital Of India ?
 Options : a) Delhi b) Mumbai c) Nagpur d) Dhule
a
Your Answer Is Correct
2 : Which Is The Largest River In World ?
 Options : a) Ganga b) Yamuna c)Nile d)Panzra
b
Your Answer Is Incorrect








7)  Linux shell program which simulate at least 5 DOS command

echo "dir"
echo "date"
echo "del"
echo "cls"
echo "md"
echo "exit"

while [ 1 ]                   # While condition is always true if write 1 
do
echo -e "C:\>"
read n
case $n in
dir) ls  ;;
date) date ;;
del) echo -e "\n\n Enter the file name which you want to delete"
read fn
rm -i $fn
ls ;;
cls) clear ;;
md) echo -e "\n\n Give new directory name"
read d
mkdir $d
ls ;;
exit) exit ;;
*) echo Entered Wrong Command
esac
done


Output
[root@localhost ~]# sh doscmd
dir
date
del
cls
md
exit

C:\>
date
Wed Oct 10 21:09:26 IST 2012
C:\>
md

Give new directory name
Amit

C:\>
del

Enter the file name which you want to delete
Mca


C:\>
Dir

amit               demo1                lll                    primeno
amit1              Desktop             ls                     printperonly
ASD                f1                   nilesh                 tal
atr                    f2                   odd                    temp






 8) Write shell program get rollno, name and marks of different three file and 
calculate total and average in proper format

i=1
tot=0
n=` cat f1 |wc -l `
echo -e "\n----------------------------MARKSHEET-----------------------------"
echo -e "\n\tRno\tName\tMark1\tMark2\tMark3\tTotal\tAvg\t "
while [ $i -le $n ]
do
rn=` cat f1 | head -$i | tail -1 | cut -d " " -f1 `
nm=` cat f2 | head -$i | tail -1 | cut -d " " -f2 `
m1=` cat f3 | head -$i | tail -1 | cut -d " " -f2 `
m2=` cat f3 | head -$i | tail -1 | cut -d " " -f3 `
m3=` cat f3 | head -$i | tail -1 | cut -d " " -f4 `
tot=` expr $m1 + $m2 + $m3 `
avg=` expr $tot / 3 `
echo -e "\n\t$rn\t$nm\t$m1\t$m2\t$m3\t$tot\t$avg"
i=` expr $i + 1 `
done


Out put 
[root@localhost amit]# cat f1
10
20
30

[root@localhost amit]# cat f2
10 rahul
20 manoj
30 rani

[root@localhost amit]# cat f3
10 40 50 60
20 37 56 78
30 67 89 98

[root@localhost amit]# sh marksheet

----------------------------MARKSHEET-----------------------------

        Rno     Name    Mark1   Mark2   Mark3   Total   Avg

        10      rahul          40         50          60        150      50

        20      manoj        37         56          78         171      57

        30      rani             67         89         98         254      84









 9) write and execute a LINUX shell program which counts number of words
 from each file of the current directory and create a summary file with
 following details

Files with words <=100
Files with words >100 and <500


clear
echo "Files With Words <= 100 Are" >> sumary
echo
for i in *
do
if [ -f $i ]
then
words=`cat $i | wc -w`
if [ $words -le 100 ]
then
echo $i         $words  >> sumary
fi
fi
done
echo
echo "Files With Words  > 100  & < 500 Are"  >> sumary
echo
for i in *
do
if [ -f $i ]
then
words=`cat $i | wc -w`
if [ $words -gt 100 -a $words -lt 500 ]
then
echo $i         $words  >> sumary
fi
fi
done

Output
[root@localhost amit]# sh CntWordFile

[root@localhost amit]# cat summary

Files With Words <= 100 Are
arith 54
arithcase 79
arithmatic 40
atr 49
binary 91
weight 62
year 26

Files With Words  > 100  & < 500 Are
CntWordFile 128
marksheet 146
que_ans 207
sumary 113
summaryword 185
vowel 154








10) WSP Enter the file name by command line and check give name is file,
 if it is file then removes interactively


if [ -f $* ]
then
echo "Give name is file"
rm -i $*
else
if [ -d $* ]
then
echo "Given name is directory."
else
echo "It is not valid directory or file name"
fi
fi

Output
[root@localhost amit]# sh  cmdremove  demo
Give name is file
rm: remove regular file `demo1'? y

[root@localhost amit]#









11) Shell program enter two numbers and calculate GCD of give number

echo Enter two numbers
read n1
read n2
while [ $n1 -ne $n2 ]
do
if [ $n1 -gt $n2 ]
then
n1=`expr $n1 - $n2`
else
n2=`expr $n2 - $n1`
fi
done
echo GCD of given number is  $n2


Output
root@localhost amit]# sh gcd
Enter two numbers
24
54
GCD of given number is  6







 12) Linux program to receive file name & inform file is exists or not
 If it's exists then give of access permission and its size.

clear
echo enter the file name
read name
if [ -s $name ]
then
if [ -f $name ]
then
echo File is Exist
size=`ls -l $name | cut -c 25-28`
per=`ls -l $name | cut -c 2-10`
echo The size of file $size
echo The Permission of file is $per
else
echo The given is not file
fi
else
echo File Does not exist 
fi

Output
[root@localhost amit]#
enter the file name
sqr
File is Exist
The size of file 89 
The Permission of file is    rw-r--r-   

enter the file name
amit
File Does not exits 
[root@localhost amit]#








13) Linux shell program that accept 3*3 matrix and find the row and column totals

clear
echo "Enter the elements of matrix"
i=0
while [ $i -lt 9 ]
do
read mtx[i]
i=`expr $i + 1`
done
echo "The given  matrix is"
echo ${mtx[0]}" "${mtx[1]}" "${mtx[2]}
echo ${mtx[3]}" "${mtx[4]}" "${mtx[5]}
echo ${mtx[6]}" "${mtx[7]}" "${mtx[8]}
echo " "
row1=`expr ${mtx[0]} + ${mtx[1]} + ${mtx[2]}`
row2=`expr ${mtx[3]} + ${mtx[4]} + ${mtx[5]}`
row3=`expr ${mtx[6]} + ${mtx[7]} + ${mtx[8]}`

clm1=`expr ${mtx[0]} + ${mtx[3]} + ${mtx[6]}`
clm2=`expr ${mtx[1]} + ${mtx[4]} + ${mtx[7]}`
clm3=`expr ${mtx[2]} + ${mtx[5]} + ${mtx[8]}`

totalrow=`expr $row1 + $row2 + $row3`
totalclm=`expr $clm1 + $clm2 + $clm3`
echo "The Addition of total row is:"
echo $totalrow
echo "The Addition of totalclm is:"
echo $totalclm

Output

[root@localhost amit]# sh mat_add

Enter the elements of matrix
3
3
3
3
3
3
3
3
3
The given  matrix is
3 3 3
3 3 3
3 3 3

The Addition of total row is:
27
The Addition of totalclm is:
27








14) Find sum and average of the command line argument

sum=0
for i in $*
do
sum=`expr $sum + $i`
done
avg=`expr $sum / $#`
echo The Total is $sum
echo The Average is $avg

Output

[root@localhost amit] #  sh sumavg 10   3
The Total is 13
The Average is 6







15) LINUX Shell program to count and print total number of files from given directory.
 The program should count files in subdirectories also which in turn may contain 
files and subdirectories


line=`ls -l | wc -l`
i=2
cnt=0
cnt0=0
cnt1=0
cnt2=0
while [ $i -le $line ]
do
fn=`ls -l | head -$i |tail -1 |cut -c 46-`
if [ -f $fn ]
then
cnt=`expr $cnt + 1`
else [ -d $fn ]
cnt1=`expr $cnt1 + 1`
cd $fn
echo `pwd`
ln=`ls -l |wc -l`
j=2
while [ $j -le $ln ]
do
fm=`ls -l | head -$j |tail -1 |cut -c 46-`
if [ -f $fm ]
then
cnt0=`expr $cnt0 + 1`
else [ -d $fm ]
cnt2=`expr $cnt2 + 1`
fi
j=`expr $j + 1`
done
echo ********Result Of Subdirectory*******
echo -e "\n Number of files in subdirectory  =$cnt0"
echo -e "\n Number of dir in sub dir is  =$cnt2"
cd ..
fi
i=`expr $i + 1`
done

echo ********Result Of Directory*******
echo -e "\n Number of Files are =$cnt"

echo -e "\n Number of Directory are =$cnt1"

Output

[root@localhost amit]# sh cnt_dir_file_subdir
/root/amit/dd
********Result Of Subdirectory*******

 Number of files in subdirectory =3

 Number of dir in sub dir is  =2
********Result Of Directory*******

 Number of Files are =55

 Number of Directory are =1
[root@localhost amit]#








16) Linux program to count number of words that start with vowel and
 number of articals from given file


nv=0
na=0
echo Enter File Name
read fname

nl=`cat $fname | wc -l`
i=1

while [ $i -le $nl ]
do
x=`cat $fname | head -$i | tail -1`
nw=`echo $x | wc -w`
j=1

while [ $j -le $nw ]
do
w=`echo $x | cut -d " " -f$j`
c=`echo $w | cut -c1`
j=`expr $j + 1`


if  test $w = "a" -o $w = "an" -o $w = "the" 
then
na=`expr $na + 1`
fi

if test $c = "a" -o $c = "e" -o $c = "i" -o $c = "o" -o $c = "u" 
then
nv=`expr $nv + 1`
fi
done
i=`expr $i + 1`
done
echo No. Of Words Start With Vowel=$nv
echo No. Of  Article=$na

Output

[root@localhost amit]# cat amit
a  apple.
earth  good morning
hello.
bye  bye
the
amit patil.

[root@localhost amit]# sh vowel
Enter File Name
amit

No. Of Words Start With Vowel=4
No. Of Article=2







17) Linux shell program to count number of article and sentence in give file

echo enter the file name
read fname
nl=`cat $fname | wc -l`
i=1
na=0
ctw=0
cts=0
while [ $i -le $nl ]
do
x=`cat $fname | head -$i | tail -1`
nw=`echo $x | wc -w`
j=1
nc=`echo $x | wc -c`
while [ $j -le $nc ]
do
c=`echo $x | cut -c $j`
if ! [ -z $c ]                       #The  $c  value is not null
then
if test $c = "."
then
cts=`expr $cts + 1`
fi
fi
j=`expr $j + 1`
done
k=1
while [ $k -le $nw ]
do
w=`echo $x | cut -d " " -f$k`
k=`expr $k + 1`
if  test $w = "a" -o $w = "an" -o $w = "the" 
then
na=`expr $na + 1`
fi
done
i=`expr $i + 1`
done
echo No. of sentence are = $cts
echo no. of articles = $na

Output

[root@localhost amit]# sh cnt_sent
enter the file name
amit

No. of sentence are = 3
no. of articles = 1








18) Shell Program print first five line and the line between 10 to 20 in given file

clear
echo Enter The File Name
read var
echo The first 5 line  is
cat $var | head -5
echo The line between 10 to 20 is
cat $var |head -20 | tail -10

Output
[root@localhost amit]# sh tal

Enter The File Name
Inputfile 

The first 5 line  is
1
2
3
4
5

The line between 10 to 20 is
11
12
13
14
15
16
17
18	
19
20






19) Find the junk file and remove this file interactively

clear
for i in *
do
if [ -f $i ]
then
s=`ls -l $i | cut -d " " -f5`
if [ $s -eq 0 ]
then
echo "$i is Junk File"
rm -i $i
fi
fi
done

Output

[root@localhost amit]# sh junk

dr is Junk File
rm: remove regular empty file `dr'? y
dr1 is Junk File
rm: remove regular empty file `dr1'? y
fg2 is Junk File
rm: remove regular empty file `fg2'? y








20) Find the Fibonacci series of given number

clear
a=0
b=1
i=3
echo Enter the no
read n
echo $a
echo $b
while [ $i -le $n ]
do
c=`expr $a + $b`
echo $c
a=$b
b=$c
i=`expr $i + 1`
done

Output
[root@localhost amit]# sh fib
Enter the no
5

0
1
1
2
3








21) To check whether number is divisible by 11 or not

echo "Enter any Number"
read n
r=`expr $n % 11`
if [ $r -eq 0 ]
then
echo $n " is divisible by 11"
else
echo $n " is not divisible by 11"
fi








