""""""""""""""""""""""""""""""""Neo-VIM"""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "set runtimepath+=~/.vim/plugged/vimproc/
        set path+=.,/usr/include,/usr/local/include
        set thesaurus=~/git/aTest/dotFiles/DICT/mthesaur.txt
        let s:thesaurus_pat = "~/git/aTest/dotFiles/DICT/mthesaur.txt"
        set dictionary=/home/red/git/aTest/dotFiles/DICT/english-words.txt
"-------------------------------------------------------------------------------------------
        " set tags=""
        " set tags=~/git/aTest/dotFiles/nVim/tags
        " set tags=tags,./tags,../tags,../../tags,../../../tags
        " set tags+=tags,./tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags
        " set tags=./tags,~/.vimtags
        set tags=""
        set tags=tags,./tags 
"-------------------------------------------------------------------------------------------
        let g:easytags_auto_highlight = 1
        let g:easytags_syntax_keyword = 'always'
        let g:easytags_events = ['BufWritePost']
        " let g:easytags_on_cursorhold = 1
        " let g:easytags_auto_update = 1
        " If you like one of the existing styles you can link them:
        " highlight link cMember Special
        " As mentioned above the plug-in will store your tags in `~/.vimtags` 
        " let g:easytags_file = '~/.vim/tags'
"-------------------------------------------------------------------------------------------
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
"-map---------------------------------------------------------------------------------------
        let maplocalleader= ','
        let mapleader=' '
        set vb t_vb=         " disable beep sound
        silent! set wrapscan ignorecase smartcase incsearch hlsearch magic
"-nPlug------------------------------------------------------------------------------------
        source ~/git/aTest/dotFiles/nVim/nPlug.vim
"-AAA01------------------------------------------------------------------------------------
        set backup                        " enable backups
        set noswapfile                    " it's 2013, Vim.
        set undodir=~/.config/nvim/undoDir/    " undo files
        set backupdir=~/.config/nvim/backUpDir/ " backups
        set directory=~/.config/nvim/swapDir/   " swap files

        " Make those folders automatically if they don't already exist.
        if !isdirectory(expand(&undodir))
            call mkdir(expand(&undodir), "p")
        endif
        if !isdirectory(expand(&backupdir))
            call mkdir(expand(&backupdir), "p")
        endif
        if !isdirectory(expand(&directory))
            call mkdir(expand(&directory), "p")
        endif

        set undofile
        set undoreload=10000
        set matchtime=3
        set showbreak=↪
        set linebreak
        set colorcolumn=+1
"-AAA01------------------------------------------------------------------------------------
        " colorscheme anderson
        " colorscheme desert
        " colorscheme ron
        " colorscheme darkblue
        " colorscheme anderson
        " colorscheme delek
        " colorscheme molokai
        " colorscheme molokayo
        syntax on
        syntax enable
        colorscheme mopkai
"-AAA01------------------------------------------------------------------------------------
        set nu
        set cf         " Enable error files & error jumping.
        set autowrite  " Writes on make/shell commands
        set guifont=Monospace\ 14
        set cinwords=if,else,while,do,for,switch,case
"-AAA01------------------------------------------------------------------------------------

"-AAA0-Misc---------------------------------------------------------------------------------------------------------{{{
        imap jj <Esc>
        noremap ss :wa<cr>
        noremap qq :wa<cr> :bd<cr>
        noremap sq :wa<cr> :qa<cr>
        noremap qa :qa!<cr>
        "noremap xc :q<cr>
        "-toggle-----------------------------
        nmap ge :w<CR>:e #<CR>
        noremap ee :e#<CR>
        "-Auto-Commands----------------------
        augroup vimrc
                autocmd!
        augroup END
        "-It's-2018--------------------------
        noremap j gj
        noremap k gk
        noremap gj j
        noremap gk k
        " Bash like keys for the command line
        cnoremap <C-A> <Home>
        cnoremap <C-E> <End>
        cnoremap <C-d> <Del>
        "------------------------------------
        nnoremap <C-P> <Up>
        nnoremap <C-N> <Down>
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
        "#- go to last edit position when opening files -#
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
        "nnoremap vv ^vg_
        nnoremap <silent> vv <C-w>v
        "-Line Transporter-------------
        nnoremap <C-down> :m .+1<CR>==
        nnoremap <C-up> :m .-2<CR>==
"-Misc-}}}

"-AAA1--Appearance--Edit--Clipboard--Bell--ExpandTab-Hist--SmartEnter-----------------------------------------------{{{
        if &compatible | set nocompatible | endif
        " magic
                silent! set wrapscan ignorecase smartcase incsearch hlsearch magic
        " Appearance  # matchtime=1
                silent! display=lastline,uhex nowrap wrapmargin=0 guioptions=ce key=
                silent! set noshowmatch  noshowmode shortmess+=I cmdheight=1 cmdwinheight=10 
                silent! set noshowcmd noruler rulerformat= laststatus=2 statusline=%t\ %=\ %m%r%y%w\ %3l:%-2c
                silent! set title titlelen=100 titleold= titlestring=%f noicon norightleft showtabline=1
                silent! set cursorline nocursorcolumn colorcolumn= concealcursor=nvc conceallevel=0 norelativenumber
                silent! set list listchars=tab:>\ ,nbsp:_ synmaxcol=3000 ambiwidth=double breakindent breakindentopt=
                silent! set nosplitbelow nosplitleft startofline linespace=0 whichwrap=b,s scrolloff=1 sidescroll=0
                silent! set equalalways nowinfixwidth nowinfixheight winminwidth=3 winminheight=3 nowarn noconfirm
                silent! set fillchars=vert:\|,fold:\  eventignore= helplang=en viewoptions=options,cursor virtualedit=
                set splitbelow splitright

                "-AAA1.1-Extra vi-compatibility-------------------------------------------------------------{{{
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

                "set tw = 300
                "easier on the eyes
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
                silent! set updatetime=300 timeout timeoutlen=300 ttimeout ttimeoutlen=50 ttyfast lazyredraw
        " Bell-Bell-Bell
                silent! set noerrorbells visualbell t_vb=
        " Move to the directory each buffer
                autocmd vimrc BufEnter * silent! lcd %:p:h
        " Fix window position of help
                autocmd vimrc FileType help if &l:buftype ==# 'help' | wincmd K | endif
        " Always open read-only when a swap file is found
                autocmd vimrc SwapExists * let v:swapchoice = 'o'
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
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>
"Unfuck my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

iabbrev yyy "---------------------------------------------------------------------------------
iabbrev yyy1 "---------------------------------------------------------------------------------------------
iabbrev yyy2 "-----------------------------------------------------------------------------------------------------{{{
iabbrev yyy3 "-}}}
iabbrev yyyr "....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8....+....9....+...10....+...11....+..12<esc>

iabbrev str start
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

"-AAA3--CleanExtrSps--WindResiz--Jump-------------------------------------------------------------------------------{{{
        set hidden
        set cinoptions=N-s,g0,+2s,l-s,i2s
        "----------------------------------------------------------------------------------
        nnoremap <m-right> :vertical resize +3<cr>
        nnoremap <m-left> :vertical resize -3<cr>
        nnoremap <m-up> :resize +3<cr>
        nnoremap <m-down> :resize -3<cr>
        "----------------------------------------------------------------------------------
                function! JumpTo(jumpcommand)
                        execute a:jumpcommand
                        call FocusLine()
                        Pulse
                endfunction

                function! JumpToInSplit(jumpcommand)
                        execute "normal! \<c-w>v"
                        execute a:jumpcommand
                        Pulse
                endfunction

                function! JumpToTag()
                        call JumpTo("normal! \<c-]>")
                endfunction

                function! JumpToTagInSplit()
                        call JumpToInSplit("normal! \<c-]>")
                endfunction

                nnoremap <C-]> :silent! call JumpToTag()<cr>
                nnoremap <C-s> :silent! call JumpToTagInSplit()<cr>

                function PreviewTag3(top)
                        set previewheight=25
                        exe "silent! pclose"
                        if &previewwindow " don't do this in the preview window
                                return
                        endif
                        let w = expand("<cword>") " get the word under cursor
                        exe "ptjump " . w
                        " if any non False arg, open in simple horiz window so simply return
                        if a:top
                                return
                        endif
                        " otherwise, make it vertical
                        exe "silent! wincmd P"
                        if &previewwindow " if we really get there...
                                if has("folding")
                                        silent! .foldopen " don't want a closed fold
                                endif
                                wincmd L " move preview window to the left
                                wincmd p " back to caller
                                if !&previewwindow " got back
                                        wincmd _ endif
                        endif
                endfunction
        "inoremap <C-]> <Esc>:call PreviewTa2(0)<CR>
        "nnoremap <C-]> :call PreviewTag3(0)<CR>
"-3-}}}

"-AAA--Bookmarks----------------------------------------------------------------------------------------------------{{{
        "let g:bookmark_save_per_working_dir = 1`     
        "let g:bookmark_manage_per_buffer = 1`        
        "let g:bookmark_auto_save_file = '/bookmarks'`
        " |------------------------------------------|-------------|------------------------------|
        " | Action                                   | Shortcut    | Command                      |
        " |------------------------------------------|-------------|------------------------------|
        " | Add/remove bookmark at current line      | `mm`        | `:BookmarkToggle`            |
        " | Add/edit/remove annotation at current li | `mi`        | `:BookmarkAnnotate <TEXT>`   |
        " | Jump to next bookmark in buffer          | `mn`        | `:BookmarkNext`              |
        " | Jump to previous bookmark in buffer      | `mp`        | `:BookmarkPrev`              |
        " | Show all bookmarks (toggle)              | `ma`        | `:BookmarkShowAll`           |
        " | Clear bookmarks in current buffer only   | `mc`        | `:BookmarkClear`             |
        " | Clear bookmarks in all buffers           | `mx`        | `:BookmarkClearAll`          |
        " | Move up bookmark at current line         | `[count]mkk`| `:BookmarkMoveUp [<COUNT>]`  |
        " | Move down bookmark at current line       | `[count]mjj`| `:BookmarkMoveDown [<COUNT>]`|
        " | Move bookmark at current line to another | `[count]mg` | `:BookmarkMoveToLine <LINE>` |
        " | Save all bookmarks to a file             |             | `:BookmarkSave <FILE_PATH>`  |
        " | Load bookmarks from a file               |             | `:BookmarkLoad <FILE_PATH>`  |
        " |------------------------------------------|-------------|------------------------------|
        let g:bookmark_auto_close = 1
        let g:bookmark_highlight_lines = 1          
        let g:bookmark_show_warning = 0           
        let g:bookmark_show_toggle_warning = 0      
        let g:bookmark_sign = '♥'
        let g:bookmark_highlight_lines = 1
        let g:bookmark_save_per_working_dir = 1
        let g:bookmark_auto_save = 1
        "------------------------------------------------------------------------ 
        nmap <Leader>m <Plug>BookmarkShowAll
        "------------------------------------------------------------------------ 
        "-   call unite#custom#profile('source/vim_bookmarks', 'context', {
        "-                           \   'winheight': 13,
        "-                           \   'direction': 'botright',
        "-                           \   'start_insert': 0,
        "-                           \   'keep_focus': 1,
        "-                           \   'no_quit': 1,
        "-                           \ })
        "------------------------------------------------------------------------ 
        let g:bookmark_no_default_key_mappings = 1
        function! BookmarkMapKeys()
                nmap mm :BookmarkToggle<CR>
                nmap mi :BookmarkAnnotate<CR>
                nmap mn :BookmarkNext<CR>
                nmap mp :BookmarkPrev<CR>
                nmap ma :BookmarkShowAll<CR>
                nmap mc :BookmarkClear<CR>
                nmap mx :BookmarkClearAll<CR>
                nmap mkk :BookmarkMoveUp
                nmap mjj :BookmarkMoveDown
        endfunction
        "------------------------------------------------------------------------ 
        function! BookmarkUnmapKeys()
                unmap mm
                unmap mi
                unmap mn
                unmap mp
                unmap ma
                unmap mc
                unmap mx
                unmap mkk
                unmap mjj
        endfunction
        autocmd BufEnter * :call BookmarkMapKeys()
        autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
"-}}}

"-AAA--Ulty--Neo----------------------------------------------------------------------------------------------------{{{
        "-TODO- 
        if has("eval")
                " don't override ^J/^K -- I don't mind ^J, but ^K is digraphs
                let g:UltiSnipsJumpForwardTrigger="<tab>"
                let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
                "-???-
                let g:UltiSnipsListSnippets="<C-R><tab>"
        endif
                imap <C-b>    <Plug>(neosnippet_expand_or_jump)
                smap <C-b>    <Plug>(neosnippet_expand_or_jump)
                xmap <C-b>    <Plug>(neosnippet_expand_target)
                set omnifunc=syntaxcomplete#Complete

        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "inoremap <expr> <C-g> neocomplete#undo_completion()
        "inoremap <expr> <C-l> neocomplete#complete_common_string()
        "inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
        "inoremap <expr> <BS>  neocomplete#smart_close_popup()."\<C-h>"
        "inoremap <expr> <C-e> neocomplete#cancel_popup()
        "??? let g:neocomplete#data_directory = '~/.vim/tmp/neocomplete'
        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#enable_auto_select = 1
        let g:neocomplete#enable_smart_case = 1
        let g:neocomplete#auto_completion_start_length = 3 "-XXX
        let g:neocomplete#sources#tags#cache_limit_size = 16777216 " 16MB
        let g:neocomplete#enable_fuzzy_completion = 1
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        set previewheight=15
        set report=0 " always report changed lines
"-6-}}}

"-AAA---MiniPlugIn--------------------------------------------------------------------------------------------------{{{
        " Error Toggles {{{
                command! ErrorsToggle call ErrorsToggle()
                function! ErrorsToggle() " {{{
                        if exists("w:is_error_window")
                                unlet w:is_error_window
                                exec "q"
                        else
                                exec "Errors"
                                lopen
                                let w:is_error_window = 1
                        endif
                endfunction " }}}

                command! LocationToggle call LocationToggle()
                function! LocationToggle() " {{{
                        if exists("w:is_location_window")
                                unlet w:is_location_window
                                exec "q"
                        else
                                lopen
                                let w:is_location_window = 1
                        endif
                endfunction " }}}

                command! -bang -nargs=? QFixToggle call QFixToggle(<bang>0)
                function! QFixToggle(forced) " {{{
                        if exists("g:qfix_win") && a:forced == 0
                                cclose
                                unlet g:qfix_win
                        else
                                copen 10
                                let g:qfix_win = bufnr("$")
                        endif
                endfunction " }}}
                " nmap <silent> <fx> :ErrorsToggle<cr>

                "-Open-Quickfix-window-automatically---------------------------
                autocmd vimrc QuickfixCmdPost [^l]* nested copen | wincmd p
                autocmd vimrc QuickfixCmdPost l* nested lopen | wincmd p
                "--------------------------------------------------------------
                "-Next error/grep match
                map          <F7>       :FirstOrNextInList<CR>
                imap         <F7>       <C-O><F7>
                "-previous error/grep match
                map          <S-F7>      :PrevInList<CR>
                imap         <S-F7>      <C-O><S-F7>
                "-current error/grep match
                map          <C-F7>      :CurInList<CR>
                imap         <C-F7>      <C-O><C-F7>
                "-on-quickfix--------------------------------------------------
                nmap <silent> <F9> :QFixToggle<cr>
                map         <S-F9>     :copen<CR>
                imap        <S-F9>     <C-O><C-F9>
                map         <C-F9>     :cclose<CR>
                imap        <C-F9>     <C-O><C-F9>
                "--------------------------------
                nnoremap <LocalLeader>b :cprev<cr>zvzz
                nnoremap <LocalLeader>n :cnext<cr>zvzz
                "-on-location-list----------------------------------------------
                nmap <silent> <f8> :LocationToggle<cr>
                map         <S-F8>     :lopen<CR>
                imap        <S-F8>     <C-O><C-F8>
                map         <C-F8>     :lclose<CR>
                imap        <C-F8>     <C-O><S-F8>
                nnoremap <Leader>n :lnext<cr>zvzz
                nnoremap <Leader>b :lprev<cr>zvzz
                "---------------------------------------------------------------
                "Ex: Pull word under cursor into LHS of a subs ztitute (replace)
                nnoremap <LocalLeader>w :%s#\<<C-r>=expand("<cword>")<CR>\>#
                nnoremap <LocalLeader>z :%s#\<<C-r>=getline(".")<CR>\>#
                "-------------------------------------------------------------------------
                " Clear hlsearch and set nopaste
                nnoremap <silent> <Esc><Esc> :<C-u>set nopaste<CR>:nohlsearch<CR>
                "-------------------------------------------------------------------------
                nmap <silent> n nzz
                nmap <silent> N Nzz
                nmap <silent> g* g*zz
                nmap <silent> g# g#zz
                "-------------------------------------------------------------------------
                nnoremap <F12> :TagbarToggle<CR>
                "-------------------------------------------------------------------------
                autocmd filetype vim noremap! <buffer> <F2> <Esc>:help <C-r><C-w><CR>
                "-------------------------------------------------------------------------
                " Super useful! From an idea by Michael Naumann
                vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
                vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
                "----------------------------------------------------------------------------------
                "nnoremap <Leader>g :grep -R <cword> .<cr>
                "----------------------------------------------------------------------------------
                nnoremap <Leader>l :lgrep -R <cword> .<cr>
                nnoremap <leader>g :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
                nnoremap <Leader>a :Ag <cword> .<cr>
        "-Toggle-}}}

"-Mini}}}

"-NERD-Tree---------------------------------------------------------------------------------------------------------{{{
        noremap  <F3> :NERDTreeToggle<cr>
        inoremap <F3> <esc>:NERDTreeToggle<cr>

        augroup ps_nerdtree
                au!

                au Filetype nerdtree setlocal nolist
                au Filetype nerdtree nnoremap <buffer> H :vertical resize -10<cr>
                au Filetype nerdtree nnoremap <buffer> L :vertical resize +10<cr>
                " au Filetype nerdtree nnoremap <buffer> K :q<cr>
        augroup END

        let NERDTreeHighlightCursorline = 1
        let NERDTreeIgnore = ['\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index',
                        \ 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json',
                        \ '.*\.o$', 'db.db', 'tags.bak', '.*\.pdf$', '.*\.mid$',
                        \ '^tags$',
                        \ '^.*\.meta$',
                        \ '^.*\.fasl$',
                        \ '^.*\.dx64fsl$',
                        \ '.*\.bcf$', '.*\.blg$', '.*\.fdb_latexmk$', '.*\.bbl$', '.*\.aux$', '.*\.run.xml$', '.*\.fls$',
                        \ '.*\.midi$']

        let NERDTreeMinimalUI = 1
        let NERDTreeDirArrows = 1
        let NERDChristmasTree = 1
        let NERDTreeChDirMode = 2
        let NERDTreeMapJumpFirstChild = 'gK'
" }}}

"-Fugitive----------------------------------------------------------------------------------------------------------{{{
        augroup ft_fugitive
                au!
                nnoremap <leader>gd :Gdiff<cr>
                nnoremap <leader>gs :Gstatus<cr>
                nnoremap <leader>gw :Gwrite<cr>
                nnoremap <leader>ga :Gadd<cr>
                nnoremap <leader>gb :Gblame<cr>
                nnoremap <leader>gco :Gcheckout<cr>
                nnoremap <leader>gci :Gcommit<cr>
                nnoremap <leader>gm :Gmove<cr>
                nnoremap <leader>gr :Gremove<cr>
                nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>
                au BufNewFile,BufRead .git/index setlocal nolist
        augroup END
        " Hub XXX"
        " vnoremap <leader>H :Gbrowse<cr>
        " nnoremap <leader>H V:Gbrowse<cr>
        "
        " (Upstream) Hub"
        " vnoremap <leader>u :Gbrowse @upstream<cr>
        " nnoremap <leader>u V:Gbrowse @upstream<cr>
"-}}}

"-AAA15-Diff--------------------------------------------------------------------------------------------------------{{{
         " This is from https://github.com/sgeb/vim-diff-fold/ without the extra
         function! DiffFoldLevel()
                 let l:line=getline(v:lnum)
                 if l:line =~# '^\(diff\|Index\)'     " file
                         return '>1'
                 elseif l:line =~# '^\(@@\|\d\)'  " hunk
                         return '>2'
                 elseif l:line =~# '^\*\*\* \d\+,\d\+ \*\*\*\*$' " context: file1
                         return '>2'
                 elseif l:line =~# '^--- \d\+,\d\+ ----$'     " context: file2
                         return '>2'
                 else
                         return '='
                 endif
         endfunction
        "----------------------------------------------------------------------------------
         augroup ft_diff
             au!
             " autocmd FileType diff setlocal foldmethod=expr
             autocmd FileType diff setlocal foldexpr=DiffFoldLevel()
         augroup END
         " See :help DiffOrig
                 command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis \ | wincmd p | diffthis
         " Diffget/diffput in visual mode
                 vmap            dg             :diffget<CR>
                 vmap            dp             :diffput<CR>
         " diff-diff-diff
                 nnoremap <silent> <expr> <leader>d ":\<C-u>".(&diff?"diffoff":"diffthis")."\<CR>"
         " Diffoff-Diffoff
                 nnoremap do :diffoff!<cr>
         " diffoff used to set wrap as a side effect
                 command! Diffoff        diffoff | setlocal nowrap
"-15-Diff-}}}

"-AAA--SyntasticCheck----------------------------------------------------------------------------------------------{{{
        noremap <C-F10> :SyntasticCheck<CR>
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
        ""let g:syntastic_java_checkers = ['checkstyle']
        let g:syntastic_java_javac_executable = '~/.vim/plugged/syntastic/syntax_checkers/java/javac.vim'
        let g:systastic_python_checkers = ['pylint', 'python']
        let g:syntastic_mode_map = {'mode': 'active'}
        let g:syntastic_python_pylint_quiet_messages = {}
        let g:syntastic_enable_signs = 1
        let g:syntastic_auto_jump = 1
        let g:syntastic_enable_highlighting = 1
        let g:syntastic_echo_current_error  = 1
        let g:syntastic_javascript_checkers=['jshint']
        let g:syntastic_php_checkers=['php']
        let g:syntastic_css_checkers=['csslint']
        let g:syntastic_check_on_w = 1
"-}}}


"-BBB-------------------------------------------------------------------------------------------------------------------
        " cyan
        highlight TagbarHighlight   ctermfg=051 ctermbg=none cterm=bold
        highlight TagListTagName    ctermfg=250
        set tabpagemax=15               " Only show 15 tabs
        set ruler                       " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set cursorline
        set cursorcolumn
        let w:persistent_cursorline = 1
        "hi Search                      ctermbg=10
        hi Pmenue                      ctermfg=17
        hi CursorLine                  ctermbg=16
        hi CursorColumn                ctermbg=16
        hi ColorColumn                 ctermbg=52
        hi ColorColumn                 ctermbg=32
        set colorcolumn=1,8,92,100,112,120
        hi LineNr ctermfg=1 ctermbg=153 
        hi Normal  ctermbg=235
        let g:indentLine_color_term = 133
        set nuw =5
        highlight Cursor ctermbg=2 term= bold
        ""-------------------------------------------------------
        " hi StatusLine       ctermfg=7    ctermbg=9     cterm=bold
        " hi StatusLineNC     ctermfg=9     ctermbg=4     term=bold
        ""-------------------------------------------------------
        " set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
        " set statusline+=%#warningmsg#
        " set statusline+=%{SyntasticStatuslineFlag()}
        " set statusline+=%*
"-TOP-------------------------------------------------------------------------------------------------------------------
        "Airline
        let g:ctags_statusline=1
        let generate_tags=1
        set noshowmode
        set showmode                    " Display the current mode
        set showcmd      " Show partial commands in status line and
        "----------------------------------------
        let g:airline#extensions#tabline#enabled = 2
        let g:airline#extensions#tabline#fnamemod = ':t'
        let g:airline#extensions#tabline#buffer_min_count = 1
        let g:airline_section_c = '%{strftime("%D - %H:%M")}'
        "let g:airline_theme='powerlineish'
        "let g:airline_theme='solarized'
        let g:airline_theme='light'
        let g:airline_powerline_fonts=1
        let g:airline#extensions#branch#enabled=1
        let g:airline#extensions#whitespace#enabled = 1
        let g:airline#extensions#hunks#non_zero_only = 1
        "-----------------------------------------------------------
        hi statusline ctermbg=Cyan ctermfg=Black  cterm=bold
        hi StatusLineNC  ctermbg=5 ctermfg=0 cterm=NONE


        "-TOP-------------------------------------------------------------------------------------------------------------------
        " highlight signcolumn  ctermfg=20
        "-TOP-------------------------------------------------------------------------------------------------------------------
        " highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
        " highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
        " highlight DiffChange        cterm=bold ctermbg=11 ctermfg=227
        highlight DiffChange        cterm=bold ctermbg=10 "greenBright
        highlight DiffChange        cterm=bold ctermbg=8 "gray
        highlight DiffChange        cterm=bold ctermbg=7 "red

"-CCC-------------------------------------------------------------------------------------------------------------------
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

"-DDD--------------------------------------------------------------------------------------
        "suppress intro message because the above makes it look bad
        set shortmess+=I
        highlight ErrorMsg  guifg=red guibg=white
        "easier on the eyes
        highlight Folded ctermbg=10
        "fold column aka gutter on the left
        highlight FoldColumn ctermbg=9 ctermfg=0 guibg=#ffffd7
        "avoid invisible color combination (red on red)
        highlight DiffText ctermbg=1

"-AAA11-QuickFix---Search-------------------------------------------------------------------------------------------{{{
        let wordUnderCursor = expand("<cword>")
        let currentLine   = getline(".")
        "-------------------------------------------------------------------------
        function! OnlineDoc8()
                let s:browser = "firefox"
                let s:wordUnderCursor = expand("<cword>")
                let s:langs = ["c", "cpp", "ruby", "python", "php", "java", "css"]
                if  ((match(s:langs, &ft) > -1) && (&ft != ""))
                        let s:url = "http://www.google.com/search\\?q=".s:wordUnderCursor."+lang:".&ft
                else
                        let s:url = "http://www.google.com/search\\?q=".s:wordUnderCursor
                endif
                let s:cmd ="silent ! " . s:browser . " " . s:url
                execute s:cmd
                redraw!
        endfunction
        map <F10> :call OnlineDoc8()<CR>
        "------------------------------------------------------------------------ 
        "------------------------------------------------------------------------ 
        function! OpenUrlUnderCursor()
                let path="/Applications/Safari.app"
                execute "normal BvEy"
                let url=matchstr(@0, '[a-z]*:\/\/[^ >,;]*')
                if url != ""
                        silent exec "!open -a ".path." '".url."'" | redraw! 
                        echo "opened ".url
                else
                        echo "No URL under cursor."
                endif
        endfunction
        nmap <leader>o :call OpenUrlUnderCursor()<CR>
        "------------------------------------------------------------------------ 
        " OnlineDoc8
        highlight TagbarHighlight   ctermfg=009 ctermbg=14 cterm=bold
        highlight TagListTagName    ctermfg=3
"-14-Search-QFix-}}}
"-TODO-------------------------------------------------------------------------------------------------------------------
" if ! exists('g:TagHighlightSettings')
"         let g:TagHighlightSettings = {}
" endif
" let g:TagHighlightSettings['TagFileName'] = 'tags'
" let g:TagHighlightSettings = {'TagFileName': 'tags', 'CtagsExecutable': 'etags.exe'}


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
