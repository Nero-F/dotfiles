let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
tabnew
tabrewind
edit ~/Work/CibleR/baracash/src/main/java/com/baracash/service/PSPService.java
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 95 + 95) / 191)
exe 'vert 2resize ' . ((&columns * 95 + 95) / 191)
argglobal
balt ~/Work/CibleR/baracash/src/main/java/com/baracash/service/FtpStorageProvider.java
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 80 - ((3 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 80
normal! 019|
wincmd w
argglobal
if bufexists("~/Work/CibleR/baracash/src/main/java/com/baracash/service/FtpStorageProvider.java") | buffer ~/Work/CibleR/baracash/src/main/java/com/baracash/service/FtpStorageProvider.java | else | edit ~/Work/CibleR/baracash/src/main/java/com/baracash/service/FtpStorageProvider.java | endif
if &buftype ==# 'terminal'
  silent file ~/Work/CibleR/baracash/src/main/java/com/baracash/service/FtpStorageProvider.java
endif
balt ~/.config/nvim/init.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 174 - ((9 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 174
normal! 05|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 95 + 95) / 191)
exe 'vert 2resize ' . ((&columns * 95 + 95) / 191)
tabnext
edit ~/Work/CibleR/bvnv2/bitbucket-pipelines.yml
argglobal
balt ~/Work/CibleR/baracash/bitbucket-pipelines.yml
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let &fdl = &fdl
let s:l = 57 - ((23 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 57
normal! 063|
tabnext 1
badd +104 ~/Work/CibleR/baracash/src/main/java/com/baracash/service/PSPService.java
badd +172 ~/Work/CibleR/baracash/src/main/java/com/baracash/service/FtpStorageProvider.java
badd +9 ~/Work/CibleR/baracash/bitbucket-pipelines.yml
badd +0 ~/Work/CibleR/bvnv2/bitbucket-pipelines.yml
badd +1 after/ftplugin/java.vim
badd +0 ./after/ftplugin/javascript.vim
badd +11 ~/.config/nvim/init.vim
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
