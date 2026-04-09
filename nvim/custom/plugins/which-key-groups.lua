return {
  'folke/which-key.nvim',
  optional = true,
  opts = {
    spec = {
      { '<leader>c', group = ' Claude' },
      { '<leader>f', group = ' Find (Telescope)' },
      { '<leader>g', group = ' Git' },
      { '<leader>s', group = ' Search' },
      { '<leader>w', group = ' Window' },
      { '<leader>t', group = ' Toggle' },
      { '<leader>x', group = ' Diagnostics' },
    },
  },
}
