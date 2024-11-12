#! /usr/bin/env bash
languages=$( echo "golang c cpp python typescript javascript rust" | tr " " "\n")
core_utils=$(echo "find xargs sed grep awk" |  tr " " "\n")
selected=$(echo "$languages $core_utils" | fzf)

read -p "Enter a Query : " query

if echo "$languages" | grep -qs $selected; then
	tmux split-window -h bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less -R"
else
	tmux split-window -h bash -c "curl cht.sh/$(echo "$selected~$query") | less -R"
fi
