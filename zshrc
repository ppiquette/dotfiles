# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# yanick
# to fix pycharm terminal. It should load /etc/paths on macosx but it doesn't
PATH=/usr/local/bin:$PATH

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH=/Users/yanick/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="spaceship"
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="frisk"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  docker-compose
  tmux
  z
  pyenv
  fzf-zsh
  zsh-completions
  zsh-autosuggestions
  zsh-iterm-touchbar
)

######################################################################

source $ZSH/oh-my-zsh.sh



# User configuration

# To run legwork test units
export PYPI_ACCESS_KEY=507cd21e-e8d5-4a59-9f64-9aa1b99969d3
export PYPI_SECRET_KEY=1d3722bd-5b5d-451c-a570-f90a600d635c

export DB_NAME=legwork
export MONGO_DB_URI=mongodb://localhost:27017/legwork?uuidRepresentation\=standard
export HOST_INVESTIGATOR_USER=user
export PYTHONUNBUFFERED=1
export REDIS_HOST=localhost
export PYTHONASYNCIODEBUG=0

# Add them to launchctl to have them inside pycharm
launchctl setenv DB_NAME ${DB_NAME}
launchctl setenv MONGO_DB_URI ${MONGO_DB_URI}
launchctl setenv HOST_INVESTIGATOR_USER ${HOST_INVESTIGATOR_USER}
launchctl setenv PYTHONUNBUFFERED ${PYTHONUNBUFFERED}
launchctl setenv REDIS_HOST ${REDIS_HOST}
launchctl setenv PYTHONASYNCIODEBUG ${PYTHONASYNCIODEBUG}

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


######################################################################
# Fuzzy finder 'fzf'

# fcd - cd to selected directory
fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
} 

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fopen() {
  local out file key
  IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

fgit_branch() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

fgit_del_branch() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m)
  if [[ $branch ]]; then
      echo "About to delete UNMERGED branch:\n'$branch'"
      read -q "REPLY?Are you sure? (y/n)"
      echo ""
      if [[ "$REPLY" = "y" ]]; then
        git branch -D $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
      else
        echo "Aborting..."
      fi
  fi
}

fgit_del_merged_branch() {
  local branches branch
  branches=$(git branch -vv --merged) &&
  branch=$(echo "$branches" | fzf +m) &&
  git branch -d $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}


######################################################################
# iterm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

