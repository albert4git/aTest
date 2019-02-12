"-"-"-"-"-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-NeoVimMix65FZF-NV-Unite"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"
" File: start1ninit19.vim
" Author: red
" Last Modified: 11 Feb 2019
"======================================================================================================================


"-AAA15-Plug2Start---------------------------------------------------------------------------------------------{{{
call plug#begin('~/.config/nvim/plugged/')
        Plug 'tyru/capture.vim'
                ":Capture mes
                ":Capture map | map! | lmap
                ":Capture scriptnames
                ":Capture digraphs

        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
                let g:airline_theme='light'
                set showmode                "-Display the current mode
                set showcmd                 "-Show partial commands in status line 
                "--------------------------------------------------------------------------
                let g:airline_section_c = '%{strftime("%Y %b %d %X")}'
                let g:airline#extensions#tabline#enabled = 2
                let g:airline#extensions#tabline#buffer_min_count = 1
                "-----------------------------------------------------------
                let g:airline#extensions#syntastic#enabled = 1
                let g:airline#extensions#branch#enabled = 1
                "-----------------------------------------------------------
                if !exists('g:airline_symbols')
                        let g:airline_symbols = {}
                endif
                "--------------------------------------------------------------------------
                hi statusline ctermbg=10 ctermfg=Black  cterm=bold
                hi StatusLineNC  ctermbg=5 ctermfg=0 cterm=NONE
        "----------------------------------------------------------------------------------- 
        Plug 'tpope/vim-tbone'
        Plug 'tmux-plugins/vim-tmux'
        Plug 'xolox/vim-misc'
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-repeat'
        Plug 'thinca/vim-quickrun'
        Plug 'ivyl/vim-bling'
                let g:bling_time = 42
                let g:bling_color_fg = 'green'
                let g:bling_color_cterm = 'reverse'
        Plug 'tpope/vim-unimpaired'  "Handy bracket mappings.
        Plug 'tpope/vim-eunuch'
                "-------------------------------------------------------------------------
                " :Delete: Delete a buffer and the file on disk simultaneously.
                " :Unlink: Like :Delete, but keeps the now empty buffer.
                " :Move: Rename a buffer and the file on disk simultaneously.
                " :Rename: Like :Move, but relative to the current file's containing directory.
                " :Chmod: Change the permissions of the current file.
                " :Mkdir: Create a directory, defaulting to the parent of the current file.
                " :Cfind: Run find and load the results into the quickfix list.
                " :Clocate: Run locate and load the results into the quickfix list.
                " :Lfind/:Llocate: Like above, but use the location list.
                " :Wall: Write every open window. Handy for kicking off tools like guard.
                " :SudoWrite: Write a privileged file with sudo.
                " :SudoEdit: Edit a privileged file with sudo.

        "----------------------------------------------------------------------------------
        Plug 'tpope/vim-sleuth'         " indet reight ?
        "----------------------------------------------------------------------------------
        Plug 'tpope/vim-fugitive'
                """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                " vnoremap <leader>H :Gbrowse<cr>
                " nnoremap <leader>H V:Gbrowse<cr>
                " vnoremap <leader>u :Gbrowse @upstream<cr>
                " nnoremap <leader>u V:Gbrowse @upstream<cr>
                " auto open quickfix window for :Ggrep.
                " nnoremap <leader>gs :Gstatus<CR>
                " nnoremap <leader>gc :Gcommit -v -q<CR>
                " nnoremap <leader>ga :Gcommit --amend<CR>
                " nnoremap <leader>gt :Gcommit -v -q %<CR>
                " nnoremap <leader>gd :Gdiff<CR>
                " nnoremap <leader>ge :Gedit<CR>
                " nnoremap <leader>gr :Gread<CR>
                " nnoremap <leader>gw :Gwrite<CR><CR>
                " nnoremap <leader>gl :silent! Glog<CR>
                " nnoremap <leader>gp :Ggrep<Space>
                " nnoremap <leader>gm :Gmove<Space>
                " nnoremap <leader>gb :Git branch<Space>
                " nnoremap <leader>go :Git checkout<Space>
                " nnoremap <leader>gps :Dispatch! git push<CR>
                " nnoremap <leader>gpl :Dispatch! git pull<CR>
                " With that configuration, my workflow is:
                " <leader>gl to view history
                " ]q and [q to move between versions (unimpaired.vim)
                " <leader>gd to open diff
                " :q to end diff
                """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "------------------------------------------------------------------------------------------
        Plug 'haya14busa/incsearch.vim'
        Plug 'vim-scripts/SearchComplete'
        "--------------------------------------------------------------------------------- 
        Plug 'guns/xterm-color-table.vim'
        "--------------------------------------------------------------------------------- 
        Plug 'mtth/scratch.vim'
        "----------------------------------------------------
        Plug 'henrik/vim-qargs'
        "----------------------------------------------------
        Plug 'maxbrunsfeld/vim-yankstack'
                nmap zp <Plug>yankstack_substitute_older_paste
                nmap zn <Plug>yankstack_substitute_newer_paste
        "--------------------------------------
        Plug 'mileszs/ack.vim'
        Plug 'jremmen/vim-ripgrep'
        "--------------------------------------
        Plug 'Shougo/unite.vim' 
        Plug 'tsukkee/unite-tag'
        Plug 'SpaceVim/unite-ctags'
        Plug 'Shougo/unite-outline/'
        Plug 'tsukkee/unite-help'
        Plug 'rstacruz/vim-fastunite'
        Plug 'kmnk/vim-unite-giti'
        "--------------------------------------
        Plug 'cskeeters/unite-fzf'
        Plug 'junegunn/fzf'
        Plug 'pbogut/fzf-mru.vim'
        Plug 'junegunn/fzf.vim'

        "------------------------------------------------------------------
        Plug 'ddrscott/vim-side-search'
        " How should we execute the search?
        " --heading and --stats are required!
        let g:side_search_prg = 'ag --word-regexp'
                                \. " --ignore='*.js.map'"
                                \. " --heading --stats -B 1 -A 4"
        "---------------------------------------------------------
                " Can use `vnew` or `new`
                let g:side_search_splitter = 'vnew'
                " I like 40% splits, change it if you don't
                let g:side_search_split_pct = 0.4
                " SideSearch current word and return to original window
                nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p
                " Create an shorter `SS` command
                command! -complete=file -nargs=+ SS execute 'SideSearch <args>'
                " or command abbreviation
                cabbrev SS SideSearch
        "-------------------------------------------------------------------------
        Plug 'exvim/ex-matchit'
        "-------------------------------------------------------------------------
        Plug 'AndrewRadev/undoquit.vim'
                let g:undoquit_mapping = ';q' 
                "---c-w+u------ 
        "------------------------------------------------------------------------------------------
        Plug 'majutsushi/tagbar'
                highlight TagbarHighlight   ctermfg=051 ctermbg=9 cterm=bold
                highlight TagListTagName    ctermfg=250
                highlight TagbarFoldIcon    ctermfg=051 ctermbg=9 
                highlight TagbarHelp        ctermfg=051 ctermbg=9
        Plug 'vim-scripts/tagselect'
        Plug 'ludovicchabant/vim-gutentags'
        Plug 'vim-scripts/genutils'
        Plug 'Yggdroot/indentLine'
                let g:indentLine_enabled = 1
                let g:indentLine_noConcealCursor='nc'
                let g:indentLine_color_term = 9
                "let g:indentLine_setConceal = 0
                "let g:indentLine_bgcolor_term = 202
        "------------------------------------------------------------------------------------------
        Plug 'w0rp/ale'
                "Linting
                let g:ale_sign_column_always = 1
                let g:ale_sign_error = '>>'
                let g:ale_sign_warning = '--'
                let g:ale_linters = {
                                        \   'javascript': ['eslint'],
                                        \   'jsx': ['eslint'],
                                        \   'python': ['flake8'],
                                        \}
        "------------------------------------------------------------------------------------------
        Plug 'haya14busa/incsearch.vim'
        Plug 'vim-scripts/SearchComplete'
        "--------------------------------------------------------------------------------- 

        Plug 'xolox/vim-easytags'
               let g:easytags_file = '~/.nvimtags'
               let g:easytags_auto_highlight = 1
               let g:easytags_syntax_keyword = 'always'
               let g:easytags_events = ['BufWritePost']
               let g:easytags_async = 1

  nmap <F3>  :sp tags<CR>:%s/^\([^	:]*:\)\=\([^	]*\).*/syntax keyword Tag \2/<CR>:wq! htags.vim<CR>/^<CR><F4>
  nmap <F4>  :so htags.vim<CR>

call plug#end()
"-5plug2Stop-}}}



"-AAA2-------------------------------------------------------------------------------------------------{{{
        "Ex: :Ex Pull word under cursor into :Ex LHS of a subs ztitute (replace)
        "1y$  //yank current row to register 1
        "<C-r>a to paste from register a
        nnoremap <LocalLeader>w :<C-r>=expand("<cword>")<CR>
        nnoremap <LocaLeader>z :<C-r>=getline(".")<CR>
        "------------------------------------------------------------------------------------------
        function! ScriptExecute()
                :!chmod u+x %
                :w
        endfunction
        "------------------------------------------------------------------------------------------
        augroup ScriptExecutePermission
                autocmd!
                autocmd BufWritePost *.sh :call ScriptExecute()
        augroup END
        "------------------------------------------------------------------------------------------
        augroup SourceVimrc
                autocmd!
                autocmd bufwritepost .vimrc source $MYVIMRC
        augroup END
        "------------------------------------------------------------------------------------------
        set diffopt+=vertical 
        "???2019
        set iskeyword+=.
        "------------------------------------------------------------------------------------------
        "char = can be removed from the list of valid filename char. JAVA_HOME=/opt/java/jdk1.4
        set isfname-==
        "------------------------------------------------------------------------------
        setlocal spell
        set nospell
        set spelllang=en_us
        set spellsuggest=best
        " set spelllang=de,tech_speak spell
        " set spellfile=~/.vim/spell/techspeak.utf-8.add
        " set spellfile=~/.vim/spell/en.utf-8.add           " 'zg': add, 'zw': remove.
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
        "???, disable the zg (add to dictionary) shortcut
        nnoremap zg z=
        "------------------------------------------------------------------------------------------
        " error: zg, zG, zw, zW, zug, zuG, zuw,
        " zuW, z=, u
        " For z=, all identical misspellings in the buffer are
        " replaced with the chosen suggestion (via :spellrepall).
        "------------------------------------------------------------------------------------------
        " I use two languages: Lithuanian and English. But I also want to add
        " a special pseudo-language to contain identifiers extracted from tags
        " file (this will eliminate false hits like printf).
        " set spelllang=lt,en,fromtags
        " https://rtfb.lt/projects/vim-dox-spell/index.html
        "------------------------------------------------------------------------------------------
        "- go to last edit position when opening files -
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
        set autowrite  " Writes on make/shell commands
        set cf         " Enable error files & error jumping.
        set nu
"-2Remap-}}}




"-AAA3-Tag8------------------------------------------------------------------------------------------------{{{
        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
                let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
        set tags+=tags,./tags,../tags,../../tags,../../../tags,../../../../tags,~/.nvimtags

"-3--}}}


"-AAA15-PlugAStart------------------------------------------------------------------------------------------{{{
"-5plugAStop-}}}



"-aaa20-PrePLAY0-remap---------------------------------------------------------------------------------------{{{
        inoremap jk <esc>
        "-Unfuck--my--screen------------------------------------
        nnoremap fu :syntax sync fromstart<cr>:redraw!<cr>
        "------------------------------------------------------------------------------------------
        nnoremap zu :<c-u>update<cr>
        "------------------------------------------------------------------------------------------
        nnoremap ;e :ls<cr>:b<space>
        nnoremap ;v <c-w>v<c-w>l
        "------------------------------------------------------------------------------------------
        nnoremap ;f :set tw=70<cr>v<s-}>gq<end>
        nnoremap W gwip
        "------------------------------------------------------------------------------------------
        "Number 7: Align Current Paragraph 
        noremap <LocalLeader>a =ip
        "------------------------------------------------------------------------------------------
        imap            ;;              <ESC>
        "-open a file with same basename but different extension        
        map <expr>      ,R              ":e ".expand("%:r")."."
        "------------------------------------------------------------------------------------------
        nnoremap ( <c-x>:y x\|@x<cr>
        nnoremap ) <c-a>:y x\|@x<cr>
        "------------------------------------------------------------------------------------------
        "???makes macros even easier to remember: hit qq to record, q to stop recording, and Q to apply.
        nnoremap Q @q
        vnoremap Q :norm @q<cr>
        "------------------------------------------------------------------------------------------
        nmap q <nop>
        nnoremap q q
        nnoremap ss :wa<cr>
        nnoremap qq :wa<cr> :bd<cr>
        nnoremap qs :wa<cr> :qa<cr>
        nnoremap qa :qa!<cr>
        nnoremap ge :w<cr>:e #<cr>
        nnoremap qw <C-w>q<CR>
        nnoremap qo <C-w>o<CR>
        "------------------------------------------------------------------------------------------
        nnoremap ZZ  <Nop> 
        nnoremap ZZ mzzt3<c-u>`z
        nnoremap zs mzzt3<c-u>`z
        nnoremap zx mzzt35<c-u>`z
        nnoremap zh mzzt10<c-u>`z
        nnoremap EE :source $MYVIMRC<CR>
        nnoremap BB ggVG
        "------------------------------------------------------------------------------------------
        nnoremap <BS> X
        "-it's-2018--------------------------------------------------------------------------------
        noremap j gj
        noremap k gk
        noremap gj j
        noremap gk k
        "-Bash-like-keys-for-the-command-line
        cnoremap <C-A> <Home>
        cnoremap <C-E> <End>
        cnoremap <C-d> <Del>
        "Same when jumping around
        nnoremap <c-o> <c-o>zz
        nnoremap <c-i> <c-i>zz
        "Yank to end of line
        nnoremap Y y$
        "-HHJ- Keep the cursor in place while joining lines
        nnoremap H mzJ`z
        "Split?? The normal use of S is covered by cc, so don't worry about shadowing it.
        nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w
        "-Reselect-last-pasted text----------------------------------------------------------------
        nnoremap gv `[v`]
        "------------------------------------------------------------------------------------------
        noremap \\ #*
        "------------------------------------------------------------------------------------------
        " make it so that if I acidentally pres ^W or ^U in insert mode,
        " then <ESC>u wil undo just the ^W/^U, and not the whole insert
        " This is docmented in :help ins-special-special, a few pages down
        inoremap <C-W> <C-G>u<C-W>
        inoremap <C-U> <C-G>u<C-U>
        "------------------------------------------------------------------------------------------
        vmap     dg  :dffget<CR>
        vmap     dp  :diffput<CR>
        nnoremap do  :diffoff!<cr>
        "------------------------------------------------------------------------------------------
        inoremap <C-_> <space><bs><esc>:call InsertCloseTag()<cr>a
"-20Remap-}}}

"-AAA14-Cyan------------------------------------------------------------------------------------------------{{{
        highlight DiffChange        cterm=bold ctermbg=7 
        "------------------------------------------------------------------------------------------
        if has('spell')
                        hi SpellBad     ctermfg=11    ctermbg=160
                        hi SpellCap     ctermfg=11    ctermbg=166
                        hi SpellLocal   ctermfg=11    ctermbg=9
        endif
        "------------------------------------------------------------------------------------------
        "highlight conflict markers
        highlight ErrorMsg  ctermfg=red ctermfg=white
        match ErrorMsg '\v^[<\|=|>]{7}([^=].+)?$'
        "shortcut to jump to next conflict marker
        nnoremap <silent> <leader>c /\v^[<\|=>]{7}([^=].+)?$<CR>
        "------------------------------------------------------------------------------------------
        highlight Folded ctermbg=10
        highlight FoldColumn ctermbg=9 ctermfg=0 guibg=#ffffd7
        highlight DiffText ctermbg=1
        "------------------------------------------------------------------------------------------
                hi Define         ctermfg=11       ctermbg=22 
                hi MatchParen     ctermfg=11       ctermbg=39  cterm=bold
                hi Delimiter      ctermfg=51       ctermbg=56  cterm=bold
                "--------------------------------------------------------------------------
                hi NonText        ctermfg=201      ctermbg=88 
                hi Error          ctermfg=196      ctermbg=232  
                hi ErrorMsg       ctermfg=196      ctermbg=232  
                hi Exception      ctermfg=201      ctermbg=103 
                hi Keyword        ctermfg=201      ctermbg=1 
                hi Label          ctermfg=201      ctermbg=3 
                "--------------------------------------------------------------------------
                "--------------------------------------------------------------------------
                set tabpagemax=15
                set signcolumn=yes
                hi signcolumn  ctermbg=10
                let w:persistent_cursorline = 1
                hi Search  ctermbg=11 ctermfg=9 term= bold
                set cursorcolumn
                hi CursorLine                  ctermbg=8
                set matchtime=3
                set linebreak
                set showbreak=↪
                "------------------------------------------------------------------------------------------
                set guifont=Monospace\ 16
                set cinwords=if,else,while,do,for,switch,case
                hi CursorColumn    ctermbg=8
                hi ColorColumn     ctermbg=22
                set colorcolumn=8,92,100,112,120
                hi LineNr ctermfg=16 ctermbg=40 
                hi Normal  ctermbg=234
                highlight Visual cterm=bold ctermbg=2 ctermfg=NONE
                set list
                set listchars=tab:▸\
                hi Cursor ctermbg=2 term= bold
                hi Comment         ctermfg=14
                hi Number          ctermfg=11
                set matchpairs=(:),{:},[:],<:>
                "set colorcolumn=+1
                "set nuw =5
                "-------------------------------------------------------------------------------
                "au! BufNewFile,BufRead *.vim, *.html, *.css
                "                       \ set tabstop=8
                "                       \ set softtabstop=8
                "                       \ set shiftwidth=8
                "                       \ set colorcolumn=2,92,100,112,120
                "-------------------------------------------------------------------------------

"-14Cyan-}}}
