return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
    ft = { 'rust' },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            -- Enable inlay hints
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end,
        },
      }

      -- Rust-specific keymaps
      vim.keymap.set('n', '<leader>rca', function()
        vim.cmd.RustLsp 'codeAction'
      end, { desc = '[R]ust [C]ode [A]ction' })

      vim.keymap.set('n', '<leader>rr', function()
        vim.cmd.RustLsp 'runnables'
      end, { desc = '[R]ust [R]unnables' })

      vim.keymap.set('n', '<leader>rd', function()
        vim.cmd.RustLsp 'debuggables'
      end, { desc = '[R]ust [D]ebuggables' })

      vim.keymap.set('n', '<leader>re', function()
        vim.cmd.RustLsp 'expandMacro'
      end, { desc = '[R]ust [E]xpand Macro' })
    end,
  },
}
