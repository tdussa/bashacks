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
  ```

* `bh_host2irt`: Resolve a given host name to its IP address(es) and run
  `bh_ip2irt` on every one of those.
  Examples:
  ```
  tdussa@flattop ~ $ bh_host2irt tu-dresden.de 
  141.76.39.140:
  % No abuse contact registered for 141.76.0.0 - 141.76.255.255
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
  ```
  ```
  tdussa@flattop ~ $ bh_host2irt fbi.gov      
  104.16.148.244:
  % No abuse contact registered for 103.252.92.0 - 104.37.31.255

  104.16.149.244:
  % No abuse contact registered for 103.252.92.0 - 104.37.31.255

  2606:4700::6810:94f4:
  % No abuse contact registered for ::/0

  2606:4700::6810:95f4:
  % No abuse contact registered for ::/0
  ```
  ```
  tdussa@flattop ~ $ bh_host2irt uni-stuttgart.de
  129.69.5.3:
  % Abuse contact for '129.69.0.0 - 129.69.255.255' is 'abuse@uni-stuttgart.de'

  2001:7c0:7c0:5::cafe:
  % Abuse contact for '2001:7c0:7c0::/48' is 'abuse@uni-stuttgart.de'
  ```
