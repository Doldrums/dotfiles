return {
  'SmiteshP/nvim-navic',
  dependencies = { 'neovim/nvim-lspconfig' },
  event = 'LspAttach',
  config = function()
    local navic = require 'nvim-navic'

    navic.setup {
      icons = {
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = ' ',
        Method = ' ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = ' ',
        Interface = ' ',
        Function = ' ',
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = ' ',
        Boolean = ' ',
        Array = ' ',
        Object = ' ',
        Key = ' ',
        Null = ' ',
        EnumMember = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' ',
      },
      highlight = true,
      separator = '  ',
      depth_limit = 5,
      depth_limit_indicator = '..',
    }

    -- Attach to LSP when it connects
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.server_capabilities.documentSymbolProvider then navic.attach(client, args.buf) end
      end,
    })

    -- Show navic in winbar
    vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
  end,
}
