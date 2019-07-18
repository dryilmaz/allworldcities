#/bin/bash
cd /home/dyilmaz/Desktop/allworld2/deneme
ls  | while read filename
do
   newfile=$(echo $filename | sed 's/[^A-Za-z0-9_.]/-/g;s/-*-/-/g;s/^-//;s/-$//' )
   oldfile=$(echo $filename| sed "s/ /\\ /g")
   if [ "$filename" != "$newfile" ]
   then
     ls -l "$oldfile"
     mv -f "$oldfile"  "$newfile"
     ls -l "$newfile"
   fi
   sed -i 's/{/"/g' $(echo $filename)
   sed -i 's/}/"/g' $(echo $filename)
   sed -i 's/\\//g' $(echo $filename)
   sed -i 's/"""/""/g' $(echo $filename)
   tr -d '\n' < $(echo $filename) > 1_$(echo $filename)
done

#sed -i 's/{/"/g' Afghanistan
#sed -i 's/}/"/g' Afghanistan
#sed -i 's/\\//g' Afghanistan
#sed ':a;$!{N;s/\n//;ba;}' Afghanistan > ./new_cen/Afghanistan


#change all file names without any characters
