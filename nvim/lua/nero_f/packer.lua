vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

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

  use 'mfussenegger/nvim-dap'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'onsails/lspkind-nvim' -- pictograms 
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'ghifarit53/tokyonight-vim'
  use 'vim-airline/vim-airline'
  use 'kyazdani42/nvim-web-devicons'


  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
  }
  use 'nvim-treesitter/playground'
end)  
