-- Productivity plugins: code understanding and quality of life
return {
  -- Trouble: Better diagnostics list
  {
    'folke/trouble.nvim',
    opts = {}, -- use defaults
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },

  -- Treesitter Context: Shows function/class name at top of screen
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'VeryLazy',
    opts = {
      enable = true,
      max_lines = 3, -- How many lines the window should span
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 20, -- Max number of lines to show for single context
      trim_scope = 'outer',
      mode = 'cursor', -- Line used to calculate context
      separator = nil,
      zindex = 20,
    },
    keys = {
      {
        '<leader>tc',
        function()
          require('treesitter-context').toggle()
        end,
        desc = '[T]oggle Treesitter [C]ontext',
      },
      {
        '[c',
        function()
          require('treesitter-context').go_to_context(vim.v.count1)
        end,
        desc = 'Go to context',
      },
    },
  },

  -- Aerial: Code outline sidebar
  {
    'stevearc/aerial.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      layout = {
        default_direction = 'prefer_right',
        min_width = 30,
      },
      attach_mode = 'global',
      backends = { 'treesitter', 'lsp', 'markdown', 'man' },
      show_guides = true,
      filter_kind = false,
    },
    keys = {
      { '<leader>o', '<cmd>AerialToggle!<cr>', desc = 'Toggle code [O]utline' },
      { '{', '<cmd>AerialPrev<cr>', desc = 'Aerial: Previous symbol' },
      { '}', '<cmd>AerialNext<cr>', desc = 'Aerial: Next symbol' },
    },
  },

  -- Undotree: Visualize undo history
  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = 'Toggle [U]ndotree' },
    },
    config = function()
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },

  -- Toggleterm: Better terminal management
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'float',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        winblend = 0,
      },
    },
    keys = {
      { '<c-\\>', desc = 'Toggle terminal' },
      { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = '[T]erminal [F]loat' },
      { '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', desc = '[T]erminal [V]ertical' },
      { '<leader>ts', '<cmd>ToggleTerm direction=horizontal<cr>', desc = '[T]erminal [S]plit' },
    },
  },
}
