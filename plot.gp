#
# Created the Fri Dec  8 02:30:12 CET 2017 with:
#   ____________________________
#  /                            \
# /        xgp        __________/
# \__________________/.:nonsns:.
#
 
#-------------------------------------
# SHAPES:
# (c)ircle  (t)riangle (i)nv.tri.
#           (d)iamond  (s)quare
# FILLING:
# (f)illed  (o)paque  (e)mpty (default)
#-------------------------------------
   s=4  ; es=s  ; fs=s+1 ; os=s+66
   c=6  ; ec=c  ; fc=c+1 ; oc=os+1
   t=8  ; et=t  ; ft=t+1 ; ot=oc+1
   i=10 ; ei=i  ; fi=i+1 ; oi=ot+1
   d=12 ; ed=d  ; fd=d+1 ; od=oi+1
   p=14 ; ep=p  ; fp=p+1 ; op=od+1
#-------------------------------------
#  e.g.:  
#  empty circles vs filled squares
#  plot "file" u 1:3 w p pt ec, 
#           "" u 1:4 w lp pt fs
#-------------------------------------

#Happy gnuplotting


#t=FilenameWithoutExtension
t=ARG1
datfile=t.".dat"
outfile=t.".pdf"

set out outfile
set term pdf font "Times,8"
#set terminal X11 enhanced font "courier 10 pitch, 16" size 1300,1000

set grid

set pointsize 0.25


if (t eq "cisco_acl_udp")
	ti="Effect on Cisco router by Icmp Ratelimiting (Router configured with Acl for Icmp ratelimting)\nUDP data plane traffic"
	tt="Udp througput x10^7bits/sec"

if (t eq "cisco_acl_tcp"){
	ti="Effect on Cisco router by Icmp Ratelimiting (Router configured with Acl for Icmp ratelimting)\nTCP data plane traffic"
	tt="tcp connection througput x10^7bits/sec"
}
if (t eq "cisco_noacl_udp"){
	ti="Effect on Cisco router by Icmp Ratelimiting (Default router configuration)\nUDP data plane traffic"
	tt="Udp througput x10^7bits/sec"
}
if (t eq "cisco_noacl_tcp"){
	ti="Effect on Cisco router by Icmp Ratelimiting (Default router configuration)\nTCP data plane traffic"
	tt="tcp connection througput x10^7bits/sec"
}
if (t eq "juniper_1000_tcp"){
	ti="Effect on Juniper router by Icmp Ratelimiting (1000 Packets/sec)\nTcp data plane traffic"
	tt="tcp connection througput x10^7bits/sec"
}


set key top left
#set multiplot 1,2 title "Effect on Cisco router by Icmp Ratelimiting\nRouter configured with Acl for Icmp ratelimting\n(UDP data plane traffic)"

set title ti

set ylabel "Probing rate in 2^Y pps. Range of Y"
set xlabel "Time (seconds)"
set xtics 5
set ytics 1

set boxwidth 0.5
set style fill solid

set ytics nomirror
set y2tics 10
set yrange [0:18]
set y2range [0:100]
set y2label "Bitrate/Lossrate(0-100%)/Cpu Usage(0-100%)"

set xrange [1:]

plot \
datfile u ($0+1):(log($1+1)/log(2))	t 'Probing rate' axes x1y1 with lp lw 2,\
datfile u ($0+1):($2)	t 'Cpu Usage' axes x1y2 with lp lw 2,\
datfile u ($0+1):($3*100)	t 'loss rate' axes x1y2 with lp lw 2,\
datfile u ($0+1):($4/10)	t tt axes x1y2 with lp lw 2,\
datfile u ($0+1):($5)	t 'Icmp Input Bw Mbps' axes x1y2 with boxes fs solid 0.25 lc rgb "red",\
datfile u ($0+1+0.25):($7)	t 'Icmp Output Bw Mbps' axes x1y2 with boxes fs solid 0.5 lc rgb "black"

#'tcp connection througput x10^7bits/sec'
