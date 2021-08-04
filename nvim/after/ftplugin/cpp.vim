let g:os = substitute(system('uname'), '\n', '', '')

function! TermWrapper(command) abort
	if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
	if g:split_term_style ==# 'vertical'
		let buffercmd = 'vert'
	elseif g:split_term_style ==# 'horizontal'
		let buffercmd = 'bo'
	else
		echoerr 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'' but is currently set to ''' . g:split_term_style . ''')'
		throw 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'')'
	endif
	if exists('g:split_term_resize_cmd')
		exec g:split_term_resize_cmd
	endif  
    exec buffercmd  
	exec ' ter ' . a:command
    exec 'startinsert'
endfunction

command! -nargs=0 CompileAndRun call TermWrapper(printf("g++ -std=c++11 %s && ./a.out", expand('%')))
command! -nargs=1 CompileAndRunWithFile call TermWrapper(printf('g++ -std=c++11 %s && ./a.out < %s', expand('%'), <args>))

autocmd FileType cpp nnoremap <leader>fw :CompileAndRun<CR>
augroup CppToolkit
	autocmd!
	autocmd FileType cpp nnoremap <leader>fb :!g++ -std=c++11 % && ./a.out<CR>
	autocmd FileType cpp nnoremap <leader>fr :!./a.out<CR>
	autocmd FileType cpp nnoremap <leader>fw :CompileAndRun<CR>
augroup END

augroup CppToolkit
	autocmd!
	autocmd FileType cpp nnoremap <leader>fb :!g++ -std=c++11 -o %:r % && ./%:r<CR>
	autocmd FileType cpp nnoremap <leader>fr :!./%:r.out<CR>
augroup END
