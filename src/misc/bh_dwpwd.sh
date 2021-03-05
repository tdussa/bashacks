bh_dwpwd() {
	while PASS=$(bh_dwpwx) && \
              ! [[ "${PASS}" =~ ^[[:alnum:]]+$ ]]; do \
	done
	echo $PASS
}
