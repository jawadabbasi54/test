#!bin/bash 

  arr=()
 rep_arr=()
   for i in `curl 'https://ddocker-registry.goabode.com/v2/_catalog' | 
    awk '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}'`
   do
  
   image=${i##*[}
   image2=${image%%]*}
   image3=$(echo $image2|tr -d '"')
    
   for j in `curl "https://ddocker-registry.goabode.com/v2/$image3/tags/list"|
     awk '{n=split($0,a,","); for (i=2; i<=n; i++) print a[i]}'`
   do
   
   tag1=${j##*[}
   tag2=${tag1%%]*}
   tag3=$(echo $tag2|tr -d '"')
    arr+=("$image3:$tag3")
   done
   done

   
   len=${#arr[@]}
   echo $len
   for (( k=0; k<$len; k++ ))
   do 
    sudo docker pull ddocker-registry.goabode.com/${arr[$k]}
   done
 
   for (( l=0; l<$len; l++ ))
   do  
      rep_arr+=("ddocker-registry.goabode.com/${arr[$l]}")
   done
  
   sudo docker run -d -p 5005:5000 --restart always --name Backup_container registry:2
   
for (( m=0; m<$len; m++ ))
   do 
     sudo docker tag ${rep_arr[$m]} localhost:5005/${arr[$m]} 
     sudo docker push localhost:5005/${arr[$m]}
   done

#If we want to take backup of these images as a compress file, then uncommment below command
 #sudo docker save -o Abode_Images_Backup.tar ${rep_arr[@]}

 

   status=$?
 if [ $status -eq 0 ]
then
 echo 'Backup Images successfully'
else
 echo 'Backup Creation Failed'
fi

 #printf '%s\n' "${rep_arr[@]}"
