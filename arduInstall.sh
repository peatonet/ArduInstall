#!/bin/bash

#Script: arduInstall.sh
#Author: Antonio Mónaco [toni@peatonet.com]
#Web: www.peatonet.com/arduinstall/
#Functions: Install, uninstall, and execute Arduino IDE with Ardublock
#Version: ArduInstall v1.3 (2016)
#Change permissions: chmod +x ArduInstall
#Execute: sh arduInstall.sh (Without sudo neither root permissions)

#Set the options list
OPTIONS="Install Uninstall Run Exit"
select opt in $OPTIONS; do

#Install option
if [ "$opt" = "Install" ]; then
	#Install Arduino IDE
	sudo apt-get install -y arduino

	#Download ArduBlock in the last version
	cd /tmp
	sudo rm -rf ardu*
	rm -rf ~/sketchbook
        wget https://datapacket.dl.sourceforge.net/project/ardublock/ardublock-all-20130712.jar
    
       #Create the directories
	mkdir ~/sketchbook
        mkdir ~/sketchbook/tools
        mkdir ~/sketchbook/tools/ArduBlockTool
        mkdir ~/sketchbook/tools/ArduBlockTool/tool
 
       #Movee ArduBlock.jar to /tool directory
       mv ardublock-all.jar ~/sketchbook/tools/ArduBlockTool/tool
       
       #Run Arduino IDE
       arduino&
exit

#Uninstall option
elif [ "$opt" = "Uninstall" ]; then
	#Remove ArduBlock
	sudo rm -rf ~/sketchbook
	
	#Uninstall Arduino IDE
	sudo apt-get -y remove arduino
exit

#Open option
elif [ "$opt" = "Run" ]; then
	#Run Arduino IDE
	arduino&
exit

#Exit option
elif [ "$opt" = "Exit" ]; then
	echo done
exit

#Error option
else
	#Clear terminal
	clear
	
	#Show error message
	echo "Please, select a correct option".
	echo " "
	#Restart ArduInstall
	
	./arduInstall
fi
done
