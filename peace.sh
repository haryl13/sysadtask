

touch file1a.txt
touch file2a.txt
touch file3a.txt     #after removing duplicate lines

awk '!seen[$0]++' file1.txt > file1a.txt
awk '!seen[$0]++' file2.txt > file2a.txt
awk '!seen[$0]++' file3.txt > file3a.txt
v=$(awk -F "," '{print $2 }' file1a.txt | awk 'BEGIN { ORS = " " }{ print }')



for x in $v
do 
  sal=$(grep "$x" file2a.txt | awk -F "," '{print $2}')      #salary match with emp Id of file1
  
  awk -F "," -v "empid=$x" -v "salary=$sal" '{if (empid == $2) print $2"\t"$1"\t"$3"\t"salary }' file1a.txt >> int.txt
  
  done
  
  
u=$(awk -F "," '{print $3 }' file1a.txt | awk 'BEGIN { ORS = " " }{ print }')  
for t in $u
do 
   year=$(grep "$t" file3a.txt | awk -F "," '{print $3}')
   
   awk -F " " -v "yr=$year" -v "phno=$t" '{if (phno == $4 ) print $1"   "$2" "$3"   "$4"   "$5"   " yr }' int.txt >> file4.txt
   done
