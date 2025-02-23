#!/usr/bin/env bash
# shellcheck disable=SC2317

# git config --global user.email "lwmacct@163.com"
# git config --global user.name "lwmacct"

# exit 0

_git_path=$(echo "$0" | awk -F '.gits/' '{print $1}')
cd "$_git_path" || exit 0

__main() {
    git rm -r --cached .
    git checkout --orphan latest_branch
    git add -A
    git commit -am "clear commit"
    git branch -D main
    git branch -m main
    git push -f origin main

}
__main

__help() {
    cat >/dev/null <<-'AEOF'


AEOF
}
