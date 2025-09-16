if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_add_path /home/leo/.local/bin/
    fish_add_path /home/leo/.local/bin/flutter/bin
    fish_add_path /home/leo/.deno/bin/
    fish_add_path /home/leo/.local/share/JetBrains/Toolbox/scripts

    # dotnet
    fish_add_path /home/leo/.dotnet/tools
    fish_add_path /root/.dotnet/tools

    # pyenv
    fish_add_path /home/leo/.pyenv/bin
    pyenv init - | source


    set fish_greeting
    set EDITOR nvim
    set NVM_DIR "$HOME/.nvm"

    # git
    alias ga "git add"
    alias gc "git commit"
    alias gt "git tag"
    alias gp "git push"
    alias lg "lazygit"

    # command rebinds
    alias vim nvim
    alias cat "bat -Pp"
    alias man batman
    alias k kubectl

    # config shortcuts
    alias fishconfig "nvim ~/.config/fish/config.fish"
    alias nvimconfig "nvim ~/.config/nvim/"

    #misc
    alias icat "kitten icat"
end
