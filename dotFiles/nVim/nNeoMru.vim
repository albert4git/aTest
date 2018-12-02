
Add this to your bashrc (zshrc or whatever) file:

# v - search in most recent used files by vim
v() {
  local file
  file=$(sed '1d' $HOME/.cache/neomru/file |
          fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && vim $file
}

# vd - cd to most recent used directory by vim
vd() {
  local dir
  dir=$(sed '1d' $HOME/.cache/neomru/directory |
        fzf --query="$1" --select-1 --exit-0) && cd "$dir"
}
