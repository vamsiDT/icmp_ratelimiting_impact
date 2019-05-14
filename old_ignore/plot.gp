#! xgp flow_pps.dat
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


set out "juniper.pdf"
set term pdf font "Times,8"
#set terminal X11 enhanced font "courier 10 pitch, 16" size 1300,1000

set pointsize 0.25

set key top right
set title "Juniper router default Icmp Ratelimiting"
set ylabel "Probing rate in 2^Y pps. Range of Y"
set xlabel "Time (seconds)"
set xtics 5
set ytics 1
#set boxwidth 0.5
#set style fill solid
set ytics nomirror
set y2tics 10
set yrange [0:16]
set y2range [0:100]
#set ylabel "Bitrate Mbps"
set y2label "Bitrate Mbps/Lossrate(0-100%)/Cpu Usage(0-100%)"
#set format y "%.t^.10^%T"
#set ytics 200000
#set yran [1e3:]
#min(a,b)=a<b?a:b
#stats 	'flow_pps.dat'	every ::1 using 1 nooutput
#total=int(STATS_sum)
#print("Total Throughput")
#print(total)
#f(x)=total
#set yrange [0:11]
#set ytics 1
#set xrange [0:70]

plot \
'< cat juniperexp.dat' u ($0):(log($2+1)/log(2))	t 'Probing rate' axes x1y1 with lp,\
'< cat juniperexp.dat' u ($0):($4)	t 'Cpu Usage' axes x1y2 with lp,\
'< cat juniperexp.dat' u ($0):($3*100)	t 'loss rate' axes x1y2 with lp,\
'< cat juniperexp.dat' u ($0):($5)	t 'tcp connection througput' axes x1y2 with lp

