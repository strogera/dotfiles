"path to plug file
call plug#begin('~\AppData\Local\nvim\plugged\')

Plug 'vimwiki/vimwiki'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-syntastic/syntastic'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'flazz/vim-colorschemes'
Plug 'tpop/vim-markdown'
Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'

call plug#end()

"gvim
set encoding=utf8
set bs=2 "fixes backspace for gvim
"set guifont:DejaVu\ Sans\ Mono\ for\ Powerline:h18
"set guifont:Powerline\ Consolas:h17
set guifont:Hack:h17
set belloff=all

"syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"color column (line size ruler)
set cc=81

"set backupdir=~/.vimbackup//,/tmp
"set directory=~/.vimbackup//,/tmp

set background=dark "light

"use spellcheck for .txt files
au BufNewFile,BufRead *.txt setlocal spell spelllang=en_us,el

"can use greek key presses in normal mode, requires utf8
set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz

"vimwiki requires these
filetype plugin on
syntax on
set nocompatible

"vimwiki markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

filetype plugin indent on
set smartcase
set incsearch 
set ttimeoutlen=100
set clipboard=unnamed

"enable numbers {:set nu! to disable for current file)
set number
""highlight LineNr term=NONE cterm=NONE ctermfg=GRAY ctermbg=none gui=NONE guifg=NONE guibg=NONE

"highlight current line number
""highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
""set cursorline

"enable mouse
if has('mouse')
  set mouse=a
endif

"ignore case when searching for word
"set ignorecase

"auto-add ",',),],}
""ino " ""<left>
"ino ( ()<left>
""ino [ []<left>
""ino { {}<left>
""inoremap { {<CR>}<Esc>ko<tab>
inoremap { {<CR>}<Esc>ko

"set autoindent, very useful for the above {
set autoindent


set t_Co=256 
"set term=xterm-256color


set laststatus=2
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
"remove branch
"let g:airline_section_b = '%{getcwd()}'
let g:airline_section_c = '%t'

colorscheme hybrid_material
