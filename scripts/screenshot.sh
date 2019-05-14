#scrot application is required. "sudo apt-get install scrot"
#$1 = time in seconds upto which to take screenshots
#$2 = time interval between screenshots

cd $RESULTS
D=$(date)
a=$(echo $D | awk '{print $4}' | awk -F ":" '{print $1}')
b=$(echo $D | awk '{print $4}' | awk -F ":" '{print $2}')
c=$(echo $D | awk '{print $4}' | awk -F ":" '{print $3}')

pwd

mkdir screenshots-$a-$b-$c
cd screenshots-$a-$b-$c
i=1
while [[ $i -le $1 ]];do 
	scrot -d $2 -c
	i=$(( $i+1 ))
done
