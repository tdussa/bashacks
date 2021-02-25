bh_host2irt()
{
    local host="${1:-`bh_myip`}"
    local hosts=$(getent ahosts "${host}" \
                      | cut -d' ' -f1 \
		      | sort -u)

    for ipaddress in ${hosts}; do
        bh_ip2irt "$ipaddress"
    done
}
