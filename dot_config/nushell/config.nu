# autoload
let autoload_dir = ($nu.data-dir | path join "vendor/autoload")
mkdir $autoload_dir

# nushell
$env.config.show_banner = false
$env.config.highlight_resolved_externals = true
$env.config.history.file_format = "sqlite"

# add pixi global binaries to path
$env.PATH = ($env.PATH | append ~/.pixi/bin)

# editor
$env.config.buffer_editor = "micro"

# starship
starship init nu | save --force $"($autoload_dir)/starship.nu"

# completions
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir $"($nu.cache-dir)"
carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"
source $"($nu.cache-dir)/carapace.nu"

pixi completion --shell nushell | save --force $"($autoload_dir)/pixi-completions.nu"
rattler-build completion --shell nushell | save --force $"($autoload_dir)/rattler-build-completions.nu"

# add cargo binaries to path
$env.PATH = ($env.PATH | append ~/.cargo/bin)

# add system binaries to path
$env.PATH = ($env.PATH | append /usr/local/bin)
$env.PATH = ($env.PATH | append /usr/sbin)

# scripts
use ~/.config/nushell/scripts/gtg.nu *
use ~/.config/nushell/scripts/repoget.nu *

# aliases
alias gpc = gh pr checkout
alias sandbox = cd ~/sandbox
alias repo = gh repo view --web
