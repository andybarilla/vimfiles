aug filetype_setup
  au!
  au FileType vim,css,ruby,eruby,tex,c,sh,java,python,js,javascript setlocal
        \ autoindent
        \ copyindent
        \ cindent
        \ smartindent
        \ tabstop=2
        \ shiftwidth=2
        \ softtabstop=2
        \ expandtab
        \ smarttab
        \ shiftround

  au FileType html,javascript,css,eruby,sass,scss,yaml setlocal
        \ iskeyword+=-

  au FileType tex,txt,mail,text,gitcommit setlocal
        \ spell
        \ formatoptions+=a

  au FileType tex,txt,mail,text,markdown setlocal
        \ textwidth=80
        \ noautoindent
        \ nocindent

  au FileType gitcommit setlocal
        \ textwidth=72

  au BufNewFile,BufReadPost,BufWritePre,FileWritePre *.md setlocal
        \ ft=markdown
aug END