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
set style line 1 lc rgb '#4C9900' pt 4 ps 1 dt 2 lw 2 # --- verde
set style line 2 lc rgb '#4C9900' pt 5 ps 1 dt 1 lw 2 # --- verde

set style line 3 lc rgb '#0080FF' pt 6 ps 1 dt 2 lw 2 # --- azzurro
set style line 4 lc rgb '#0080FF' pt 7 ps 1 dt 1 lw 2 # --- azzurro dashed

set style line 5 lc rgb '#9933FF' pt 8 ps 1 dt 2 lw 2 # --- viola 
set style line 6 lc rgb '#9933FF' pt 9 ps 1 dt 1 lw 2 # --- viola dashed



#F7D358

set xlabel 'Number of observation variables' font 'Verdana,16' enhanced
set ylabel 'TIME (s)' font 'Verdana,16' enhanced

#set terminal wxt size 410,250 enhanced font 'Verdana,10' persist 1
set terminal pdfcairo enhanced font 'Verdana,14'
#set title "With error bars" font 'Verdana,14'

set output 'figs/aaijodsweaktime.pdf'
set key top left box title 'Weakly controllable CNCUs' box
plot 'aai/weak.time' u 1:2 t 'WC old' w lp ls 1, 'jods/weak.time' u 1:2 t 'WC new' w lp ls 2

set output 'figs/aaijodsstrongtime.pdf'
set key top left box title 'Strongly controllable CNCUs' box
plot 'aai/strong.time' u 1:2 t 'WC old' w lp ls 1, '' u 1:3 t 'SC old' w lp ls 3, '' u 1:4 t 'DC old' w lp ls 5, 'jods/strong.time' u 1:2 t 'WC new' w lp ls 2, '' u 1:3 t 'SC new' w lp ls 4, '' u 1:4 t 'DC new' w lp ls 6

set output 'figs/aaijodsdynamictime.pdf'
set key top left box title 'Dynamically controllable CNCUs' box
plot 'aai/dynamic.time' u 1:2 t 'WC old' w lp ls 1, '' u 1:3 t 'DC old' w lp ls 5, 'jods/strong.time' u 1:2 t 'WC new' w lp ls 2, '' u 1:4 t 'DC new' w lp ls 6

set output 'figs/aaijodsuncontrollabletime.pdf'
set key top left box title 'Uncontrollable CNCUs' box
plot 'aai/uncontrollable.time' u 1:2 t 'WC old' w lp ls 1, '' u 1:3 t 'SC old' w lp ls 3, '' u 1:4 t 'DC old' w lp ls 5, 'jods/uncontrollable.time' u 1:2 t 'WC new' w lp ls 2, '' u 1:3 t 'SC new' w lp ls 4, '' u 1:4 t 'DC new' w lp ls 6

set ylabel 'SPACE (KB)' font 'Verdana,16' enhanced

set output 'figs/aaijodsweakspace.pdf'
set key top left box title 'Weakly controllable CNCUs' box
plot 'aai/weak.space' u 1:($2 / 1024) t 'WC old' w lp ls 1, 'jods/weak.space' u 1:($2 / 1024) t 'WC new' w lp ls 2

set output 'figs/aaijodsstrongspace.pdf'
set key top left box title 'Strongly controllable CNCUs' box
plot 'aai/strong.space' u 1:($2 / 1024) t 'WC old' w lp ls 1, '' u 1:($3 / 1024) t 'SC old' w lp ls 3, '' u 1:($4 / 1024) t 'DC old' w lp ls 5, 'jods/strong.space' u 1:($2 / 1024) t 'WC new' w lp ls 2, '' u 1:($3 / 1024) t 'SC new' w lp ls 4, '' u 1:($4 / 2014) t 'DC new' w lp ls 6

set output 'figs/aaijodsdynamicspace.pdf'
set key top left box title 'Dynamically controllable CNCUs' box
plot 'aai/dynamic.space' u 1:($2 / 1024) t 'WC old' w lp ls 1, '' u 1:($3 / 1024) t 'DC old' w lp ls 5, 'jods/strong.space' u 1:($2 / 1024) t 'WC new' w lp ls 2, '' u 1:($4 / 1024) t 'DC new' w lp ls 6

