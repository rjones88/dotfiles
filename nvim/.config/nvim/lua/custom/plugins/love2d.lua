return {
  {
    'S1M0N38/love2d.nvim',
    cmd = 'LoveRun',
    opts = {
      path_to_love_library = '/usr/sbin/love',
    },
    keys = {
      { '<leader>v', ft = 'lua', desc = '+love2d' },
      { '<leader>vv', '<cmd>LoveRun<cr>', ft = 'lua', desc = 'Run Love2D' },
      { '<leader>vs', '<cmd>LoveStop<cr>', ft = 'lua', desc = 'Stop Love2D' },
    },
  },
}
