bh_ip2cymru()
{
    local ipaddress="${1:-`bh_myip`}"

    whois -h whois.cymru.com " -v ${ipaddress}"
    echo
}
