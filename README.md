# Driglibash
Simple helper script for bash, in bash.
Those scripts are not optimized at all, they may be slow and ressources consuming. They are made for simplicity.

## Driglibash-base
This file contains some very basic functions that are wildely used. Since bash is pain to read, you better do a lot of them.

### yell
Print its arguments on stderr.

### clean
Store its last argument as command and execute them all when called without arguments. Example :
```
$ clean "echo file"
$ clean
file
```
You can add a first argument in (pre/post/del) to add your command before/after the others or to remove it from the list

### die
Like yell but clean and exit too.

### root_or_die
Execute `die` if the user is not root

### section
Print a separation line that is the size of the terminal. If an argument is provided, it will be displayed in the middle of the line.
```
$ section 'Unit tests'
=============================================================================================================== Unit tests ==============================================================================================================
```

### run
Execute a command. Run a clean and exit if it returns a non zero status.
If you set the variable `driglibash_run_retry`, you will be asked to retry a failing command.

### start
Execute a command in background, add a clean task that kill it, and returns the pid.
Be careful ! Only the PID of the started process is returned. If the process forks, driglibash can’t stop it when needed.

### where
Tells you where (in absolute path) is the script being executed. Useful when you want to access som files next to your executable. If the `--follow` argument is provided, `where` will follow symlinks and find the linked script file.

### repeat
Print its first argument, the second argument times.
```
$ repeat '=' 10
==========
```


## driglibash-args
A little framework for argument parsing in bash. It already contains driglibash-base.
Just fill the arrays `usage` et `varia` and the value
Usage exemple :
```
# Thoses two lines are important for bash
declare -A usage
declare -A varia

version="alpha nightly 0.0.1 pre-release unstable"
summary="$0 [options] <device>"

# if the script is called with -t option, tst will be set to true
usage[t]="Start qemu after the installation"
varia[t]=tst
tst=false

# if the script is called with -i option, tst will be an array of every argument passed to -i (must repeat -i)
usage[i]="Install the provided package. Not implemented"
varia[i]=install
declare -a install

. driglibash-args
# After this line, driglibash-base is available and your variables are set according to arguments
# Exemple. If you call :
# ./this-script -i package2 -t -i package1
# tst will be true and install will be an array containing (package2 package1)
```
