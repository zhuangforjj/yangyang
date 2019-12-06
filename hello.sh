#!/bin/bash

parse_picture(){  														  #使用方法 ./hello.sh 文件夹的绝对路径
    echo $1
    for file in $1/*
		do
		if test -f $file
		then
			name=`echo "$file" | sed 's/\(.*\)\/\/\(.*\)/\2/'`			  #截取文件下文件的名字			
			dir_name=`echo "$file" | sed 's/\(.*\)_\(.*\)_\(.*\)\.\(.*\)/\2/'`   #截取文件名中间字符串的名字
			if [ -d "$1/$dir_name" ];then								  #判断文件夹是否存在
				echo "$1$dir_name文件夹存在"
				cp $file $1$dir_name
			else
				echo "$1$dir_name文件夹不存在"
				mkdir $1/$dir_name
				cp $file $1$dir_name
			fi
			arr=(${arr[*]} $name)
		fi
    done
}



parse_picture $@
echo ${arr[@]}
