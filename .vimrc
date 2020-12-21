call plug#begin('~\AppData\Local\nvim\plugged\')

" Essential
Plug 'tpope/vim-surround'

" IDE like functionality
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug '907th/vim-auto-save'
Plug 'vim-syntastic/syntastic'

" Nice to have
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"makes surround repeatable
Plug 'tpope/vim-repeat'
Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'

" Looks
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Needs compatible font https://github.com/ryanoasis/nerd-fonts
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"vscode colorscheme
"Plug 'tomasiser/vim-code-dark'
"Plug 'itchyny/lightline.vim'
"Plug 'kristijanhusak/vim-hybrid-material'

" Misc
"Plug 'tpop/vim-markdown'
"Plug 'vimwiki/vimwiki'
"Plug 'vim-scripts/restore_view.vim'
"Plug 'shinchu/lightline-gruvbox.vim'
"Plug 'pablobender/lightline-gruvbox.vim'
"Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'
"Plug 'junegunn/fzf.vim'

call plug#end()

"gvim
set encoding=utf-8
set bs=2 "fixes backspace for gvim
"set guifont:DejaVu\ Sans\ Mono\ for\ Powerline:h18
"set guifont:Consolas:h13
set guifont:Hack\ NF:h14
"let &guifont="Consolas Nerd Font Complete:h16"
set belloff=all
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar
set guioptions-=L  "scrollbar
au GUIEnter * simalt ~x "open in full screen

set noswapfile
set nobackup
set undodir="~\vimfiles\undodir"
set undofile

let g:auto_save = 1  " enable AutoSave on Vim startup
"let g:auto_save_silent = 1  " do not display the auto-save notification

"completions for vim command
set wildmode=longest,list,full
set wildignorecase

"use nerdfont's chars, needs patched font 
let g:NERDTreeGitStatusUseNerdFonts = 1 

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

"coc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
"filetype plugin on
"syntax on
"set nocompatible

"vimwiki markdown
"let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

filetype plugin indent on
set smartcase
set incsearch 
set ttimeoutlen=100
set clipboard=unnamed

set noautochdir

"enable numbers {:set nu! to disable for current file)
set number
"set relativenumber
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

"inoremap { {<CR>}<Esc>ko

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
set statusline +=%5l%*             "current line
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number

let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#branch#enabled = 1
"remove git branch
"let g:airline_section_b = '%{getcwd()}'
"let g:airline_section_c = '%t'

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

"lightline theme
"let g:lightline = {'colorscheme': 'gruvbox', }

"tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type= 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_count = 0

"Gruvbox settings
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_improved_strings=1
set background=dark
colorscheme gruvbox
