return {
  'greggh/claude-code.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('claude-code').setup {
      window = {
        split_ratio = 0.4, -- 40% of screen width
        position = 'vertical', -- sidebar on the right
      },
      refresh = {
        enable = true, -- auto-refresh on file changes
      },
      git = {
        use_git_root = true, -- Claude works from git repo root
      },
    }
  end,
  keys = {
    { '<leader>cc', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude Code' },
    { '<leader>cC', '<cmd>ClaudeCodeContinue<cr>', desc = 'Continue Claude session' },
    { '<leader>cr', '<cmd>ClaudeCodeResume<cr>', desc = 'Resume last Claude session' },
    { '<leader>cv', '<cmd>ClaudeCodeVerbose<cr>', desc = 'Claude verbose mode' },
  },
}
