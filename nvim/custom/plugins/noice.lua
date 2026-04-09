return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  opts = {
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
    },
    presets = {
      bottom_search = false, -- classic bottom search / use popup
      command_palette = true, -- position cmdline + popupmenu together
      long_message_to_split = true,
      lsp_doc_border = true, -- border around hover / signature docs
    },
    cmdline = {
      view = 'cmdline_popup', -- centered popup for command line
    },
  },
}
