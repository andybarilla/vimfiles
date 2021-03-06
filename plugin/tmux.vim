command! TmuxSetPane call TmuxRunner.setTmuxPane()
command! TmuxSetRunner call TmuxRunner.setRunner()

noremap <silent> <leader>tc :call TRKill()<CR>
noremap <silent> <leader>tl :call TmuxRunner.send('C-l')<CR>
noremap <silent> <leader>tp :call TmuxRunner.send('C-p Enter', 'TRClear')<CR>

noremap <silent> <leader>rt :call TmuxRunner.runUnscoped('TRClear')<CR>
noremap <silent> <leader>rf :call TmuxRunner.runFile('TRClear')<CR>
noremap <silent> <leader>rn :call TmuxRunner.runNearest('TRClear')<CR>
noremap <silent> <leader>rc :call TmuxRunner.runCustom('TRClear')<CR>

noremap <silent> <leader>rr :call TmuxRunner.reExecute('TRClear')<CR>

cnoreabbrev tm Tmux

function! TRKill()
  silent call g:TmuxRunner.send('C-c')
  sleep 10 m
endfunction

function! TRClear()
  silent call TRKill()
  sleep 20 m
  silent call g:TmuxRunner.send('C-l')
endfunction
