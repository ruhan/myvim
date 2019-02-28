"Ruhan Bidart
"Based on Wladston Viana vimrc
"
" Plugins:
" * vim-abolish: makes easy to make substitutions of words with different
"   CaSe. You need only use %S/ instead of %s/ and the plugin handles the
"   differences to you.
" Enables packages instaled in the bundle directory.
call pathogen#infect()
call pathogen#helptags()

" Disables old vi stuff we won't use
set nocompatible

" Shares clipboard with operating system
set clipboard=unnamed

" Search settings
set incsearch " Incremental search
set ignorecase " Ignore capsloc
set smartcase " Execp with explicit caps
nmap <C-h> :set hls!<CR>:set hls?<CR> " Search Highlight

set showmatch " Show matching bracket
set ruler " Show line/column pertentage info on the bottom of the screen
set backspace=indent,eol,start " allow backspace over autoindent, end of lines, start of a insert
set hlsearch

" lazy auto complete
set wildmode=longest:full
set wildmenu

" Indentation settings
set smartindent
set autoindent
set tabstop=4 "set tab character to 4 characters
set softtabstop=4 " a backspace will delete 4 spaces
set expandtab "turn tabs into whitespace
set shiftwidth=4 "indent width for autoindent
filetype indent on "indent depends on filetype
filetype plugin on
filetype plugin indent on

"allow indented python commands
inoremap # X#

"Set color scheme
"colorscheme zenburn
"colorscheme badwolf
"colorscheme inkpot
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 256
colorscheme solarized
syntax enable
set background=dark
"set background=light

" Paste mode
map <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
au InsertLeave * set nopaste " exit paste mode when leaving insert mode.
set showmode!

" 79 char limit for Python and Js
autocmd FileType python3,javascript set textwidth=79
autocmd FileType python3,javascript set colorcolumn=80
autocmd FileType python3,javascript highlight ColorColumn ctermbg=Grey

" 72 char limit for Git Commit Message
autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set colorcolumn=73
autocmd FileType gitcommit highlight ColorColumn ctermbg=Red
autocmd BufNewFile,BufRead *.git/modules/**/COMMIT_EDITMSG set ft=gitcommit

" Disable arrow keys in normal mode -- learn vim the hard way >)
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <Esc> <nop>

" Fix arrow keys bug on mac
imap OX <ESC>

" Autocomplete
" TODO

"Adiciona um ponto para os espaços em branco
set list listchars=tab:\ \ ,trail:·

" VimTip 80: Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Adicionando linhas relativas como default
set relativenumber
set numberwidth=5 " Reserve 5 chars for line numbers

" Toggle de linhas relativas/absolutas
"function! NumberToggle()
"  if(&relativenumber == 1)
"    set number
"  else
"    set relativenumber
"  endif
"endfunc
"nnoremap <C-n> :call NumberToggle()<cr>

" handy ESC
inoremap jk <Esc>
inoremap ;; <Esc>
xnoremap ;; <Esc>

if &diff
    colorscheme greens
    set number " Display absolute line numbers
    set numberwidth=4 " Reserve 4 chars for line numbers
    " Settings for vimdiff
    nnoremap dg1 :diffget 1<CR>
    nnoremap dg2 :diffget 2<CR>
    nnoremap dg3 :diffget 3<CR>
else
    " linhas absolutas para janelas sem foco
    :au FocusLost * :set number
    :au FocusGained * :set relativenumber

    " linhas absolutas no modo de inserção
    autocmd InsertEnter * :set number
    autocmd InsertLeave * :set relativenumber
endif

" Centraliza a tela
nmap <space> zz

nnoremap <Tab>h <C-w>h
nnoremap <Tab>j <C-w>j
nnoremap <Tab>k <C-w>k
nnoremap <Tab>l <C-w>l

"Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

if has("user_commands")
    command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif


" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

"
" External plugin settings
"

" Zen Coding
let g:user_zen_expandabbr_key='<C-e>'

" Gundo
nnoremap <C-i> :GundoToggle<CR>
set undofile

nnoremap <C-l> :Gblame<CR>

" Syntastic
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['python3', 'javascript', 'text'],
                           \ 'passive_filetypes': [] }

"let g:Powerline_symbols = 'fancy'
set t_Co=256
let g:Powerline_symbols = 'unicode'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height=3
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_text_checkers = ['language_check']
"let g:syntastic_text_language_check_args = '--language=en-US'
"let g:syntastic_aggregate_errors = 1

" Close syntastic window when :q
nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>

" jsx syntax also valid on simple js files
let g:jsx_ext_required = 0
set laststatus=2

" Python Mode configurations
let g:pymode = 0

" Disable pylint checking every save
let g:pymode_lint_write = 1

" Load show documentation plugin
let g:pymode_doc = 1

" Load run code plugin
let g:pymode_run = 1

" Key for run python codesdf
let g:pymode_run_key = '<C-c>r'

" Key for set/unset breakpoint
let g:pymode_breakpoint_key = '<C-c>b'

let g:pymode_rope=0

" Enable black execution after each save
" * Black is a python code formatter!
autocmd BufWritePre *.py execute ':Black'
let g:black_linelength=80

" Enable prettier (for js) after each save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" Code folding shortcuts
"`za` - toggles
"`zc` - closes
"`zo` - opens
"`zR` - open all
"`zM` - close all
set foldmethod=indent
set foldnestmax=2

" To work using tab inner a autocomplete popup
function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

" Maps F2 to toggle autoindent mode
set pastetoggle=<F2>

" Maps F3 to toggle line numbers
function! g:ToggleNoRnuRnuMode()
    if(&rnu == 1)
        set nornu
    else
        set rnu
    endif
endfunc

nnoremap <F3> :call g:ToggleNoRnuRnuMode()<cr>

" Maps F4 to toggle between relative line number and common line numbers
function! g:ToggleNuRnuMode()
    if(&rnu == 1)
        set nu
    else
        set rnu
    endif
endfunc


nnoremap <F4> :call g:ToggleNuRnuMode()<cr>

" Better navigation between tabs using CTRL+n and CTRL+p
nmap <silent> <C-n> :tabnext<CR>
nmap <silent> <C-p> :tabprev<CR>
imap <silent> <C-n> <esc><C-n>
imap <silent> <C-p> <esc><C-p>

ca tn tabnew
ca th tabp
ca tl tabn

" Vimpdb
highlight PdbCurrentLine guibg=DarkGreen ctermbg=Blue
highlight PdbBreakpoint guibg=DarkRed ctermbg=DarkRed
highlight PdbConditionalBreakpoint guibg=Purple ctermbg=Magenta
highlight PdbTemporaryBreakpoint guibg=SlateBlue ctermbg=LightBlue

map <Leader>p :call InsertLine()<CR>

function! InsertLine()
  let trace = expand("import pdb; pdb.set_trace()")
    execute "normal o".trace
endfunction

" Clean unwanted spaces
nmap <silent> <C-l> :%s/\s\+$//<CR>

" Indentation guidelines
au VimEnter * IndentGuidesEnable
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red ctermbg=darkgray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=gray

" Javascript guides
" js folding
" zf#j creates a fold from the cursor down # lines.
" zf/ string creates a fold from the cursor to string .
" zj moves the cursor to the next fold.
" zk moves the cursor to the previous fold.
" zo opens a fold at the cursor.
" zO opens all folds at the cursor.
" zm increases the foldlevel by one.
" zM closes all open folds.
" zr decreases the foldlevel by one.
" zR decreases the foldlevel to zero -- all folds will be open.
" zd deletes the fold at the cursor.
" zE deletes all folds.
" [z move to start of open fold.
" ]z move to end of open fold.
au FileType javascript call JavaScriptFold()

" CoffeeScript fold
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable


" Ctrlp
let g:ctrlp_map = '<c-a>'
let g:ctrlp_cmd = 'CtrlP'

" Cursor
" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=4
" Highlight line where cursor is
set cursorline

" Create a command w!! that can be used to save the file as sudo
cmap w!! w !sudo tee > /dev/null %

" Highlight columns after 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
