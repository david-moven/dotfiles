#########################################################################################
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("/Users/${USERNAME}/anaconda3/bin/conda" 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/${USERNAME}/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/${USERNAME}/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/${USERNAME}/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
#########################################################################################

export NVM_AUTO_USE=true
export NVM_LAZY_LOAD=true
export EDITOR="code --wait"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export PATH=$PATH:$JAVA_HOME/bin
# export PYSPARK_DRIVER_PYTHON=jupyter
# export PYSPARK_DRIVER_PYTHON_OPTS='notebook'


alias ls="exa"
alias ws="cd ~/workspace"
alias gpoh="git push origin HEAD"
alias zshcfg="code ~/.zshrc"
alias grbi="git rebase -i"
alias gpurge="gco dev && git up && git for-each-ref --format '%(refname:short)' refs/heads | grep -v master | xargs git branch -D"

# Helper functions
turbo()     { zplugin ice wait"0" lucid     "${@}"; } # Load next plugin async
zload()     { zplugin load                  "${@}"; } # Load plugin

# Command installations
turbo as"command" from"gh-r" mv"exa* -> exa" sbin"exa"; zload ogham/exa
turbo as"command" from"gh-r" ; zload junegunn/fzf-bin
turbo as"command" pick"bin/git-dsf"; zload zdharma/zsh-diff-so-fancy
# turbo as"command" pick"$ZPFX/bin/git-*" src"etc/git-extras-completion.zsh" make"PREFIX=$ZPFX"; zload tj/git-extras
# turbo as"command" pick"$ZPFX/bin/git-now" make"prefix=$ZPFX install"; zload iwata/git-now

# Async load for speed
zinit wait lucid for \
    agkozak/zsh-z \
    hlissner/zsh-autopair \
    lukechilds/zsh-nvm \
    mafredri/zsh-async \
    zdharma/history-search-multi-word \
    zsh-users/zsh-autosuggestions \
    PZT::modules/directory/init.zsh \
    OMZ::lib/history.zsh \
    PZT::modules/git/alias.zsh

zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions \
    zdharma/fast-syntax-highlighting

# Sync load p10k for prompt paint
zload romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh