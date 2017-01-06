# colon : write single colon in haskell with vim

colon is a simple vim plugin that show :: as : and vice versa
it also make a few other changes as below

```
:: -> :
 : -> ::      
data    -> type
type    -> type=
newtype -> type*
```

for example

```haskell
main : IO ()
main = putStrLn hello

hello = 'h'::'e'::'l':: 'l' :: 'o' :: []

data MyInt = MyInt Int
type= AnotherInt = MyInt
type* NewInt = NewInt Int
```

only tested with simple examples but it probably work if you're not using unicode characters as operators that also have colon in them :) in that case it shows colon as double colon and vice versa
