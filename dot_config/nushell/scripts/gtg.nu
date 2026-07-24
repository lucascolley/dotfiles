# Change current directory to a git repository of your choice
export def --env main []: nothing -> nothing {
    let selection = (ghq list | lines | str join "\n" | fzf)
    cd ([(ghq root) $selection] | path join)
}

