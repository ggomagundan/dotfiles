"=============================================================================
" init.vim --- Entry file for neovim
" Copyright (c) 2016-2023 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg@outlook.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

" set default encoding to utf-8
" Let Vim use utf-8 internally, because many scripts require this
set encoding=utf-8
scriptencoding utf-8

" Enable nocompatible
if &compatible
  set nocompatible
endif

set mouse=a


call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'vim-syntastic/syntastic'
Plug 'ludovicchabant/vim-gutentags'
Plug 'flazz/vim-colorschemes'
Plug 'flrnprz/candid.vim'
Plug 'gmoe/vim-espresso'
Plug 'vim-scripts/WhiteWash'
Plug 'jremmen/vim-ripgrep'
Plug 'justinmk/vim-sneak'
Plug 'frazrepo/vim-rainbow'
Plug 'mfussenegger/nvim-lint'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

"-------------------=== Javascript  ===-----------------------------
Plug 'mxw/vim-jsx'
Plug 'isRuslan/vim-es6'
Plug 'flowtype/vim-flow'
Plug 'jason0x43/vim-js-indent'
Plug 'pangloss/vim-javascript'

"-------------------=== Python  ===-----------------------------
Plug 'klen/python-mode'                   " Python mode (docs, refactor, lints...)

"-------------------=== Rust   ===-----------------------------
Plug 'rust-lang/rust.vim'

" nvim-cmp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()

" For yank clipboard
set clipboard=unnamed

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


set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.gif
let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
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


set t_Co=256
colorscheme espresso

" For indent
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

let g:airline#extensions#tagbar#enabled = 0


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

" Gutentags configuration
let g:gutentags_project_root = ['.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_ctags_extra_args = ['--fields=+l', '--extra=+f']
let g:gutentags_enabled = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_missing = 1


lua require('nvim-cmp')
lua require('treesitter')

nnoremap <C-p> :Telescope find_files<CR>

lua << EOF
require('telescope').setup{
 defaults = {
   mappings = {
     i = {
       ["<C-o>"] = require('telescope.actions').select_horizontal,
       ["<C-h>"] = require('telescope.actions').select_horizontal
     }
   }
 }
}
EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" SpaceVim Setting
let g:_spacevim_root_dir = escape(fnamemodify(resolve(fnamemodify(expand('<sfile>'),
      \ ':p:h:gs?\\?'.((has('win16') || has('win32')
      \ || has('win64'))?'\':'/') . '?')), ':p:gs?[\\/]?/?'), ' ')
lockvar g:_spacevim_root_dir
if has('nvim')
  let rtps = [g:_spacevim_root_dir]
  for rtp in split(&rtp, ',')
    if rtp =~# 'nvim-qt'
      call insert(rtps, 0, rtp)
    else
      call add(rtps, rtp)
    endif
  endfor
  let &rtp = join(rtps, ',')
else
  let &rtp = g:_spacevim_root_dir . ',' . $VIMRUNTIME
endif
call SpaceVim#logger#info('Loading SpaceVim from: ' . g:_spacevim_root_dir)
call SpaceVim#logger#info('default rtp is:')
call map(split(&rtp, ','), 'SpaceVim#logger#info("  > " . v:val)')
if has('vim_starting')
  " python host
  " @bug python2 error on neovim 0.6.1
  " let g:loaded_python_provider = 0
  if !empty($PYTHON_HOST_PROG)
    let g:python_host_prog  = $PYTHON_HOST_PROG
    call SpaceVim#logger#info('$PYTHON_HOST_PROG is not empty, setting g:python_host_prog:' . g:python_host_prog)
  endif
  if !empty($PYTHON3_HOST_PROG)
    let g:python3_host_prog = $PYTHON3_HOST_PROG
    call SpaceVim#logger#info('$PYTHON3_HOST_PROG is not empty, setting g:python3_host_prog:' . g:python3_host_prog)
    if !has('nvim')
          \ && (has('win16') || has('win32') || has('win64'))
          \ && exists('&pythonthreedll')
          \ && exists('&pythonthreehome')
      let &pythonthreedll = get(split(globpath(fnamemodify($PYTHON3_HOST_PROG, ':h'), 'python*.dll'), '\n'), -1, '')
      call SpaceVim#logger#info('init &pythonthreedll:' . &pythonthreedll)
      let &pythonthreehome = fnamemodify($PYTHON3_HOST_PROG, ':h')
      call SpaceVim#logger#info('init &pythonthreehome:' . &pythonthreehome)
    endif
  endif
endif

call SpaceVim#begin()

call SpaceVim#custom#load()

if has('timers')
  call timer_start(g:spacevim_lazy_conf_timeout, 'SpaceVim#default#keyBindings')
else
  call SpaceVim#default#keyBindings()
endif


call SpaceVim#end()

call SpaceVim#logger#info('finished loading SpaceVim!')
" vim:set et sw=2 cc=80:
