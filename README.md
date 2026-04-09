# dotfiles

My macOS development setup: Ghostty + zsh + Starship + Neovim.

![screenshot](screenshot.png)

## Stack

- **Terminal:** [Ghostty](https://ghostty.org) with Moonfly theme
- **Shell:** zsh with [Starship](https://starship.rs) prompt
- **Font:** Liga SFMono Nerd Font
- **Editor:** Neovim with [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) base + custom plugins
- **AI:** [Claude Code](https://github.com/anthropics/claude-code) integrated into nvim

## Features

### Shell
- Powerline Starship prompt with user, live IP, git branch, package version, runtime, clock
- `zoxide` smart `cd` — jumps to frequent directories
- `eza`, `bat`, `fd`, `rg` as modern replacements for `ls`, `cat`, `find`, `grep`
- Autosuggestions from history, syntax highlighting, fuzzy history search
- Extensive aliases for git, navigation, config editing
- Custom functions: `mkcd`, `extract`, `fe` (fuzzy edit), `fcd`, `fkill`, `fco`, `weather`, `serve`

### Neovim
- Lualine statusbar with git branch, diff, diagnostics, IP, git email, clock
- Winbar breadcrumbs via `nvim-navic` (shows current function/class)
- Neo-tree file explorer
- Telescope fuzzy finder
- LSP + Treesitter (from kickstart)
- Claude Code sidebar integration (`<leader>cc`)
- Noice + nvim-notify for beautiful UI
- Alpha dashboard on startup

### Ghostty
- Moonfly theme matching Starship colors
- Translucent window with blur
- Custom keybinds for splits, tabs, quick terminal

## Install

On a fresh macOS:

\`\`\`bash
git clone https://github.com/amoriodi/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
\`\`\`

The script will:
1. Install all brew packages and casks
2. Set up fzf shell integration
3. Install Claude Code CLI via npm
4. Clone kickstart.nvim
5. Symlink all configs

After install, restart your shell (`exec zsh`) and open `nvim` once to let lazy.nvim install plugins.

## Structure

\`\`\`
dotfiles/
├── zsh/
│   └── zshrc
├── starship/
│   └── starship.toml
├── ghostty/
│   └── config
├── nvim/
│   └── custom/
│       └── plugins/
│           ├── claude-code.lua
│           ├── lualine.lua
│           ├── navic.lua
│           ├── neo-tree.lua
│           ├── noice.lua
│           ├── notify.lua
│           ├── alpha.lua
│           └── window-nav.lua
├── install.sh
└── README.md
\`\`\`

## License

MIT — do whatever you want with it.
