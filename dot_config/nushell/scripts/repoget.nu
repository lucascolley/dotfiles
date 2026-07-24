# clone from github.com the input "ORG/REPO", set ORG as upstream, fork it
export def --env main [repo: string]: nothing -> nothing {
    ghq get $repo
    cd $"~/ghq/github.com/($repo)"
    gh repo set-default
    gh repo fork --remote
}
