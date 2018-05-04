###############################################################################
#                             Driglibash pack 2
#                   Argument parsing for bash scripts
###############################################################################

# variable types
# boolean / list / string /
# mandatory or not

declare -A usage
declare -A short
declare -A varia
version="alpha nightly 0.0.1 pre-release unstable"
summary="$0 [options] <device>"

usage[test]="Start qemu after the installation"
short[test]=t
varia[test]=tst
tst=false

usage[install]="Install the provided package. Not implemented"
short[install]=i
varia[install]=install
declare -a install

# https://github.com/adrianamaglio/driglibash-arg v2.0
declare -a positional
wait_for=
got_one=false
for arg ; do
  if [ -n "$(echo "$arg" | grep '^-[a-zA-Z0-9_\-]\+$')" && -n "$wait_for" && "$got_one" == "false"] ; then
    die "Missing arument for option '$wait_for'"
  elif [ -n "$(echo "$arg" | grep '^--[a-zA-Z0-9_\-]\+$')" ] ; then
    if [ $(driglibash_arg_type "$arg") == "boolean" ] ; then : ; else wait_for="$arg"; got_one=false ;fi #TODO set var
  elif [ -n "$(echo "$arg" | grep '^-[a-zA-Z0-9_]\+$')"] ; then
    
  else
    positional+=("$arg")
  fi
done
