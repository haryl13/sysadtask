#!/bin/bash
touch war.txt

#organizing users and dates in tempervory file 
awk -F "," '{print $1}' atd.txt | awk -F " " '{print $1"\t"$3}' > war.txt
#reading dates
read -p 'enter first date in YYYY-MM-DD format ' date1
read -p 'enter second date in YYYY-MM-DD format ' date2

if [ -z "$date1" -a -z "$date2" ]                          #if  date not input is given
 then 
			   touch war.txt

			 #organizing users and dates in tempervory file 
			 awk -F "," '{print $1}' atd.txt | awk -F " " '{print $1"\t"$3}' > war.txt
			 
			 var2=$(awk '{print $2}' war.txt | uniq | awk 'BEGIN { ORS = " " }{print }')  #list of dates
			 
			 
			 
			 
			 touch abs.txt
			 touch tmp.txt
			 touch tmp1.txt
			 for v in $var2
			 do 
				prst=$(grep "$v" war.txt | awk '{print $1}' | awk 'BEGIN { ORS = " " }{print }')  #list of present on date v
				 
				 touch $v.txt
				
				cp alphausers.txt $v.txt      
			      
			      for var in  $prst                           #making list of absentees in date.txt
				     do
			   
					  sed "s|$var||g" $v.txt > tmp.txt;
					   grep . tmp.txt > tmp1.txt
					   mv tmp1.txt tmp.txt 
					   cat /dev/null > tmp1.txt ;
					   mv tmp.txt $v.txt
					     cat /dev/null > tmp.txt ;
			  
					 done
					 
			       awk -v "date=$v" '{ print $0,date}' $v.txt > tmp.txt
			       cat tmp.txt >> abs.txt
			       cat /dev/null > tmp.txt ;           
			done 

			abs=$(awk -F " " '{print $1}' abs.txt | sort -u -k1,1 | awk 'BEGIN { ORS = " " }{print }')  #list of absentees
			 
			  for dom in $abs
			     do   
				  echo -e "$dom\n\n" >> absentees.txt
				 grep "$dom" abs.txt | awk  '{print $2}' >> absentees.txt              
			      done                     
			echo "absentees and dates when they are absent are "
			cat absentees.txt

else



		touch prs.txt
		cp alphausers.txt prs.txt   
		 
		var1=$(awk -v "start=$date1" -v "stop=$date2" '{if($2 > start && stop > $2) print $1}' war.txt | awk 'BEGIN { ORS = " " }{print }')  
		                                                                                                    #var1=list of users who were present

		  
		#making list of absentees between the two dates
		for var in  $var1
		do
		   
		 sed "s|$var||g" prs.txt > tmp;
		  mv tmp prs.txt
		  cat /dev/null > tmp ;
		  
		done
		echo "absentees between the given dates are "
		cat prs.txt

fi
