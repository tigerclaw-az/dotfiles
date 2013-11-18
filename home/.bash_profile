prefix=$(brew --prefix)
export BYOBU_PREFIX=$prefix
export PYTHONPATH=/usr/local/lib/python2.7/site-packages

# proxy
#export http_proxy="http://localhost:8080"
#export https_proxy="http://localhost:8080"

#npm set proxy $http_proxy
#npm set https-proxy $https_proxy

# bash completion
if [ -f $prefix/etc/bash_completion ]; then
    . $prefix/etc/bash_completion
fi

# terminal color
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# PHP server
alias serve="php -S 127.0.0.1:9000"

# brew & PHP 5.5
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/php5/bin:/usr/local/Cellar/ruby/2.0.0-p247/bin:$PATH

# Git
source /usr/local/git/contrib/completion/git-completion.bash
source /usr/local/git/contrib/completion/git-prompt.sh

# If you set GIT_PS1_SHOWDIRTYSTATE to a nonempty value,
# unstaged (*) and staged (+) changes will be shown next to the branch
# name.  You can configure this per-repository with the
# bash.showDirtyState variable, which defaults to true once
# GIT_PS1_SHOWDIRTYSTATE is enabled.
GIT_PS1_SHOWDIRTYSTATE=1

# You can also see if currently something is stashed, by setting
# GIT_PS1_SHOWSTASHSTATE to a nonempty value. If something is stashed,
# then a '$' will be shown next to the branch name.
#GIT_PS1_SHOWSTASHSTATE=1

# If you would like to see if there're untracked files, then you can set
# GIT_PS1_SHOWUNTRACKEDFILES to a nonempty value. If there're untracked
# files, then a '%' will be shown next to the branch name.  You can
# configure this per-repository with the bash.showUntrackedFiles
# variable, which defaults to true once GIT_PS1_SHOWUNTRACKEDFILES is
# enabled.
GIT_PS1_SHOWUNTRACKEDFILES=1

# If you would like to see the difference between HEAD and its upstream,
# set GIT_PS1_SHOWUPSTREAM="auto".  A "<" indicates you are behind, ">"
# indicates you are ahead, "<>" indicates you have diverged and "="
# indicates that there is no difference. You can further control
# behaviour by setting GIT_PS1_SHOWUPSTREAM to a space-separated list
# of values:
#
#     verbose       show number of commits ahead/behind (+/-) upstream
#     legacy        don't use the '--count' option available in recent
#                   versions of git-rev-list
#     git           always compare HEAD to @{upstream}
#     svn           always compare HEAD to your SVN upstream
#
# By default, __git_ps1 will compare HEAD to your SVN upstream if it can
# find one, or @{upstream} otherwise.  Once you have set
# GIT_PS1_SHOWUPSTREAM, you can override it on a per-repository basis by
# setting the bash.showUpstream config variable.
GIT_PS1_SHOWUPSTREAM=verbose

# If you would like to see more information about the identity of
# commits checked out as a detached HEAD, set GIT_PS1_DESCRIBE_STYLE
# to one of these values:
#
#     contains      relative to newer annotated tag (v1.6.3.2~35)
#     branch        relative to newer tag or branch (master~4)
#     describe      relative to older annotated tag (v1.6.3.1-13-gdd42c2f)
#     default       exactly matching tag
#GIT_PS1_DESCRIBE_STYLE=default

# If you would like a colored hint about the current dirty state, set
# GIT_PS1_SHOWCOLORHINTS to a nonempty value. The colors are based on
# the colored output of "git status -sb".
GIT_PS1_SHOWCOLORHINTS=1

export LOLCOMMITS_FORK=true

# prompt
export PS1="\T \u:\w\n\$(__git_ps1)$ "
# export PS1="\T \u\n\w \$ "

alias ls="ls -F"
alias ll="ls -laF"
alias mamp="cd /Applications/MAMP"
alias htdocs="cd /Applications/MAMP/htdocs"

# -- Git Shortcuts --
alias cherry-pick="git cherry-pick -x "
alias gs="git status "
alias ga="git add "
alias gb="git branch "
alias gc="git commit"
alias gco="git checkout"
alias gd="git diff -w -b"
alias gg="git log --oneline --abbrev-commit --all --graph --decorate --color"
alias gl="git log"
alias gm="git merge --no-ff "
alias gp="git push origin $1"
alias gru="git remote update"
alias gk="gitk --all&"
alias gx="gitx --all"
alias mkbranch="git checkout -b"
alias mvbranch="git branch -f "
alias rmbranch="git branch -D "

# -- Custom aliases --
alias sublime="/Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2"
