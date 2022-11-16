# lazy-SDTO
Automated tool for finding subdomain takeovers 

   by bronxi
 
  *lazy-SDTO looks 404 subdomains CNAME.
  

### Requeriment
Install httpx

    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    
Install amass

    go install -v github.com/OWASP/Amass/v3/...@master


### It's easy!

Clone the repo, give it execute permissions and run the script!

    git clone https://github.com/bronxi47/lazy-sdto.git
    
    chmod +x lazy-sdto.sh
    
    
Usage:

    ./lazy_sdto -FLAG [DOMAIN/FILELIST]

Flags:  

-a DOMAIN		find subdomains, check 404 and look CNAME  
-l FILELIST             check 404 and look CNAME from a list
