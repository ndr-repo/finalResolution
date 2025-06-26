# Welcome to finalResolution! 

finalResolution is a collection of PowerShell scripts for working with common network indicators. These are mostly time savers for validating situational awareness (i.e: how's my VPN looking?) & performing quick lookups of hostnames and IPs through common APIs. 

These can be used for threat hunting, pentesting, or security admin work.

I recommend adding the 'Resolvers', 'Web', and 'Validators' folder to your PATH for quick use. 
## Quick Reference - Command Syntax

**Resolvers -Resolv** -  Uses a hostname 

**Resolvers -Lookup** -  Uses an IP address

**Enumeration - Subdomains** - These function seperately but include interactive prompts. Various passive discovery tools for subdomain enumeration using open-source intelligence platforms.

**Enumeration - Web - Archives** - These all function seperately but include interactive prompts as you go. For the most part, these are functionally alike with the Golang tool, gau. Consider them a parody of sorts, rewritten for Powershell.

# Resolvers

**cfResolv** - Resolve a hostname through CloudFlare's one.one.one.one resolver. Returns A records and DNSSEC info by default. This is an alternative way to call this information through DoH (DNS over HTTPS).

**cfResolv**-v - Resolve a hostname through multiple public CloudFlare resolvers. At times, you can find different entries for the same hostname this way that may not have been previously visible.

![gnResolv](https://github.com/user-attachments/assets/4f05c0dc-f874-4f35-9d6c-74c73f336c5d)

**gnResolv** - Pings a host using Shodan's public geonet API, then attempts a lookup of the hostname using various geonet servers across the globe. This can be useful for identifying load balancers or mirror servers created for availability on a target domain.

**idLookup** - Resolves an IP address using Shodan's public InternetDB service. Supports IPv4 & IPv6.

**idLookup**-T - Reformatted layout for idLookup. Displays results in a table. I find this useful if I know I am going to call a few hosts in a row but dont have a list I can scan all at once.

**idLookup**-X - Expanded results for a specific value when checking IPs on the InternetDB. If you find a load balancer for example, a lot of times you will not be able to see all the hostnames from standard view. If you run the IP through here and expand the hostnames column, it will format a list of hostnames for that IP. 

Sometimes, the domain may block the internetDB from indexing the address. In these cases, I often see a ton of ports flooding the results. You can validate this usually by checking the common platform enumerator {cpes} value, and it will usually have the name of a security appliance (i.e Imperva).

![q9Lookup](https://github.com/user-attachments/assets/b9c261b7-545b-4a40-ae0e-7d8e3c25a877)

**q9Status** - Check if a hostname is blocked by Quad9 DNS. This will show who flagged the host as malicious. [Source Indicator - Alienvault OTX](https://otx.alienvault.com/pulse/67427da18d25f8ccab50b440)

# Validators

**cfWhoami** - Check your external IP address, user-agent, and detected location using CloudFlare's public trace services.

**mvWhoami** - An external check to validate connections to Mullvad VPN. This uses their public "Am I Mullvad?" service and a good second-opinion scan after your local command line if youre doing things like split tunneling or using proxies.

![cfUagTest](https://github.com/user-attachments/assets/a82682b3-b0b1-4feb-83e7-01daaeaeaa82)
**cfUagTest** - Cloudflare User-Agent Test. Test a user-agent on Cloudflare Trace to see how it looks on the other end. Verify discrepencies against parsers, etc.

## Support
- If you find use from this, consider supporting my work on [Ko-fi](https://ko-fi.com/weekndr_sec). 
