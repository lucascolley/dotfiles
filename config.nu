mkdir ($nu.data-dir | path join "vendor/autoload")
# add pixi global binaries to path
$env.PATH = ($env.PATH | append /Users/lucascolley/.pixi/bin)
# set editor to nano
$env.config.buffer_editor = "nano"
# set up pixi completions
pixi completion --shell nushell | save --force $"($nu.data-dir)/vendor/autoload/pixi-completions.nu"
# set up starship
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
# setup go-to-git script
use ~/.config/nushell/scripts/gtg.nu *
# aliases
alias gpc = gh pr checkout
alias mm = micromamba
alias sandbox = cd ~/sandbox
# config.nu
#
# Installed by:
# version = "0.105.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.
