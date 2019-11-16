# Install and initialize zplugin ########
if [ ! -d "$HOME/.zplugin" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi
source $HOME/.zplugin/bin/zplugin.zsh   # Source plugin
autoload -Uz _zplugin                   # Load plugin
zpcompinit                              # Load completions
# End of install block ##################

export NVM_AUTO_USE=true
export NVM_LAZY_LOAD=true
export EDITOR="code --wait"
alias ls="exa"

# Helper functions
turbo()     { zplugin ice wait"0" lucid     "${@}"; } # Load next plugin async
zload()     { zplugin load                  "${@}"; } # Load plugin
zsnippet()  { zplugin snippet               "${@}"; } # Load snippet

# Command installations
turbo as"command" from"gh-r" mv"exa* -> exa" sbin"exa"; zload ogham/exa
turbo as"command" from"gh-r" ; zload junegunn/fzf-bin
turbo as"command" pick"bin/git-dsf"; zload zdharma/zsh-diff-so-fancy
turbo as"command" pick"$ZPFX/bin/git-*" src"etc/git-extras-completion.zsh" make"PREFIX=$ZPFX"; zload tj/git-extras
turbo as"command" pick"$ZPFX/bin/git-now" make"prefix=$ZPFX install"; zload iwata/git-now

# Async load for speed
turbo; zload agkozak/zsh-z
turbo; zload hlissner/zsh-autopair
turbo; zload lukechilds/zsh-nvm 
turbo; zload mafredri/zsh-async
turbo; zload zdharma/fast-syntax-highlighting
turbo; zload zdharma/history-search-multi-word
turbo; zload zsh-users/zsh-autosuggestions
turbo; zload zsh-users/zsh-completions
turbo; zsnippet OMZ::lib/history.zsh
turbo; zsnippet PZT::modules/directory/init.zsh
turbo; zsnippet PZT::modules/git/alias.zsh

# Sync load p10k for prompt paint
zload romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/davidgarber/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/davidgarber/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/davidgarber/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/davidgarber/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<