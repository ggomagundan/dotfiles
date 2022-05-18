set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" From Armin
Plugin 'vim-airline/vim-airline'
Plugin 'isRuslan/vim-es6'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'flowtype/vim-flow'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'reasonml-editor/vim-reason'

" For Me
"Plugin 'scrooloose/nerdtree'
"Plugin 'mileszs/ack.vim'
"Plugin 'kien/ctrlp.vim'
"Plugin 'airblade/vim-gitgutter'
Plugin 'dense-analysis/ale'
Plugin 'vim-syntastic/syntastic'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'flazz/vim-colorschemes'
Plugin 'flrnprz/candid.vim'
Plugin 'gmoe/vim-espresso'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/WhiteWash'
Plugin 'jason0x43/vim-js-indent'
Plugin 'jremmen/vim-ripgrep'
Plugin 'justinmk/vim-sneak'
Plugin 'frazrepo/vim-rainbow'
Plugin 'embear/vim-localvimrc'

" For Rust
Plugin 'rust-lang/rust.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable vim-rainbow
let g:rainbow_active = 1

" Ale Setting Start
let g:ale_fixers = {
       \ '*': ['remove_trailing_lines', 'trim_whitespace'],
       \ 'javascript': ['prettier', 'xo', 'eslint'],
       \ 'rust': ['rustfmt'],
       \ 'python': ['black']
\ }
let g:ale_linters = {
       \ 'javascript': ['eslint', 'xo' ],
       \ 'rust': ['rustc', 'analyzer'],
       \ 'python': ['pylint']
\ }

"let g:ale_sign_error = '❌'
"let g:ale_sign_warning = '⚠️'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '!!'

let g:ale_fix_on_save = 1
let g:ale_enabled = 1
" Ale Setting  Env

" Enable local Vimrc and not ask when vim start
let g:localvimrc_enable = 1
let g:localvimrc_ask=0
" Value 0: Don't ask before loading a vimrc file.
" Value 1: Ask before loading a vimrc file.
" Default: 1

" Kite Setting Start
" let g:kite_supported_languages = ['javascript']
" let g:kite_tab_complete=1
" let g:kite_snippets=1
" let g:kite_log=1 
" set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
" set laststatus=2  " always display the status line
"Kite Setting End


" Set Standard Lint Start
" autocmd bufwritepost *.js silent !standard --fix % " Auto fix when save
" autocmd bufwritepost *.js silent !standard %
autocmd BufNewFile,BufRead *.rs set filetype=rust
" set autoread
" Set Standard Lint End

" syntastic Setting Start
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
" syntastic Setting End

set tags=./tags,./tags.temp
" tag file

let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'javascript',
    \ 'kinds'     : [
        \ 'O:objects',
        \ 'F:functions',
        \ 'A:arrays',
        \ 'S:strings',
        \ 'P:properties',
        \ 'C:class',
        \ 'M:methods',
        \ 'V:global variables'
    \ ]
\ }

" cscope
if has("cscope")
    set csto=0
    cs add cscope.out
    if $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    else
        cs add ~/ref/linux-4.18.3/cscope.out
    "else
    "    cs add /usr/src/linux-source-2.6.22/cscope.out
    endif

    set cscopeverbose

    " cscope/vim key mappings
    " 's' symbol: find all references to the token under cursor
    " 'g' global: find global definition(s) of the token under cursor
    " 'c' calls:  find all calls to the function name under cursor
    " 't' text:   find all instances of the text under cursor
    " 'e' egrep:  egrep search for the word under cursor
    " 'f' file:   open the filename under cursor
    " 'i' includes: find files that include the filename under cursor
    " 'd' called: find functions that function under cursor calls
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>i :cs find i <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

    " CTRL-space <C-@> search and split horizonal window
    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :scs find f <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>i :scs find i <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

    " CTRL-space CTRL-space vertical split
    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>i :vert scs find i <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

    " key map timeout
    "set notimeout
    " Or
    "set timetouteln=4000
    "set ttimeout
    "set ttimeoutlen=100

endif

set foldmethod=syntax
set foldcolumn=1
let javaScript_fold=1
set foldlevelstart=99

""
"" Janus setup
""

" Define paths
if has('win32') || has('win64') || has('win32unix')
  let g:janus_path = escape(expand("~/.vim/janus/vim"), ' ')
  let g:janus_vim_path = escape(expand("~/.vim/janus/vim"), ' ')
else
  let g:janus_path = escape(fnamemodify(resolve(expand("<sfile>:p")), ":h"), ' ')
  let g:janus_vim_path = escape(fnamemodify(resolve(expand("<sfile>:p" . "vim")), ":h"), ' ')
endif
let g:janus_custom_path = expand("~/.janus")

" Source janus's core
exe 'source ' . g:janus_vim_path . '/core/before/plugin/janus.vim'

" You should note that groups will be processed by Pathogen in reverse
" order they were added.
call janus#add_group("tools")
call janus#add_group("langs")
call janus#add_group("colors")

""
"" Customisations
""

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif


" Disable plugins prior to loading pathogen
exe 'source ' . g:janus_vim_path . '/core/plugins.vim'

""
"" Pathogen setup
""

" Load all groups, custom dir, and janus core
call janus#load_pathogen()

" .vimrc.after is loaded after the plugins have loaded
" Ctrl + e NERDTree
nmap <C-e> :NERDTreeToggle<cr>

" For CtrlP Ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.gif
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
  \ --ignore .git
  \ --ignore .svn
  \ --ignore .hg
  \ --ignore .DS_Store
  \ --ignore node_modules
  \ --ignore logs
  \ --ignore webpack
  \ --ignore tags
  \ --ignore .gitignore
  \ --ignore dist
  \ -g ""'

let g:ctrlp_custom_ignore = {
         \   'dir' : '\node_modules\|DS_Store\|.git\|logs\|public\|webpack',
         \   'file': '\.png$\|\.gif$\|\.jpg|\.gitignore$'
         \ }
"let g:ctrlp_user_command = [
"    \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
"    \ 'find %s -type f'
"   \ ]
let g:jsx_ext_required = 1

" Mapping leader key
let mapleader = '\'

" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_enable_diagnostic_highlighting = 0

" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" Mapping YCM GOTOs
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>

syntax on
" colorscheme candid
" colorscheme nightsky
set t_Co=256
colorscheme espresso

" For indent
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

let g:airline#extensions#tagbar#enabled = 0
