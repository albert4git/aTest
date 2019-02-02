    call neocomplete#custom#source('tags', 'converters',
    \ ['converter_remove_overlap', 'converter_remove_last_paren',
    \  'converter_disable_abbr', 'converter_abbr'])


        let g:syntastic_mode_map = { 'mode': 'active',
                                    \ 'active_filetypes': ['javascript', 'php'],
                                    \ 'passive_filetypes': ['css', 'html', 'xhtml', 'scss', 'sass'] }



Completion can be done for:

1. Whole lines                                          i_CTRL-X_CTRL-L
2. keywords in the current file                         i_CTRL-X_CTRL-N
3. keywords in 'dictionary'                             i_CTRL-X_CTRL-K
4. keywords in 'thesaurus', thesaurus-style             i_CTRL-X_CTRL-T
5. keywords in the current and included files           i_CTRL-X_CTRL-I
6. tags                                                 i_CTRL-X_CTRL-]
7. file names                                           i_CTRL-X_CTRL-F
8. definitions or macros                                i_CTRL-X_CTRL-D
9. Vim command-line                                     i_CTRL-X_CTRL-V
10. User defined completion                             i_CTRL-X_CTRL-U
11. omni completion                                     i_CTRL-X_CTRL-O
12. Spelling suggestions                                i_CTRL-X_s
13. keywords in 'complete'                              i_CTRL-N

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set number
    autocmd WinLeave * set nonumber
augroup END
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=80
    autocmd WinLeave * set colorcolumn=0
augroup END

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

augroup NrHighlight
  autocmd!
  autocmd WinEnter * hi LineNr ctermfg=247 guifg=#9e9e9e ctermbg=233 guibg=#121212
  autocmd WinLeave * hi LineNr ctermfg=274 guifg=#e9e9e9 ctermbg=133 guibg=#212121
augroup END


hi StatusLine                  ctermfg=8     ctermbg=2     cterm=NONE
hi StatusLineNC                ctermfg=2     ctermbg=8     cterm=NONE

"-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-- " enable omni-completion for Ruby and PHP
"-- call neocomplete#util#set_default_dictionary(
"--       \'g:neocomplete#sources#omni#input_patterns', 'ruby',
"--       \'[^. *\t]\.\h\w*\|\h\w*::\w*')
"-- call neocomplete#util#set_default_dictionary(
"--       \'g:neocomplete#sources#omni#input_patterns',
"--       \'php',
"--       \'[^. \t]->\h\w*\|\h\w*::\w*')

"My stuff --------------------------------------------------------------------------
"When programming, there is generally no reason to want 'smartcase'
"to apply when you press *. For other situations, use:
"nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
"nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

Plug 'Rykka/trans.vim'
"--set spelllang=en,de
"--spell-check: $(FILE).tex
"--    hunspell -d en_GB -t $<
"--set spelllang=de_de

TransPo [[en],[de]]
""My stuff --------------------------------------------------------------------------
""-- nmap <leader>f0 :set foldlevel=0<CR>
""-- nmap <leader>f1 :set foldlevel=1<CR>
""-- nmap <leader>f2 :set foldlevel=2<CR>
""-- nmap <leader>f3 :set foldlevel=3<CR>
""-- nmap <leader>f4 :set foldlevel=4<CR>
""-- nmap <leader>f5 :set foldlevel=5<CR>
""-- nmap <leader>f6 :set foldlevel=6<CR>
""-- nmap <leader>f7 :set foldlevel=7<CR>
""-- nmap <leader>f8 :set foldlevel=8<CR>
""-- nmap <leader>f9 :set foldlevel=9<CR>
""-- " http://vimcasts.org/e/14
""-- cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
""-- map <leader>ew :e %%
""-- map <leader>es :sp %%
""-- map <leader>ev :vsp %%
""-- map <leader>et :tabe %%


""My stuff --------------------------------------------------------------------------
""-- let mapleader=","
""-- " omnicompletion : words
""-- inoremap <leader>, <C-x><C-o>
""-- " omnicompletion : filenames
""-- inoremap <leader>: <C-x><C-f>
""-- " omnicompletion : lines
""-- inoremap <leader>= <C-x><C-l>

function! OnlineDoc()
  if &ft =~ "cpp"
    let s:urlTemplate = "http://doc.trolltech.com/4.1/%.html"
  elseif &ft =~ "ruby"
    let s:urlTemplate = "http://www.ruby-doc.org/core/classes/%.html"
  elseif &ft =~ "perl"
    let s:urlTemplate = "http://perldoc.perl.org/functions/%.html"
  elseif &ft =~ "java"
    let s:urlTemplate = "http://www.google.com"
  else
    return
  endif
  let s:browser = "\"D:\\Applications\\Mozilla Firefox\\firefox.exe\""
  let s:wordUnderCursor = expand("<cword>")
  let s:url = substitute(s:urlTemplate, "%", s:wordUnderCursor, "g")
  let s:cmd = "silent !start " . s:browser . " " . s:url
  execute s:cmd
endfunction
" Online doc search.
map <silent> <M-d> :call OnlineDoc()<CR>
let g:lightline = {
      \ 'colorscheme': 'wombat' ,
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename' ] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction
""My stuff --------------------------------------------------------------------------
""-- nmap <leader>f0 :set foldlevel=0<CR>
""-- nmap <leader>f1 :set foldlevel=1<CR>
""-- nmap <leader>f2 :set foldlevel=2<CR>
""-- nmap <leader>f3 :set foldlevel=3<CR>
""-- nmap <leader>f4 :set foldlevel=4<CR>
""-- nmap <leader>f5 :set foldlevel=5<CR>
""-- nmap <leader>f6 :set foldlevel=6<CR>
""-- nmap <leader>f7 :set foldlevel=7<CR>
""-- nmap <leader>f8 :set foldlevel=8<CR>
""-- nmap <leader>f9 :set foldlevel=9<CR>
""-- " http://vimcasts.org/e/14
""-- cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
""-- map <leader>ew :e %%
""-- map <leader>es :sp %%
""-- map <leader>ev :vsp %%
""-- map <leader>et :tabe %%




set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"call vundle#begin('~/some/path/here')
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" Plugin 'ascenator/L9', {'name': 'newL9'}
"My stuff ---------------------------
"My stuff ---------------------------
Plugin 'scratch'
Plugin 'quickrun.vim'
Plugin 'fontzoom.vim'
""My stuff --------------------------------------------------------------------------
""My stuff --------------------------------------------------------------------------
"highlight Comment ctermbg=DarkGray
"highlight Constant ctermbg=Blue
"highlight Normal ctermbg=Black
"highlight NonText ctermbg=Black
"highlight Special ctermbg=Magenta
"highlight Cursor ctermbg=Green
"highlight Comment ctermbg=Blue ctermfg=White
"highlight Comment cterm=bold ctermbg=gray ctermfg=White
highlight Comment ctermbg=gray ctermfg=Red
""My stuff --------------------------------------------------------------------------
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
""My stuff --------------------------------------------------------------------------
	Vim*scrollBackground:		Black
	Vim*scrollForeground:		Blue

The resources can also be set with arguments to Vim:

    argument		meaning	~
							*-gui*
   -display {display}	Run vim on {display}		*-display*
   -iconic		Start vim iconified		*-iconic*
   -background {color}	Use {color} for the background	*-background*
   -bg {color}		idem				*-bg*
   -foreground {color}	Use {color} for normal text	*-foreground*
   -fg {color}		idem				*-fg*
   -ul {color}		idem				*-ul*
   -font {font}		Use {font} for normal text	*-font*
   -fn {font}		idem				*-fn*
   -boldfont {font}	Use {font} for bold text	*-boldfont*
   -italicfont {font}	Use {font} for italic text	*-italicfont*
   -menufont {font}	Use {font} for menu items	*-menufont*
   -menufontset {fontset} Use {fontset} for menu items	*-menufontset*
   -mf {font}		idem				*-mf*
   -geometry {geom}	Use {geom} for initial geometry	*-geometry*
   -geom {geom}		idem, see |-geometry-example|	*-geom*
   -borderwidth {width}	Use a border width of {width}	*-borderwidth*
   -bw {width}		idem				*-bw*
							*-scrollbarwidth*
   -scrollbarwidth {width}	Use a scrollbar width of {width}
   -sw {width}		idem				*-sw*
   -menuheight {height}	Use a menu bar height of {height} *-menuheight*
   -mh {height}		idem				*-mh*
			NOTE: On Motif the value is ignored, the menu height
			is computed to fit the menus.
   -reverse		Use reverse video		*-reverse*
   -rv			idem				*-rv*
   +reverse		Don't use reverse video		*-+reverse*
   +rv			idem				*-+rv*
   -xrm {resource}	Set the specified resource	*-xrm*

Note about reverse video: Vim checks that the result is actually a light text
on a dark background.  The reason is that some X11 versions swap the colors,
and some don't.  These two examples will both give yellow text on a blue
background:
    gvim -fg Yellow -bg Blue -reverse
    gvim -bg Yellow -fg Blue -reverse
