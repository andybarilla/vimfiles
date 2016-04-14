" CtrlP easy open files
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_max_files = 0
let g:ctrlp_open_new_file = 't'
let g:ctrlp_switch_buffer = 'ETV'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\v[\/](tmp|log|.git|.hg|.svn)$'
let g:ctrlp_abbrev = {
      \   'abbrevs': [
      \     { 'pattern': '\v(^|\/)a/', 'expanded': 'app/' },
      \     { 'pattern': '\v(^|\/)c/', 'expanded': 'controllers/' },
      \     { 'pattern': '\v(^|\/)m/', 'expanded': 'models/' },
      \     { 'pattern': '\v(^|\/)v/', 'expanded': 'views/' },
      \     { 'pattern': '^s/', 'expanded': 'spec/' },
      \     { 'pattern': '^t/', 'expanded': 'test/' }
      \   ]
      \ }

nnoremap <c-n> :CtrlPBufTag<CR>
nnoremap <c-k> :CtrlPBuffer<CR>
