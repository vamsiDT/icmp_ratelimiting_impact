#$1 is 1 or 2 to configure as pc1 or pc2
# pc1 --- laptop connected to cisco
# pc2 --- laptop connected to juniper
# Please refer to the topology figure

## INTERFACE
sudo ifconfig $INT down
sudo ifconfig $INT up

PC=$1
if [[ $PC -eq 1 ]];then
	sudo ifconfig $INT 192.168.1.1/24
	sudo ip route add 192.168.2.0/24 via 192.168.1.254
	sudo ip route add 10.0.0.0/30 via 192.168.1.254
elif [[ $PC -eq 2 ]];then
	sudo ifconfig $INT 192.168.2.1/24
	sudo ip route add 192.168.1.0/24 via 192.168.2.254
	sudo ip route add 10.0.0.0/30 via 192.168.2.254
else
	echo "Unknown device in topology"
fi
