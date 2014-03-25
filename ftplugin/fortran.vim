setlocal expandtab
setlocal shiftwidth=2
setlocal textwidth=72
setlocal smartindent
inoremap <buffer> <TAB> <C-R>=fortran#tabstop()<CR>

function fortran#tabstop()
	let c = col('.')
	let d = c < 7 ? 7 : c+1+(c%2)
	return repeat(' ',d-c)
endfunction
