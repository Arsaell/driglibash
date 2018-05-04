###############################################################################
#                             Driglibash pack 1
#                 Usual helper functions for bash scripts
###############################################################################

# Output on standard error output #
yell() {
  echo >&2 -e "$@"
}

# Print an error and exit #
die() {
  yell "$@"
  exit 1
}

# Exit on error if not root #
root_or_die() {
  if [ "$UID" -ne 0 ] ; then
    die "You need to be root"
  fi
}

# Execute a command and die if it returns with error #
run() {
  "$@"
  code=$?
  [ $code -ne 0 ] && die "command [$*] failed with erro code $code"
}

