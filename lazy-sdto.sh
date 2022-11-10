#!/usr/bin/env bash
cat <<!TITLE!
  _                        _____ _____ _______ ____  
 | |                      / ____|  __ |__   __/ __ \ 
 | | __ _ _____   _ _____| (___ | |  | | | | | |  | |
 | |/ _  |_  | | | |______\___ \| |  | | | | | |  | |
 | | (_| |/ /| |_| |      ____) | |__| | | | | |__| |
 |_|\__,_/___|\__, |     |_____/|_____/  |_|  \____/ 
               __/ |                                 
              |___/    
                     by bronxi
	    https://github.com/bronxi47

	*lazy-SDTO looks 404 subdomains CNAME.
!TITLE!

TARGET=$2
DIR="temp"


finder(){
    echo "Searching subdomains..."
    assetfinder $TARGET > $DIR.txt
}

not_found(){
    echo -e "\nThanks httpx :)" &&
    httpx -l "$1" -mc 404 -sc | tee -a "$DIR"_inactives.txt &&
    [ ! -f "$DIR"_inactives.txt ] && echo "No 404 subdomains" && exit 1
    sed -i s/'http[s]\?:\/\/'// "$DIR"_inactives.txt
}

dig_check(){
    echo -e "\nPossible Subdomain Tokeovers:" &&
    while read inactives; do echo ---- && dig $inactives | grep CNAME ; done <"$DIR"_inactives.txt ||
    echo -e "\nNo Subdomains Takeovers :("
}

help_me(){
    echo -e "\nCan I help you?"
    echo -e "\nUsage:"
    echo "./lazy_sdto -FLAG [DOMAIN/FILELIST]"
    echo -e "\nFlags:"
    echo "-a DOMAIN		find subdomains, check 404 and look CNAME"
    echo "-l FILELIST             check 404 and look CNAME from a list"
}

case $1 in
  -l)
    not_found "$TARGET" &&
    dig_check &&
    rm "$DIR"_inactives.txt
    ;;
  -a)
    finder &&
    not_found "$DIR".txt &&
    dig_check
    rm $DIR.txt "$DIR"_inactives.txt
    ;;
   *)
    help_me
    ;;
esac
