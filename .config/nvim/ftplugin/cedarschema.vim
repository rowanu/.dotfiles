if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal commentstring=//\ %s
setlocal comments=://
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
setlocal expandtab
setlocal formatoptions-=t formatoptions+=croql
setlocal iskeyword+=:

let b:undo_ftplugin = "setlocal commentstring< comments< shiftwidth< softtabstop< tabstop< expandtab< formatoptions< iskeyword<"
