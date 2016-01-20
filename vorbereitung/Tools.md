# Tools

[GIT bash prompt](https://github.com/magicmonty/bash-git-prompt)

    cd ~
    git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt

    echo > .bashrc < EOF
    GIT_PROMPT_ONLY_IN_REPO=1
    GIT_PROMPT_FETCH_REMOTE_STATUS=0
    source ~/.bash-git-prompt/gitprompt.sh
    EOF


[Puppet VIM Syntax](https://github.com/ricciocri/vimrc)

    cd ~
    git clone https://github.com/ricciocri/vimrc.git .vim
    cd .vim
    git pull && git submodule init && git submodule update && git submodule status
    cd ~
    ln -s .vim/.vimrc .


