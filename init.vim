"lua require('dap-go').setup()
source $HOME/.config/nvim/plug-config/coc.vim
"My personal config starts from here:
source $HOME/.config/nvim/plug-config/treesitter.vim
" This is used to activate esc in terminal mode
tnoremap <A-`> <C-\><C-n>

"for switching between vertical windows 
nmap <S-j> <C-w>
"for folding code
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
set nobackup
set nowritebackup
set noswapfile

syntax on
filetype plugin on

filetype plugin indent on

set laststatus=0
set tabstop=2
set shortmess+=afilmnrxoOtT
set hidden
set number
let mapleader=","
set listchars=eol:¬,tab:»\ ,trail:~,extends:»,precedes:«
hi Normal ctermbg=none
inoremap jj <Esc><Right>
tnoremap jj <C-\><C-n>
imap ;; <right>

"to make left arrow key go to previous line in insert mode (read whichwarp help)
set whichwrap=[,]

"disable these two to see the differenc when jumping from one line (multilined) to another
nnoremap k gk
nnoremap j gj

"to make dd really delete and not cut
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

"making enter key make more sense in coc.nvim's new completion mode
"inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

""inoremap <expr><up> coc#pum#visible() ? coc#pum#confirm : "\<esc>gki" 
"inoremap <expr><up> pumvisible() ? "\<up>" : "\<esc>gki" 
"inoremap <expr><down> coc#pum#visible() ? coc#pum#confirm : "\<esc>gji" 
"inoremap <expr><down> pumvisible() ? "\<down>" : "\<esc>gji" 

"I dont like $ to jump to the end of a line, my fingers hurt to type it!

nnoremap <leader>f $
inoremap <leader>f $

"use soft wrap to make vim not split words for wrapping
set wrap linebreak


"if U got tired of preview window, uncomment this:
"set completeopt-=preview


set encoding=utf-8
set number
syntax enable
set scrolloff=5
set backspace=indent,eol,start


set tabstop=4
set softtabstop=4
set shiftwidth=2
set autoindent
set expandtab
set fileformat=unix

"inoremap <expr><tab> pumvisible() ?"\<c-n>" :"\<tab>"

" make ENTER make more sense in complete popup menu
"inoremap <expr><Return> pumvisible() ?"\<C-e>\<Return>" :"\<Return>"

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tomasr/molokai'
Plug 'vim-test/vim-test'
Plug 'neoclide/coc.nvim', {'branch': 'release','off': 'txt'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sonph/onehalf', { 'rtp': 'vim' }
"Plug 'junegunn/limelight.vim'
"Plug 'tmhedberg/SimpylFold'

"Plug 'tweekmonster/braceless.vim'
Plug 'preservim/nerdcommenter'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'leoluz/nvim-dap-go'
Plug 'morhetz/gruvbox'
"Plug 'jiangmiao/auto-pairs'
"Plug 'davidhalter/jedi-vim'
"Plug 'zchee/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
"telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
" or                                , { 'branch': '0.1.x' }
"Plug 'nathanaelkane/vim-indent-guides'
"if has('nvim')
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
  "Plug 'Shougo/deoplete.nvim'
  "Plug 'roxma/nvim-yarp'
  "Plug 'roxma/vim-hug-neovim-rpc'
"endif


call plug#end()

"colorscheme molokai
"enabling the italic comments of gruvbox
let g:molokai_italic=0
"set background=light
colorscheme onehalfdark

let g:python3_host_prog = '/usr/local/bin/python3.9'
let g:deoplete#enable_at_startup = 1
let g:jedi#completions_enabled = 1
"let g:coc_user_config = 1
"let g:coc_start_at_startup = 1
let g:coc_config_home = '/Users/amirreza/.config/nvim'
set hidden
"for auto closing preview window (i guess i don't know how to use it properly,
"yet)
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"autocmd FileType python setlocal autoindent smartindent softtabstop=2 tabstop=2 shiftwidth=2 ts=2

"*** vim-test ***
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

"this is used for making command line call signatures to be invisible.
"more reading https://github.com/davidhalter/jedi-vim/blob/master/doc/jedi-vim.txt
let g:jedi#show_call_signatures = 0
" for the love of God, let's disable cursor
set mouse=


"change cursor style in insert mode
set guicursor=
if $TERM_PROGRAM =~ "iTerm2"
  let &t_SI = "\<Esc>]10;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=1\x7" " Block in normal mode
endif
autocmd InsertEnter,InsertLeave * set cul!

"for splitting 
set splitright
set splitbelow

"automatically install missing plugins at startup
"autocmd VimEnter *
"  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"  \|   PlugInstall --sync | q
"  \| endif


"autocmd VimEnter * BracelessEnable +highlight-cc2 

"Automatically install plugins on startup
"TODO
"luafile $HOME/.config/nvim/plug-config/treesitter.lua
" A function removing annoying whitespaces
"TODO Learn to write functions in vim
function Idnt ()
   :%s;^\(\s\+\);\=repeat(' ', len(submatch(0))/2);g
endfunction

"printing the date
function Dt()
  :r! printf "****\n" && date "+\%d-\%m-\%y \%H:\%M"&&printf "\n\n"
endfunction


"SOME SPECIFIC COMMANDS FOR TXT FILES
"to disable autocomplete menu of CoC on txt files
autocmd FileType text let b:coc_suggest_disable = 1
autocmd FileType text setlocal nonumber
autocmd VimEnter * let b:coc_disabled_sources= 1


"sexy treesitter
lua <<EOF
require('nvim-treesitter.configs').setup {        
  highlight = { enable = true }
}
EOF


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    ""For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif


