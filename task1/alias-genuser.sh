#!/bin/bash

#creating useracc 

sudo useradd jay_jay
sudo usermod -aG sudo jay_jay
touch alphausers.txt
dom="sysAd_ appDev_ webDev_"

for var in $dom
do 
 i=1;
  while [ $i -le 30 ]
   do

     name="$var$i"
   if [ $i -le 9 ]
   then
        echo "$var"0"$i" >>alphausers.txt
    else 
         echo $name >>alphausers.txt
    fi        
        
    i=`expr $i + 1`
   done
done
  
  v=$(awk 'Begin { ORS = " " }{print }' alphausers.txt)
i=1
for var in $v
do 
     
    users[$i]="$var"
    i=`expr $i + 1`
done
    
   
   
#adding users
mkdir ./alphaQ
for x in "${users[@]}"
 do
      sudo useradd $x
      
      
      mkdir ./alphaQ/$x
      sudo usermod -d ./alphaQ/$x $x
      chmod 770 ./alphaQ/$x
      setfacl -m jay_jay:rwx ./alphaQ/$x
      setfacl -m $x:rwx ./alphaQ/$x
 done   

 

    
