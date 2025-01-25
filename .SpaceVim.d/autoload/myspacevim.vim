function! myspacevim#before() abort


  set mouse=r
  set foldmethod=indent
  set foldcolumn=1
  set foldlevelstart=99

  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|.hygen\|__pycache__\|package\|poetry.lock'
  let g:ale_fix_on_save = 0

  let g:spelunker_white_list_for_user = ['queryset', 'datetime', 'serializers', 'whitelist']
endfunction
