autocmd BufNewFile,BufRead *.template setfiletype cloudformation.yaml
function s:IsJson()
  if getline(1) =~ '{'
    setlocal filetype=cloudformation.json
  endif
endfun
autocmd BufNewFile,BufRead *.template call s:IsJson()
