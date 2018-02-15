#! /bin/bash

read -p "Target Assets folder (../RoomAug/Assets):" base
base=${base:-../RoomAug/Assets}

exclude=( "PlatformSpecificAndroid" "PlatformSpecificAndroid.meta" "PlatformSpecificUWP" "PlatformSpecificUWP.meta"  )
mkdir -p Assets
target="Assets"

for file in ${base}/*; do
    for (( index = 0; index < ${#exclude[@]}; index++ )); do
	
        if [[ $(basename ${file}) == ${exclude[${index}]} ]]; then
        	echo "IGNORING: " ${file} ${target}/$(basename ${file})
		continue 2;
	fi
    done
    ln -s ../${file} ${target}/$(basename ${file})
done


echo "You might want to copy the ProjectSettings folder across"
