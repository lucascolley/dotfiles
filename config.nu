# setup autoload
let autoload_dir = ($nu.data-dir | path join "vendor/autoload")
mkdir $autoload_dir

# nushell config
$env.config.show_banner = false
$env.config.highlight_resolved_externals = true
$env.config.history.file_format = "sqlite"

# add system binaries to path
$env.PATH = ($env.PATH | append /usr/local/bin)
$env.PATH = ($env.PATH | append /usr/sbin)

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
starship init nu | save --force $"($autoload_dir)/starship.nu"

# setup go-to-git script
use ~/.config/nushell/scripts/gtg.nu *

# setup repoget script
use ~/.config/nushell/scripts/repoget.nu *

# aliases
alias gpc = gh pr checkout
alias gpl = gh pr list
alias mm = micromamba
alias sandbox = cd ~/sandbox
alias repo = gh repo view --web
