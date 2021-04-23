"################# change directory if needed #################
call plug#begin('~/.vim/plugged')

" Essential
Plug 'tpope/vim-surround'

" IDE like functionality
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'vim-syntastic/syntastic'
"Plug 'tpope/vim-fugitive'
"Plug 'preservim/nerdtree'
"Plug '907th/vim-auto-save'

" Nice to have
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"makes surround repeatable
Plug 'tpope/vim-repeat'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
"Plug 'junegunn/limelight.vim'

" Looks
"colorschemes
Plug 'https://github.com/srcery-colors/srcery-vim'
"Plug 'https://github.com/nanotech/jellybeans.vim'
"Plug 'https://github.com/AlessandroYorba/Alduin'
"Plug 'https://github.com/preservim/vim-colors-pencil'
"Plug 'https://github.com/owickstrom/vim-colors-paramount'
"Plug 'sainnhe/gruvbox-material'
"Plug 'kristijanhusak/vim-hybrid-material'
"Plug 'https://github.com/plainfingers/black_is_the_color'
"vscode colorscheme
"Plug 'tomasiser/vim-code-dark'

"Plug 'Xuyuanp/nerdtree-git-plugin'
"Needs compatible font https://github.com/ryanoasis/nerd-fonts
"Plug 'ryanoasis/vim-devicons'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Misc
"Plug 'tpop/vim-markdown'
"Plug 'vimwiki/vimwiki'
"Plug 'vim-scripts/restore_view.vim'
"Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'
"Plug 'junegunn/fzf.vim'

call plug#end()

" Gvim
"set encoding=utf-8
"set bs=2 "fixes backspace for gvim
"set guifont:DejaVu\ Sans\ Mono\ for\ Powerline:h18
"set guifont:Consolas:h13
"set guifont:Hack:h13
"set guifont:Hack\ NF:h13
"set guifont="Consolas Nerd Font Complete:h16"
"set belloff=all
"set guioptions-=m  "menu bar
"set guioptions-=T  "toolbar
"set guioptions-=r  "scrollbar
"set guioptions-=L  "scrollbar
"au GUIEnter * simalt ~x "open in full screen


"""""" Vim settings """"""

set noswapfile
set nobackup
set undodir="~\vimfiles\undodir"
set undofile
set backupdir=~/.vimbackup//,/tmp
set directory=~/.vimbackup//,/tmp
set wildmode=longest,list,full
set wildignorecase
set mouse=a
filetype plugin indent on
set expandtab
set ignorecase
set incsearch 
set ttimeoutlen=100
set clipboard=unnamedplus
set number
set autoindent
set scrolloff=2
set smarttab 
set autoread
set background=dark
set termguicolors

"use spellcheck for .txt files
au BufNewFile,BufRead *.txt setlocal spell spelllang=en_us,el

"can use greek key presses in normal mode, requires utf8
set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz


"These are needed in order to use true colors for st
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"Cursor
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q""]"


"""""" Status bar and tab status settings """"""

function! GitBranch()
          return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
        let l:branchname = GitBranch()
        return strlen(l:branchname) > 0?'{'.l:branchname.'}':''
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
set statusline+=%{StatuslineGit()}  " git status
set statusline+=%#CursorLine#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%m                        " modified [+] flag
set statusline+=%=                          " right align
set statusline+=%3l/%L\         " line/totalLines
set statusline+=%-2c\             " column count
set statusline+=%{wordcount().words}\  " word count


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

"NerdTree
"let g:netrw_liststyle = 3
"let g:netrw_banner = 0
"let g:netrw_browse_split = 4
"let g:netrw_winsize = 20
"autocmd BufWinEnter * silent :Lex
"use nerdfont's chars, needs patched font 
"let g:NERDTreeGitStatusUseNerdFonts = 1 
" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window left.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"    \ quit | endif
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * silent NERDTreeMirror

"coc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"vimwiki requires these
"filetype plugin on
"syntax on
"set nocompatible

"vimwiki markdown
"let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]


"""""" Colorscheme settings """"""

"Gruvbox
"let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_improved_strings=1

"let g:PaperColor_Theme_Options = {    'theme': {      'default.dark': {        'transparent_background': 1      }    }  }
"
"let g:pencil_neutral_code_bg = 1   " 0=gray (def), 1=normal
"
"let g:alduin_Shout_Become_Ethereal = 1
"
"let g:jellybeans_overrides = {
"\    'background': { 'ctermbg': 'none', '256ctermbg': 'none'  },
"\}
"if has('termguicolors') && &termguicolors
"    let g:jellybeans_overrides['background']['guibg'] = 'none'
"endif

let g:srcery_transparent_background = 1
colorscheme srcery

"highlight only current line number (needs to be after colorscheme)
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

