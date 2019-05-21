#!/bin/bash

#This is a bash script that uses the "ukbfetch" utility (https://biobank.ndph.ox.ac.uk/showcase/docs/ukbfetch_instruct.html) to download approved bulk files for a UK Biobank Application.  It reads the .bulk file that 
# is created from the main UKB dataset using the ukbconv function (download this utility on the "downloads" page of the UK Biobank web site, and run it), and iterates through the list, downloading 800 files at a time.  To use this script,
# place it into the directory where you want the data to go, change the "your_xxx_here" paths in this script, and either run "bash UKB_Fetch_Blanca_public.sh" or "./UKB_Fetch_Blanca_Public.sh" in your shell, depending on which version of Bash you have.
#Gordon Matthewson, May 2019

#reads the .bulk file, assigns the variable numfiles to the number of lines in the .bulk file
numfiles="$(cat /path_to_your_bulk_file_here.bulk | wc -l)"
#divides this number by 800, assigns it to the variable "numfilesdivided"
numfilesdivided="$(( numfiles / 800 ))"

for (( n=1; n<=numfilesdivided; n++ ))
do
#Uses the ukbfetch utility (have this in the current directory, where this script lives and where you want the data to go), takes a key (given to your app by UKB) and a bulk file (generated from your main dataset with the ukbconv utility) as input, starts at position one,
# and iterates through the .bulk file in batches of 800, downloading your approved files.
./ukbfetch -your_key_here_have_this_in_current_directory.key -your_bulk_file_here_have_this_in_your_current_directory.bulk -s$((1 + (($n-1) * 800))) -m800 -of$n
done
