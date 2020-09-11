function s:IsJson()
  if getline(1) =~ '{'
    setlocal filetype=cloudformation.json
  endif
endfun

augroup filetype_cloudformation
  autocmd!
  autocmd BufNewFile,BufRead *.template setfiletype cloudformation.yaml
  autocmd BufNewFile,BufRead *.template call s:IsJson()
augroup END
