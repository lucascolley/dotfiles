# setup autoload
let autoload_dir = ($nu.data-dir | path join "vendor/autoload")
mkdir $autoload_dir

# nushell config
$env.config.show_banner = false
$env.config.highlight_resolved_externals = true
$env.config.history.file_format = "sqlite"
$env.config.completions.external.completer = {|spans|
  carapace $spans.0 nushell ...$spans | from json
}

# add system binaries to path
$env.PATH = ($env.PATH | append /usr/local/bin)

# add pixi global binaries to path
$env.PATH = ($env.PATH | append ~/.pixi/bin)

# add cargo binaries to path
$env.PATH = ($env.PATH | append ~/.cargo/bin)

# set editor to micro
$env.config.buffer_editor = "micro"

# set up pixi completions
pixi completion --shell nushell | save --force $"($autoload_dir)/pixi-completions.nu"

# set up rattler-build completions
rattler-build completion --shell nushell | save --force $"($autoload_dir)/rattler-build-completions.nu"

# set up starship
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# setup go-to-git script
use ~/.config/nushell/scripts/gtg.nu *

# aliases
alias gpc = gh pr checkout
alias gpl = gh pr list
alias mm = micromamba
alias sandbox = cd ~/sandbox
alias repo = gh repo view --web
