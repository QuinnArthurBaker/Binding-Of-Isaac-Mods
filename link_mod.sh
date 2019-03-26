#!/bin/bash
modpath="$HOME/.local/share/binding of isaac afterbirth+ mods"

if [ -z $1 ]
then
	echo "ERROR: Please provide a mod folder name"
	exit 1
else
	modname=$1
fi

echo "Mod name is: $modname"

if [ ! -d $modname ]
then 
	echo "ERROR: Provide a directory name in the current path"
	exit 2
fi

#t="$(find . -type f -path \"./"$modname"/*\" ! -path \"./"$modname"/.git/*\")"



echo "$modpath/$modname"

dest="$modpath/$modname"
mkdir "$dest"

find . -type f -path "./$modname/*" ! -path "./$modname/.git/*" | while read line;
do
	newline=$(echo "$line" | cut -d'.' -f2,3)
	newline="$(pwd)$newline"
	
	echo "Dest is: $dest   line is $newline"
	ln -s "$newline" "$dest/"
done 
