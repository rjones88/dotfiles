return {
  {
    'Vigemus/iron.nvim',
    config = function()
      local iron = require 'iron.core'
      local view = require 'iron.view'

      iron.setup {
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,

          -- Your repl definitions come here
          repl_definition = {
            python = {
              command = { 'ipython' }, -- or "ipython" if you have it
              format = require('iron.fts.common').bracketed_paste,
            },
            rust = {
              command = { 'evcxr' },
            },
            lua = {
              command = { 'croissant' }, -- IPython-like REPL (fallback: 'luajit')
            },
            sh = {
              command = { 'bash' },
            },
          },

          -- How the repl window will be displayed
          -- Can be: "float", "split", "vsplit", etc.
          repl_open_cmd = view.split.vertical.botright(50), -- 50% width vertical split
        },

        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keybindings to your config.
        keymaps = {
          send_motion = '<leader>sc', -- Send motion to REPL
          visual_send = '<leader>sc', -- Send visual selection to REPL
          send_line = '<leader>sl', -- Send line to REPL
          send_until_cursor = '<leader>su', -- Send from start to cursor
          send_mark = '<leader>sm', -- Send mark to REPL
          mark_motion = '<leader>mc', -- Mark motion
          mark_visual = '<leader>mc', -- Mark visual selection
          remove_mark = '<leader>md', -- Remove mark
          cr = '<leader>s<cr>', -- Send carriage return
          interrupt = '<leader>s<space>', -- Interrupt REPL
          exit = '<leader>sq', -- Exit REPL
          clear = '<leader>cl', -- Clear REPL
        },

        -- If the highlight is on, you can change how it looks
        highlight = {
          italic = true,
        },
      }
    end,

    -- Keymaps to open REPLs
    keys = {
      { '<leader>rs', '<cmd>IronRepl<CR>', desc = '[R]EPL [S]tart' },
      { '<leader>rr', '<cmd>IronRestart<CR>', desc = '[R]EPL [R]estart' },
      { '<leader>rf', '<cmd>IronFocus<CR>', desc = '[R]EPL [F]ocus' },
      { '<leader>rh', '<cmd>IronHide<CR>', desc = '[R]EPL [H]ide' },
      { '<leader>sF', function() require('iron.core').send_file() end, desc = '[S]end [F]ile to REPL' },
    },
  },
}
