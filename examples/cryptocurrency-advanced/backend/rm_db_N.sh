#!/bin/bash
n=$((5*$1+1))
for i in 1 2 3 4 5
do
 rm -Rf example/$(($n-$i))/db
done