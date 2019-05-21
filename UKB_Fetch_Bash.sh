#!/bin/bash

#reads the .bulk file, assigns the variable numfiles to the number of lines in the .bulk file
numfiles="$(cat /path_to_your_bulk_file_here.bulk | wc -l)"

#divides this number by 800, assigns it to the variable "numfilesdivided"
numfilesdivided="$(( numfiles / 800 ))"

for (( n=1; n<=numfilesdivided; n++ ))
do
#Uses the ukbfetch utility (have this utility in the current directory, where this script lives and where you want the data to go), takes a key (given to your app by UKB) 
#and a bulk file (generated from your main dataset with the ukbconv utility) as input, starts at position one, and iterates through the .bulk file in batches of 800, downloading your approved files.
./ukbfetch -your_key_here_have_this_in_current_directory.key -your_bulk_file_here_have_this_in_your_current_directory.bulk -s$((1 + (($n-1) * 800))) -m800 -of$n
done
