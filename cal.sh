#/bin/bash
cd /home/dyilmaz/Desktop/allworld2/deneme
ls | while read filename
do
  newfile=$(echo $filename | sed 's/[^A-Za-z0-9_.]/-/g;s/-*-/-/g;s/^-//;s/-$//' )
  oldfile=$(echo $filename| sed "s/ /\\ /g")
  if [ "$filename" != "$newfile" ]
  then
    ls -l "$oldfile"
    mv -f "$oldfile"  "$newfile"
    ls -l "$newfile"
  fi
done

ls | while read filename
do
  sed -i 's/{/"/g' $(echo $filename)
  sed -i 's/}/"/g' $(echo $filename)
  sed -i 's/\\//g' $(echo $filename)
  sed -i 's/"""/""/g' $(echo $filename)
  tr -d '\n' < $(echo $filename) > 1$(echo $filename)
  tr -d "[:space:]" < $(echo $filename) > 1$(echo $filename)
  sed -i 's/", "/,/g' 1$(echo $filename)
  sed -i 's/","/,/g' 1$(echo $filename)
  sed -i 's/"""/""/g' 1$(echo $filename)
  sed -i 's/""/"*"/g' 1$(echo $filename)
  sed -i 's/Missing\[\"NotAvailable\"\]/no information/g' 1$(echo $filename)
  sed -i 's/IntegerPart\[QuantityMagnitude\[no information\]\]/no information/g' 1$(echo $filename)
done
ls | while read filename
do
  mv 1$(echo $filename) 1$(echo $filename).csv
done
