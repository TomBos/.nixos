_ps1_git_branch_() {
    local branch
    branch=$(command git symbolic-ref --quiet --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo "($branch)"
    fi
};

# Colors
RED='\[\033[01;31m\]'
GREEN='\[\033[01;32m\]'
BLUE='\[\033[01;34m\]'
PURPLE='\[\033[01;35m\]'
RESET='\[\033[00m\]'

export PS1="${RED}\u${RESET}@${GREEN}\h${RESET}:${BLUE}\w${RESET} ${PURPLE}\$(_ps1_git_branch_)${RESET}\$ "

