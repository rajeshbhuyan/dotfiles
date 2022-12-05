echo "**  Welcome $USER  **"
echo ""
# source the default cshrc
if ( -f /usr/local/etc/default.cshrc ) then
        source /usr/local/etc/default.cshrc
endif
if (! $?ARCH) then
    setenv ARCH `/usr/local/bin/arch`
endif

if (! $?UNAME) then
    setenv UNAME `uname`
endif
# basic info about the host/user
if (! $?USER) then
    setenv USER `whoami`
endif

if (! $?HOST) then
    setenv HOST `hostname`
endif

## Note: while using set command leave space before and after "=" or do not leave any space. if you leave space on one side oand no spac eon other side it will show error.

# Set the term and shell variables
setenv TERM vt100  # Specify terminal type
set color
set notify    # Turn on immediate notification of job completion
set ignoreeof  # Disable logging out via CTRL-D
set history = 20       # Tell shell to remember the last 20 commands
set prompt = "% "       # Define command line prompt
set fignore = (.o .bak)  # Specify suffixes to ignore during filename completion

# set path=directory1:directory2:directory3:
set path=$PATH:$HOME/bin:
# another way to add path 
set path = ( /bin /usr/bin /usr/ucb ˜/bin . )
set promptchars="%#"
set history=100
set savehist=(1000 merge)
set autolist=ambiguous
set autoexpand
set autorehash
set correct = cmd  # auto correct the command
set filec           # enable filename completion
set noclobber       # don't clobber existing files
set nomatch         # not an error if '*' matches nothing


# **  Environment Variables  ** #
setenv TERM vt100            # Specify terminal type
setenv EDITOR /usr/bin/emacs  # Specify preferred editor for defalult editor
setenv EDITOR vi

# **  Aliases  ** #
alias ls 'ls -CF'
alias ll 'ls -l'
alias h history
alias print 'pr \!* | lpr'
alias j jobs -l
alias la ls -aF
alias ll ls -lFA

if ($?prompt) then
    set prompt = "% "
    set history = 20
    set cdpath = ( ˜ ˜/Projects ˜/Papers )
    set prompt = '[\!]% ' # replaced the prompt. if you want to use your own prompt you can add here.
    set prompt="%N@%m:%~ %# "
endif


tset -I -Q
stty erase ^h intr ^c
