###############################################################################
#                             Driglibash pack 1
#                 Usual helper functions for bash scripts
#               https://github.com/adrianamaglio/driglibash
###############################################################################

# Output on standard error output #
yell() {
  echo >&2 -e "$@"
}

# Print an error, clean and exit #
die() {
  yell "$@"
  clean
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

# Clean exit #
# Record command lines passed as argument and execute them all when called without args #
# One argument = One command #
clean() {
  if [ $# -gt 0 ] ; then
    driglibash_clean_actions+=("$@")
  else
    echo "Cleaning"
    for action in "${driglibash_clean_actions[@]}" ; do
      echo "> $action"
      $action
    done
  fi
}

