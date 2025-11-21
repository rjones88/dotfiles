-- Learning plugins: Track habits and improve vim skills
return {
  -- Hardtime: Break bad habits, master vim motions
  -- Use :Hardtime report to see your bad habits analytics
  {
    'm4xshen/hardtime.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {
      max_count = 3, -- Max count of repeated key before blocking
      disable_mouse = false, -- Keep mouse enabled for beginners
      hint = true, -- Show hints for better alternatives
      notification = true, -- Show notification when blocked
      allow_different_key = false,
      enabled = true,
      restriction_mode = 'hint', -- 'hint' (show hints) or 'block' (block keys)
      restricted_keys = {
        ['h'] = { 'n', 'x' },
        ['j'] = { 'n', 'x' },
        ['k'] = { 'n', 'x' },
        ['l'] = { 'n', 'x' },
        ['-'] = { 'n', 'x' },
        ['+'] = { 'n', 'x' },
        ['gj'] = { 'n', 'x' },
        ['gk'] = { 'n', 'x' },
        ['<CR>'] = { 'n', 'x' },
        ['<C-M>'] = { 'n', 'x' },
        ['<C-N>'] = { 'n', 'x' },
        ['<C-P>'] = { 'n', 'x' },
      },
      disabled_keys = {
        ['<Up>'] = { '', 'i' },
        ['<Down>'] = { '', 'i' },
        ['<Left>'] = { '', 'i' },
        ['<Right>'] = { '', 'i' },
      },
      -- Disable in these filetypes
      disabled_filetypes = {
        'qf',
        'netrw',
        'NvimTree',
        'neo-tree',
        'lazy',
        'mason',
        'oil',
        'Trouble',
        'aerial',
        'undotree',
        'toggleterm',
        'harpoon',
      },
    },
    keys = {
      { '<leader>ht', '<cmd>Hardtime toggle<cr>', desc = '[H]ardtime [T]oggle' },
      { '<leader>hr', '<cmd>Hardtime report<cr>', desc = '[H]ardtime [R]eport (analytics)' },
    },
  },

  -- Precognition: Show motion hints before you press them
  {
    'tris203/precognition.nvim',
    event = 'VeryLazy',
    opts = {
      startVisible = false, -- Start hidden, toggle when learning
      showBlankVirtLine = true,
      highlightColor = { link = 'Comment' },
      hints = {
        Caret = { text = '^', prio = 2 },
        Dollar = { text = '$', prio = 1 },
        MatchingPair = { text = '%', prio = 5 },
        Zero = { text = '0', prio = 1 },
        w = { text = 'w', prio = 10 },
        b = { text = 'b', prio = 9 },
        e = { text = 'e', prio = 8 },
        W = { text = 'W', prio = 7 },
        B = { text = 'B', prio = 6 },
        E = { text = 'E', prio = 5 },
      },
      gutterHints = {
        G = { text = 'G', prio = 10 },
        gg = { text = 'gg', prio = 9 },
        PrevParagraph = { text = '{', prio = 8 },
        NextParagraph = { text = '}', prio = 8 },
      },
    },
    keys = {
      {
        '<leader>tp',
        function()
          require('precognition').toggle()
        end,
        desc = '[T]oggle [P]recognition hints',
      },
      {
        '<leader>pp',
        function()
          require('precognition').peek()
        end,
        desc = '[P]recognition [P]eek (show once)',
      },
    },
  },
}
