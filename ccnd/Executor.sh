#!/usr/local/bin/bash

if [ $# -ne 2 ]; then
	echo "Usage: $0 <BenchDir> <weak|strong|dynamic>"
	exit
fi


if [ "$2" != "weak" ] && [ "$2" != "strong" ] && [ "$2" != "dynamic" ]; then
	echo "Usage: ./$0 <BenchDir> <weak|strong|dynamic>"
	exit
fi


DEST=$1.$2
> $DEST.x

for f in `ls $1`; do
	./zeta $1/$f -x $DEST/$f.s 1000 -silent 
	echo $f `cat ._stats` >> $DEST.x
done

