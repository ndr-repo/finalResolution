# finalResolution

Hello everyone, I'm happy to introduce finalResolution 0.9!

The final beta release of these tools will become publicly available on this portal after the v1.0 rollout. If you are reading this before then, I'm happy to have you for testing and look forward to your feedback!

Included are optimized tools I have written over the last year that have helped me save time when working with common network indicators. I plan to expand these over the next few days to create easy calls of a few other related one-liners similar to what you can find here. 

These are mostly time savers that I use for validating external presence on the net & performing quick lookups of hostnames and IPs through common APIs. 

This *can* be used for threat hunting, but I mostly use these during external pentest work and not for creating CTI. 
I would definitely recommend the resolvers over a traditional nslookup when working with indicators, since these tools all resolve by proxy through another host and not your own box.

At most, I would use them to find any initial indicators (i.e: Quad9 blocked ___ hostname), and then moving your work over to a CTI platform for OSINT like [AlienVault OTX](https://otx.alienvault.com/). 

I would like to make setup scripts for Windows & popular Linux distros respectively for quickly setting the script folders to PATH/environment variables. In the mean time, I recommend manually adding the 'Resolvers' and 'Validators' folder to your PATH for quick use. This is what I personally do. 

11JAN25: I recovered some of my scripts that I wrote in my Fedora 38 days. I wanted to include these in the toolkit, so I changed the names of some of the scripts for clarity.

** - *Resolv ** -  Uses a hostname 

** - *Lookup ** -  Uses an IP address

# Resolvers

**cfResolv** - Resolve a hostname through CloudFlare's one.one.one.one resolver. Returns A records and DNSSEC info by default. This is an alternative way to call this information through DoH (DNS over HTTPS).

**cfResolv**-v - Resolve a hostname through multiple public CloudFlare resolvers. At times, you can find different entries for the same hostname this way that may not have been previously visible.

![gnResolv](https://github.com/user-attachments/assets/4f05c0dc-f874-4f35-9d6c-74c73f336c5d)

**gnResolv** - Pings a host using Shodan's public geonet API, then attempts a lookup of the hostname using various geonet servers across the globe. This can be useful for identifying load balancers or mirror servers created for availability on a target domain.

**idLookup** - Resolves an IP address using Shodan's public InternetDB service. The InternetDB can resolve shortened ipv6 addresses as well.

**idLookup**-T - Reformatted layout for idLookup. Displays results in a table. I find this useful if I know I am going to call a few hosts in a row but dont have a list I can scan all at once.

**idLookup**-X - Expanded results for a specific value when checking IPs on the InternetDB. If you find a load balancer for example, a lot of times you will not be able to see all the hostnames from standard view. If you run the IP through here and expand the hostnames column, it will format a list of hostnames for that IP. 

Sometimes, the domain may block the internetDB from indexing the address. In these cases, I often see a ton of ports flooding the results. You can validate this usually by checking the common platform enumerator {cpes} value, and it will usually have the name of a security appliance (i.e Imperva).

**q9Status** - Check if a hostname is blocked by Quad9 DNS. This will show who flagged the host as malicious.
# Validators

**cfWhoami** - Check your external IP address, user-agent, and detected location using CloudFlare's public trace services.

**mvWhoami** - An external check to validate connections to Mullvad VPN. This uses their public "Am I Mullvad?" service and a good second-opinion scan after your local command line if youre doing things like split tunneling or using proxies.
