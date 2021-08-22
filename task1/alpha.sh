
#!/bin/bash




pwd
ls -l


mkdir g
sudo useradd jay_jay
sudo usermod -aG sudo jay_jay
touch alphausers.txt
cat /dev/null > alphausers.txt
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

   
   
#adding users
mkdir ./alphaQ
for x in "$v"
 do
      sudo useradd $x
      
      
      mkdir ./alphaQ/$x
      sudo usermod -d ./alphaQ/$x $x
      chmod 770 ./alphaQ/$x
      setfacl -m jay_jay:rwx ./alphaQ/$x
      setfacl -m $x:rwx ./alphaQ/$x
 done   

 
######

 sudo groupadd sysAd_A 
                                                                                                                                                                                                                  sudo groupadd sysAd_B
sudo groupadd appDev_A
 sudo groupadd appDev_B
sudo groupadd webDev_A
sudo groupadd webDev_B
#adding members to grps
dom="sysAd_ appDev_ webDev_"

for var in $dom
do 
 i=11;
 
 
  while [ $i -le 30 ]
   do
      grp=$var"A" ;
      
     name="$var$i"
     sudo usermod -a -G $grp $name 
     i=`expr $i + 1`
     done
     
     
      j=21 ;
      
     grpb=$var"B" ;
     while [ $j -ge 21 -a $j -le 30 ]
     do
          name_="$var$j"
        sudo usermod -a -G $grpb $name_
        j=`expr $j + 1`
     done
       
   
done

#grp permissions to home dir

for var in $dom
do 
   i=1
   while [ $i -le 10 ]
   do  
      grp=$var"A";
      if [ $i -ne 10 ] 
      then
           username="$var"0"$i" ;
          
         chgrp -R $grp ./alphaQ/$username
          
      else
         user=$var"10";
         chgrp -R $grp ./alphaQ/$user
        fi 
        i=`expr $i + 1`
   done
       
    j=11
    while [ $j -le 20 ]
      do
          name="$var$j" ;
          grpb=$var"B" ;
          chgrp -R $grpb ./alphaQ/$name
          j=`expr $j + 1`
        done
done
        



