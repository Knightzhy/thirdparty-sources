#!/bin/sh

diff Makefile ~/projects/sources/thirdparty/sources/Makefile | grep '< $(eval' | awk -F',' '{print $2,$3,$4}'| awk -F')' '{print $1}' > new

echo > new2
while read line
do
    md5=`echo $line | awk '{print $1}'`
    filename=`echo $line | awk '{print $2}'`
#   url=`cat $line | awk '{print $3}'`
    echo $md5,$filename

    if [ -f $filename ] ; 
    then 
        m=`md5sum $filename | awk '{printf $1}'`
        echo $m;

        if [ "$m" == "$md5" ]; 
        then 
            echo ok;
        else 
            echo has no $filename; 
            echo $line >> new2
        fi ; 

    else
        echo has no $filename; 
        echo $line >> new2
    fi;
done < new


