bh_prefix() {
	if [ -z "${PREFIX}" ] && [ -z "${PREFIX2}" ]; then
		local PREFIX="$1"
		local PREFIX2="$1"
		shift
	fi

	if [ -z "${PREFIX2}" ]; then
		$@ > >(trap "" INT TERM; sed "s/^/${PREFIX}/")
	else
		$@ > >(trap "" INT TERM; sed "s/^/${PREFIX}/") 2> >(trap "" INT TERM; sed "s/^/${PREFIX2}/" >&2)
	fi
}
