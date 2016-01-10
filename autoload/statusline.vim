function! statusline#update()
  for nr in range(1, winnr('$'))
    if bufname(winbufnr(nr)) =~ 'NERD_tree'
      call setwinvar(nr, '&statusline', g:NERDTreeStatusline)
    else
      call setwinvar(nr, '&statusline', statusline#line(winnr() == nr))
    end
  endfo
endfunction

function! statusline#line(active)
  if a:active
    return
          \   '%#SLModeNormal#%{statusline#mode("N")}%*'
          \ . '%#SLModeVisual#%{statusline#mode("V")}%*'
          \ . '%#SLModeInsert#%{statusline#mode("I")}%*'
          \ . '%#SLModeInsert#%{statusline#mode("R")}%*'
          \ . '%#SLModeTerminal#%{statusline#mode("T")}%*'
          \ . '%#SLSection1# %n %*'
          \ . '%(%#SLSection2#%<%{statusline#filename(!&modified)}%*%)'
          \ . '%(%#SLUnsavedFile#%{statusline#filename(&modified)}%*%)'
          \ . '%='
          \ . '%#SLSection2# %y %{&ff} %{&fenc!=""?&fenc:&enc} '
          \ . '%#SLSection1# %c,%l/%L '
  else
    return
          \   ' %n '
          \ . ' %m%<%f '
          \ . '%='
          \ . ' %r%y %{&ff} %{&fenc!=""?&fenc:&enc} '
          \ . ' %c,%l/%L '
  end
endfunction

function! statusline#filename(modified)
  if a:modified
    let fname = expand('%')
    return printf(' %s ', len(fname) ? fname : '[No Name]')
  else
    return ''
  end
endfunction

function! statusline#mode(base)
  if a:base == s:currentModeKey()
    return printf('  %s ', a:base)
  else
    return ''
  end
endfunction

function! s:currentModeKey()
  return get({
        \ 'n': 'N',
        \ 'v': 'V',
        \ 'V': 'V',
        \ '': 'V',
        \ 'i': 'I',
        \ 'R': 'R',
        \ 'Rv': 'R',
        \ 't': 'T',
        \ }, mode(), '-')
endfunction
