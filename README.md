# UKBFetchbash

This is a bash script that uses the "ukbfetch" utility (http://biobank.ndph.ox.ac.uk/showcase/download.cgi) to download approved bulk files for a UK Biobank Application.  It reads the .bulk file that is created from the main UKB dataset using the ukbconv function (see downloads page above), and iterates through the list, downloading 800 files at a time.  To use this script, place it into the directory where you want the data to go, change the "your_xxx_here" paths in this script, and either run "bash UKB_Fetch_Blanca_public.sh" or "./UKB_Fetch_Blanca_Public.sh" in your shell, depending on which version of Bash you have.

Gordon Matthewson, May 2019
