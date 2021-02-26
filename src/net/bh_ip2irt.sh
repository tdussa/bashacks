bh_ip2irt()
{
    local ipaddress="${1:-`bh_myip`}"

    local whoiscresult="$(whois -c "$ipaddress")"
    local whoisresult="$(whois "$ipaddress")"

    local whoiscabuse=$(echo "${whoiscresult}" \
	                    | fgrep -i " abuse contact ")
    local whoiscirt=$(echo "${whoiscresult}" \
                          | sed '/^irt:/,/^$/!d')
    local whoisabuse=$(echo "${whoisresult}" \
                           | fgrep -i "abuse")
    local whoisirt=$(echo "${whoisresult}" \
                         | sed '/^irt:/,/^$/!d')

    if [ -n "${whoiscabuse}" ] \
       && ! echo "${whoiscabuse}" \
              | fgrep -qc "% No abuse contact registered for "; then
        echo -e "${whoiscabuse}\n"
    fi
    if [ -n "${whoiscirt}" ]; then
	    echo -e "${whoiscirt}\n"
    fi
    if [ -n "${whoisabuse}" ]; then
	    echo -e "${whoisabuse}\n"
    fi
    if [ -n "${whoisirt}" ]; then
	    echo -e "${whoisirt}\n"
    fi
}
