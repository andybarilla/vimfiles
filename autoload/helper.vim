function! helper#filename_camelized(...)
  let name = expand("%:t:r")
  if len(name) == 0
    if a:0 == 0
      let name = 'MyClass'
    else
      let name = a:1
    endif
  endif
  return s:camelcase(name)
endfunction

function! s:camelcase(s)
  "upcase the first letter
  let to_return = substitute(a:s, '^\(.\)', '\=toupper(submatch(1))', '')
  "turn all '_x' into 'X'
  return substitute(to_return, '_\(.\)', '\=toupper(submatch(1))', 'g')
endfunction

function! helper#modeline()
  return self.start_comment() . " vim:${1:ft=rb:tw=80:hls:}:" . self.end_comment()
endfunction

function! helper#start_comment()
  return <SID>comment_dict().begin
endfunction

function! helper#end_comment()
  return <SID>comment_dict().end
endfunction

function! s:comment_dict()
  if !exists('b:comment_dict')
    let comments = split(&commentstring, '%s')
    let b:comment_dict = { 'begin': get(comments, 0, ''), 'end': get(comments, 1, '') }
    echo b:comment_dict
  endif

  return b:comment_dict
endfunction
