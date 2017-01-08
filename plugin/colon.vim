func! ChangeHaskellColonSymbols()
  silent! %s/\v([!#$%&*+./<=>?@\\\^\|-~:])@<!::([!#$%&*+./<=>?@\\\^\|-~:])@!/lifeuniverseknowledgepeace/g
  silent! %s/\v([!#$%&*+./<=>?@\\\^\|-~:])@<!:([!#$%&*+./<=>?@\\\^\|-~:])@!/::/g
  silent %s/lifeuniverseknowledgepeace/:/ge
endfunc

func! ChangeHaskellSyntax()
  let view = winsaveview()
  call ChangeHaskellColonSymbols()
  silent %s/\<type\>/type=/ge
  silent %s/\<data\>/type/ge
  silent %s/\<newtype\>/type*/ge
  call winrestview(view)
endfunc
func! ChangeBackHaskellSyntax()
  let view = winsaveview()
  call ChangeHaskellColonSymbols()
  silent %s/\<type\>[*]/newtype/ge
  silent %s/\<type\>=/lifeuniverseknowledgepeace/ge
  silent %s/\<type\>/data/ge
  silent %s/lifeuniverseknowledgepeace/type/ge
  call winrestview(view)
endfunc

au BufRead,BufWritePost *.hs :call ChangeHaskellSyntax()
au BufWrite *.hs :call ChangeBackHaskellSyntax()
