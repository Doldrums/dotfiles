return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    -- Custom component: local IP from env var (set by zsh)
    local function current_ip()
      local ip = vim.fn.getenv 'CURRENT_IP'
      if ip == vim.NIL or ip == '' or ip == 'no-ip' then
        -- Fallback: query directly
        local handle = io.popen 'ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null'
        if handle then
          ip = handle:read('*a'):gsub('%s+', '')
          handle:close()
        end
      end
      return ip ~= '' and (' ' .. ip) or ''
    end

    -- Custom component: git user.email
    local function git_user()
      local handle = io.popen 'git config user.email 2>/dev/null'
      if handle then
        local email = handle:read('*a'):gsub('%s+', '')
        handle:close()
        if email ~= '' then return ' ' .. email end
      end
      return ''
    end

    -- Custom component: current time
    local function clock() return ' ' .. os.date '%H:%M' end

    require('lualine').setup {
      options = {
        theme = 'auto',
        component_separators = { left = '│', right = '│' },
        section_separators = { left = '', right = '' },
        globalstatus = true, -- one statusline for all windows
        refresh = {
          statusline = 1000, -- refresh every second (for the clock)
        },
        disabled_filetypes = {
          statusline = {},
          winbar = { 'neo-tree', 'claude-code' },
        },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = {
          {
            'branch',
            icon = '',
          },
          {
            'diff',
            symbols = { added = ' ', modified = ' ', removed = ' ' },
          },
        },
        lualine_c = {
          {
            'filename',
            path = 1, -- 0=just name, 1=relative, 2=absolute
            symbols = {
              modified = '● ',
              readonly = ' ',
              unnamed = '[No Name]',
            },
          },
          {
            'diagnostics',
            sources = { 'nvim_lsp' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
          },
        },
        lualine_x = {
          {
            'filetype',
            icon_only = false,
            colored = true,
          },
          current_ip,
          git_user,
          'encoding',
        },
        lualine_y = {
          { 'progress', separator = ' ' },
          { 'location' },
        },
        lualine_z = {
          { clock, separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { 'neo-tree', 'lazy', 'mason' },
    }
  end,
}
