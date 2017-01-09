func! ChangeHaskellColonSymbols()
  silent! %s/\v([!#$%&*+./<=>?@\\\^\|-~:])@<!::([!#$%&*+./<=>?@\\\^\|-~:])@!/lifeuniverseknowledgepeace/g
  silent! %s/\v([!#$%&*+./<=>?@\\\^\|-~:])@<!:([!#$%&*+./<=>?@\\\^\|-~:])@!/::/g
  silent %s/lifeuniverseknowledgepeace/:/ge
endfunc

func! ChangeHaskellSyntax(bufwrite)
  call ChangeHaskellColonSymbols()
  silent %s/\<type\>\C\([']\)\@!/type=/ge
  silent %s/\<data\>\C\([']\)\@!/type/ge
  silent %s/\<newtype\>\C/type*/ge
  if a:bufwrite
    call winrestview(b:view)
  endif
endfunc
func! ChangeBackHaskellSyntax()
  let b:view = winsaveview()
  call ChangeHaskellColonSymbols()
  silent %s/\<type\>\C[*]/newtype/ge
  silent %s/\<type\>=/lifeuniverseknowledgepeace/ge
  silent %s/\<type\>\C\([']\)\@!/data/ge
  silent %s/lifeuniverseknowledgepeace/type/ge
endfunc

au BufRead *.hs :call ChangeHaskellSyntax(0)
au BufWritePost *.hs :call ChangeHaskellSyntax(1)
au BufWrite *.hs :call ChangeBackHaskellSyntax()
