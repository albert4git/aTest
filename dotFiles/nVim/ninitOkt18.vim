""""""""""""""""""""""""""" nVIM Neo VIM """"""""""""""""""""""""""""""""""""""""""""""""""
        "set runtimepath+=~/.vim/plugged/vimproc/
        set path+=.,/usr/include,/usr/local/include
        set thesaurus=~/git/aTest/dotFiles/DICT/mthesaur.txt
        let s:thesaurus_pat = "~/git/aTest/dotFiles/DICT/mthesaur.txt"
        set dictionary=/home/red/git/aTest/dotFiles/DICT/english-words.txt
        set tags=""
        set tags=~/git/aTest/dotFiles/nVim/tags
        set nocompatible
        "set encoding=utf-8
        "set fileencodings=utf-8,sjis
        "set spell
        set nospell
        set shell=/bin/bash
"-------------------------------------------------------------------------------------------
        filetype on
        filetype plugin on
        filetype indent on
        syntax enable
"-map--------------------------------------------------------------------------------------
        let maplocalleader= ','
        let mapleader=' '
        set vb t_vb=         " disable beep sound
"-magic------------------------------------------------------------------------------------
        silent! set wrapscan ignorecase smartcase incsearch hlsearch magic
"-AAA01------------------------------------------------------------------------------------
        source ~/git/aTest/dotFiles/nVim/nPlug.vim
        "colorscheme anderson
        colorscheme molokai
        syntax on
        colorscheme desert
        colorscheme ron
        syntax enable
        colorscheme darkblue
        colorscheme anderson
        colorscheme delek
        colorscheme molokayo
"OOO------------------------------------------------------------------------------
        set nu
        set cf  " Enable error files & error jumping.
        set clipboard+=unnamed  
        set history=2024  
        set autowrite  " Writes on make/shell commands
        set ruler
        set tabstop=4
        set softtabstop=4
        set shiftwidth=4
        set textwidth=80
        set smarttab
        set expandtab
        set smartindent
        set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
        set guifont=Monospace\ 14
        set cinwords=if,else,while,do,for,switch,case
"OOO--------------------------------------------------------------------------------

"-AAA0-Misc---------------------------------------------------------------------------------------------------------{{{
        imap jj <Esc>
        noremap ss :wa<cr>
        noremap sq :wa<cr> :qa<cr>
        noremap qq :w<cr> :bd<cr>
        noremap xz :qa!<cr>
        noremap xc :q<cr>
        "-toggle---------------
        nmap ge :w<CR>:e #<CR>
        noremap ee :e#<CR>
        "-Auto-Commands----------------------
        augroup vimrc
                autocmd!
        augroup END
        "-It's-2018------------
        noremap j gj
        noremap k gk
        noremap gj j
        noremap gk k
        " Bash like keys for the command line
        cnoremap <C-A> <Home>
        cnoremap <C-E> <End>
        cnoremap <C-d> <Del>
        "------------------------
        nnoremap <C-P> <Up>
        nnoremap <C-N> <Down>
        "Better x
        "nnoremap x "_x
        "Disable Ex-mode.
        nnoremap Q  q
        "Underline the current line with '-'
        nmap <silent> <leader>- :t.<CR>Vr-
        "Select entire buffer
        nnoremap aa ggVG
        "Same when jumping around
        nnoremap <c-o> <c-o>zz
        nnoremap <c-i> <c-i>zz
        "Search
        let g:bling_time = 42
        let g:bling_color_fg = 'green'
        let g:bling_color_cterm = 'reverse'
        "Useful save mappings.
        nnoremap <silent> <Leader>u :<C-u>update<CR>
        " Yank to end of line
        nnoremap Y y$
        " Formatting, TextMate-style
        vnoremap W gq
        nnoremap W gqip
        "-HHJ- Keep the cursor in place while joining lines
        nnoremap H mzJ`z
        "Split?? The normal use of S is covered by cc, so don't worry about shadowing it.
        nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w
"-}}}


"-AAA1--Appearance--Edit--Clipboard--Bell--ExpandTab-Hist--SmartEnter-----------------------------------------------{{{
        if &compatible | set nocompatible | endif
        " magic
                silent! set wrapscan ignorecase smartcase incsearch hlsearch magic
                set nospell
        " Appearance  # matchtime=1
                silent! display=lastline,uhex nowrap wrapmargin=0 guioptions=ce key=
                silent! set noshowmatch  noshowmode shortmess+=I cmdheight=1 cmdwinheight=10 showbreak=
                silent! set noshowcmd noruler rulerformat= laststatus=2 statusline=%t\ %=\ %m%r%y%w\ %3l:%-2c
                silent! set title titlelen=100 titleold= titlestring=%f noicon norightleft showtabline=1
                silent! set cursorline nocursorcolumn colorcolumn= concealcursor=nvc conceallevel=0 norelativenumber
                silent! set list listchars=tab:>\ ,nbsp:_ synmaxcol=3000 ambiwidth=double breakindent breakindentopt=
                silent! set nosplitbelow nosplitleft startofline linespace=0 whichwrap=b,s scrolloff=1 sidescroll=0
                silent! set equalalways nowinfixwidth nowinfixheight winminwidth=3 winminheight=3 nowarn noconfirm
                silent! set fillchars=vert:\|,fold:\  eventignore= helplang=en viewoptions=options,cursor virtualedit=
                set splitbelow splitright
                set number
                "-AAA1.1-Extra vi-compatibility---------------------------------------------------{{{
                        set switchbuf=useopen    " reveal already opened files from the
                        set formatoptions-=o     " don't start new lines w/ com leader on press 'o'
                        au filetype vim set formatoptions-=o
                "1.1}}}
        " Editing
                silent! set iminsert=0 imsearch=0 nopaste pastetoggle= nogdefault comments& commentstring=#\ %s
                silent! set smartindent autoindent shiftround shiftwidth=8 expandtab tabstop=4 smarttab softtabstop=8
                silent! set foldclose=all foldcolumn=0 nofoldenable foldlevel=0 foldmarker& foldmethod=indent
                silent! set textwidth=0 backspace=indent,eol,start nrformats=hex formatoptions=cmMj nojoinspaces
                silent! set nohidden autoread noautowrite noautowriteall nolinebreak mouse= modeline& modelines&
                silent! set noautochdir write nowriteany writedelay=0 verbose=0 verbosefile= notildeop noinsertmode
                "silent! set tags+=tags,./tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags
                silent! set tags=tags,./tags 
                "set tw = 300
                "easier on the eyes
                "-???- set formatoptions = tcqw
                highlight Folded ctermbg=1
                setlocal foldmarker={{{,}}}
                setlocal foldmethod=marker
                setlocal foldminlines=6
                set foldcolumn=1 
                " Mappings to easily toggle fold levels
                nnoremap z1 :set foldlevel=1<cr>
                nnoremap z2 :set foldlevel=2<cr>
                nnoremap z3 :set foldlevel=3<cr>
                nnoremap z4 :set foldlevel=4<cr>
                nnoremap z5 :set foldlevel=5<cr>
                "set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
        " Clipboard
                silent! set clipboard=unnamed
                silent! set clipboard+=unnamedplus
        " Performance
                silent! set updatetime=300 timeout timeoutlen=500 ttimeout ttimeoutlen=50 ttyfast lazyredraw
        " Bell-Bell-Bell
                silent! set noerrorbells visualbell t_vb=
        " Move to the directory each buffer
                autocmd vimrc BufEnter * silent! lcd %:p:h
        " Fix window position of help
                autocmd vimrc FileType help if &l:buftype ==# 'help' | wincmd K | endif
        " Always open read-only when a swap file is found
                autocmd vimrc SwapExists * let v:swapchoice = 'o'
        " Automatically set expandtab
        " autocmd vimrc FileType * execute 'setlocal ' . (search('^\t.*\n\t.*\n\t', 'n') ? 'no' : '') . 'expandtab'

        " Setting lazyredraw causes a problem on startup
                autocmd vimrc VimEnter * redraw
        " Enter, I never use the default behavior of <cr> and this saves me a keystroke...
                nnoremap <cr> o<esc>
        " Smart Enter -???-
                inoremap <silent><expr> <CR> (pumvisible() && bufname('%') !=# '[Command Line]' ? "\<C-e>\<CR>" : "\<C-g>u\<CR>")
        " Go to the first non-blank character of the line after paragraph motions
                noremap } }^
        " select last paste
                nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'
        " Command line history
                set history=4024
        " Visual shifting (does not exit Visual mode)
                vnoremap < <gv
                vnoremap > >gv
        " Allow using the repeat operator with a visual selection (!)
        " http://stackoverflow.com/a/8064607/127816
                vnoremap . :normal .<CR>
        " For when you forget to sudo.. Really Write the file.
                cmap w!! w !sudo tee % >/dev/null
        " SWITCH TO THE DIRECTORY OF THE OPEN BUFFER
                map cd :cd %:p:h<cr>
                set nowrap
                set mouse=a
"-AAA1-}}}

"-AAA--SyntaxColor--------------------------------------------------------------------------------------------------{{{
         set list
         set listchars=tab:▸\
        "set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
        "set listchars=tab:▸\ ,eol:¬,trail:⋅

        nnoremap ( <c-x>:y x\|@x<cr>
        nnoremap ) <c-a>:y x\|@x<cr>

        " Show syntax highlighting groups for word under cursor
        nmap <F4> :call <SID>SynStack()<CR>
        function! <SID>SynStack()
                if !exists("*synstack")
                        return
                endif
                echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
        endfunc
        "----------------------------------------------------------------------------------
        function! ShowFuncKeys(bang)
                for i in range(1,12)
                        redir! => map
                        exe "silent " . (a:bang == "!" ? 'verbose' : '') . " map<F" . i . ">"
                        redir end
                        if map !~ 'No mapping found'
                                echomsg map
                        endif
                endfor
        endfunction
        com! -bang ShowFuncKeys :call ShowFuncKeys(<q-bang>)
        "----------------------------------------------------------------------------------
        function! s:ShowMaps()
                let old_reg = getreg("a")          " save the current content of register a
                let old_reg_type = getregtype("a") " save the type of the register as well
                try
                        redir @a                           " redirect output to register a
                        " Get the list of all key mappings silently, satisfy"
                        " Press ENTER to continue"
                        silent map | call feedkeys("\<CR>")
                        redir END                          " end output redirection
                        vnew                               " new buffer in vertical window
                        put a                              " put content of register
                        " Sort on 4th character column which is the key(s)
                        %!sort -k1.4,1.4
                finally                              " Execute even if exception is raised
                        call setreg("a", old_reg, old_reg_type) " restore register a
                endtry
        endfunction
        com! ShowMaps call s:ShowMaps()      " Enable :ShowMaps to call the function
        nnoremap \m :ShowMaps<CR>            " Map keys to call the function
"-SynChek-}}}

"-AAA--Wildmenu-completion------------------------------------------------------------------------------------------{{{
        " Save when losing focus
        au FocusLost * :silent! wall
        set wildmenu
        set wildmode=list:longest
        set wildignore+=.hg,.git,.svn                    " Version control
        set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
        set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
        set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
        set wildignore+=*.spl                            " compiled spelling word lists
        set wildignore+=*.sw?                            " Vim swap files
        set wildignore+=*.DS_Store                       " OSX bullshit
        set wildignore+=*.luac                           " Lua byte code
        set wildignore+=migrations                       " Django migrations
        set wildignore+=*.pyc                            " Python byte code
        set wildignore+=*.orig                           " Merge resolution files
        set wildignore+=*.fasl                           " Lisp FASLs
        set wildignore+=*.dx64fsl                        " CCL
        " Clojure/Leiningen
        set wildignore+=classes
        set wildignore+=lib
"-Wild-}}}

"-AAA--CScope-------------------------------------------------------------------------------------------------------{{{
        nnoremap ff :call CscopeFindInteractive(expand('<cword>'))<CR>
        nnoremap <leader>f :call CscopeFindInteractive(expand('<cword>'))<CR>
        nnoremap <leader>\ :call ToggleLocationList()<CR>
        " s: Find this C symbol
        nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
        " g: Find this definition
        nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
        " d: Find functions called by this function
        nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
        " c: Find functions calling this function
        nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
        " t: Find this text string
        nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
        " e: Find this egrep pattern
        nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
        " f: Find this file
        nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
        " i: Find files #including this file
        nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
"-CScope-}}}

"-AAA--Deoplete-----------------------------------------------------------------------------------------------------{{{
        call deoplete#custom#option('sources', {
                                \ 'tex' : ['buffer', 'dictionary', 'file', 'omni']
                                \})
        call deoplete#custom#source('omni', 'input_patterns', {
                                \ 'tex' : '\\(?:'
                                \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
                                \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
                                \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
                                \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
                                \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
                                \ . '|\w*'
                                \ .')',
                                \}
                                \)
        " autoindent
        " omnipotent
        " omnifunc ???
        set omnifunc=syntaxcomplete#Complete
        "----------------------------------------------------------------------------------
        call deoplete#custom#option('refresh_always', v:true)
        let g:deoplete#enable_ignore_case = 1
        let g:deoplete#enable_smart_case = 1
        let g:deoplete#enable_camel_case = 1
        let g:deoplete#enable_refresh_always = 1
        let g:deoplete#max_abbr_width = 0
        let g:deoplete#max_menu_width = 0
        call deoplete#custom#source('_', 'min_pattern_length', 4)
        "inoremap <silent> <C-]> <C-x><C-]>
        "inoremap <silent> <C-u> <C-x><C-u>
        inoremap <silent> <C-o> <C-x><C-o>
        inoremap <silent> <C-k> <C-x><C-k>
        inoremap <silent> <C-d> <C-x><C-d>
        inoremap <silent> <C-f> <C-x><C-f>
        inoremap <silent> <C-l> <C-x><C-l>

        call deoplete#custom#source('dictionary', 'mark', '⊶')
        call deoplete#custom#source('syntax',        'mark', '♯')
        call deoplete#custom#source('tag',           'mark', '⌦')
        call deoplete#custom#source('omni',          'mark', '⌾')
        call deoplete#custom#source('vim',           'mark', 'vi')
        call deoplete#custom#source('neosnippet',    'mark', '⌘')
        call deoplete#custom#source('jedi',          'mark', '⌁')
        call deoplete#custom#source('around',        'mark', '↻')
        call deoplete#custom#source('buffer',        'mark', 'ℬ')
        call deoplete#custom#source('member', 'mark', '.')
"-Deoplete-}}}

"-AAA-:Ag-----------------------------------------------------------------------------------------------------------{{{
        " command! -nargs=1 -bang Locate call fzf#run(fzf#wrap(
        "                        \ {'source': 'locate <q-args>', 'options': '-m'}, <bang>0))
        "-------------------------------------------------------------------------
        "!" command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
        "-------------------------------------------------------------------------
        if executable('ag')
                let g:ag_working_path_mode="r"
                " Use ag over grep
                set grepprg=ag\ --nogroup\ --nocolor
                " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
                let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
                " ag is fast enough that CtrlP doesn't need to cache
                let g:ctrlp_use_caching = 0
        endif
"-}}}

"-AAA5--GitGutter-----------------------------------------------------------------------{{{
        "let g:gitgutter_highlight_lines = 1
        let g:gitgutter_signs = 1
        let g:gitgutter_max_signs = 2000
        "-???-XXX
        nmap ]c <Plug>GitGutterNextHunk
        nmap [c <Plug>GitGutterPrevHunk
        nmap <Leader>hs <Plug>GitGutterStageHunk
        nmap <Leader>hu <Plug>GitGutterUndoHunk
        "-???-XXX
        highlight GitGutterAdd ctermfg=green
        highlight GitGutterChange ctermfg=yellow
        highlight GitGutterDelete ctermfg=red
        highlight GitGutterChangeDelete ctermfg=yellow
        "--------------------------------------------------------------
        if exists("*gitgutter#highlight#define_highlights")
                " let vim-gitgutter know we changed the SignColumn colors!
                call gitgutter#highlight#define_highlights()
        endif
"-5-}}}

"-AAA4--EnterO--ReSel-LastPast--FormatBlock--UnFuck--Join--Typos--Maps--Abbr------------{{{
"??? Sel (charwise) cont of the cur line, Great for pasting Python lines into REPLs
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>
"DDD Unfuck my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

iabbrev yyy "---------------------------------------------------------------------------------
iabbrev yyy1 "---------------------------------------------------------------------------------------------
iabbrev yyy2 "-----------------------------------------------------------------------------------------------------{{{
iabbrev yyy3 "-}}}
iabbrev yyyr "....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8....+....9....+...10....+...11....+..12<esc>

iabbrev str start
iabbrev supe superuser
iabbrev que question
iabbrev #i #include
iabbrev #d #define
iabbrev cmnt /*<CR><CR>*/<Up>
iabbrev @@  alf@nomail.com
iabbrev ccopy Copyright 2013 Alf , no rights reserved.
iabbrev xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iabbrev ydate <c-r>=strftime("%Y %b %d")<cr>
iabbrev todo TODO
"-4-}}}

"-TOP-------------------------------------------------------------------------------------------------------------------
"-TOP-------------------------------------------------------------------------------------------------------------------
        set tabpagemax=15               " Only show 15 tabs
        set ruler                       " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set cursorline
        set cursorcolumn
        let w:persistent_cursorline = 1
        "hi Search                      ctermbg=10
        hi Pmenue                      ctermbg=16
        hi Pmenue                      ctermfg=16
        hi CursorLine                  ctermbg=16
        hi CursorColumn                ctermbg=16
        hi ColorColumn                 ctermbg=52
        hi ColorColumn                 ctermbg=32
        set colorcolumn=1,8,92,100,112,120
        hi LineNr ctermfg=1 ctermbg=153 
        hi Normal  ctermbg=235
        let g:indentLine_color_term = 133
        set nuw =5
        "highlight Cursor ctermbg=1 term= bold
        ""-------------------------------------------------------
        hi StatusLine       ctermfg=7    ctermbg=9     cterm=bold
        hi StatusLineNC     ctermfg=9     ctermbg=4     term=bold
        ""-------------------------------------------------------
        set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*
"-TOP-------------------------------------------------------------------------------------------------------------------
        "brackets show match
        set nosm
        set nowrap
        set wmh=0
        "-------------------------------------------------------------------------------
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-H> <C-W>h<C-W>|
        map <C-L> <C-W>l<C-W>|
        map <C-=> <C-W>=
        "-------------------------------------------------------------------------------
        nnoremap <S-j> :bn<cr>
        nnoremap <S-k> :bp<cr>
        nnoremap <m-j> :bn<cr>
        nnoremap <m-k> :bp<cr>
        "-------------------------------------------------------------------------------
        highlight Visual cterm=bold ctermbg=0 ctermfg=NONE

"-AAA01--------------------------------------------------------------------------------------
        "suppress intro message because the above makes it look bad
        set shortmess+=I
        highlight ErrorMsg  guifg=red guibg=white
        "easier on the eyes
        highlight Folded ctermbg=10
        "fold column aka gutter on the left
        highlight FoldColumn ctermbg=9 ctermfg=0 guibg=#ffffd7
        "avoid invisible color combination (red on red)
        highlight DiffText ctermbg=1

"-AAA01--------------------------------------------------------------------------------------

"-AAA01--------------------------------------------------------------------------------------

"-AAA01--------------------------------------------------------------------------------------


















"-----XXX-------ToDO--------------------FFF-------------------------------------------------
"= 1. Whole lines                                          i_CTRL-X_CTRL-L
"= 2. keywords in the current file                         i_CTRL-X_CTRL-N
"= 3. keywords in 'dictionary'                             i_CTRL-X_CTRL-K
"= 4. keywords in 'thesaurus', thesaurus-style             i_CTRL-X_CTRL-T
"= 5. keywords in the current and included files           i_CTRL-X_CTRL-I
"= 6. tags                                                 i_CTRL-X_CTRL-]
"= 7. file names                                           i_CTRL-X_CTRL-F
"= 8. definitions or macros                                i_CTRL-X_CTRL-D
"= 9. Vim command-line                                     i_CTRL-X_CTRL-V
"= 10. User defined completion                             i_CTRL-X_CTRL-U
"= 11. omni completion                                     i_CTRL-X_CTRL-O
"= 12. Spelling suggestions                                i_CTRL-X_s
"= 13. keywords in 'complete'                              i_CTRL-N
