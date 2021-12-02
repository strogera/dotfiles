"################# change directory if needed #################
set nocompatible "for polyglot
call plug#begin('~\AppData\Local\nvim\plugged\')

" Essential
Plug 'tpope/vim-surround'
" v makes surround repeatable
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'

" IDE like functionality
" v use coc for the languages that you have set it up to be used
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for':['python', 'go', 'haskell', 'nim', 'cpp', 'c', 'markdown']} 
" v syntax highlighting for most languages
Plug 'sheerun/vim-polyglot'
"Plug '907th/vim-auto-save'

" Nice to have
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'], 'on':'MarkdownPreview'}
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
"Plug 'junegunn/limelight.vim'

" Looks
"colorschemes
Plug 'https://github.com/srcery-colors/srcery-vim'
"Plug 'https://github.com/rakr/vim-one'
"Plug 'https://github.com/nanotech/jellybeans.vim'
"Plug 'https://github.com/AlessandroYorba/Alduin'
"Plug 'https://github.com/preservim/vim-colors-pencil'
"Plug 'https://github.com/owickstrom/vim-colors-paramount'
"Plug 'sainnhe/gruvbox-material'
"Plug 'kristijanhusak/vim-hybrid-material'
"Plug 'https://github.com/plainfingers/black_is_the_color'
"vscode colorscheme
"Plug 'tomasiser/vim-code-dark'

" Misc
"Plug 'vimwiki/vimwiki'
"Plug 'vim-scripts/restore_view.vim'
"Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'
"Plug 'junegunn/fzf.vim'

call plug#end()

" Gvim
set encoding=utf-8
set bs=2 "fixes backspace for gvim
"set guifont:DejaVu\ Sans\ Mono\ for\ Powerline:h18
set guifont:Consolas:h13
"set guifont:Hack:h13
"set guifont:Hack\ NF:h13
"set guifont="Consolas Nerd Font Complete:h16"
set belloff=all
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar
set guioptions-=L  "scrollbar
au GUIEnter * simalt ~x "open in full screen


"""""" Vim settings """"""

" from https://github.com/neoclide/coc.nvim
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set nobackup
set nowritebackup

set noswapfile
set undodir="~\vimfiles\undodir"
set undofile
"set backupdir=~/.vimbackup//,/tmp
"set directory=~/.vimbackup//,/tmp
set wildmode=longest,list,full
set wildignorecase
set mouse=a
filetype plugin indent on
set expandtab
set ignorecase
set incsearch 
set ttimeoutlen=100
set clipboard=unnamed
"set clipboard=unnamedplus
set number
set autoindent
set scrolloff=2
set smarttab 
set autoread
set background=dark
set termguicolors
syntax on

"use spellcheck for .txt files
au BufNewFile,BufRead *.txt setlocal spell spelllang=en_us,el

"can use greek key presses in normal mode, requires utf8
set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz


"These are needed in order to use true colors for st
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"Cursor for st
"let &t_ti.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[1 q"
"let &t_te.="\e[0 q""]"


"""""" Status bar and tab status settings """"""

function! GitBranch()
          return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
        let l:branchname = GitBranch()
        return strlen(l:branchname) > 0?'{'.l:branchname.'}':''
endfunction

function! WordCount()
"Based on https://www.vivi.sh/blog/technical/live-wordcount-vim-airline/
    let position = getpos(".")
    exe ":silent normal g\<c-g>"
    let stat = v:statusmsg
    let s:word_count = 0
    if stat != '--No lines in buffer--'
        if mode() == "V"
            let s:word_count = str2nr(split(stat)[5])
        else
            let s:word_count = str2nr(split(stat)[11])
        endif
    endif
    call setpos('.', position)
    return s:word_count
endfunction

set laststatus=2
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ REPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#CursorLine#     " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%#CursorLine#     " colour
set statusline+=\ %y\                   " file type
set statusline+=\ %F\                   " Full path 
"set statusline+=%{StatuslineGit()}  " git status
set statusline+=%#CursorLine#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%m                        " modified [+] flag
set statusline+=%=                          " right align
set statusline+=%3l/%L\         " line/totalLines
set statusline+=%-2c\             " column count
set statusline+=%{WordCount()}\  " word count


set showtabline=2
function! Tabline()
        "Based on https://github.com/mkitt/tabline.vim/blob/master/plugin/tabline.vim
        let s = ''
        for i in range(tabpagenr('$'))
                let tab = i + 1
                let winnr = tabpagewinnr(tab)
                let buflist = tabpagebuflist(tab)
                let bufnr = buflist[winnr - 1]
                let bufname = bufname(bufnr)
                let bufmodified = getbufvar(bufnr, "&mod")

                let s .= '%' . tab . 'T'
                let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
                let s .= ' [' . tab .'] '
                let s .= (bufname != '' ?  fnamemodify(bufname, ':p:h:t') . '/' . fnamemodify(bufname, ':t')  : '[No Name] ')
                let s .= ' '

                if bufmodified
                        let s .= '[+]'
                endif
                let s.= '|'
        endfor
        return s
endfunction

set tabline=%!Tabline()


"""""" Plugin settings """"""

"AutoSave
"let g:auto_save = 1  " enable AutoSave on Vim startup
"let g:auto_save_silent = 1  " do not display the auto-save notification

"coc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"





"""""" Colorscheme settings """"""

let g:srcery_transparent_background = 1
colorscheme srcery

"highlight only current line number (needs to be after colorscheme)
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline
