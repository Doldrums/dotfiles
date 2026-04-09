#!/usr/bin/env bash
# dotfiles installer
# Usage: ./install.sh

set -e

DOTFILES="$HOME/dotfiles"

echo "📦 Installing dotfiles from $DOTFILES..."

# ─── Helpers ─────────────────────────────────────────
link() {
  local src="$1"
  local dst="$2"
  local dst_dir="$(dirname "$dst")"

  mkdir -p "$dst_dir"

  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "  backing up existing $dst → $dst.backup"
    mv "$dst" "$dst.backup"
  elif [ -L "$dst" ]; then
    rm "$dst"
  fi

  ln -s "$src" "$dst"
  echo "  linked $dst → $src"
}

# ─── Check dependencies ──────────────────────────────
echo ""
echo "🔍 Checking dependencies..."

command -v brew >/dev/null 2>&1 || {
  echo "❌ Homebrew not found. Install from https://brew.sh first."
  exit 1
}

# ─── Install brew packages ───────────────────────────
echo ""
echo "🍺 Installing brew packages..."

brew install \
  starship \
  neovim \
  tree-sitter \
  fzf \
  ripgrep \
  fd \
  bat \
  eza \
  zoxide \
  dust \
  procs \
  btop \
  git-delta \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  zsh-completions \
  zsh-history-substring-search

brew install --cask \
  ghostty \
  font-sf-mono-nerd-font-ligaturized

# ─── fzf shell integration ───────────────────────────
if [ ! -f ~/.fzf.zsh ]; then
  echo ""
  echo "⚙️  Setting up fzf shell integration..."
  "$(brew --prefix)/opt/fzf/install" --key-bindings --completion --no-update-rc
fi

# ─── Install Claude Code CLI ─────────────────────────
if ! command -v claude >/dev/null 2>&1; then
  echo ""
  echo "🤖 Installing Claude Code CLI..."
  npm install -g @anthropic-ai/claude-code
fi

# ─── Install kickstart.nvim ──────────────────────────
if [ ! -d ~/.config/nvim ]; then
  echo ""
  echo "📝 Installing kickstart.nvim..."
  git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/nvim
  # Enable custom plugins import
  sed -i '' "s|-- { import = 'custom.plugins' },|{ import = 'custom.plugins' },|" ~/.config/nvim/init.lua
fi

# ─── Symlink configs ─────────────────────────────────
echo ""
echo "🔗 Creating symlinks..."

link "$DOTFILES/zsh/zshrc" "$HOME/.zshrc"
link "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"
link "$DOTFILES/ghostty/config" "$HOME/.config/ghostty/config"
link "$DOTFILES/nvim/custom" "$HOME/.config/nvim/lua/custom"

echo ""
echo "✅ Done! Restart your shell: exec zsh"
echo "   And open nvim once to let lazy.nvim install plugins."
