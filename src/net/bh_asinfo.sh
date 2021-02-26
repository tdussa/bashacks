bh_asinfo()
{
    local as="$(echo ${1} | tr a-z A-Z)"

    if [ -n "${as}" ]; then
        if ! echo ${as} | fgrep -cq AS; then
            as="AS${as}"
        fi

        whois -h whois.cymru.com " -v ${as}"
    fi
}
