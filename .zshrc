POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

# Support over 256 colors
export TERM="xterm-256color"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    isLinux=true
else
    isLinux=false
fi;

if $isLinux ; then
    export ZSH="/home/matthewyasul/.oh-my-zsh"
else
    export ZSH="/Users/mitchjusay/.oh-my-zsh"
fi;

if [ ! -d $HOME/.antigen ]; then
    mkdir -p $HOME/.antigen
    git clone https://github.com/zsh-users/antigen.git $HOME/.antigen
    clear
fi;

source $HOME/.antigen/antigen.zsh

#Load the oh-my-zsh's library.
antigen use oh-my-zsh

#Bundles from the default repo
if $isLinux ; then
    antigen bundle archlinux
else
    antigen bundle brew
fi;
antigen bundle compleat
antigen bundle extract
antigen bundle git
antigen bundle git-extras
antigen bundle git-flow
antigen bundle git-remote-branch
antigen bundle gitignore
antigen bundle github
antigen bundle gradle
antigen bundle pip
antigen bundle tmux
antigen bundle tmuxinator
antigen bundle vi-mode

#Bundles from other repo
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

#This bitch bundle has to be the last bundle
antigen bundle zsh-users/zsh-syntax-highlighting

#Install theme
antigen theme bhilburn/powerlevel9k powerlevel9k

#Finalize
antigen apply

clear

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set what font is being used
POWERLEVEL9K_MODE="nerdfont-complete"

# Set depth of displayed directory
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

# Sets prompt on new line
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Adds 2 new lines per prompt
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE_COUNT=2

# Sets left prompt elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    os_icon
    vi_mode
    root_indicator
    dir_writable
    dir
    vcs
)

# Sets right prompt element
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    time
    date
)

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
if $isLinux ; then
    plugins=(
        archlinux
        compleat
        git
        git-extras
        git-flow
        git-remote-branch
        gitignore
        github
        gradle
        pip
        tmux
        tmuxinator
        vi-mode
        zsh-autosuggestions
        zsh-syntax-highlighting
    )
else
    plugins=(
        brew
        compleat
        extract
        git
        git-extras
        git-flow
        git-remote-branch
        gitignore
        github
        gradle
        pip
        tmux
        tmuxinator
        vi-mode
        zsh-autosuggestions
        zsh-syntax-highlighting
    )
fi;

# Setting custom commands
alias zsh-update='upgrade_oh_my_zsh & antigen selfupdate & antigen update'
alias clr-sg='echo ""> ~/.zsh_history & exec $SHELL -l'

# Load existing commands previously placed in bash profile
. ~/.bash_profile

# Overwrite highlight style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'

# Ported from my zshrc setup

alias sshdev="ssh dev@myasul.syd1.fln-dev.net"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Arcanist
if [ -d "$HOME/phabricator/" ]; then
    echo "arcanist-bash active"
    export PATH="${PATH}:~/phabricator/arcanist/bin"
    source ~/phabricator/arcanist/resources/shell/bash-completion
else
    echo "arcanist-bash inactive"
fi
alias arc="~/phabricator/arcanist/bin/arc"


# GIT AND ARC ALIASES
if [ -f ~/.zsh/.git-arc-aliases ]; then
    source ~/.zsh/.git-arc-aliases
else
    print "404: ~/.zsh/.git-arc-aliases not found."
fi


export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"


# Automatically open TMUX by default
# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#   tmux attach -t default || tmux new -s default
# fi

# Kill a certain port
kill_port() {
	if [ $# -eq 0 ]; then
		echo "No arguments provided"
		echo "Provide port of service you wish to kill"
		exit 1
	fi
	sudo fuser -k $1/tcp
}



# Check if custom local configuration exists and use it if it does
if [ -f $HOME/.zsh-local-conf ]; then
    . $HOME/.zsh-local-conf
fi;

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
