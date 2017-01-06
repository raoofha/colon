func! ChangeHaskellColonSymbols()
  silent! %s/\v([!#$%&*+./<=>?@\\\^\|-~:])@<!::([!#$%&*+./<=>?@\\\^\|-~:])@!/lifeuniverseknowledgepeace/g
  silent! %s/\v([!#$%&*+./<=>?@\\\^\|-~:])@<!:([!#$%&*+./<=>?@\\\^\|-~:])@!/::/g
  silent %s/lifeuniverseknowledgepeace/:/ge
endfunc

func! ChangeHaskellSyntax()
  call ChangeHaskellColonSymbols()
  silent %s/\<type\>/type=/ge
  silent %s/\<data\>/type/ge
  silent %s/\<newtype\>/type*/ge
endfunc
func! ChangeBackHaskellSyntax()
  call ChangeHaskellColonSymbols()
  silent %s/\<type\>[*]/newtype/ge
  silent %s/\<type\>=/lifeuniverseknowledgepeace/ge
  silent %s/\<type\>/data/ge
  silent %s/lifeuniverseknowledgepeace/type/ge
endfunc

au BufRead *.hs :call ChangeHaskellSyntax()
au BufWritePost *.hs :call ChangeHaskellSyntax()
au BufWrite *.hs :call ChangeBackHaskellSyntax()
