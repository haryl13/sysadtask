#!/bin/bash

 chmod 777 job.sh
 
i=1;  
while [ $i -le 90 ]
do 
 
v=$(awk -v "j=$i" 'NR != j {next}1' alphausers.txt)
  
  touch ./alphaQ/$v/schedule.txt
  echo "date time" > ./alphaQ/$v/schedule.txt

i=`expr $i + 1`    
done



echo "0 0 * * * sh /job.sh" >> crontab_new

crontab crontab_new
cat /dev/null > crontab_new













############################################################################################



