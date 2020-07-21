#!/bin/bash
#
# This is a rather minimal example Argbash potential
# Example taken from http://argbash.readthedocs.io/en/stable/example.html
#
# ARG_OPTIONAL_SINGLE([quality],[q],[Sets quality for optimized images, can be a value from 1 to 100. (100 means lossless optimization)],[80])
# ARG_POSITIONAL_SINGLE([path],[Path to directory for optimization])
# ARG_OPTIONAL_BOOLEAN([recursive],[R],[Do recursive],[off])
# ARG_OPTIONAL_BOOLEAN([verbose],[v],[Be verbose],[off])
# ARG_OPTIONAL_BOOLEAN([keep],[k],[Keep old files],[off])
# ARG_HELP([Tapnesh is wrapper for image optimizers, It simply lets you optimize images in directory(ies) or single images in parallel])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.8.1 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info
# Generated online by https://argbash.io/generate


die()
{
	local _ret=$2
	test -n "$_ret" || _ret=1
	test "$_PRINT_HELP" = yes && print_help >&2
	echo "$1" >&2
	exit ${_ret}
}


begins_with_short_option()
{
	local first_option all_short_options='qRvkh'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_quality="80"
_arg_recursive="off"
_arg_verbose="off"
_arg_keep="off"


print_help()
{
	printf '%s\n' "Tapnesh is wrapper for image optimizers, It simply lets you optimize images in directory(ies) or single images in parallel"
	printf 'Usage: %s [-q|--quality <arg>] [-R|--(no-)recursive] [-v|--(no-)verbose] [-k|--(no-)keep] [-h|--help] <path>\n' "$0"
	printf '\t%s\n' "<path>: Path to directory for optimization"
	printf '\t%s\n' "-q, --quality: Sets quality for optimized images, can be a value from 1 to 100. (100 means lossless optimization) (default: '85')"
	printf '\t%s\n' "-R, --recursive, --no-recursive: Do recursive (off by default)"
	printf '\t%s\n' "-v, --verbose, --no-verbose: Be verbose (off by default)"
	printf '\t%s\n' "-k, --keep, --no-keep: Keep old files (off by default)"
	printf '\t%s\n' "-h, --help: Prints help"
}


parse_commandline()
{
	_positionals_count=0
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-q|--quality)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_quality="$2"
				shift
				;;
			--quality=*)
				_arg_quality="${_key##--quality=}"
				;;
			-q*)
				_arg_quality="${_key##-q}"
				;;
			-R|--no-recursive|--recursive)
				_arg_recursive="on"
				test "${1:0:5}" = "--no-" && _arg_recursive="off"
				;;
			-R*)
				_arg_recursive="on"
				_next="${_key##-R}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					{ begins_with_short_option "$_next" && shift && set -- "-R" "-${_next}" "$@"; } || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-v|--no-verbose|--verbose)
				_arg_verbose="on"
				test "${1:0:5}" = "--no-" && _arg_verbose="off"
				;;
			-v*)
				_arg_verbose="on"
				_next="${_key##-v}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					{ begins_with_short_option "$_next" && shift && set -- "-v" "-${_next}" "$@"; } || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-k|--no-keep|--keep)
				_arg_keep="on"
				test "${1:0:5}" = "--no-" && _arg_keep="off"
				;;
			-k*)
				_arg_keep="on"
				_next="${_key##-k}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					{ begins_with_short_option "$_next" && shift && set -- "-k" "-${_next}" "$@"; } || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_last_positional="$1"
				_positionals+=("$_last_positional")
				_positionals_count=$((_positionals_count + 1))
				;;
		esac
		shift
	done
}

handle_passed_args_count()
{
	local _required_args_string="'path'"
	test "${_positionals_count}" -ge 1 || _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require exactly 1 (namely: $_required_args_string), but got only ${_positionals_count}." 1
	test "${_positionals_count}" -le 1 || _PRINT_HELP=yes die "FATAL ERROR: There were spurious positional arguments --- we expect exactly 1 (namely: $_required_args_string), but got ${_positionals_count} (the last one was: '${_last_positional}')." 1
}


assign_positional_args()
{
	local _positional_name _shift_for=$1
	_positional_names="_arg_path "

	shift "$_shift_for"
	for _positional_name in ${_positional_names}
	do
		test $# -gt 0 || break
		eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
		shift
	done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args 1 "${_positionals[@]}"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])



validate_quality(){
	QUALITY=$1
	MIN_QUALITY_VALUE=1
	MAX_QUALITY_VALUE=100

	if [ $QUALITY -lt $MIN_QUALITY_VALUE ]; then
		echo "[!] Minimum value for quality is $MIN_QUALITY_VALUE";
		echo "[!] Exiting ..."
		exit -1
	elif [ $QUALITY -gt $MAX_QUALITY_VALUE ]; then
		echo "[!] Maximum value for quality is $MAX_QUALITY_VALUE";
		echo "[!] Exiting ..."
		exit -1
	fi

}

formatHumanReadableSize(){
  numfmt $1 --to=iec-i
}


#Arguments validation
validate_quality $_arg_quality

# [ <-- needed because of Argbash
log (){
	if [[ $_arg_verbose == "on" ]]; then
		echo $1
	fi
}

PREFIX="tapnesh_"

if [[ -f $_arg_path ]]; then #Check if path is a file
	IMG="$_arg_path"
	FILE_FULL_PATH=$(readlink -f "$_arg_path")
	log "[L] Processing $FILE_FULL_PATH"
	#Find file extension base on magic number, not name since sometimes images get saved with wrong extensions
	TIME_BEFORE=$(date +%s.%N)
	SIZE_BEFORE=$(du "$_arg_path" -b | cut -f1)

	MIMETYPE=$(file "$IMG" --mime-type -b)
	if [[ $MIMETYPE == "image/jpeg" ]]; then
		log "[L] jpeg file"
		OPTIONS="--strip-all -m$_arg_quality -q"
		if [[ $_arg_keep == "on" ]]; then #Create e forced backup if they wanna keep old files
			log "[L] backing up ..."
			/bin/cp -f "$IMG" "$(dirname "$IMG")/$PREFIX$(basename "$IMG")"
		fi
		sh -c "/usr/bin/jpegoptim $OPTIONS '$IMG'"
	elif [[ $MIMETYPE == "image/png" ]]; then
		log "[L] Png file ..."
		OPTIONS="--strip --speed 1 -f --quality $_arg_quality-$_arg_quality --skip-if-larger"
		if [[ $_arg_keep == "on" ]]; then
			log "[L] Backing up..."
			OPTIONS="$OPTIONS --output '$(dirname "$IMG")/$PREFIX$(basename "$IMG")' "
		else
			OPTIONS="$OPTIONS --output '$(dirname "$IMG")/$(basename "$IMG")' "
		fi
		log "[L] Compressing ..."
		sh -c "/usr/bin/pngquant $OPTIONS '$IMG'"
	else
		echo "[E] Invalid image type !"
	fi
	TIME_AFTER=$(date +%s.%N)
	TOTAL_TIME=$(awk -v item=$TIME_AFTER -v total=$TIME_BEFORE 'BEGIN { printf "%.2f\n", item - total }')

	SIZE_AFTER=$(du "$_arg_path" -b | cut -f1)
	OPT_PERCENT=$(awk -v item=$SIZE_AFTER -v total=$SIZE_BEFORE 'BEGIN { printf "%.2f\n", 100 * (1-(item / total)) }')

	echo "[*] File: $_arg_path"
	echo "[*] Processing time: ${TOTAL_TIME} seconds"
	echo "[*] Before: [$(formatHumanReadableSize $SIZE_BEFORE)] ==> After: [$(formatHumanReadableSize $SIZE_AFTER)] ($OPT_PERCENT% size decreased)"

elif [[ -d "$_arg_path" ]]; then
	#User wants to optimize a directory
	#Check if he/she wants recursive option

	FIND_OPTIONS=" -iregex '.*\.\(jpg\|png\|jpeg\)$' "

	if [[ $_arg_recursive == "off" ]]; then
		FIND_OPTIONS="-maxdepth 1 $FIND_OPTIONS "
	fi
	FIND_CMD="find "$_arg_path" $FIND_OPTIONS"

	PARALLEL_OPTIONS=" --no-notice"

	TAPNESH_OPTIONS="-q $_arg_quality"
	if [[ $_arg_keep == "on" ]]; then
		TAPNESH_OPTIONS="--keep $TAPNESH_OPTIONS"
	fi

	if [[ $_arg_verbose == "on" ]]; then
		TAPNESH_OPTIONS="--verbose $TAPNESH_OPTIONS"
	fi

	echo "[*] Finding images and processing in parallel at same time..."
	sh -c "$FIND_CMD | /usr/bin/parallel $PARALLEL_OPTIONS /usr/local/bin/tapnesh $TAPNESH_OPTIONS {}"
	log "[L] Compressing directory has been finished!"
fi
  log "[*] Done"
# ] <-- needed because of Argbash
