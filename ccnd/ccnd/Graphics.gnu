reset
# define axis
# remove border on top and right and set color to gray
set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror
set bmargin 5
# define grid
set style line 12 lc rgb '#808080' lt 0 lw 1
set grid back ls 12

#set xrange [0:6]
set xtics 1
# color definitions
set style line 1 lc rgb '#4C9900' pt 5 ps 1 dt 1 lw 2 # --- verde
#set style line 2 lc rgb '#4C9900' pt 5 ps 1 dt 1 lw 2 # --- verde

set style line 2 lc rgb '#0080FF' pt 7 ps 1 dt 1 lw 2 # --- azzurro
#set style line 4 lc rgb '#0080FF' pt 7 ps 1 dt 1 lw 2 # --- azzurro

set style line 3 lc rgb '#9933FF' pt 9 ps 1 lt 1 lw 2 # --- viola 
#set style line 6 lc rgb '#9933FF' pt 9 ps 1 lt 1 lw 2 # --- viola



#F7D358

set xlabel 'Number of pairs observation-decision points' font 'Verdana,16' enhanced
set ylabel 'TIME (s)' font 'Verdana,16' enhanced

#set terminal wxt size 410,250 enhanced font 'Verdana,10' persist 1
set terminal pdfcairo enhanced font 'Verdana,14'
#set title "With error bars" font 'Verdana,14'

set output 'figs/jodsweaktime.pdf'
set key top left box title 'Weakly controllable CCNDs' box
plot 'weak.time' u 1:($2 / 1000) t 'WC' w lp ls 1

set output 'figs/jodsstrongtime.pdf'
set key top left box title 'Strongly controllable CCNDs' box
plot 'strong.time' u 1:($2 / 1000) t 'WC' w lp ls 1, '' u 1:($3 / 1000) t 'SC' w lp ls 2, '' u 1:($4 / 1000) t 'DC' w lp ls 3

set output 'figs/jodsdynamictime.pdf'
set key top left box title 'Dynamically controllable CCNDs' box
plot 'dynamic.time' u 1:($2 / 1000) t 'WC' w lp ls 1, '' u 1:($4 / 1000) t 'DC' w lp ls 3
 
set output 'figs/jodsuncontrollabletime.pdf'
set key top left box title 'Uncontrollable CCNDs' box
plot 'uncontrollable.time' u 1:($2 / 1000) t 'WC' w lp ls 1, '' u 1:($3 / 1000) t 'SC' w lp ls 2, '' u 1:($4 / 1000) t 'DC' w lp ls 3


set ylabel 'SPACE (# of nodes)' font 'Verdana,16' enhanced

set output 'figs/jodsweakspace.pdf'
set key top left box title 'Weakly controllable CCNDs' box
plot 'weak.space' u 1:2 t 'WC' w lp ls 1

set output 'figs/jodsstrongspace.pdf'
set key top left box title 'Strongly controllable CCNDs' box
plot 'strong.space' u 1:2 t 'WC' w lp ls 1, '' u 1:3 t 'SC' w lp ls 2, '' u 1:4 t 'DC' w lp ls 3

set output 'figs/jodsdynamicspace.pdf'
set key top left box title 'Dynamically controllable CCNDs' box
plot 'dynamic.space' u 1:2 t 'WC' w lp ls 1, '' u 1:4 t 'DC' w lp ls 3



