#bird application is required to run this script
#$1 number of routes to be configured in each loop
#$2 is the router according to the topology "cisco" or "juniper"

j=1
total=0
echo -e "$1\t$2"
ROUTER=$2

if [[ "${ROUTER}" == "cisco" ]] ;then
        R=1
        echo cisco
elif [[ "${ROUTER}" == "juniper" ]];then
        R=2
        echo juniper
else
        echo "Unknown router in the topology"
        exit
fi

while [[ $j -le 255 ]];do
        cat bird_"$ROUTER"_1.conf > bird_"$ROUTER".conf
        i=1
        while [[ $i -le $1 ]];do
                echo "route $j.168.$i.0:255.255.255.0 via 192.168.$R.1;" >> bird_"$ROUTER".conf
                i=$(( $i+1 ))
                total=$(( $total+1 ))
                echo $total > total.dat
        done
        j=$(( $j+1 ))
        if [[ $j -eq 256 ]];then
                j=1
        fi
        cat bird_"$ROUTER"_2.conf >> bird_"$ROUTER".conf
        sleep 0.1
done
