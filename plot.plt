set terminal pngcairo enhanced mono dashed
set output 'EgPlot.png'

set logscale xy
set xrange [0.1:1000]
set yrange [0.04:4]

set title "Band Gap Using\nDelta Function Approximation"
set xlabel "P"
set ylabel "Band Gap\n[ħ^2π^2/2ma^2]" offset 2

set arrow from 0.1,pi to 1000,pi nohead lt 2
set label "π" at 0.2,2.7

plot 'data.csv' u 1:2 w l notitle
