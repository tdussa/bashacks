bh_ip2irt()
{
    local ipaddress="${1:-`bh_myip`}"

    whois -c "$ipaddress" \
        | sed '/^irt:/,/^$/!d'
}
