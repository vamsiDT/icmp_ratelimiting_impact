#bird application is required to run this script
#$1 is cisco or juniper

cd $RESULTS
sudo killall bird
sudo service bird stop

sudo bird -c ./bird_"$1".conf

i=1
while [[ $i -gt 0 ]];do
	sudo birdc configure soft
	#sudo birdc show route
	sleep 0.1
done
