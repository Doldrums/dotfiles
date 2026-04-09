return {
  'rcarriga/nvim-notify',
  event = 'VeryLazy',
  opts = {
    timeout = 3000,
    stages = 'slide',
    render = 'compact',
    top_down = false,
    background_colour = '#000000',
  },
  config = function(_, opts)
    require('notify').setup(opts)
    vim.notify = require 'notify'
  end,
}
