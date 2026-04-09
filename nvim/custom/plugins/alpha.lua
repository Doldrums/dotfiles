return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.header.val = {
      '                                                   ',
      '      ████ ██████           █████      ██          ',
      '     ███████████             █████                 ',
      '     █████████ ███████████████████ ███   ███████   ',
      '    █████████  ███    █████████████ █████ ██████   ',
      '   █████████ ██████████ █████████ █████ █████      ',
      ' ███████████ ███    ███ █████████ █████ █████      ',
      '██████  █████████████████████ ████ █████ █████     ',
      '                                                   ',
    }

    dashboard.section.buttons.val = {
      dashboard.button('f', '  Find file', ':Telescope find_files<CR>'),
      dashboard.button('r', '  Recent files', ':Telescope oldfiles<CR>'),
      dashboard.button('g', '  Grep text', ':Telescope live_grep<CR>'),
      dashboard.button('c', '  Claude Code', ':ClaudeCode<CR>'),
      dashboard.button('n', '  New file', ':ene <BAR> startinsert<CR>'),
      dashboard.button('s', '  Settings', ':e ~/.config/nvim/init.lua<CR>'),
      dashboard.button('l', ' 󰒲 Lazy', ':Lazy<CR>'),
      dashboard.button('q', '  Quit', ':qa<CR>'),
    }

    dashboard.section.footer.val = function()
      local stats = require('lazy').stats()
      return '⚡ ' .. stats.loaded .. '/' .. stats.count .. ' plugins loaded'
    end

    dashboard.section.header.opts.hl = 'Type'
    dashboard.section.buttons.opts.hl = 'Keyword'
    dashboard.section.footer.opts.hl = 'Comment'

    alpha.setup(dashboard.opts)
  end,
}
