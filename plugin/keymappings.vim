if exists('b:keymappings_setup_loaded')
  finish
endif
let b:keymappings_setup_loaded=1

" Folding
nnoremap <silent> <F3> zM
nnoremap <silent> <F4> zR

" Make Y consistent with C and D
nnoremap <silent> Y y$

" Make <C-l> clear the highlight
nnoremap <silent> <C-l> :nohls<CR><C-l>

nnoremap <c-w><c-t> :tabnew<CR>
" Delete current buffer
nnoremap <silent> <leader>bd :call buffer#kill()<CR>
" Delete all buffers
nnoremap <silent> <leader>da :silent bufdo call buffer#kill()<CR>
" Move current window to currend file path
nnoremap <silent> <leader>cd :lcd %:p:h<CR>:pwd<CR>

" Spell
nnoremap <silent> <F7> <esc>:set invspell<CR>
nnoremap <silent> <F6> zg
nnoremap <silent> <F8> z=

nnoremap <silent> # g#
nnoremap <silent> g# #
nnoremap <silent> * g*
nnoremap <silent> g* *

vmap * :<C-u>call text#highlight_visual()<CR>//<CR>
vmap # :<C-u>call text#highlight_visual()<CR>??<CR>
vnoremap <silent> ! :<c-u>call text#highlight_visual()<CR>
nnoremap <silent> ! :call text#highlight(expand('<cword>'))<CR>

nnoremap K <nop>
nnoremap Q <nop>
nnoremap <up> <nop>
nnoremap <right> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>

" Indent all file
nnoremap <silent> <leader>ff :call Preserve('normal gg=G')<CR>

inoremap <TAB> <C-R>=SnippetOrCloserGetOut()<CR>
function! SnippetOrCloserGetOut()
  if neosnippet#expandable_or_jumpable()
    return neosnippet#mappings#expand_or_jump_impl()
  else
    return closer#get_out() . "\<right>"
  endif
endfunction
