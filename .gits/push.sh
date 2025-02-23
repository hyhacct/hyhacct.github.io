#!/usr/bin/env bash

# git config --global user.email "lwmacct@163.com"
# git config --global user.name "lwmacct"

# shellcheck disable=SC2317

# exit 0

_git_path=$(echo "$0" | awk -F '.gits/' '{print $1}')
cd "$_git_path" || exit 0

__main() {
    echo "Git:  $_git_path"
    {
        _exec_bin="/apps/data/bin/suprce" && mkdir -p /apps/data/bin
        $_exec_bin version 2>&1 | grep 'v1.0.25' -q || {
            wget -O "$_exec_bin" "https://1133.s.kuaicdn.cn:11338/public/project/240611-suprce/bin/suprce-v1.0.25-x86_64"
            chmod +x "$_exec_bin"
        }
        _list=$(find ./ -type f -name "*.sh" | grep "suprce" -E)
        for _file in $_list; do
            $_exec_bin sec sign --file="$_file" --key=".local/secret/private.key"
        done
    }

    git add .
    git commit -m "update"
    git push -u origin main
}

__main

__help() {
    cat >/dev/null <<-'AEOF'


AEOF
}
