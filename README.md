# bashacks

 1. What is this
 2. Additional Requirements
 3. Additional Functions

## 1. What is this

 This is a fork of bashacks by Fernando Mercês, mainly to do some
 development.

## 2. Additional Requirements

* `whois`

## 3. Additional Functions

* `bh_asinfo`: Look up AS information in Team Cymru's `whois` for a given
  AS.  (The string `AS` is prepended to the argument if it is not
  included.)
  Examples:
  ```
  tdussa@flattop ~ $ bh_asinfo 32868        
  AS      | CC | Registry | Allocated  | AS Name
  32868   | US | arin     | 2004-08-10 | FLEX-DATASIDE-AS01, US
  ```
  ```
  tdussa@flattop ~ $ bh_asinfo AS1  
  AS      | CC | Registry | Allocated  | AS Name
  1       | US | arin     | 2001-09-20 | LVLT-1, US
  ```

* `bh_ip2as`: Look up AS information in Team Cymru's `whois` for a given
  IP.
  Example:
  ```
  tdussa@flattop ~ $ bh_ip2as 129.13.64.5
  AS      | IP               | AS Name
  34878   | 129.13.64.5      | KIT Karlsruhe Institute of Technology, DE
  ```

* `bh_ip2cymru`: Look up all information provided by Team Cymru for a
  given IP.
  Example:
  ```
  tdussa@flattop ~ $ bh_ip2cymru 129.13.64.5
  AS      | IP               | BGP Prefix          | CC | Registry | Allocated  | AS Name
  34878   | 129.13.64.5      | 129.13.0.0/16       | DE | ripencc  | 1987-06-29 | KIT Karlsruhe Institute of Technology, DE
  ```

* `bh_ip2irt`: Look up abuse contact information and the relevant IRT
  object in `whois` for a given IP.
  Example:
  ```
  tdussa@flattop ~ $ bh_ip2irt 129.13.64.5
  % Abuse contact for '129.13.0.0 - 129.13.255.255' is 'cert@kit.edu'

  irt:            IRT-KIT-CERT
  address:        KIT-CERT
  address:        Karlsruhe Institute of Technology
  address:        Steinbuch Centre for Computing
  address:        76128 Karlsruhe
  address:        Germany
  phone:          +49 721 608 45678
  signature:      PGPKEY-D742DE72
  encryption:     PGPKEY-D742DE72
  admin-c:        TI123-RIPE
  tech-c:         TI123-RIPE
  auth:           PGPKEY-D742DE72
  remarks:        This is a TI accredited CSIRT/CERT
  remarks:        emergency number +49 1520 1601774
  remarks:        timezone Europe/Berlin
  remarks:        https://www.trusted-introducer.org/teams/kit-cert.html
  irt-nfy:        cert@kit.edu
  created:        2010-06-07T18:29:40Z
  last-modified:  2020-07-06T09:36:18Z
  source:         RIPE # Filtered
  mnt-by:         TRUSTED-INTRODUCER-MNT

  OrgAbuseHandle: ABUSE3850-ARIN
  OrgAbuseName:   Abuse Contact
  OrgAbusePhone:  +31205354444 
  OrgAbuseEmail:  abuse@ripe.net
  OrgAbuseRef:    https://rdap.arin.net/registry/entity/ABUSE3850-ARIN
  % Abuse contact for '129.13.0.0 - 129.13.255.255' is 'cert@kit.edu'
  abuse-c:        CKIT1-RIPE
  ```

* `bh_host2as`: Resolve a given host name to its IP address(es) and run
  `bh_ip2as` on every one of those.
  Examples:
  ```
  tdussa@flattop ~ $ bh_host2as tu-dresden.de
  141.76.39.140:
  AS      | IP               | AS Name
  680     | 141.76.39.140    | DFN Verein zur Foerderung eines Deutschen Forschungsnetzes e.V., DE
  ```
  ```
  tdussa@flattop ~ $ bh_host2as fbi.gov
  104.16.148.244:
  AS      | IP               | AS Name
  13335   | 104.16.148.244   | CLOUDFLARENET, US
  
  104.16.149.244:
  AS      | IP               | AS Name
  13335   | 104.16.149.244   | CLOUDFLARENET, US
  
  2606:4700::6810:94f4:
  AS      | IP                                       | AS Name
  13335   | 2606:4700::6810:94f4                     | CLOUDFLARENET, US
  
  2606:4700::6810:95f4:
  AS      | IP                                       | AS Name
  13335   | 2606:4700::6810:95f4                     | CLOUDFLARENET, US
  ```
  ```
  tdussa@flattop ~ $ bh_host2as uni-stuttgart.de
  129.69.5.3:
  AS      | IP               | AS Name
  553     | 129.69.5.3       | BELWUE BelWue-Koordination, DE
  
  2001:7c0:7c0:5::cafe:
  AS      | IP                                       | AS Name
  553     | 2001:7c0:7c0:5::cafe                     | BELWUE BelWue-Koordination, DE
  ```

* `bh_host2cymru`: Resolve a given host name to its IP address(es) and run
  `bh_ip2cymru` on every one of those.
  Examples:
  ```
  tdussa@flattop ~ $ bh_host2cymru tu-dresden.de
  141.76.39.140:
  AS      | IP               | BGP Prefix          | CC | Registry | Allocated  | AS Name
  680     | 141.76.39.140    | 141.76.0.0/16       | DE | ripencc  | 1990-06-07 | DFN Verein zur Foerderung eines Deutschen Forschungsnetzes e.V., DE
  ```
  ```
  tdussa@flattop ~ $ bh_host2cymru fbi.gov
  104.16.148.244:
  AS      | IP               | BGP Prefix          | CC | Registry | Allocated  | AS Name
  13335   | 104.16.148.244   | 104.16.144.0/20     | US | arin     | 2014-03-28 | CLOUDFLARENET, US

  104.16.149.244:
  AS      | IP               | BGP Prefix          | CC | Registry | Allocated  | AS Name
  13335   | 104.16.149.244   | 104.16.144.0/20     | US | arin     | 2014-03-28 | CLOUDFLARENET, US

  2606:4700::6810:94f4:
  AS      | IP                                       | BGP Prefix          | CC | Registry | Allocated  | AS Name
  13335   | 2606:4700::6810:94f4                     | 2606:4700::/44      | US | arin     | 2011-11-01 | CLOUDFLARENET, US

  2606:4700::6810:95f4:
  AS      | IP                                       | BGP Prefix          | CC | Registry | Allocated  | AS Name
  13335   | 2606:4700::6810:95f4                     | 2606:4700::/44      | US | arin     | 2011-11-01 | CLOUDFLARENET, US
  ```
  ```
  tdussa@flattop ~ $ bh_host2cymru uni-stuttgart.de
  129.69.5.3:
  AS      | IP               | BGP Prefix          | CC | Registry | Allocated  | AS Name
  553     | 129.69.5.3       | 129.69.0.0/16       | DE | ripencc  | 1987-09-09 | BELWUE BelWue-Koordination, DE

  2001:7c0:7c0:5::cafe:
  AS      | IP                                       | BGP Prefix          | CC | Registry | Allocated  | AS Name
  553     | 2001:7c0:7c0:5::cafe                     | 2001:7c0::/32       | DE | ripencc  | 2002-04-11 | BELWUE BelWue-Koordination, DE
  ```

* `bh_host2irt`: Resolve a given host name to its IP address(es) and run
  `bh_ip2irt` on every one of those.
  Examples:
  ```
  tdussa@flattop ~ $ bh_host2irt tu-dresden.de
  141.76.39.140:
  irt:            IRT-DFN-CERT
  address:        DFN-CERT Services GmbH
  address:        Nagelsweg 41
  address:        20097 Hamburg
  address:        Germany
  phone:          +49 40 808077 590
  fax-no:         +49 40 808077 556
  signature:      PGPKEY-140F485B
  encryption:     PGPKEY-140F485B
  admin-c:        TI123-RIPE
  tech-c:         TI123-RIPE
  auth:           PGPKEY-140F485B
  remarks:        This is a TI accredited CSIRT/CERT
  remarks:        emergency number +49 40 808077 590
  remarks:        timezone Europe/Berlin
  remarks:        https://www.trusted-introducer.org/teams/dfn-cert.html
  remarks:        *** This team has been formally certified in accordance
  remarks:        *** with the TI Certification framework, see
  remarks:        *** https://www.trusted-introducer.org/processes/certification.html
  irt-nfy:        dfncert@dfn-cert.de
  created:        2003-08-14T13:12:15Z
  last-modified:  2020-03-09T14:27:23Z
  source:         RIPE # Filtered
  mnt-by:         TRUSTED-INTRODUCER-MNT
  
  % No abuse contact registered for 141.76.0.0 - 141.76.255.255
  ```
  ```
  tdussa@flattop ~ $ bh_host2irt fbi.gov      
  104.16.148.244:
  Comment:        All Cloudflare abuse reporting can be done via https://www.cloudflare.com/abuse
  OrgAbuseHandle: ABUSE2916-ARIN
  OrgAbuseName:   Abuse
  OrgAbusePhone:  +1-650-319-8930 
  OrgAbuseEmail:  abuse@cloudflare.com
  OrgAbuseRef:    https://rdap.arin.net/registry/entity/ABUSE2916-ARIN
  RAbuseHandle: ABUSE2916-ARIN
  RAbuseName:   Abuse
  RAbusePhone:  +1-650-319-8930 
  RAbuseEmail:  abuse@cloudflare.com
  RAbuseRef:    https://rdap.arin.net/registry/entity/ABUSE2916-ARIN
  
  104.16.149.244:
  Comment:        All Cloudflare abuse reporting can be done via https://www.cloudflare.com/abuse
  OrgAbuseHandle: ABUSE2916-ARIN
  OrgAbuseName:   Abuse
  OrgAbusePhone:  +1-650-319-8930 
  OrgAbuseEmail:  abuse@cloudflare.com
  OrgAbuseRef:    https://rdap.arin.net/registry/entity/ABUSE2916-ARIN
  RAbuseHandle: ABUSE2916-ARIN
  RAbuseName:   Abuse
  RAbusePhone:  +1-650-319-8930 
  RAbuseEmail:  abuse@cloudflare.com
  RAbuseRef:    https://rdap.arin.net/registry/entity/ABUSE2916-ARIN
  
  2606:4700::6810:94f4:
  Comment:        All Cloudflare abuse reporting can be done via https://www.cloudflare.com/abuse
  OrgAbuseHandle: ABUSE2916-ARIN
  OrgAbuseName:   Abuse
  OrgAbusePhone:  +1-650-319-8930 
  OrgAbuseEmail:  abuse@cloudflare.com
  OrgAbuseRef:    https://rdap.arin.net/registry/entity/ABUSE2916-ARIN
  RAbuseHandle: ABUSE2916-ARIN
  RAbuseName:   Abuse
  RAbusePhone:  +1-650-319-8930 
  RAbuseEmail:  abuse@cloudflare.com
  RAbuseRef:    https://rdap.arin.net/registry/entity/ABUSE2916-ARIN
  
  2606:4700::6810:95f4:
  Comment:        All Cloudflare abuse reporting can be done via https://www.cloudflare.com/abuse
  OrgAbuseHandle: ABUSE2916-ARIN
  OrgAbuseName:   Abuse
  OrgAbusePhone:  +1-650-319-8930 
  OrgAbuseEmail:  abuse@cloudflare.com
  OrgAbuseRef:    https://rdap.arin.net/registry/entity/ABUSE2916-ARIN
  RAbuseHandle: ABUSE2916-ARIN
  RAbuseName:   Abuse
  RAbusePhone:  +1-650-319-8930 
  RAbuseEmail:  abuse@cloudflare.com
  RAbuseRef:    https://rdap.arin.net/registry/entity/ABUSE2916-ARIN
  ```
  ```
  tdussa@flattop ~ $ bh_host2irt uni-stuttgart.de
  129.69.5.3:
  % Abuse contact for '129.69.0.0 - 129.69.255.255' is 'abuse@uni-stuttgart.de'
  
  OrgAbuseHandle: ABUSE3850-ARIN
  OrgAbuseName:   Abuse Contact
  OrgAbusePhone:  +31205354444 
  OrgAbuseEmail:  abuse@ripe.net
  OrgAbuseRef:    https://rdap.arin.net/registry/entity/ABUSE3850-ARIN
  % Abuse contact for '129.69.0.0 - 129.69.255.255' is 'abuse@uni-stuttgart.de'
  abuse-c:        RUSN1-RIPE
  abuse-mailbox:  abuse@uni-stuttgart.de
  remarks:        trouble:      | abuse@Uni-Stuttgart.DE - spam, UBE, and AUP violations
  
  2001:7c0:7c0:5::cafe:
  % Abuse contact for '2001:7c0:7c0::/48' is 'abuse@uni-stuttgart.de'
  
  % Abuse contact for '2001:7c0:7c0::/48' is 'abuse@uni-stuttgart.de'
  abuse-c:        RUSN1-RIPE
  abuse-mailbox:  abuse@uni-stuttgart.de
  remarks:        trouble:      | abuse@Uni-Stuttgart.DE - spam, UBE, and AUP violations
  abuse-mailbox:  abuse@belwue.de
  ```
