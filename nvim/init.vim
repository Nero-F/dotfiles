" ============ VimPlug ============
call plug#begin(stdpath('data') . '/init.vim')

Plug 'ghifarit53/tokyonight-vim' " #theme
Plug 'Nero-F/vim-tek-header'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'junegunn/goyo.vim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'neovim/nvim-lspconfig'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'

call plug#end()
" ============ End VimPlug ============

" KEYMAPS
let mapleader = ","
" escape
inoremap jk <Esc>
inoremap kj <Esc>
inoremap JK <Esc>
inoremap KJ <Esc>
vnoremap q <Esc>
" exit terminal
tnoremap <c-a>m exit<cr>
tnoremap <Esc> <C-\><C-n>
tnoremap jk <C-\><C-n>
tnoremap kj <C-\><C-n>
tnoremap JK <C-\><C-n>
tnoremap KJ <C-\><C-n>
" mouving :line up and down
vnoremap J :m '>+1<cr>gv=gv
vn"oremap K :m '<-2<cr>gv=gv
" rc's ones
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>evs :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" SETTINGS
set guicursor=
set nu rnu
set splitright
set splitbelow
set noswapfile
set cul

" THEME
colorscheme tokyonight

let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
let g:tokyonight_cursor = 'red'
let g:tokyonight_current_word = 'bold'
let g:tokyonight_transparent_background = 1
set background=dark

" FUGITIVE 
nnoremap <leader>gd :Gdiffsplit<cr>
nnoremap <leader>gs :G<cr>
nnoremap <leader>gl :Git log<cr>
nnoremap <leader>glg :Git log --stat --max-count=10<cr>
nnoremap <leader>glgg :Git log --graph --max-count=10<cr>

" AIRLINE
let g:airline#extensions#tabline#enabled = 1

"** Goyo **
nnoremap <leader>xz :Goyo<cr>
let g:goyo_width = 190

filetype plugin on 

noremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>gf <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>ffb <cmd>Telescope file_browser<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr> TELESCOPE
nnoremap <leader>frc <cmd>lua require('nero_f.seecrete').search_dotfiles()<cr>
nnoremap <leader>fs <cmd>lua require('nero_f.seecrete').seecrete()<cr>
