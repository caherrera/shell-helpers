# shellcheck shell=bash

if ! declare -p FG_COLOURS > /dev/null 2>&1; then
  declare -A FG_COLOURS=(
    [black]=30
    [red]=31
    [green]=32
    [yellow]=33
    [blue]=34
    [magenta]=35
    [cyan]=36
    [white]=37
    [bright_black]=90
    [bright_red]=91
    [bright_green]=92
    [bright_yellow]=93
    [bright_blue]=94
    [bright_magenta]=95
    [bright_cyan]=96
    [bright_white]=97
  )
fi

if ! declare -p BG_COLOURS > /dev/null 2>&1; then
  declare -A BG_COLOURS=(
    [black]=40
    [red]=41
    [green]=42
    [yellow]=43
    [blue]=44
    [magenta]=45
    [cyan]=46
    [white]=47
    [bright_black]=100
    [bright_red]=101
    [bright_green]=102
    [bright_yellow]=103
    [bright_blue]=104
    [bright_magenta]=105
    [bright_cyan]=106
    [bright_white]=107
  )
fi

if ! declare -p NC > /dev/null 2>&1; then
  declare -r NC=$'\033[0m' # No Color
fi


function may_color() {
  if [ -n "${CI:-}" ]; then
    return 0
  elif [ -z "${TERM:-}" ]; then
    return 1
  else
    case "${TERM:-}" in
          *color*|*256*|xterm*|screen*|tmux*)
              return 0 ;;
          *)
              return 1 ;;
    esac;
  fi
}

function yellow() {
	printf "\033[%sm%s%s" "${FG_COLOURS[yellow]}" "$@" "${NC}"
}

function red() {
	printf "\033[%sm%s%s" "${FG_COLOURS[red]}" "$@" "${NC}"
}
function green() {
	printf "\033[%sm%s%s" "${FG_COLOURS[green]}" "$@" "${NC}"
}
function blue() {
	printf "\033[%sm%s%s" "${FG_COLOURS[blue]}" "$@" "${NC}"
}

function black() {
	printf "\033[%sm%s%s" "${FG_COLOURS[black]}" "$@" "${NC}"
}

function magenta() {
	printf "\033[%sm%s%s" "${FG_COLOURS[magenta]}" "$@" "${NC}"
}

function cyan() {
	printf "\033[%sm%s%s" "${FG_COLOURS[cyan]}" "$@" "${NC}"
}

function white() {
	printf "\033[%sm%s%s" "${FG_COLOURS[white]}" "$@" "${NC}"
}

function bright_black() {
	printf "\033[%sm%s%s" "${FG_COLOURS[bright_black]}" "$@" "${NC}"
}

function bright_red() {
	printf "\033[%sm%s%s" "${FG_COLOURS[bright_red]}" "$@" "${NC}"
}

function bright_green() {
	printf "\033[%sm%s%s" "${FG_COLOURS[bright_green]}" "$@" "${NC}"
}

function bright_yellow() {
	printf "\033[%sm%s%s" "${FG_COLOURS[bright_yellow]}" "$@" "${NC}"
}

function bright_blue() {
	printf "\033[%sm%s%s" "${FG_COLOURS[bright_blue]}" "$@" "${NC}"
}

function bright_magenta() {
	printf "\033[%sm%s%s" "${FG_COLOURS[bright_magenta]}" "$@" "${NC}"
}

function bright_cyan() {
	printf "\033[%sm%s%s" "${FG_COLOURS[bright_cyan]}" "$@" "${NC}"
}

function bright_white() {
	printf "\033[%sm%s%s" "${FG_COLOURS[bright_white]}" "$@" "${NC}"
}

function bg_black() {
	printf "\033[%sm%s%s" "${BG_COLOURS[black]}" "$@" "${NC}"
}

function bg_red() {
	printf "\033[%sm%s%s" "${BG_COLOURS[red]}" "$@" "${NC}"
}

function bg_green() {
	printf "\033[%sm%s%s" "${BG_COLOURS[green]}" "$@" "${NC}"
}

function bg_yellow() {
	printf "\033[%sm%s%s" "${BG_COLOURS[yellow]}" "$@" "${NC}"
}

function bg_blue() {
	printf "\033[%sm%s%s" "${BG_COLOURS[blue]}" "$@" "${NC}"
}

function bg_magenta() {
	printf "\033[%sm%s%s" "${BG_COLOURS[magenta]}" "$@" "${NC}"
}

function bg_cyan() {
	printf "\033[%sm%s%s" "${BG_COLOURS[cyan]}" "$@" "${NC}"
}

function bg_white() {
	printf "\033[%sm%s%s" "${BG_COLOURS[white]}" "$@" "${NC}"
}

function bg_bright_black() {
	printf "\033[%sm%s%s" "${BG_COLOURS[bright_black]}" "$@" "${NC}"
}

function bg_bright_red() {
	printf "\033[%sm%s%s" "${BG_COLOURS[bright_red]}" "$@" "${NC}"
}

function bg_bright_green() {
	printf "\033[%sm%s%s" "${BG_COLOURS[bright_green]}" "$@" "${NC}"
}

function bg_bright_yellow() {
	printf "\033[%sm%s%s" "${BG_COLOURS[bright_yellow]}" "$@" "${NC}"
}

function bg_bright_blue() {
	printf "\033[%sm%s%s" "${BG_COLOURS[bright_blue]}" "$@" "${NC}"
}

function bg_bright_magenta() {
	printf "\033[%sm%s%s" "${BG_COLOURS[bright_magenta]}" "$@" "${NC}"
}

function bg_bright_cyan() {
	printf "\033[%sm%s%s" "${BG_COLOURS[bright_cyan]}" "$@" "${NC}"
}

function bg_bright_white() {
	printf "\033[%sm%s%s" "${BG_COLOURS[bright_white]}" "$@" "${NC}"
}


function echoc() {
        local color="${1,,}"
        local title="$2"
        shift 2
        local message="$*"
        local formatted_title="$title"

	may_color && [ -n "$color" ] && declare -F "$color" >/dev/null && formatted_title="$($color "$title")"

	printf "%s %s" "$formatted_title" "$message"

}


function success(){
  get_log_level "INFO" &&  echoc "green" "[INFO]" "$@" && echo  >&2 || true;
}

function notice(){
  get_log_level "INFO" &&  echoc "cyan" "[NOTICE]" "$@" && echo  >&2 || true;
}

function info(){
  get_log_level "INFO" &&  echoc "blue" "[INFO]" "$@" && echo  >&2 || true;
}

function warning() {
	get_log_level "WARN" &&  echoc "yellow" "[WARN]" "$@" && echo >&2 || true;
}

function warn(){
  get_log_level "WARN" &&  echoc "yellow" "[WARN]" "$@" && echo >&2 || true;
}

function error(){
  get_log_level "ERROR" && echoc "red" "[ERROR]" "$@" && echo >&2 || true;
}


function fatal(){
  echoc "red" "[FATAL]" "$@" && echo >&2;
  exit 1
}

function debug(){
  get_log_level "DEBUG" &&  echo "[DEBUG]" "$@" && echo >&2 || true;
}

function verbose(){
	get_log_level "VERBOSE" &&  echo "[VERBOSE]" "$@" && echo >&2 || true;
}

function trace(){
	get_log_level "TRACE" &&  echo "[TRACE]" "$@" && echo >&2 || true;
}



function has_tty_available() {
	if [[ -t 0 || -t 1 || -t 2 ]]; then
		return 0
	fi
	if [[ -r /dev/tty && -w /dev/tty ]]; then
		return 0
	fi
	return 1
}

function confirm() {
	local prompt="${1:-Are you sure? [y/N]: }"
	local default_response="n"
	local answer=""

	if [[ "${QUIET:-}" == "true" || "${QUIET:-}" == "1" ]]; then
		error "❌ Confirmation required but QUIET mode is enabled."
		return 1
	fi

	if ! has_tty_available; then
		error "❌ Confirmation required but no interactive terminal is available."
		return 1
	fi

	local read_fd=""
	local need_close_fd="false"

	if [[ -t 0 ]]; then
		read_fd="0"
	elif [[ -r /dev/tty ]]; then
		if exec {read_fd}<>/dev/tty; then
			need_close_fd="true"
		else
			read_fd=""
		fi
	fi

	if [[ -z "${read_fd}" ]]; then
		error "❌ Confirmation required but could not access a terminal."
		return 1
	fi

	local prompt_fd=""
	if [[ -t 2 ]]; then
		prompt_fd="2"
	elif [[ -t 1 ]]; then
		prompt_fd="1"
	else
		prompt_fd="${read_fd}"
	fi

	while true; do
		printf '%s' "${prompt}" >&${prompt_fd}
		if ! IFS= read -r -u "${read_fd}" answer; then
			answer=""
		fi

		if [[ -z "${answer}" ]]; then
			answer="${default_response}"
		fi

		case "${answer}" in
			y|Y|yes|YES)
				if [[ "${need_close_fd}" == "true" ]]; then
					exec {read_fd}>&-
				fi
				return 0
				;;
			n|N|no|NO)
				if [[ "${need_close_fd}" == "true" ]]; then
					exec {read_fd}>&-
				fi
				return 1
				;;
			*)
				warn "⚠️ Please answer 'y' or 'n'."
				;;
		esac
	done
}

function split_title() {
        local max_length="80"
        local text="$*"

	while [[ ${#text} -gt $max_length ]]; do
		# Corta el texto en la longitud máxima permitida
		echo "*** ${text:0:$max_length} ***"
		# Resto del texto
		text="${text:$max_length}"
	done
	# Muestra el resto que no supera el límite
	echo "*** $text ***" >&2
}

function printtitle() {
        local title="$*"
        info "********************************************"
        info "*** $title ***"
        info "********************************************"
        
}

# Ensure given commands exist in PATH; print friendly errors and return non-zero if any missing
# Usage: ensure_commands glab jq yq
function ensure_commands() {
	local missing=()
	local cmd
	for cmd in "$@"; do
		if ! command -v "$cmd" >/dev/null 2>&1; then
			missing+=("$cmd")
		fi
	done
	if (( ${#missing[@]} > 0 )); then
		local m
		for m in "${missing[@]}"; do
			case "$m" in
				glab)
					error "❌ 'glab' CLI is required. Install it from https://gitlab.com/gitlab-org/cli and ensure it's on your PATH." ;;
				jq)
					error "❌ 'jq' is required. Install it from https://stedolan.github.io/jq/ or your package manager." ;;
				yq)
					error "❌ 'yq' is optional but required for YAML pretty printing unless Python+PyYAML fallback is configured. See https://mikefarah.gitbook.io/yq/" ;;
				*)
					error "❌ '$m' is required and was not found in PATH." ;;
			esac
		done
		return 1
	fi
	return 0
}

# If the user has a personal token in GITLAB_TOKEN but GLAB_TOKEN isn't set, propagate it
function setup_gitlab_token() {
	if [[ -z "${GLAB_TOKEN:-}" && -n "${GITLAB_TOKEN:-}" ]]; then
		export GLAB_TOKEN="${GITLAB_TOKEN}"
		debug "Using GLAB_TOKEN from GITLAB_TOKEN environment variable."
	fi
}

# Combined helper to initialize environment for scripts.
# Pass the list of required commands for the script (e.g., glab jq)
function ensure_dependencies() {
	setup_gitlab_token
	ensure_commands "$@"
}



function get_log_level() {
  local LL EE
  if [[ "${QUIET:-}" == "true" || "${QUIET:-}" == "1" ]]; then
	VERBOSITY="QUIET"
  fi
  case "${VERBOSITY:-"INFO"}" in
    QUIET) LL=0 ;;
    ERROR) LL=1 ;;
    WARN) LL=2 ;;
    INFO) LL=3 ;;
    DEBUG) LL=4 ;;
	VERBOSE) LL=5 ;;
	TRACE) LL=6 ;;
    *) LL=3 ;;
  esac

  case "$1" in
    QUIET) EE=0 ;;
    ERROR) EE=1 ;;
    WARN) EE=2 ;;
    INFO) EE=3 ;;
    DEBUG) EE=4 ;;
	VERBOSE) EE=5 ;;
	TRACE) EE=6 ;;
    *) EE=3 ;;
  esac

  if [ $LL -ge $EE ]; then
    return 0
  else
    return 1
  fi

}
