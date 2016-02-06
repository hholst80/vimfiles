setlocal foldmethod=expr foldexpr=DiffFold(v:lnum)
function! DiffFold(lnum)
  let line = getline(a:lnum)
  if line =~ '^\(diff\|Only\|---\|+++\) '
    return 0
  elseif line =~ '^\(@@\)'
    return 1
  else
    return 2
  endif
endfunction
