bh_prefix() {
	PREFIX="$1"
	shift
	$@ > >(trap "" INT TERM; sed "s/^/${PREFIX}/") 2> >(trap "" INT TERM; sed "s/^/${PREFIX}/" >&2)
}
