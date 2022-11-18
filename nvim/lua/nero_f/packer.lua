vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use '/home/nero_f/Projects/vim/epitech.nvim'
  -- use 'Nero-F/epitech.nvim'
  use 'wbthomason/packer.nvim'
  use 'wbthomason/packer.nvim'

  use 'stevearc/dressing.nvim'

  use 'jiangmiao/auto-pairs'
  use 'numToStr/comment.nvim'
  use 'junegunn/goyo.vim'

  use 'tpope/vim-surround'
  use 'tpope/vim-obsession'
  use 'tpope/vim-fugitive'

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  use 'simrat39/rust-tools.nvim'

  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'onsails/lspkind-nvim' -- pictograms 
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use {
    "L3MON4D3/LuaSnip",
    tag = "v<CurrentMajor>.*"
  }
  use 'saadparwaiz1/cmp_luasnip'

  use 'folke/tokyonight.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'jbyuki/one-small-step-for-vimkind'
  use 'theHamsta/nvim-dap-virtual-text'

  use {'iamcco/markdown-preview.nvim'}
  -- use 'hinz/vim-startify'
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = nil
  }

end)
