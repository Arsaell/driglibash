# Driglibash
Simple helper script for bash, in bash.
Those scripts are not optimized at all, they may be slow and ressources consuming. They are made for simplicity.

## Driglibash-base
This file contains some very basic functions

### yell
Print its arguments on stderr.

### clean
Store its argument as command and execute them all when called without arguments. Example :
```
$ clean "echo file"
$ clean
file
```
If you supply a command that is already in cleans memory, it will be removed and wont be executed at all when cleaning.
```
$ clean "echo file"
$ clean "echo file"
$ clean 
# Nothing to do
```

### die
Like yell but clean and exit too.

### root_or_die
Die if the user is not root

### run
Execute a command adn clean and exit if it returns a non zero status.

### where
Tells you where is the script being executed. Useful when you want to access som files next to your executable. If any non void argument is provided, `where` will follow symlinks and find the linked script file.

## driglibash-args
A little framework for argument parsing in bash. It already contains driglibash-base

```
# Thoses two lines are important for bash
declare -A usage
declare -A varia

version="alpha nightly 0.0.1 pre-release unstable"
summary="$0 [options] <device>"

usage[t]="Start qemu after the installation"
varia[t]=tst
tst=false

usage[i]="Install the provided package. Not implemented"
varia[i]=install
declare -a install

usage[k]="Keep the temporar mountpoints"
varia[k]=keep
keep=false

usage[e]="bash command file to execute in the chroot. - to read from stdin"
varia[e]=execute
declare -a execute

. driglibash-args
# After this line, driglibash-base is available and your variables are set according to arguments
```
