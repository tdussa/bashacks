bh_ip2irt()
{
    local ipaddress="${1:-`bh_myip`}"

    local whoisresult="$(whois -c "$ipaddress")"
   
    echo "${whoisresult}" \
        | sed '/^% Abuse contact for /!d'
    echo
    echo "${whoisresult}" \
        | sed '/^irt:/,/^$/!d'
}
