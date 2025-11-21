-- Fun games to take a break
return {
  {
    'alanfortlink/blackjack.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'BlackJackNewGame', 'BlackJackQuit', 'BlackJackResetScores' },
    opts = {
      card_style = 'large', -- or 'mini'
      suit_style = 'black', -- or 'white'
    },
    keys = {
      { '<leader>gB', '<cmd>BlackJackNewGame<cr>', desc = '[G]ame: [B]lackjack' },
    },
  },
}
