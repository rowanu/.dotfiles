if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal commentstring=//\ %s
setlocal comments=://
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal expandtab
setlocal formatoptions-=t formatoptions+=croql

" Entity type paths use :: so treat colon as part of a keyword for w/*/gd
setlocal iskeyword+=:

let b:undo_ftplugin = "setlocal commentstring< comments< shiftwidth< softtabstop< tabstop< expandtab< formatoptions< iskeyword<"
