#!/bin/sh
#script2



#awk -F " " '{print $1}' future.txt > tmp.txt      

today=$( date '+%Y-%m-%d') 
result=$(grep "$today" tmp.txt)
#echo $result

if [ -n "$result"  ]    
then
        
       i=1;  
      while [ $i -le 90 ]
      do 
 
                 v=$(awk -v "j=$i" 'NR != j {next}1' alphausers.txt)

      grep "today" future.txt >> ./alphaQ/$v/schedule.txt
      awk '{$1 = sprintf("%-20s", $1)} 1' ./alphaQ/$v/schedule.txt > tmp1.txt
                  cat tmp1.txt > ./alphaQ/$v/schedule.txt
             
    

fi     
