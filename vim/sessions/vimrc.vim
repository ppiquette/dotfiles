" ~/dotfiles/.vim/sessions/vimrc.vim:
" Vim session script.
" Created by session.vim 2.7 on 30 octobre 2014 at 15:10:44.
" Open this file in Vim and run :source % to restore your session.

set guioptions=egmrL
silent! set guifont=
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'light'
	set background=light
endif
if !exists('g:colors_name') || g:colors_name != 'macvim' | colorscheme macvim | endif
call setqflist([])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +53 PhotoInPress/PseudoOrders/100611-10646863-CASA-0121-020/bookprint.xml
badd +48 Desktop/polls.json
badd +1 /private/var/folders/g6/g1ycncqx78ldk035yp6fn0kc0000gn/T/623c81a7-4a14-4b36-821a-1766909e61dd/photoinpress/app_messages/messages/2014-06-16-welcome-baby-album.png
badd +18 \[Vundle]\ Installer
badd +249 .vimrc
badd +6 \[Vundle]\ search
badd +27 Library/Caches/Cleanup\ At\ Startup/Transmit/D6C1AD46-A2DD-46C3-BAA6-A15B4AE877D8/bookprint.xml
badd +20 Documents/Titanium_Studio_Workspace/TestPolls/Resources/polls_controller.js
badd +15 Documents/Titanium_Studio_Workspace/TestPolls/Resources/polls.json
argglobal
silent! argdel *
edit .vimrc
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 31 + 117) / 235)
exe 'vert 2resize ' . ((&columns * 203 + 117) / 235)
argglobal
enew
" file NERD_tree_1
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 249 - ((39 * winheight(0) + 36) / 73)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
249
normal! 019|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 31 + 117) / 235)
exe 'vert 2resize ' . ((&columns * 203 + 117) / 235)
tabnext 1
if exists('s:wipebuf')
"   silent exe 'bwipe ' . s:wipebuf
endif
" unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save

" Support for special windows like quick-fix and plug-in windows.
" Everything down here is generated by vim-session (not supported
" by :mksession out of the box).

1wincmd w
tabnext 1
let s:bufnr_save = bufnr("%")
let s:cwd_save = getcwd()
NERDTree ~/
if !getbufvar(s:bufnr_save, '&modified')
  let s:wipebuflines = getbufline(s:bufnr_save, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:bufnr_save
  endif
endif
execute "cd" fnameescape(s:cwd_save)
1resize 73|vert 1resize 31|2resize 73|vert 2resize 203|
2wincmd w
tabnext 1
if exists('s:wipebuf')
  if empty(bufname(s:wipebuf))
if !getbufvar(s:wipebuf, '&modified')
  let s:wipebuflines = getbufline(s:wipebuf, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:wipebuf
  endif
endif
  endif
endif
doautoall SessionLoadPost
unlet SessionLoad
" vim: ft=vim ro nowrap smc=128
