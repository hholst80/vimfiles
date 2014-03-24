setlocal expandtab
setlocal tabstop=6
setlocal shiftwidth=2
setlocal textwidth=72
setlocal smartindent
inoremap <TAB> <C-R>=fortran#tabstop()<CR>

function fortran#tabstop()
	let l = line('.')
	let c = col('.')
	let d = c < 7 ? 7 : c+1+(c%2)
	return repeat(' ',d-c)
endfunction
