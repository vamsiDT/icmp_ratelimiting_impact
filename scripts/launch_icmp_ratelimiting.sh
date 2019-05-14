#Every scripts requires the use of config.sh
#add "source config.sh" at the end of ~/.bashrc

cd $ICMP
sudo build/ICMPEndToEnd -t ./resources/test/test -I -T[0.05,0.99] -m5 -e1.05 --start-probing-rate 900 2> $RESULTS/application_stdout/cisco_bgp.dat > $RESULTS/application_stdout/cisco_bgp.dat
