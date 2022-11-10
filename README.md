# lazy-SDTO
Automated tool to find subdomain takeovers

   by bronxi
 
  *lazy-SDTO looks 404 subdomains CNAME.
  
  
### It's easy!

Clone the repo, give it execute permissions and run the script!

    git clone https://github.com/bronxi47/lazy-sdto.git
    
    chmod +x lazy-sdto.sh

Install httpx

    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest



Usage:

    ./lazy_sdto -FLAG [DOMAIN/FILELIST]

Flags:  

-a DOMAIN		find subdomains, check 404 and look CNAME  
-l FILELIST             check 404 and look CNAME from a list
