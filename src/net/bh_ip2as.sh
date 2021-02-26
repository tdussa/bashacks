bh_ip2as()
{
    local ipaddress="${1:-`bh_myip`}"

    whois -h whois.cymru.com "${ipaddress}"
    echo
}
