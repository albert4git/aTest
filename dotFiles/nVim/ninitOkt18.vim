"-"-"-"-"-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-NeoVimMix10-"-""-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"
" File: ninitOkt18.vim
" Author: yourname
" Description: 
" Last Modified: November 12, 2018
"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-
"-This-can-be-fixed-by-running-
"  :filetype detect
"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-
        "set runtimepath+=~/.vim/plugged/vimproc/
        set path+=.,/usr/include,/usr/local/include
        set thesaurus=~/git/aTest/dotFiles/DICT/mthesaur.txt
        let s:thesaurus_pat = "~/git/aTest/dotFiles/DICT/mthesaur.txt"
        set dictionary+=/home/red/git/aTest/dotFiles/DICT/english-words.txt
        set shell=/bin/bash
        set nocompatible
        set nospell
        filetype on
        filetype plugin on
        filetype indent on
        let maplocalleader=','
        let mapleader=' '
        "set dictionary="/usr/dict/words"     
        "------------------------------------------------------------------------------------------
        let $MYVIMRC='~/.config/nvim/init.vim'
        "------------------------------------------------------------------------------------------
        augroup vimrc
                autocmd!
        augroup END
        "------------------------------------------------------------------------------------------
        function! ScriptExecute()
                :!chmod u+x %
                :w
        endfunction
        "------------------------------------------------------------------------------------------
        augroup ScriptExecutePermission
                autocmd!
                autocmd BufWritePost *.sh :call ScriptExecute()
                " autocmd BufWritePost *.rb :call ScriptExecute()
                " autocmd BufWritePost *.py :call ScriptExecute()
                " autocmd BufWritePost *.pl :call ScriptExecute()
        augroup END
        "------------------------------------------------------------------------------------------
        if has("autocmd")
                augroup SourceVimrc
                        au!
                        autocmd bufwritepost .vimrc source $MYVIMRC
                augroup END
        endif
        "------------------------------------------------------------------------------------------
        source ~/git/aTest/dotFiles/nVim/nPlug.vim
        set background=dark
        source ~/git/aTest/dotFiles/nVim/damPlug/betterdigraphs.vim  
        "source ~/git/aTest/dotFiles/nVim/mix/n-mopkai.vim
        source ~/git/aTest/dotFiles/nVim/mix/n-badwolf.vim 
        source ~/git/aTest/dotFiles/nVim/myPlug/nHydra.vim 
        syntax on
        syntax enable
        let g:pymode = 1
        set diffopt+=vertical    " split diffs vertically
        set spelllang=en,de      " spell-check two languages at once
        set spelllang=en         " en: all, en_gb: Great Britain.
        set spellsuggest=best    " default and fast list.
        "set spellfile=~/.vim/spell/en.utf-8.add " 'zg': add, 'zw': remove.
        "set wrapscan   " wrapscan used for ]s and [s spelling mistake.
        "------------------------------------------------------------------------------------------
        "Opens a vertical split and switches over (\v)
        "nnoremap vv ^vg_
        "nnoremap <silent> vv <C-w>v
        map ;s :let @/=expand("<cword>") <BAR> split <BAR> execute 'normal n'<CR>
        nnoremap ;v <C-w>v<C-w>l
        "------------------------------------------------------------------------------------------
        " inoremap <expr>  <C-a>   BDG_GetDigraph()  
        "------------------------------------------------------------------------------------------
        " Reload the colorscheme whenever we write the file.
        augroup color_badwolf_dev
                au!
                au BufWritePost badwolf.vim color badwolf
                au BufWritePost goodwolf.vim color goodwolf
        augroup END

"-"-"-Petrov-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-
"-AAA0-Tags-BackUp------------------------------------------------------------------------------------------{{{
        " Ctags {
                set tags=./tags;/,~/.vimtags
                " Make tags placed in .git/tags file available in all levels of a repository
                let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
                if gitroot != ''
                let &tags = &tags . ',' . gitroot . '/.git/tags'
                endif
        "-}
        let g:easytags_auto_highlight = 1
        let g:easytags_syntax_keyword = 'always'
        let g:easytags_events = ['BufWritePost']
        " let g:easytags_file = '~/.vim/tags'
        "------------------------------------------------------------------------------------------
        set backup                               " enable backups
        set noswapfile
        set undodir=~/.config/nvim/undoDir/      " undo files
        set backupdir=~/.config/nvim/backUpDir/  " backups
        set directory=~/.config/nvim/swapDir/    " swap files

        if !isdirectory(expand(&undodir))
            call mkdir(expand(&undodir), "p")
        endif
        if !isdirectory(expand(&backupdir))
            call mkdir(expand(&backupdir), "p")
        endif
        if !isdirectory(expand(&directory))
            call mkdir(expand(&directory), "p")
        endif
        "------------------------------------------------------------------------------------------
        set undofile
        set undoreload=10000
        set matchtime=3
        set showbreak=↪
        set linebreak
        set colorcolumn=+1
        "------------------------------------------------------------------------------------------
        set cf         " Enable error files & error jumping.
        set nu
        set autowrite  " Writes on make/shell commands
        set guifont=Monospace\ 14
        set cinwords=if,else,while,do,for,switch,case
        set matchpairs=(:),{:},[:],<:>
"-0Tags-}}}

"-AAA1-Remap-qq----------------------------------------------------------------------------------------------{{{
        inoremap jk <Esc>
        noremap ss :wa<cr>
        noremap qq :wa<cr> :bd<cr>
        noremap <localleader>c :bd<CR>
        noremap sq :wa<cr> :qa<cr>
        noremap qa :qa!<cr>
        nnoremap ge :w<CR>:e #<CR>
        "nnoremap ;e :e#<CR>
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
        nnoremap <C-N> <Up>
        nnoremap <C-P> <Down>
        nnoremap Q q
        "Underline the current line with '-'
        nmap <silent> <leader>- :t.<CR>Vr-
        "Select entire buffer
        nnoremap aa ggVG
        "Same when jumping around
        nnoremap <c-o> <c-o>zz
        nnoremap <c-i> <c-i>zz
        "Useful save mappings.
        nnoremap <silent> <Leader>u :<C-u>update<CR>
        " Yank to end of line
        nnoremap Y y$
        "-HHJ- Keep the cursor in place while joining lines
        nnoremap H mzJ`z
        "Split?? The normal use of S is covered by cc, so don't worry about shadowing it.
        nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w
        "-Reselect-last-pasted text----------------------------------------------------------------
        nnoremap gv `[v`]
        "------------------------------------------------------------------------------------------
        noremap \\ #*
        "-Manually-RE-format-a-paragraph-of-text----
        nnoremap <silent> W gwip
        "------------------------------------------------------------------------------------------
        "char = can be removed from the list of valid filename char. JAVA_HOME=/opt/java/jdk1.4
        set isfname-==
        "------------------------------------------------------------------------------------------
        "#- go to last edit position when opening files -#
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"-1Remap-}}}

"-AAA2--SetUp-Appearance--Edit--Clipboard--Bell--ExpandTab-Hist--SmartEnter---------------------------------{{{
        set updatetime=99
        let g:bling_time = 42
        let g:bling_color_fg = 'green'
        let g:bling_color_cterm = 'reverse'
        "-magic--------    
        silent! set wrapscan ignorecase smartcase incsearch hlsearch magic
            " \v: 'very magic', make every character except a-zA-Z0-9 and '_' have special meaning
            " use \v and \V to switch 'very magic' on or off.
            " \m, \M: 'magic' mode.
            " use \m and \M to switch 'magic' on or off.
        "-Appearance--- 
        silent! display=lastline,uhex nowrap wrapmargin=0 guioptions=ce key=
        silent! set noshowmatch  noshowmode shortmess+=I cmdheight=1 cmdwinheight=10 
        silent! set noshowcmd noruler rulerformat= laststatus=2 statusline=%t\ %=\ %m%r%y%w\ %3l:%-2c
        silent! set title titlelen=100 titleold= titlestring=%f noicon norightleft showtabline=1
        silent! set cursorline nocursorcolumn colorcolumn= concealcursor=nvc conceallevel=0 norelativenumber
        silent! set list listchars=tab:>\ ,nbsp:_ synmaxcol=500 ambiwidth=double breakindent breakindentopt=
        silent! set nosplitbelow nosplitleft startofline linespace=0 whichwrap=b,s scrolloff=1 sidescroll=0
        silent! set equalalways nowinfixwidth nowinfixheight winminwidth=3 winminheight=3 nowarn noconfirm
        silent! set fillchars=vert:\|,fold:\  eventignore= helplang=en viewoptions=options,cursor virtualedit=
        set splitbelow splitright
        set noruler
        set viminfo='20,\"80            " read/write a .viminfo file, don't store more
                                        "    means that the current buffer can be put
                                        "    to background without being written; and
                                        "    that marks and undo history are preserved

        "-Editing----------------------------------------------------------------------------------
        silent! set iminsert=0 imsearch=0 nopaste pastetoggle= nogdefault comments& commentstring=#\ %s
        silent! set smartindent autoindent shiftround shiftwidth=8 expandtab tabstop=4 smarttab softtabstop=8
        silent! set foldclose=all foldcolumn=0 nofoldenable foldlevel=0 foldmarker& foldmethod=indent
        silent! set textwidth=0 backspace=indent,eol,start nrformats=hex formatoptions=cmMj nojoinspaces
        silent! set nohidden autoread noautowrite noautowriteall nolinebreak mouse= modeline& modelines&
        silent! set noautochdir write nowriteany writedelay=0 verbose=0 verbosefile= notildeop noinsertmode
        set modelines=0
        "-AAA2.1-Extra vi-compatibility---------------------------------------------------------{{{
                set switchbuf=useopen    " reveal already opened files from the
                set formatoptions-=o     " don't start new lines w/ com leader on press 'o'
                autocmd filetype python setlocal formatoptions-=t " But disable autowrapping as it is super annoying
                " do not auto insert comment chars on newline
                autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
                " Global
                set hidden               " Hide buffer instead of abandoning when unloading
                set ruler                " ???
        "-2.1-}}}
        "------------------------------------------------------------------------------------------
        "set tw = 300
        set synmaxcol=801
        highlight Folded ctermbg=1
        setlocal foldmarker={{{,}}}
        setlocal foldmethod=marker
        setlocal foldminlines=6
        set foldcolumn=1 
        "-Focus the current line.  Basically:
        "-1. Close all folds.
        "-2. Open just the folds containing the current line.
        "-3. Move the line to a bit (25 lines) down from the top of the screen.
        "-4. Pulse the cursor line.  My eyes are bad.
        "-This mapping wipes out the z mark, which I never use.
        function! FocusLine()
                let oldscrolloff = &scrolloff
                set scrolloff=0
                execute "keepjumps normal! mzzMzvzt25\<c-y>\<cr>"
                let &scrolloff = oldscrolloff
        endfunction
        "------------------------------------------------------------------------------------------
        "set whichwrap=b,s,h,l,<,>,[,]
        silent! set clipboard=unnamed
        silent! set clipboard+=unnamedplus
        "-Performance
        silent! set updatetime=300 timeout timeoutlen=300 ttimeout ttimeoutlen=50 ttyfast lazyredraw
        "-Bell-Bell-Bell
        silent! set noerrorbells visualbell t_vb=
        "-Fix window position of help
        autocmd! vimrc FileType help if &l:buftype ==# 'help' | wincmd K | endif
        "-Always open read-only when a swap file is found
        autocmd! vimrc SwapExists * let v:swapchoice = 'o'
        "-Setting lazyredraw causes a problem on startup
        autocmd! vimrc VimEnter * redraw
        "-Enter, I never use the default behavior of <cr> and this saves me a keystroke...
        nnoremap <cr> o<esc>
        "-Smart Enter -???-
        inoremap <silent><expr> <CR> (pumvisible() && bufname('%') !=# '[Command Line]' ? "\<C-e>\<CR>" : "\<C-g>u\<CR>")
        "-Go to the first non-blank character of the line after paragraph motions
        noremap } }^
        "-Command line history
        set history=4024
        "-Visual shifting (does not exit Visual mode)
        nnoremap > v>
        nnoremap < v<
        vnoremap < <gv
        vnoremap > >gv
        "-Allow using the repeat operator with a visual selection (!)
        vnoremap . :normal .<CR>
        "-For when you forget to sudo.. Really Write the file.
        cmap w!! w !sudo tee % >/dev/null
        "-Move to the directory each buffer
        autocmd! vimrc BufEnter * silent! lcd %:p:h
        "-SWITCH TO THE DIRECTORY OF THE OPEN BUFFER
        map cd :cd %:p:h<cr>
        "------------------------------------------------------------------------------------------
        set nosm
        set wmh=0
        "------------------------------------------------------------------------------------------
        set nowrap
        set mouse=a
        set report=0 " always report changed lines
"-2SetUp-}}}

"-AAA3-SyntaxColor------------------------------------------------------------------------------------------{{{
        nnoremap ( <c-x>:y x\|@x<cr>
        nnoremap ) <c-a>:y x\|@x<cr>
        "------------------------------------------------------------------------------------------
        "Show syntax highlighting groups for word under cursor
        function! <SID>SynStack()
                if !exists("*synstack")
                        return
                endif
                echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
        endfunc
        "------------------------------------------------------------------------------------------
        function! ShowFunc()
                let gf_s = &grepformat
                let gp_s = &grepprg

                let &grepformat = '%*\k%*\sfunction%*\s%l%*\s%f %*\s%m'
                let &grepprg = 'ctags -x --c-types=f --sort=no -o -'

                write
                silent! grep %
                cwindow

                let &grepformat = gf_s
                let &grepprg = gp_s
        endfunc
        nmap sf :call ShowFunc()<CR>
        "------------------------------------------------------------------------------------------
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
        "------------------------------------------------------------------------------------------
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
        nnoremap sm :ShowMaps<CR>            " Map keys to call the function
"-3SynColor-}}}


"-AAA5Ulty--NeoSnippet--Ctrl-B--Expander0------------------------------------------------------------------{{{
        "-!!!-Insert completion-!!!---------
        silent! set complete& completeopt=menu infercase pumheight=10 noshowfulltag shortmess+=c
        "--------------------------------------------
        set complete=.,w,b,t,i,u,k
        "            | | | | | | |
        "            | | | | | | `-dict
        "            | | | | | `-unloaded buffers
        "            | | | | `-include files
        "            | | | `-tags
        "            | | `-other loaded buffers
        "            | `-windows buffers
        "            `-the current buffer
        "--------------------------------------------

        "set completeopt=menuone,menu,longest,preview
        " turn off that preview window that shows the issue body
        " only show completion as a list instead of a sub-window
        " see: https://github.com/tpope/vim-rhubarb
        "set completeopt-=preview
        "set completeopt=preview,menuone
        set completeopt=longest,menuone
        "--------------------------------------------
        set omnifunc=syntaxcomplete#Complete
        "------------------------------------------------------------------------------------------
        "inoremap <silent> <C-]> <C-x><C-]>
        "inoremap <silent> <C-u> <C-x><C-u>
        "----------------------------------------------------
        let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
        let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
        let g:SuperTabContextDiscoverDiscovery =
                \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
        "----------------------------------------------------
        let g:SuperTabContextDefaultCompletionType = "<c-n>"
        let g:SuperTabDefaultCompletionType = "<c-n>"
        let g:SuperTabLongestHighlight = 1
        let g:SuperTabCrMapping = 1
        "------------------------------------
        " imap <leader><tab> <C-x><C-o>
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "                            Expander-UNITE-UltiSnips-BOX                                 "
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        function! UltiSnipsCallUnite()
                Unite -start-insert -winheight=100 -immediately -no-empty ultisnips
                return ''
        endfunction
        "==========================================================================================
        set runtimepath+=~/.config/nvim/plugged/neosnippet.vim/
        set runtimepath+=~/.config/nvim/plugged/neosnippet-snippets/
        "------------------------------------------------------------------
        " let g:neosnippet#disable_runtime_snippets = 1               "Disable default runtime snippets
        " let g:neosnippet#snippets_directory = '~/.vim/snippets'     "Tell Neosnippet about the other snippets
        "------------------------------------------------------------------
        let g:neosnippet#enable_snipmate_compatibility = 1
        let g:AutoPairsMapCR=0
        "==========================================================================================
        set pumheight=12
        hi Pmenu  ctermfg=202 ctermbg=14
        hi PmenuSbar   ctermfg=11 ctermbg=5 cterm=NONE
        hi PmenuThumb  ctermfg=12 ctermbg=2 cterm=NONE
"-6-NeoComplete-}}}


"-AAA8--GitGutter-------------------------------------------------------------------------------------------{{{
        "g:mako_detect_lang_from_ext = 1
        ":let g:gitgutter_highlight_lines = 1
        let g:gitgutter_signs = 1
        let g:gitgutter_max_signs = 2000
        "------------------------------------------------------------------------------------------
        highlight GitGutterAdd ctermfg=green
        highlight GitGutterChange ctermfg=yellow
        highlight GitGutterDelete ctermfg=red
        highlight GitGutterChangeDelete ctermfg=yellow
        "------------------------------------------------------------------------------------------
        if exists("*gitgutter#highlight#define_highlights")
                " let vim-gitgutter know we changed the SignColumn colors!
                call gitgutter#highlight#define_highlights()
        endif

        "------------------------------------------------------------------------------------------
        " let g:expand_region_text_objects = {
        "                         \ 'iw'  :0,
        "                         \ 'iW'  :0,
        "                         \ 'i"'  :0,
        "                         \ 'i''' :0,
        "                         \ 'i]'  :1, 
        "                         \ 'ib'  :1, 
        "                         \ 'iB'  :1, 
        "                         \ 'il'  :0, 
        "                         \ 'ip'  :0,
        "                         \ 'ie'  :0, 
        "                         \ }
        "------------------------------------------------------------------------------------------
        let g:expand_region_text_objects = {
                                \ 'iw'  : 0,
                                \ 'i"'  : 1,
                                \ 'i''' : 1,
                                \ 'a"'  : 0,
                                \ 'a''' : 0,
                                \ 'i)'  : 1,
                                \ 'i}'  : 1,
                                \ 'i]'  : 1,
                                \ 'a)'  : 1,
                                \ 'a}'  : 1,
                                \ 'a]'  : 1,
                                \ }



        "------------------------------------------------------------------------------------------
        " Extend the global default (NOTE: Remove comments in dictionary before sourcing)
        call expand_region#custom_text_objects({
                                \ "\/\\n\\n\<CR>": 1, 
                                \ 'a]' :1, 
                                \ 'ab' :1, 
                                \ 'aB' :1, 
                                \ 'ii' :0, 
                                \ 'ai' :0, 
                                \ })

        " Use the global default + the following for ruby
        call expand_region#custom_text_objects('vim', {
                                \ 'im' :0,
                                \ 'am' :0,
                                \ })

        "Default templates directory is `.vim/templates` or (if you use pathogen) `.vim/bundle/vimplates/templates` you can change it by adding this line to your `.vimrc`:
        " let g:vimplates_templates_dirs = ['/path/to/templates', '/another/path/to/templates']
        " let g:vimplates_username (default: "John Doe")
        " let g:vimplates_email (default: "john.doe@nothing.com")
        " let g:vimplates_website (default: "http://nothing.com")
        " let g:vimplates_license (default: "GPL-3")

        " This will replace text and save the buffers for each file found by GitGrep in the previous search.
        " :GitGrep foo.*bar
        " :Qdo %s/foo.*bar/baz/g | update

        "------------------------------------------------------------------------------------------
        ":YRShow
        "------------------------------------------------------------------------------------------
                "let g:yankring_n_keys = 'Y D x X'
                "let g:yankring_window_use_right = 1
                let g:yankring_window_use_bottom = 1
                let g:yankring_window_use_horiz = 1  " Use vertical split 0
                let g:yankring_window_height = 12
                let g:yankring_record_insert = 1
                let g:yankring_window_auto_close = 1
                let g:yankring_window_use_separate = 1
                let g:yankring_persist = 1
                let g:yankring_max_history = 100
                " let g:yankring_replace_n_pkey = '<m-p>'
                " let g:yankring_replace_n_nkey = '<m-n>'
"-8-}}}

"-AAA9--Abbr------------------------------------------------------------------------------------------------{{{
        "-Unfuck--my--screen-
        nnoremap U :syntax sync fromstart<cr>:redraw!<cr>
        "-Command mode related ???
        cno $h e ~/
        cno $d e ~/Desktop/
        cno $j e ./
        cno $c e <C-\>eCurrentFileDir("e")<cr>
        "------------------------------------------------------------------------------------------
        command! -bang E e<bang>
        command! -bang Q q<bang>
        command! -bang W w<bang>
        command! -bang QA qa<bang>
        command! -bang Qa qa<bang>
        command! -bang Wa wa<bang>
        command! -bang WA wa<bang>
        command! -bang Wq wq<bang>
        command! -bang WQ wq<bang>

        "??? Map auto complete of (, ", ', [
        inoremap $q ''<esc>i
        inoremap $e ""<esc>i

        "Spelling corrects. Just for example. Add yours below.
        iab teh the
        iab Teh The

        abb dlin "==================================================================================
        abb alin "AAA--------------------------------------------------------------------------------
        iabbrev yyy "---------------------------------------------------------------------------------
        iabbrev yyy1 "---------------------------------------------------------------------------------------------
        iabbrev yyy2 "--------------------------------------------------------------------------------------{{{
        iabbrev yyy3 "-}}}

        iabbrev mispell misspell
        iabbrev funciton function
        iabbrev functiton function
        iabbrev fucntion function
        iabbrev funtion function
        iabbrev erturn return
        iabbrev retunr return
        iabbrev reutrn return
        iabbrev reutn return
        iabbrev queyr query
        iabbrev htis this
        iabbrev foreahc foreach
        iabbrev forech foreach

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
        " My information
        iab xname <C-R> William Durand
        iab xsigp <C-R> William Durand <will+git@drnd.me>
"-9Abbr-}}}

"-AAA10--Jump-----------------------------------------------------------------------------------------------{{{
        set cinoptions=N-s,g0,+2s,l-s,i2s
        "------------------------------------------------------------------------------------------
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
        "------------------------------------------------------------------------------------------
                nnoremap <C-]> :silent! call JumpToTag()<cr>
                " nnoremap <C-s> :silent! call JumpToTagInSplit()<cr>
        "------------------------------------------------------------------------------------------

                        function! PreviewTag3(top)
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
"-10Jump-}}}
"-AAA11--BookMarks------------------------------------------------------------------------------------------{{{
        let g:bookmark_auto_close = 1
        let g:bookmark_highlight_lines = 1          
        let g:bookmark_show_warning = 0           
        let g:bookmark_show_toggle_warning = 0      
        let g:bookmark_sign = '♥'
        let g:bookmark_highlight_lines = 1
        let g:bookmark_save_per_working_dir = 1
        let g:bookmark_auto_save = 1
        "------------------------------------------------------------------------------------------
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
        autocmd! BufEnter * :call BookmarkMapKeys()
        autocmd! BufEnter NERD_tree_* :call BookmarkUnmapKeys()

        "----------------------------------------------------------------------------------
        " dmx          Remove mark 'x' where x is a-zA-Z
        " m,           Place the next available mark
        " m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
        " m-           Delete all marks from the current line
        " m<Space>     Delete all marks from the current buffer
        " ]`           Jump to next mark
        " [`           Jump to prev mark
        " ]'           Jump to start of next line containing a mark
        " ['           Jump to start of prev line containing a mark
        " `]           Jump by alphabetical order to next mark
        " `[           Jump by alphabetical order to prev mark
        " ']           Jump by alphabetical order to start of next line having a mark
        " '[           Jump by alphabetical order to start of prev line having a mark
        " m/           Open location list and display marks from current buffer
        "----------------------------------------------------------------------------------
        " m[0-9]       Toggle the corresponding marker !@#$%^&*()
        " m<S-[0-9]>   Remove all markers of the same type
        " ]-           Jump to next line having a marker of the same type
        " [-           Jump to prev line having a marker of the same type
        " ]=           Jump to next line having a marker of any type
        " [=           Jump to prev line having a marker of any type
        " m?           Open location list and display markers from current buffer
        " m<BS>        Remove all markers
        "----------------------------------------------------------------------------------

"-11BookMarks-}}}

"-AAA12-MiniPlugIn------------------------------------------------------------------------------------------{{{
        command! ErrorsToggle call ErrorsToggle()
        function! ErrorsToggle() 
                if exists("w:is_error_window")
                        unlet w:is_error_window
                        exec "q"
                else
                        exec "Errors"
                        lopen
                        let w:is_error_window = 1
                endif
        endfunction
        "----------
        "----------
        command! LocationToggle call LocationToggle()
        function! LocationToggle()
                if exists("w:is_location_window")
                        unlet w:is_location_window
                        exec "q"
                else
                        lopen
                        let w:is_location_window = 1
                endif
        endfunction
        "----------
        "----------
        command! -bang -nargs=? QFixToggle call QFixToggle(<bang>0)
        function! QFixToggle(forced)
                if exists("g:qfix_win") && a:forced == 0
                        cclose
                        unlet g:qfix_win
                else
                        copen 10
                        let g:qfix_win = bufnr("$")
                endif
        endfunction
        "-nmap <silent> <fx> :ErrorsToggle<cr>

        "-Open-Quickfix-window-automatically---------------------------
        autocmd! vimrc QuickfixCmdPost [^l]* nested copen | wincmd p
        autocmd! vimrc QuickfixCmdPost l* nested lopen | wincmd p
        "--------------------------------------------------------------
        "-------------------------------------------------------------------------
        "Clear hlsearch and set nopaste
        nnoremap <silent> <Esc><Esc> :<C-u>set nopaste<CR>:nohlsearch<CR>
        "-------------------------------------------------------------------------
        nmap <silent> n nzz
        nmap <silent> N Nzz
        nmap <silent> g* g*zz
        nmap <silent> g# g#zz
        " Super useful! From an idea by Michael Naumann
        vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
        vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
        "----------------------------------------------------------------------------------
        " Find file in current directory and edit it
        function! Find(name)
                let l:list=system("find . -name '".a:name."' | perl -ne 'print \"$.\\t$_\"'")
                let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
                if l:num < 1
                        echo "'".a:name."' not found"
                        return
                endif

                if l:num != 1
                        echo l:list
                        let l:input=input("Which ? (CR=nothing)\n")

                        if strlen(l:input)==0
                                return
                        endif

                        if strlen(substitute(l:input, "[0-9]", "", "g"))>0
                                echo "Not a number"
                                return
                        endif

                        if l:input<1 || l:input>l:num
                                echo "Out of range"
                                return
                        endif

                        let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
                else
                        let l:line=l:list
                endif

                let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
                execute ":e ".l:line
        endfunction
        command! -nargs=1 Find :call Find("<args>")

        "------------------------------------------------------------------------------------------
        set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
        "------------------------------------------------------------------------------------------
        " let g:session_directory = "~/.config/nvim/tmp/session"
        " let g:session_autoload = "no"
        " let g:session_autosave = "no"
        " let g:session_command_aliases = 1
        "-session-management-
        " nnoremap <leader>so :OpenSession
        " nnoremap <leader>ss :SaveSession
        " nnoremap <leader>sd :DeleteSession<CR>
        " nnoremap <leader>sc :CloseSession<CR>
        "------------------------------------------------------------------------------------------
        "         function! MakeSession()
        "                 let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
        "                 if (filewritable(b:sessiondir) != 2)
        "                         exe 'silent !mkdir -p ' b:sessiondir
        "                         redraw!
        "                 endif
        "                 let b:filename = b:sessiondir . '/session.vim'
        "                 exe "mksession! " . b:filename
        "         endfunction
        "
        "         function! LoadSession()
        "                 let b:sessiondir  = $HOME . "/.vim/sessions" . getcwd()
        "                 let b:sessionfile = b:sessiondir . "/session.vim"
        "                 if (filereadable(b:sessionfile))
        "                         exe 'source ' b:sessionfile
        "                 else
        "                         echo "No session loaded."
        "                 endif
        "         endfunction
        "
        " au VimEnter * :call LoadSession()
        " au VimLeave * :call MakeSession()
        "------------------------------------------------------------------------------------------

"-12Mini-}}}

"-AAA13-NERD-Tree-------------------------------------------------------------------------------------------{{{
        "Show hidden files in NerdTree
        let NERDTreeShowHidden=1

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
"-13Nerd-}}}


"-AAA15-Diff------------------------------------------------------------------------------------------------{{{
         " This is from https://github.com/sgeb/vim-diff-fold/ without the extra
         function! DiffFoldLevel()
                 let l:line=getline(v:lnum)
                 if l:line =~# '^\(diff\|Index\)'  " file
                         return '>1'
                 elseif l:line =~# '^\(@@\|\d\)'   " hunk
                         return '>2'
                 elseif l:line =~# '^\*\*\* \d\+,\d\+ \*\*\*\*$' " context: file1
                         return '>2'
                 elseif l:line =~# '^--- \d\+,\d\+ ----$'     " context: file2
                         return '>2'
                 else
                         return '='
                 endif
         endfunction
        "------------------------------------------------------------------------------------------
        augroup ft_diff
                au!
                " autocmd FileType diff setlocal foldmethod=expr
                autocmd FileType diff setlocal foldexpr=DiffFoldLevel()
        augroup END
        " See :help DiffOrig
        command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis \ | wincmd p | diffthis
        " diffoff used to set wrap as a side effect
        command! Diffoff        diffoff | setlocal nowrap
"-15Diff-}}}

"-AAA16-SyntasticCheck--------------------------------------------------------------------------------------{{{
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
        ""let g:syntastic_java_checkers = ['checkstyle']
        ""let g:syntastic_java_javac_executable = '~/.vim/plugged/syntastic/syntax_checkers/java/javac.vim'
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

        "-fun-with-unicode-
        let g:syntastic_error_symbol = '⚡'
        let g:syntastic_warning_symbol = '⚠'
        " let g:syntastic_python_checkers=['python', 'flake8']
        " let g:syntastic_python_flake8_post_args='--ignore=W391'
        " For forcing the use of flake8, pyflakes, or pylint set
        " let g:syntastic_python_checkers = ['pyflakes']
        let g:syntastic_python_checkers = ['flake8']

"-16-}}}

"-AAA17-Doc8------------------------------------------------------------------------------------------------{{{
        let wordUnderCursor = expand("<cword>")
        let currentLine   = getline(".")
        "------------------------------------------------------------------------------------------
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
        "map <F10> :call OnlineDoc8()<CR>
        "------------------------------------------------------------------------------------------
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
        " nmap <leader>o :call OpenUrlUnderCursor()<CR>
        " OnlineDoc8
        "------------------------------------------------------------------------------------------

"-17--}}}

"-AAA18-Cyan------------------------------------------------------------------------------------------------{{{
        " highlight DiffAdd         cterm=bold ctermbg=none ctermfg=119
        " highlight DiffDelete      cterm=bold ctermbg=none ctermfg=167
        " highlight DiffChange      cterm=bold ctermbg=11 ctermfg=227
        highlight DiffChange        cterm=bold ctermbg=7 
        "------------------------------------------------------------------------------------------
        highlight TagbarHighlight   ctermfg=051 ctermbg=none cterm=bold
        highlight TagListTagName    ctermfg=250
        "------------------------------------------------------------------------------------------
        "suppress intro message because the above makes it look bad
        set shortmess+=I
        "???-Highlight VCS conflict markers
        match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
        highlight ErrorMsg  guifg=red guibg=white
        " highlight conflict markers
        match ErrorMsg '\v^[<\|=|>]{7}([^=].+)?$'
        "-???-ccc-shortcut to jump to next conflict marker
        nnoremap <silent> <leader>c /\v^[<\|=>]{7}([^=].+)?$<CR>


        "easier on the eyes
        highlight Folded ctermbg=10
        "fold column aka gutter on the left
        highlight FoldColumn ctermbg=9 ctermfg=0 guibg=#ffffd7
        "avoid invisible color combination (red on red)
        highlight DiffText ctermbg=1
                set tabpagemax=15
                set cursorline
                set cursorcolumn
                let w:persistent_cursorline = 1
                hi Search  ctermbg=11 ctermfg=9 term= bold
                hi CursorLine                  ctermbg=8
                hi CursorColumn                ctermbg=8
                hi ColorColumn                 ctermbg=9
                set colorcolumn=8,92,100,112,120
                "hi Visual guifg=NONE guibg=NONE
                " GitGutter
                set signcolumn=yes
                hi signcolumn  ctermbg=7
                hi LineNr ctermfg=9 ctermbg=14 
                hi Normal  ctermbg=236
                highlight Visual cterm=bold ctermbg=2 ctermfg=NONE
                "autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=16
                 set listchars=tab:▸\
                 set list
                let g:indentLine_enabled = 1
                let g:indentLine_noConcealCursor='nc'
                let g:indentLine_color_term = 10  "-Odd-Even-???
                hi Cursor ctermbg=2 term= bold
                hi Comment         ctermfg=14
                hi Number          ctermfg=11
                set nuw =5
                "-AAA---------------------------------------------------------------------------{{{
                        highlight BookmarkSign ctermbg=9 ctermfg=1
                        highlight BookmarkLine ctermbg=9 ctermfg=1
                        highlight BookmarkAnnotationLine ctermbg=9 ctermfg=1
                        highlight BookmarkAnnotationSign ctermbg=9 ctermfg=1
                "-}}}
        highlight ShowMatches ctermbg=16 
        au! Cursorhold * exe 'match ShowMatches /\v%(%#\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(\n|[^\{\}])*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(\n|[^\{\}])*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*%#\})/'
"-18Cyan-}}}


"-AAA19-Airline---------------------------------------------------------------------------------------------{{{
        let g:airline_theme='light'
        let generate_tags=1
        set showmode                "-Display the current mode
        set showcmd                 "-Show partial commands in status line 
        "-------------------------------------------------------------------------------
        let g:airline_section_c = '%{strftime("%Y %b %d %X")}'
        let g:airline#extensions#tabline#enabled = 2
        let g:airline#extensions#tabline#buffer_min_count = 1
        "-----------------------------------------------------------
        hi statusline ctermbg=Cyan ctermfg=Black  cterm=bold
        hi StatusLineNC  ctermbg=5 ctermfg=0 cterm=NONE
        "---------------------------------------------------------------------
                "let g:airline_theme = 'powerlineish'
                let g:airline#extensions#syntastic#enabled = 1
                let g:airline#extensions#branch#enabled = 1

                if !exists('g:airline_symbols')
                        let g:airline_symbols = {}
                endif
        "---------------------------------------------------------------------
                " let g:airline#extensions#tabline#left_sep = ''
                " let g:airline#extensions#tabline#left_alt_sep = ''
                " let g:airline_left_sep = ''
                " let g:airline_left_alt_sep = ''
                " let g:airline_right_sep = ''
                " let g:airline_right_alt_sep = ''
                " let g:airline_symbols.branch = ''
                " let g:airline_symbols.readonly = ''
                " let g:airline_symbols.linenr = ''
        "---------------------------------------------------------------------

"-19-}}}

"-AAA20-Wildmenu--------------------------------------------------------------------------------------------{{{
        " More useful command-line completion
        au FocusLost * :silent! wall     "Save when losing focus
        set wildmenu
        set wildmode=list:longest
        set wildmode=list:full

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
        " Command line
        silent! set wildchar=9 nowildmenu wildmode=list:longest wildoptions= wildignorecase cedit=<C-k>
"-20Wild-}}}

"-AAA21-Navi-Supertab---------------------------------------------------------------------------------------{{{
        "-SCROLL-----------------------------------------------------------------------------------
        "! noremap <expr> <C-up> (line('w0') <= 1         ? 'k' : "\<C-y>")
        "! noremap <expr> <C-down> (line('w$') >= line('$') ? 'j' : "\<C-e>")
        "------------------------------------------------------------------------------------------

"-21-}}}


"-AAA23-TEST2-----------------------------------------------------------------------------------------------{{{

        "Instead of setting 'verbose' in your vimrc, use autocommands, as follows (for instance)
        if &cmdheight == 1
                set cmdheight=2
        endif
        if &verbose == 0
                augroup late-verbose
                        autocmd!    VimEnter    *    set verbose=1
                        autocmd!    VimLeave    *    set verbose=0
                augroup END
        endif

        "------------------------------------------------------------------------------------------ 
        "This adds :G <pattern> command which runs "git grep <pattern>".
        fun! Git2GREP(...)
                let save = &grepprg
                set grepprg=git\ grep\ -n\ $*
                let s = 'grep'
                for i in a:000
                        let s = s . ' ' . i
                endfor
                exe s
                let &grepprg = save
        endfun
        command! -nargs=? GGR call Git2GREP(<f-args>)
        "------------------------------------------------------------------------------------------ 
        fun! ScrollOtherWindow(dir)
                if a:dir == "down"
                        let move = "\<C-E>"
                elseif a:dir == "up"
                        let move = "\<C-Y>"
                endif
                exec "normal \<C-W>p" . move . "\<C-W>p"
        endfun

       "---------NoAutoClose-YCM------------------------------------------------------------------- 
        "-Shortcut for closing tags, default is '>'
        " let g:closetag_shortcut = '>'
        " let g:closetag_filenames = '*.vim,*.html,*.xhtml,*.phtml'
        " let g:AutoClosePairs = "() {} \""
        " " add <angular brackets> and |pipes|
        " let g:AutoClosePairs_add = "<> |"
        " " don't close apostrophes
        " let g:AutoClosePairs_del = "'"
        " let g:AutoCloseProtectedRegions = ["Comment", "String", "Character"]
        "---------------------------------------------------------

        let g:qf_mapping_ack_style = 1
        let g:qf_window_bottom = 0
        let g:qf_auto_open_loclist = 0
        let g:qf_max_height = 8
        let g:qf_nowrap = 1

        "---------------------------------------------------------
        "---This plugin map `gag` to do Ag search.
        " - `gagiw` to search the word
        " - `gagi'` to search the words inside single quotes.
        " - `gag` to search the selected text
        let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'

        "---------------------------------------------------------
        "-Compiling-C-source-In-Vim
        autocmd FileType c,cpp
                                \ if empty(glob("[Mm]akefile")) |
                                \   setlocal makeprg=make\ %< |
                                \ endif
        "---------------------------------------------------------

        "---------------------------------------------------------
        "-The %< in
        "our makeprg definition refers to the current file with its extension
        "stripped. We specifically only change the behaviour if no Makefile
        "exists so that we don’t interfere with the normal usage of the :make
        "command.
        "---------------------------------------------------------

"-23-}}}


"-AAA22-TEST------------------------------------------------------------------------------------------------{{{
        "193 Insert the current filename at cursor postion.
        "imap \f   <C-R>=expand("%:t:r")<CR>
        
        "-------------------------------------------------------------------------------------------
        "Keep your cursor centered vertically on the screen
        "?? unite- map j jzz map k kzz

        "-------------------------------------------------------------------------------------------
        "autocmd Syntax * exec('set dict=/usr/share/vim/syntax/' .expand('<amatch>') .'.vim')

        "-------------------------------------------------------------------------------------------
        "??? VimTip605: replace a word with the yanked text
        " noremap S diw"0P

"-22-}}}

"-AAA----------------------------------------------------------------------------------------------------------
" ctrl+[ it will put you in normal mode just like hitting esc.  
" :ab php           : list of abbreviations beginning php
" :map ,            : list of maps beginning ,
" # For use in Maps
" <CR>             : carriage Return for maps
" <ESC>            : Escape
" <LEADER>         : normally \
" <BAR>            : | pipe
"-AAA----------------------------------------------------------------------------------------------------------
" Ack .vim -inspired mappings available only in location/quickfix windows:
"  s - open entry in a new horizontal window
"  v - open entry in a new vertical window
"  t - open entry in a new tab
"  o - open entry and come back
"  O - open entry and close the location/quickfix window
"  p - open entry in a preview window
" :Keep
" :Reject
" :Restore
" :Doline s/^/--
" :SaveList
" :SaveList curlist
" :SaveListAdd curlist
" :LoadList curlist
" :ListLists
"AAA-----------------------------------------------------------------------------------------------------------
"let g:indentLine_color_term = 000 There never seem to be enough spare keys for maps.
" The command is executed by doing a @m
" let @m=":'a,'bs/"
"AAA-----------------------------------------------------------------------------------------------------------
" function! SaveCurrentSession()
"   if v:this_session != ""
"     exe "mksession! " . v:this_session
"   endif
" endfunction
" au BufRead Session.vim so %
" au VimLeave * call SaveCurrentSession()
"--------------------------------------------------------------------------------------------------------------
"   help jump-motions
" )   - jump forward one sentence
" (   - jump backward one sentence
" }   - jump forward one paragraph
" {   - jump backward one paragraph
" H   - jump to the top of the display       
" M   - jump to the middle of the display   
" L   - jump to the bottom of the display
" 'm  - jump to the beginning of the line of mark m
" `m  - jump to the location of mark m
" ''  - return to the line where the cursor was before the latest jump
" ``  - return to the cursor position before the latest jump (undo the jump).
" %   - jump to corresponding item, e.g. from an open brace to its 
"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-""-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-
" execute 'nnoremap \, :edit' resolve(expand('~/.bashrc')) '<CR>'
" nnoremap ,l mayiw`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>
" vnoremap ,l may`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>
"--------------------------------------------------------------------------------------------------------------
"-Plugin: insearch + insearch-fuzzy
" map <Space>  <Plug>(incsearch-forward)
" map /        <Plug>(incsearch-forward)
" map ?        <Plug>(incsearch-backward)
" map g/       <Plug>(incsearch-stay)
" map z<Space> <Plug>(incsearch-fuzzyspell-/)
" map z/       <Plug>(incsearch-fuzzyspell-/)
" map z?       <Plug>(incsearch-fuzzyspell-?)
" map zg/      <Plug>(incsearch-fuzzyspell-stay)
"--------------------------------------------------------------------------------------------------------------
" Plugin: qf
" nmap <F5>   <Plug>QfSwitch
" nmap <F6>   <Plug>QfCtoggle
" nmap <F7>   <Plug>QfCprevious
" nmap <F8>   <Plug>QfCnext
" nmap <C-F6> <Plug>QfLtoggle
" nmap <C-F7> <Plug>QfLprevious
" nmap <C-F8> <Plug>QfLnext
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------


        "------------------------------------------------------------------------------
        " Refactor
        " Locally (local to block) rename a variable. Every day I want Vim to be an
        " IDE, but it will always be a text editor
        "------------------------------------------------------------------------------
        function! Refactor()
                call inputsave()
                let @z=input("What do you want to rename '" . @z . "' to? ")
                call inputrestore()
        endfunction

        nnoremap <Leader>rf "zyiw:call Refactor()<cr>mx:silent! norm gd<cr>:silent! norm [{<cr>$V%:s/<C-R>//<c-r>z/g<cr>`x


        "------------------------------------------------------------------------------
        " Wipeout (helpful!)
        " Remove non visible buffers
        "------------------------------------------------------------------------------
        function! Wipeout()
                "From tabpagebuflist() help, get a list of all buffers in all tabs
                let tablist = []
                for i in range(tabpagenr('$'))
                        call extend(tablist, tabpagebuflist(i + 1))
                endfor

                let nWipeouts = 0
                for i in range(1, bufnr('$'))
                        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
                                "bufno exists AND isn't modified AND isn't in the list of buffers
                                "open in windows and tabs
                                silent exec 'bwipeout' i
                                let nWipeouts = nWipeouts + 1
                        endif
                endfor
                echomsg nWipeouts . ' buffer(s) wiped out'
        endfunction

        nnoremap <Leader>x :tabcl<cr>:call Wipeout()<cr>

        "------------------------------------------------------------------------------
        " ToggleQuickFix
        " There's no way to close the quickfix window without jumping to it and :q or
        " whatever. That's bad. Let me close it from anywhere
        "------------------------------------------------------------------------------
        function! ToggleQuickFix()
                if exists("g:qwindow")
                        cclose
                        execute "wincmd p"
                        unlet g:qwindow
                else
                        try
                                copen
                                execute "wincmd J"
                                let g:qwindow = 1
                        catch
                                echo "Error!"
                        endtry
                endif
        endfunction

        "------------------------------------------------------------------------------
        " FixVimSpellcheck
        " Map z=, which normally opens a big useless list of suggested spelling
        " corrections, to automatiaclly replace the word under the cursor with the
        " first most likely spell suggestion, even if set spell is off
        "------------------------------------------------------------------------------
        function! FixVimSpellcheck()
                if &spell
                        normal! 1z=
                else
                        set spell
                        normal! 1z=
                        set nospell
                endif
        endfunction

        nnoremap z= :call FixVimSpellcheck()<cr>

        " While we're here, disable the zg (add to dictionary) shortcut, because it's
        " awful functionality and I hit it all the time because who on earth remembers
        " what zg and z= do
        nnoremap zg z=

        "------------------------------------------------------------------------------
        " ParagraphMove
        " Fix vim's default { } motions by treating lines containing only whitespace
        " as blank, so they aren't jumped to
        " see http://stackoverflow.com/questions/1853025/make-and-ignore-lines-containing-only-whitespace
        "------------------------------------------------------------------------------
        function! ParagraphMove(delta, visual, count)
                normal m'
                normal |
                if a:visual
                        normal gv
                endif

                if a:count == 0
                        let limit = 1
                else
                        let limit = a:count
                endif

                let i = 0
                while i < limit
                        if a:delta > 0
                                " first whitespace-only line following a non-whitespace character
                                let pos1 = search("\\S", "W")
                                let pos2 = search("^\\s*$", "W")
                                if pos1 == 0 || pos2 == 0
                                        let pos = search("\\%$", "W")
                                endif
                        elseif a:delta < 0
                                " first whitespace-only line preceding a non-whitespace character
                                let pos1 = search("\\S", "bW")
                                let pos2 = search("^\\s*$", "bW")
                                if pos1 == 0 || pos2 == 0
                                        let pos = search("\\%^", "bW")
                                endif
                        endif
                        let i += 1
                endwhile
                normal |
        endfunction



        "----------------------------------------------------------------------------------
        "----------------------------------------------------------------------------------
        " " Next/prev git change, and disable intrusive GitGutter mappings
        " let g:gitgutter_map_keys = 0
        " nmap [c <Plug>GitGutterPrevHunk
        " nmap ]c <Plug>GitGutterNextHunk

        "----------------------------------------------------------------------------------
        " " Run tests
        " " Plugin: test
        " nmap <Leader>rt :w<CR>:TestToggleStrategy<CR>
        " nmap <Leader>rs :w<CR>:TestSuite<CR>
        " nmap <Leader>rf :w<CR>:TestFile<CR>
        " nmap <Leader>rl :w<CR>:TestLast<CR>
        " nmap <Leader>rn :w<CR>:TestNearest<CR>
        " nmap <Leader>rv :w<CR>:TestVisit<CR>

        "----------------------------------------------------------------------------------
        " if dein#tap('completor.vim')
        "         let g:completor_python_binary = '/usr/bin/python3'
        "         let g:completor_racer_binary = '/usr/bin/racer'
        "         let g:completor_clang_binary = '/usr/bin/clang'
        "         let g:completor_node_binary = '/usr/bin/node'
        "         let g:completor_disable_ultisnips = 1
        "         let g:completor_min_chars = 3
        " elseif dein#tap('deoplete.nvim')
        "         let g:deoplete#enable_at_startup = 1
        "         call deoplete#custom#set('buffer', 'min_pattern_length', 3)
        "         if dein#tap('deoplete-clang')
        "         let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
        "         let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
        "         endif
        " endif

        "----------------------------------------------------------------------------------
        " " Plugin: insearch + insearch-fuzzy
        " map <Space>  <Plug>(incsearch-forward)
        " map /        <Plug>(incsearch-forward)
        " map ?        <Plug>(incsearch-backward)
        " map g/       <Plug>(incsearch-stay)
        " map z<Space> <Plug>(incsearch-fuzzyspell-/)
        " map z/       <Plug>(incsearch-fuzzyspell-/)
        " map z?       <Plug>(incsearch-fuzzyspell-?)
        " map zg/      <Plug>(incsearch-fuzzyspell-stay)

        "----------------------------------------------------------------------------------
        " Then rebuild **helptags** in vim:
        " :helptags ~/.vim/doc/
        " let g:pymode_python = 'python3'
        " :help pymode-faq

        augroup python_files "{{{
                au!

                " This function detects, based on Python content, whether this is a
                " Django file, which may enabling snippet completion for it
                fun! s:DetectPythonVariant()
                        let n = 1
                        while n < 50 && n < line("$")
                                " check for django
                                if getline(n) =~ 'import\s\+\<django\>' || getline(n) =~ 'from\s\+\<django\>\s\+import'
                                        set ft=python.django
                                        "set syntax=python
                                        return
                                endif
                                let n = n + 1
                        endwhile
                        " go with html
                        set ft=python
                endfun
                autocmd BufNewFile,BufRead *.py call s:DetectPythonVariant()

                " PEP8 compliance (set 1 tab = 4 chars explicitly, even if set
                " earlier, as it is important)
                autocmd filetype python setlocal textwidth=78
                autocmd filetype python match ErrorMsg '\%>120v.\+'


                " Folding for Python (uses syntax/python.vim for fold definitions)
                "autocmd filetype python,rst setlocal nofoldenable
                "autocmd filetype python setlocal foldmethod=expr

                " Python runners
                autocmd filetype python noremap <buffer> <F5> :w<CR>:!python %<CR>
                autocmd filetype python inoremap <buffer> <F5> <Esc>:w<CR>:!python %<CR>
                autocmd filetype python noremap <buffer> <S-F5> :w<CR>:!ipython %<CR>
                autocmd filetype python inoremap <buffer> <S-F5> <Esc>:w<CR>:!ipython %<CR>

                " Automatic insertion of breakpoints
                autocmd filetype python nnoremap <buffer> <leader>bp :normal oimport pdb; pdb.set_trace()  # TODO: BREAKPOINT  # noqa<Esc>

                " Toggling True/False
                autocmd filetype python nnoremap <silent> <C-t> mmviw:s/True\\|False/\={'True':'False','False':'True'}[submatch(0)]/<CR>`m:nohlsearch<CR>

                " Run a quick static syntax check every time we save a Python file
                autocmd BufWritePost *.py call Flake8()

                " Defer to isort for sorting Python imports (instead of using Unix sort)
                autocmd filetype python nnoremap <leader>s mX:%!isort -<cr>`X:redraw!<cr>
        augroup end " }}}


"-AAA7-Ag--CtrlP--Unite--------------------------------------------------------------------------------------{{{
        "g:fzf_command_prefix = 'Fzf'
        "---BigList-400----------------------------------------------------------------------------
        let g:fzf_action = {
                                \ 'ctrl-t': 'tab split',
                                \ 'ctrl-x': 'split',
                                \ 'ctrl-v': 'vsplit' }
        let g:fzf_launcher = 'urxvt -geometry 120x30 -e sh -c %s'
        "------------------------------------------------------------------------------------------
        " Mapping selecting mappings
        nmap <leader><tab> <plug>(fzf-maps-n)
        xmap <leader><tab> <plug>(fzf-maps-x)
        omap <leader><tab> <plug>(fzf-maps-o)
        "------------------------------------------------------------------------------------------
        function! s:fzf_statusline()
                highlight fzf1 ctermfg=161 ctermbg=251
                highlight fzf2 ctermfg=23 ctermbg=251
                highlight fzf3 ctermfg=237 ctermbg=251
                setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
        endfunction
        autocmd! User FzfStatusLine call <SID>fzf_statusline()
        "------------------------------------------------------------------------------------------
        "-[Buffers] Jump to the existing window if possible
        let g:fzf_buffers_jump = 1
        "-[[B]Commits] Customize the options used by 'git log':
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
        "-[Tags] Command to generate tags file
        let g:fzf_tags_command = 'ctags -R'
        "-[Commands] --expect expression for directly executing the command
        let g:fzf_commands_expect = 'alt-enter,ctrl-x'

        "------------------------------------------------------------------------------------------
        "-fzf#vim#grep(command, with_column, [options], [fullscreen])
        command! -bang -nargs=* GGrep
                                \ call fzf#vim#grep(
                                \   'git grep --line-number '.shellescape(<q-args>), 0,
                                \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

        "-Override Colors command. You can safely do this in your .vimrc as fzf.vim
        command! -bang Colors
                                \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

        "------------------------------------------------------------------------------------------
        " Augmenting Ag command using fzf#vim#with_preview function
        "  :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
        "  :Ag! - Start fzf in fullscreen and display the preview window above
        "------------------------------------------------------------------------------------------
        command! -bang -nargs=* Ag
                                \ call fzf#vim#ag(<q-args>,
                                \                 <bang>0 ? fzf#vim#with_preview('up:60%')
                                \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
                                \                 <bang>0)

        "------------------------------------------------------------------------------------------
        "-Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
        command! -bang -nargs=* Rg
                                \ call fzf#vim#grep(
                                \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
                                \   <bang>0 ? fzf#vim#with_preview('up:60%')
                                \           : fzf#vim#with_preview('right:50%:hidden', '?'),
                                \   <bang>0)
        "-Likewise, Files command with preview window
        "------------------------------------------------------------------------------------------
        command! -bang -nargs=? -complete=dir Files
                                \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
        "------------------------------------------------------------------------------------------
        call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
                                \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))
        "------------------------------------------------------------------------------------------
        call unite#filters#matcher_default#use(['matcher_fuzzy'])
        call unite#filters#matcher_default#use(['matcher_fzf'])
        call unite#filters#sorter_default#use(['sorter_rank'])
        "------------------------------------------------------------------------------------------
        if executable('ag')
                let g:ag_working_path_mode="r"
                set grepprg=ag\ --nogroup\ --nocolor
                let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
                let g:ctrlp_use_caching = 0
                let g:ackprg = 'ag --vimgrep --smart-case'
                let g:unite_source_grep_command = 'ag'
                let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
                let g:unite_source_grep_recursive_opt = ''
        endif
        "------------------------------------------------------------------------------------------
            "   - :Unite [{options}] {source's'}
            "           - parameters of source
            "               - e.g. file:foo:bar -- here ['foo', 'bar'] is parameters
            "               - e.g. file:foo\:bar -- use \ to escape
            "               - e.g. file:foo::bar -- ['foo', '', 'bar']
            "   - press 'I' to search after prompt '>'
            "       - *word,
            "       - **/foo (directory recursively)
            "       - foo bar (AND)
            "       - foo|bar (OR)
            "       - foo !bar (negative)
            "   - :UniteResume, :UniteBookmarkAdd,
        let g:unite_source_history_yank_save_clipboard = 1
        let g:unite_source_mark_marks = "abcdefghijklmnopqrstuvwxyz"
                \ . "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.'`^<>[]{}()\""
        "------------------------------------------------------------------------------------------
        " let g:unite_no_default_keymappings = 1 " don't map default key mappings
        let g:unite_candidate_icon = '∘'
        let g:unite_source_history_yank_enable = 1
        let g:unite_enable_start_insert = 0
        let g:unite_enable_short_source_mes = 0
        let g:unite_force_overwrite_statusline = 1
        let g:unite_prompt = '::: '
        let g:unite_marked_icon = '✓'
        let g:unite_winheight = 15
            let g:unite_winwidth = 50
        let g:unite_update_time = 200
        let g:unite_split_rule = 'botright'
        let g:unite_split_rule = "topleft"
        let g:unite_data_directory ='~/.config/nvim/tmp/unite'
        let g:unite_source_buffer_time_format = '(%d-%m-%Y %H:%M:%S) '
        let g:unite_source_file_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
        let g:unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '

        "------------------------------------------------------------------------------------------
        let g:ctrlp_cmd = 'CtrlPMRU'
        let g:ctrlp_extensions = ['tag']
        let g:ctrlp_match_window_bottom = 0
        let g:ctrlp_match_window_reversed = 0
        let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
        let g:ctrlp_dotfiles = 0
        let g:ctrlp_switch_buffer = 0
        let g:ctrlp_working_path_mode = 0
        let g:ctrlp_map = '<leader>e'
        let g:ctrlp_open_new_file = 'R'
        "let g:ctrlp_working_path_mode = 'ar'
        "------------------CtrlP-------------------------------------------------------------------
        nnoremap <leader>p :CtrlP<cr>
        nnoremap ;p :CtrlP<cr>
        nnoremap ;m :CtrlPMRU<cr>

        "------------------------------------------------------------------------------------------

        " Command-T {{{
            " <Leader>t provide fast, intuitive mechanism for opening files and buffers
            "nnoremap <silent> <Leader>t :CommandT<CR>
            "nnoremap <silent> <Leader>b :CommandTBuffer<CR>
            " <BS> <Del> -- delete
            " <Left> <C-h> -- move left.
            " <Right> <C-l> -- move right
            " <C-a> -- move to the start.
            " <C-e> -- move to the end.
            " <C-u> -- clear the contents of the prompt.
            " <Tab> -- switch focus between the file listing and prompt.
            " ---------------------------------------------------------
            "  <C-CR> <C-s> -- split open
            "  <C-v> -- vsplit
            "  <C-t> -- tab
            "  <C-j> <C-n> <Down> -- select next file in file listing.
            "  <C-k> <C-p> <Up> -- select previous file in file listing.
            "  <Esc> <C-c> -- cancel (dismisses file listing)
            let g:CommandTMaxFiles = 10000 " maximum number of files scan.
            let g:CommandTMaxDepth = 15
            let g:CommandTMaxCacheDirectories = 1 " 0: no limit.
            let g:CommandTMaxHeight = 15 " 0: as much as available space.
            let g:CommandTMinHeight = 0 " 0: single line.
            let g:CommandTAlwaysShowDotFiles = 0 " only if entered string contains a dot
            let g:CommandTNeverShowDotFiles = 0
            let g:CommandTScanDotDirectories = 0
            let g:CommandTMatchWindowAtTop = 0 " match window appear at bottom.
            let g:CommandTMatchWindowReverse = 1 " let the best match at bottom.
            let g:CommandTTageIncludeFilenames = 1 " include filenames when matches
            "let g:CommandTCancelMap='<C-x>'
            "let g:CommandTCancelMap=['<C-x>', '<C-c>'] " multiple alternative mapping.
                nmap <silent> ;t <Plug>(CommandTJump)
                nmap <silent> ;b <Plug>(CommandTBuffer)
                nmap <silent> ;h <Plug>(CommandTHelp)
        " }}}
        "------------------------------------------------------------------------------------------
        let g:ycm_filetype_blacklist = {
                                \ 'tagbar': 1,
                                \ 'qf': 1,
                                \ 'notes': 1,
                                \ 'markdown': 1,
                                \ 'unite': 1,
                                \ 'text': 1,
                                \ 'vimwiki': 1,
                                \ 'pandoc': 1,
                                \ 'infolog': 1,
                                \ 'mail': 1
                                \}

        "------------------------------------------------------------------------------------------
        "let g:ycm_complete_in_comments=1
        "" load ycm conf by default
        let g:ycm_confirm_extra_conf=0
        "" turn on tag completion
        let g:ycm_collect_identifiers_from_tags_files=1

        "" start completion from the first character
        let g:ycm_min_num_of_chars_for_completion=2
        "" don't cache completion items
        let g:ycm_cache_omnifunc=0
        "" complete syntax keywords
        let g:ycm_seed_identifiers_with_syntax=1
        "------------------------------------------------------------------------------------------
        "noYet- let g:ycm_show_diagnostics_ui = 1
        "let g:ycm_enable_diagnostic_highlighting = 1
        "---------------------tests----------------------------------------------------------------
        "let g:neosnippet#enable_snipmate_compatibility = 1
        "------------------------------------------------------------------------------------------
        "-???- let g:EclimCompletionMethod = 'omnifunc'
        let g:ycm_autoclose_preview_window_after_completion = 1
        let g:ycm_error_symbol = 'x>'
        let g:ycm_warning_symbol = 'w>'
        let g:ycm_enable_diagnostic_signs = 1
        let g:ycm_add_preview_to_completeopt = 1
        let g:ycm_use_ultisnips_completer = 1
        let g:ycm_autoclose_preview_window_after_insertion = 0
        let g:ycm_key_detailed_diagnostics = '<leader>d'
        let g:ycm_key_invoke_completion = '<C-Space>'
        let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
        let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
        let g:ycm_key_list_stop_completion = ['<C-y>']
        map <C-;> :YcmCompleter GoToImprecise<CR>
        "**************************************************************
        autocmd FileType python setlocal omnifunc=jedi#completions
        let g:jedi#completions_enabled = 0
        let g:jedi#auto_vim_configuration = 0
        let g:jedi#popup_on_dot = 0
        let g:jedi#goto_assignments_command = "<localleader>g"
        let g:jedi#goto_definitions_command = "<localleader>d"
        let g:jedi#documentation_command = "K"
        let g:jedi#usages_command = "<localleader>u"
        let g:jedi#rename_command = "<localleader>r"
        let g:jedi#show_call_signatures = "0"
        let g:jedi#completions_command = "<C-q>"
        "---------------------tests----------------------------------------------------------------
        " call unite#filters#sorter_default#use(['sorter_rank'])
        "------------------------------------------------------------------------------------------
        let g:ycm_semantic_triggers =  {
                                \   'c': ['->', '.'],
                                \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
                                \            're!\[.*\]\s'],
                                \   'ocaml': ['.', '#'],
                                \   'cpp,cuda,objcpp': ['->', '.', '::'],
                                \   'perl': ['->'],
                                \   'php': ['->', '::'],
                                \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
                                \   'ruby,rust': ['.', '::'],
                                \   'lua': ['.', ':'],
                                \   'erlang': [':'],
                                \ }

        "---BigList-500----------------------------------------------------------------------------
        let g:EasyMotion_smartcase = 1
        let g:EasyMotion_do_mapping = 0 "-Disable default mappings
                nmap <LocalLeader><LocalLeader> <Plug>(easymotion-w)
                omap <LocalLeader>l <Plug>(easyoperator-line-select)
                xmap <LocalLeader>l <Plug>(easyoperator-line-select)
                nmap <LocalLeader>w <Plug>(easymotion-overwin-w)
        "------------------------------------------------------------------------------------------
        autocmd FileType unite call s:unite_settings()

        " automatically open and close the popup menu / preview window
        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        "--------------Ulti-Expander-Unite----------------------------------
        inoremap <silent> <F10> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
                let g:UltiSnipsListSnippets="<C-z>"
                let g:UltiSnipsExpandTrigger="<tab>"
                let g:UltiSnipsJumpForwardTrigger="<tab>"
                let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
        "--------------Neo-Expander-Unite----------------------------------
                imap <C-s>    <Plug>(neosnippet_start_unite_snippet)
                imap <C-b>    <Plug>(neosnippet_expand_or_jump)
                smap <C-b>    <Plug>(neosnippet_expand_or_jump)
                xmap <C-b>    <Plug>(neosnippet_expand_target)
        "------------------------------------------------------------------------------------------
            "let g:neosnippet#snippets_directory = "~/.vim/snippets/neosnippet/"
            let g:neosnippet#snippets_directory = "~/.config/nvim/plugged/neosnippet-snippets/neosnippets/"

            nnoremap ;n
                \ :exec ':NeoSnippetEdit -split -direction=topleft -horizontal'<CR>
                " \ . &filetype<CR>
        "------------------------------------------------------------------------------------------
        "nmap <Leader>m <Plug>BookmarkShowAll
        "------------------------------------------------------------------------------------------
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
        "------------------------------------------------------------------------------------------
                "nnoremap <Leader>p :Unite grep<CR>
                nmap <C-u> :Unite buffer file_mru file <CR>
                nnoremap <Leader>\ :Unite -silent -vertical -winwidth=40  -direction=topleft -toggle outline<CR>
                nnoremap <Leader>u :Unite help file_mru file buffer file_rec bookmark <CR>
                nnoremap <Leader>' :Unite bookmark <CR>
                nnoremap <Leader>f :<C-u>UniteWithBufferDir -buffer-name=files file bookmark file/new<CR>
                nnoremap <Leader>r :<C-u>Unite -buffer-name=register register<CR>
        "------------------------------------------------------------------------------------------
                nnoremap <Leader>h :UniteWithCursorWord -silent help<CR>
                nnoremap <Leader>v :UniteWithCursorWord -silent -no-split -auto-preview line<CR>
        "------------------------------------------------------------------------------------------
                "nnoremap <Leader>y :<C-u>Unite -buffer-name=yanks<CR>
                nnoremap <Leader>y :<C-u>Unite -buffer-name=yanks history/yank<CR>
                nnoremap <Leader>i :<C-u>Unite -buffer-name=ultisnips ultisnips<CR>
                nnoremap <Leader>e :<C-u>Unite -buffer-name=neosnippet neosnippet<CR>
                nnoremap <Leader>m :<C-u>Unite -buffer-name=mapping mapping<CR>
                nnoremap <Leader>c :<C-u>Unite -buffer-name=change change<CR>
                nnoremap <Leader>j :<C-u>Unite -buffer-name=jump jump<CR>
                nnoremap <Leader>o :<C-u>Unite -buffer-name=command command<CR>
        "------------------------------------------------------------------------------------------
        "------------------------------------------------------------------------------------------
                nnoremap <Leader>l :lgrep -R <cword> .<cr>
                "nnoremap <Leader>g :grep -R <cword> .<cr>
                nnoremap <Leader>g :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
                nnoremap <Leader>a :Ack <cword> .<cr>
                map ? :Ack
        "---BigList-600----------------------------------------------------------------------------
                nmap <localleader>m <Plug>yankstack_substitute_older_paste
                nmap <localleader>p <Plug>yankstack_substitute_newer_paste
        "-Plugin: agriculture----------------------------------------
                nmap <Leader>/ <Plug>AgRawSearch
                vmap <Leader>/ <Plug>AgRawVisualSelection
                nmap <Leader>* <Plug>AgRawWordUnderCursor
        "-zt-is-okay-for-putting-something-at-the-top----------------
                nnoremap zh mzzt10<c-u>`z
                "-Mappings to easily toggle fold levels
                nnoremap z1 :set foldlevel=1<cr>
                nnoremap z2 :set foldlevel=2<cr>
                nnoremap z3 :set foldlevel=3<cr>
                "-Make zO recursively open whatever fold we're in, even if it's partially open.
                nnoremap zO zczO
                "nnoremap <c-z> :call FocusLine()<cr>
        "------------------------------------------------------------------------------------------
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
        " fugitive {{{ Intuitive and Simple Git wrapper for Vim.
                " vnoremap <leader>H :Gbrowse<cr>
                " nnoremap <leader>H V:Gbrowse<cr>
                " vnoremap <leader>u :Gbrowse @upstream<cr>
                " nnoremap <leader>u V:Gbrowse @upstream<cr>
            " Usage:
            "   - :Git[!] [args]
            "   - :Gstatus
            "   - :Gcommit [args]
            "   - :Gedit/:Gsplit/:Gvsplit/:Gtabedit/:Gpedit [revision]
            "   - :Gwrite/:Gwq {path}
            "   - :Gmove {destination}
            "   - :Gremove
            "   - :{range}Gread [revision]/[args]
            "   - :Gdiff/:Gsdiff/:Gvdiff [revision]
            "   - :Ggrep/:Glgrep [args] -- :grep/:lgrep with git-grep as 'grepprg'
            "   - :Glog [args] -- load all previous revisions of current file into quickfix
            "   - :[range]Gblame {flags}
            "   - :[range]Gbrowse {revision}
            " auto open quickfix window for :Ggrep.
            autocmd QuickFixCmdPost grep cwindow
        " }}}
        "------------------FZF---------------------------------------------------------------------
                nnoremap ft :Files<Cr>
                nnoremap fg :GFiles<Cr>
                nnoremap fc :Commands<Cr>
                nnoremap fm :BCommits<Cr>
                nnoremap fh :Helptags<Cr>
                nnoremap fh :<C-u>History<cr>
                nnoremap fb :<C-u>Buffers<cr>

                " " Fzf fuzzy finders
                " " Plugin: fzf
                " nmap <Leader>f :GFiles<CR>
                " nmap <Leader>F :Files<CR>
                " nmap <Leader>t :BTags<CR>
                " nmap <Leader>T :Tags<CR>
                " " nmap <Leader>m :Methods<CR>
                " nmap <Leader>b :Buffers<CR>
                " nmap <Leader>l :BLines<CR>
                " nmap <Leader>L :Lines<CR>
                " nmap <Leader>h :History<CR>
                " " nmap <Leader>H :GHistory<CR>
                " nmap <Leader>: :History:<CR>
                " nmap <Leader>M :Maps<CR>
                " nmap <Leader>C :Commands<CR>
                " nmap <Leader>' :Marks<CR>
                " nmap <Leader>s :Filetypes<CR>
                " nmap <Leader>S :Snippets<CR>
                " nmap <Leader><Leader>h :Helptags!<CR>
        "------------------------------------------------------------------------------------------
                inoremap <silent> <C-o> <C-x><C-o>
                inoremap <silent> <C-k> <C-x><C-k>
                inoremap <silent> <C-d> <C-x><C-d>
                inoremap <silent> <C-f> <C-x><C-f>
                inoremap <silent> <C-l> <C-x><C-l>
        "----------------------------------------------------
                imap <c-\> fzf#vim#complete#word({'left': '15%'})
                imap <C-l> <plug>(fzf-complete-line)
                imap <expr> <c-j> fzf#vim#complete(fzf#wrap({
                                        \ 'prefix': '^.*$',
                                        \ 'source': 'rg -n ^ --color always',
                                        \ 'options': '--ansi --delimiter : --nth 3..',
                                        \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

        " this will allow you to format an entire block of text
                nnoremap ;f :set tw=70<cr>v<S-}>gq<End>
                nnoremap ;e :ls<CR>:b<Space>
        "----------------------------------------------------------------------------------- 
                nmap <silent> <C-M-Down> :call ScrollOtherWindow("down")<CR>
                nmap <silent> <C-M-Up> :call ScrollOtherWindow("up")<CR>
        "------------------------------------------------------------------------------------------ 
                nnoremap <S-j> :bn<cr>
                nnoremap <S-k> :bp<cr>
        "--------------------------------------------------
                map <C-J> <C-W>j<C-W>_
                map <C-K> <C-W>k<C-W>_
                map <C-H> <C-W>h<C-W>|
                map <C-L> <C-W>l<C-W>|
                map <C-=> <C-W>=
        "--------------------------------------------------
                nnoremap <m-right> :vertical resize +3<cr>
                nnoremap <m-left> :vertical resize -3<cr>
                nnoremap <m-up> :resize +3<cr>
                nnoremap <m-down> :resize -3<cr>
        "---BigList-700----------------------------------------------------------------------------
                        map <M-k> <Plug>(expand_region_expand)
                        map <M-j> <Plug>(expand_region_shrink)
                nmap <M-q> viq 
                nmap <M-s> vas 
                        nmap <M-o> vio 
                        nmap <M-i> vao 
                nmap <M-0> vib 
                nmap <M-b> vaB 
                nmap <M-9> vab 
                        nmap <M-7> vif 
                        nmap <M-8> vaf 
                nmap <M-6> vip 
                nmap <M-5> vih 
                        nmap <M-m> <Plug>GitGutterNextHunk
                        nmap <M-c> <Plug>GitGutterPrevHunk
                nmap ]c <Plug>GitGutterNextHunk
                nmap [c <Plug>GitGutterPrevHunk
                        nmap  ;g <Plug>GitGutterStageHunk
                        nmap  ;u <Plug>GitGutterUndoHunk
                " Quote motions for operators: da" will delete a quoted string.
                omap i" :normal vT"ot"<CR>
                omap a" :normal vF"of"<CR>
                omap i' :normal vT'ot'<CR>
                omap a' :normal vF'of'<CR>
                        " Switch " and ' with c (VERY useful)
                        nmap c' cs'"
                        nmap c" cs"'
                "Put 'and' around the current word
                map f' i'<ctrl-v><esc>ea'<ctrl-v><esc>
                "Put "and" around the current word
                map f" i"<ctrl-v><esc>ea"<ctrl-v><esc>
                "-VISUAL-MODE-Mappings
                "-wrap <b></b> around VISUALLY selected Text
                vmap sb "zdi<b><C-R>z</b><ESC>
                "-wrap <?=   ?> around VISUALLY selected Text
                vmap st "zdi<?= <C-R>z ?><ESC> 
        "------------------------------------------------------------------------------------------
                nnoremap <buffer> <F2> <Esc>:help <C-r><C-w><CR>
                nnoremap <buffer> <C-F2> <Esc>:helpgrep <C-r><C-w><CR>
        "------------------------------------------------------------------------------------------
                noremap  <F3> :NERDTreeToggle<cr>
                inoremap <F3> <esc>:NERDTreeToggle<cr>
        "---???------------------------------------------------------------------------------------
                nmap <F4> :call <SID>SynStack()<CR>
        "---???------------------------------------------------------------------------------------
                nmap <F5> <Plug>(qf_qf_toggle)
        "------------------------------------------------------------------------------------------
                nmap <F6> <Plug>(qf_loc_toggle)
        "------------------------------------------------------------------------------------------
                "-Next error/grep match
                map          <F7>       :FirstOrNextInList<CR>
                imap         <F7>       <C-O><F7>
                "-previous error/grep match
                map          <S-F7>      :PrevInList<CR>
                imap         <S-F7>      <C-O><S-F7>
                "-current error/grep match
                map          <C-F7>      :CurInList<CR>
                imap         <C-F7>      <C-O><C-F7>
        "-on-location-list-------------------------------------------------------------------------
                nmap <silent> <f8> :LocationToggle<cr>
                map         <S-F8>     :lopen<CR>
                imap        <S-F8>     <C-O><C-F8>
                map         <C-F8>     :lclose<CR>
                imap        <C-F8>     <C-O><S-F8>
                nnoremap <Leader>n :lnext<cr>zvzz
                nnoremap <Leader>b :lprev<cr>zvzz
        "-on-quickfix------------------------------------------------------------------------------
                nmap <silent> <F9> :QFixToggle<cr>
                map         <S-F9>     :copen<CR>
                imap        <S-F9>     <C-O><C-F9>
                map         <C-F9>     :cclose<CR>
                imap        <C-F9>     <C-O><C-F9>
                nnoremap <Leader>q :call ToggleQuickFix()<CR>
        "------------------------------------------------------------------------------------------
                nnoremap <LocalLeader>b :cprev<cr>zvzz
                nnoremap <LocalLeader>n :cnext<cr>zvzz
        "------------------------------------------------------------------------------------------
                noremap <C-F10> :SyntasticCheck<CR>
        "------------------------------------------------------------------------------------------
                nnoremap <F12> :TagbarToggle<CR>
        "------------------------------------------------------------------------------------------
                map <C-F12> :Scratch<CR>
                map <S-F12> :ScratchPreview<CR>
        "------------------------------------------------------------------------------------------
                nnoremap ff :call CscopeFindInteractive(expand('<cword>'))<CR>
                map <m-c> :cscope find c <C-R>=@m<CR><CR>
        "------------------------------------------------------------------------------------------
                nnoremap ZZ  <Nop> "-Disable-ZZ-
                map ZZ :source $MYVIMRC<CR>
                map EE :e $MYVIMRC<CR>
        "------------------------------------------------------------------------------------------
                "Ex: Pull word under cursor into LHS of a subs ztitute (replace)
                nnoremap <LocalLeader>w :%s#\<<C-r>=expand("<cword>")<CR>\>#
                nnoremap <LocalLeader>z :%s#\<<C-r>=getline(".")<CR>\>#
        "------------------------------------------------------------------------------------------
                "g:SignatureForceRemoveGlobal
                "-  m,           Place the next available mark
                "-  m.           If no mark on line, place the next available mark. Otherwise
                "-  m-           Delete all marks from the current line
                "-  m<Space>     Delete all marks from the current buffer
                "-  ]`           Jump to next mark
                "-  [`           Jump to prev mark
                "-  ]'           Jump to start of next line containing a mark
                "-  ['           Jump to start of prev line containing a mark
                "-  `]           Jump by alphabetical order to next mark
                "-  `[           Jump by alphabetical order to prev mark
                "-  ']           Jump by alphabetical order to start of next line having a mark
                "-  '[           Jump by alphabetical order to start of prev line having a mark
                "-  m/           Open location list and display marks from current buffer
        "------------------------------------------------------------------------------------------
                "nnoremap <silent> <expr> <leader>d ":\<C-u>".(&diff?"diffoff":"diffthis")."\<CR>"
                "nnoremap <leader>d ":\<C-u>".(&diff?"diffoff":"diffthis")."\<CR>"
                vmap  dg  :diffget<CR>
                vmap  dp  :diffput<CR>
                nnoremap do :diffoff!<cr>
        "------------------------------------------------------------------------------------------
        nnoremap ;d mayiw`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>
        inoremap <C-_> <space><bs><esc>:call InsertCloseTag()<cr>a
        "------------------------------------------------------------------------------------------
        map fv :VimFiler<CR>
        map fc :VimFilerCurrentDir<CR>
        "------------------------------------------------------------------------------------------
        " President group Hotel
        "------------------------------------------------------------------------------------------
        let g:tq_language=['en', 'ru', 'de', 'cn']
        "------------------------------------------------------------------------------------------
        "! setlocal completefunc=thesaurus_query#auto_complete_integrate
        "! vnoremap  <Leader>c "ky:ThesaurusQueryReplace <C-r>k<CR>
        "! nnoremap  <Leader>c :ThesaurusQueryReplaceCurrentWord<CR>
        "! nnoremap <LocalLeader>c :ThesaurusQueryReplaceCurrentWord<CR>
        "! vnoremap <LocalLeader>c "ky:ThesaurusQueryReplace <C-r>k<CR>
        "! sudo apt install translate-shell
        "---BigList-800----------------------------------------------------------------------------
        let g:switch_mapping = "-"
        let g:switch_custom_definitions =
                                \ [
                                \   ['green', 'yellow', 'red']
                                \,
                                \   ['one', 'two', 'three']
                                \ ]
        "------------------------------------------------------------------------------------------
        let b:switch_custom_definitions = [
        \   {
        \     '\<[a-z0-9]\+_\k\+\>': {
        \       '_\(.\)': '\U\1'
        \     },
        \     '\<[a-z0-9]\+[A-Z]\k\+\>': {
        \       '\([A-Z]\)': '_\l\1'
        \     },
        \   }
        \ ]

        "------------------------------------------------------------------------------------------
        nnoremap <silent> } :<C-U>call ParagraphMove( 1, 0, v:count)<CR>
        nnoremap <silent> { :<C-U>call ParagraphMove(-1, 0, v:count)<CR>
        "------------------------------------------------------------------------------------------
        "" Open current line on GitHub
        noremap ,o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>
        "------------------------------------------------------------------------------------------
        " If the cursor is on foo_bar_baz , then switching would produce "fooBarBaz"
        " and vice-versa. The logic is as follows:
        " one two red

        " inoremap <silent> <leader>t <ESC>:Trans<CR>
        " nnoremap <silent> <leader>t :Trans<CR>
        " vnoremap <silent> <leader>t :Trans<CR>
        " nnoremap <silent> <leader>td :TransSelectDirection<CR>
        " vnoremap <silent> <leader>td :TransSelectDirection<CR>
        "------------------------------------------------------------------------------------------
        "nnoremap  ;t  :UndotreeToggle<cr>
        "------------------------------------------------------------------------------------------
        let g:undoquit_mapping = ';q'  "c-w u 
        "------------------------------------------------------------------------------------------
        " double comma for limited virtual keyboards                    {{{2
        map             ,,              :update<CR>
        imap            ,,              <ESC>
        " open a file in the same dir as the current one                {{{2
        map <expr>      ,E              ":e ".curdir#get()."/"
        " open a file with same basename but different extension        {{{2
        map <expr>      ,R              ":e ".expand("%:r")."."
        "------------------------------------------------------------------------------------------
        " Undo in insert mode                                           {{{2
        " make it so that if I accidentally press ^W or ^U in insert mode,
        " then <ESC>u will undo just the ^W/^U, and not the whole insert
        " This is documented in :help ins-special-special, a few pages down
        inoremap <C-W> <C-G>u<C-W>
        inoremap <C-U> <C-G>u<C-U>
        "------------------------------------------------------------------------------------------
        " Toggle between .c (.cc, .cpp) and .h                          {{{2
        " ToggleHeader defined inHOME/.vim/plugin/cpph.vim
        " Maybe these mappings should be moved into FT_C() ?
        map             ,h              :call ToggleHeader()<CR>
        map             <C-F6>          ,h
        imap            <C-F6>          <C-O><C-F6>

        "------------------------------------------------------------------------------------------
        " Split previously opened file ('#') in a split window
        nnoremap <leader>sh :execute "leftabove vsplit" bufname('#')<cr>
        nnoremap <leader>sl :execute "rightbelow vsplit" bufname('#')<cr>

        "------------------------------------------------------------------------------------------
        " Smart-quote a paragraph
        vnoremap ' :s/'/’/<cr>
        "------------------------------------------------------------------------------------------
        " Creating underline/overline headings for markup languages
        nnoremap <leader>1 yyPVr=jyypVr=
        nnoremap <leader>2 yyPVr*jyypVr*
        nnoremap <leader>3 yypVr=
        nnoremap <leader>4 yypVr-
        nnoremap <leader>5 yypVr^
        nnoremap <leader>6 yypVr"
        "------------------------------------------------------------------------------------------
        "-Python-$-pydoc
        " au FileType python nnoremap H :exec "!pydoc" expand("<cword>")<CR>
        "------------------------------------------------------------------------------------------
        "-Vim-:help-
        au FileType vim,help nnoremap K :exec "help" expand("<cword>")<CR>

"-7-}}}

        " extradite {{{ A git commit log browser that extends fugitive.vim
            " :Extradite | :Extradite! -- vertical.
            " nnoremap <F9> :Extradite<cr>
            " let g:extradite_width = 60
            let g:extradite_showhash = 1 " show abbre commit hashes.
        " }}}

        " Digraphs                                                      {{{2
        if has("digraphs")
                digraph -- 8212               " em dash
                digraph `` 8220               " left double quotation mark
                digraph '' 8221               " right double quotation mark
                digraph ,, 8222               " double low-9 quotation mark
        endif
        "------------------------------------------------------------------------------------------
        let g:templates_user_variables = [
                                \   ['FULLPATH', 'GetFullPath'],
                                \ ]

        function! GetFullPath()
                return expand('%:p')
        endfunction

        "-???--------------------------------------------------------------------------------------
        let g:project_use_nerdtree = 1
        set rtp+=~/.config/nvim/plugged/vim-project/
        call project#rc("~/git/aTest/dotFiles/")
        Project  'scratch'
        Project  'nVim'
        File     'nVim/ninitOkt18.vim'                 , 'vimrc'
        File     'nVim/nPlug.vim'                      , 'plugged'
        "------------------------------------------------------------------------------------------
        function! FT_Mako()
                setf html
                setlocal includeexpr=substitute(v:fname,'^/','','')
                setlocal indentexpr=
                setlocal indentkeys-={,}
                map <buffer> <C-F6>  :SwitchCodeAndTest<CR>
        endf
        "------------------------------------------------------------------------------------------
        augroup Mako_templ
                autocmd!
                autocmd BufRead,BufNewFile *.mako call FT_Mako()
        augroup END
        "========================================================================================
        " Highlight words to avoid in tech writing
        "==================================================================================
        "   http://css-tricks.com/words-avoid-educational-writing/
        highlight TechWordsToAvoid ctermbg=red ctermfg=white
        match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
        autocmd BufWinEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
        autocmd InsertEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
        autocmd InsertLeave * match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
        autocmd BufWinLeave * call clearmatches()


        " AutoPairs {{{
                " shortcuts:
                "   <M-o> : newline with indentation
                "   <M-a> : jump to of line
                "   <M-n> : jump to next pairs
                "   <M-e> : jump to end of pairs.
                "   Ctrl-V ) : insert ) without trigger the plugin.
            "let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
            let g:AutoPairsShortcuts = 1
            " let g:AutoPairscutToggle = '<another key>'
                " if bellowing keys conflict with others
            let g:AutoPairsShortcutToggle = '<M-p>'
            let g:AutoPairsShortcutFastWrap = '<M-e>'
            let g:AutoPairsShortcutJump = '<M-n>'
            let g:AutoPairsShortcutBackInsert = '<M-b>'
            let g:AutoPairsMapBS = 1
            let g:AutoPairsMapCR = 0 " insert a new indented line if cursor in pairs.
                " error in vimwiki <CR> Enter. but use upper inoremap can solve.
            let g:AutoPairsMapSpace = 0
                " error in abbreviations <space> auto expand.
            let g:AutoPairsCenterLine = 1
            let g:AutoPairsFlyMode = 0
        " }}}



