# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#




# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=10'

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install

# Created by newuser for 5.8
# ---------------------------------------------------------- 


# Aliases
# ----------------------------------------------------------
alias nano='vim'                       # Alias for nano to vim
alias transid='trans :id'              # Alias for trans shell translate to indonesia
alias sleep='systemctl suspend -i'     # Sleep the pc
alias restart='systemctl reboot -i'    # Restart the pc 
alias shutdown='systemctl poweroff -i' # Shutdown the pc
alias reload='exec zsh'                # Reload zsh
alias navish='navi --cheatsh'          # Access navi with cheat.sh repos
alias navitl='navi --tldr'             # Access navi with tldr repos
# ----------------------------------------------------------


# Init sources for third party tools/apps
# ----------------------------------------------------------
# Brew init
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# asdf init
. $HOME/.asdf/asdf.sh                 
# append completions to fpath         
fpath=(${ASDF_DIR}/completions $fpath)

# Zsh plugin that reminds you to use exisitng aliases for commands you just typed
source githubs/zsh-you-should-use/you-should-use.plugin.zsh
#-----------------------------------------------------------


# Some random configurations
# ----------------------------------------------------------

# Cheat completion
fpath=(~/.zsh.d/ $fpath)

# Bat themes
export BAT_THEME="Dracula"

# Dir colors location
eval `dircolors /home/enricofadly/.dir_colors`

# Zoxide
eval "$(zoxide init zsh)"

# Thefuck
eval $(thefuck --alias)

# Navi shell widget
eval "$(navi widget zsh)"

# Make Custom executable directory
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin/:$PATH"

# cs50 libraries for c
CC="clang"
CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
LDLIBS="-lcrypt -lcs50 -lm"
# ----------------------------------------------------------


# ALL FZFs configuration
# ----------------------------------------------------------
# Fzf completion and keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# alias rg="rg --files --hidden --follow --glob '!.git'"                 # ripgrep to search through hidden file

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'" # Fzf using rg
#export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude .git"        # Alt t Shortcut to search file
export FZF_CTRL_T_COMMAND="fd --hidden --follow --exclude .git"          # Alt t Shortcut to search file
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_COMMAND="fd -t d --hidden --follow --exclude .git"      # Alt c Shortcut to cd
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

# Fzf colorschemes dracula theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
# Fzf-tab completion source
source /home/enricofadly/githubs/fzf-tab/fzf-tab.plugin.zsh
# Fzf-tab custom configuration to incude dotfiles in completion
setopt glob_dots
zstyle ':completion:*' special dirs true
zstyle ':completion:*' format '[%d]'
zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# ----------------------------------------------------------


# Keep these configurations in bottom
# ----------------------------------------------------------
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit


# To show basic OS info everytime start zsh shell
pfetch
# ----------------------------------------------------------


# Init eval for starship
eval "$(starship init zsh)"
