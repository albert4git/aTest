        set nocompatible
        set encoding=utf-8

        let install_plugs=0
        let vim_plug=expand('~/.vim/autoload/plug.vim')
        if !filereadable(vim_plug)
            echo "Installing vim-plug.."
            echo ""
            let autoload_dir=$HOME . "/.vim/autoload"
            if !isdirectory(autoload_dir)
                call mkdir(autoload_dir, "p", 0700)
            end
            if executable('wget') == 1
                silent !wget -O .vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            elseif executable('curl') == 1
                silent !curl -o .vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            else
                let uname=system('uname')
                if uname =~ "OpenBSD"
                    silent !ftp -o .vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                else
                    echo "Can't find any suitable program to download vim-plug. Aborting."
                    echo ""
                    exit 1
                endif
            endif
            let install_plugs=1
        endif
        call plug#begin('~/.vim/plugged')
        Plug 'davidhalter/jedi-vim' " Python auto-complete
        Plug 'tpope/vim-fugitive' " Git extras
        Plug 'tpope/vim-repeat'
        Plug 'bling/vim-airline'
        Plug 'w0rp/ale' " Asynchronous linting
        Plug 'mhinz/vim-signify' " Show diff +/- signs on LHS of screen
        Plug 'sjl/gundo.vim' " Tree of undos
        Plug 'rust-lang/rust.vim' " Rust support
        if executable('rustc') == 1
            "Plug 'phildawes/racer' " Rust autocomplete
            Plug 'racer-rust/vim-racer'
        endif
        Plug 'Shougo/neocomplete.vim'
        Plug 'Shougo/echodoc.vim'
        Plug 'Shougo/context_filetype.vim'
        Plug 'tpope/vim-sensible'
        Plug 'kien/ctrlp.vim' " Fuzzy filename matcher
        Plug 'tacahiroy/ctrlp-funky' " Search for functions in the current file (Ctrl-P and Ctrl-B)
        Plug 'FelikZ/ctrlp-py-matcher' " Speeds up CtrlP
        Plug 'ap/vim-css-color'
        Plug 'bling/vim-bufferline' " Show the list of buffers in the command bar
        Plug 'Lokaltog/vim-easymotion'
        Plug 'haya14busa/incsearch.vim'
        Plug 'haya14busa/incsearch-easymotion.vim' " Clever searching (also use 'h' for navigation)
        Plug 'mhinz/vim-grepper' " Async grep with ':Grepper <search>'
        Plug 'SammysHP/vim-heurindent' " Automatically adjust 'shiftwidth' and 'expandtab'
        Plug 'tpope/vim-endwise' " Automatically add 'end' keywords to some languages
        Plug 'morhetz/gruvbox' " Nice colour scheme
        Plug 'edkolev/tmuxline.vim'
        Plug 'scrooloose/nerdcommenter' " Comment / uncomment blocks (<leader>cc <leader>cu)
        Plug 'vim-scripts/mako.vim' " Mako plugins
        Plug 'majutsushi/tagbar' " F8 folding
        Plug 'nathanaelkane/vim-indent-guides' " Visually highlight indent levels <leader>ig
        Plug 'lervag/vimtex'
        Plug 'dietsche/vim-lastplace' " Open cursor at last place in the file
        Plug 'ntpeters/vim-better-whitespace' " Highlight whitespace at end of lines
        Plug 'tpope/vim-speeddating' " Increment dates and other things correctly with <C-A>/<C-X>
        Plug 'svermeulen/vim-easyclip' " Simplified clipboard functionality
        Plug 'neitanod/vim-clevertab' " Allow the <Tab> key to call other plugins when appropriate
        Plug 'kana/vim-textobj-user' " Needed by other plugins
        Plug 'reedes/vim-textobj-sentence' " Make sentence moving ('('/')') more sensible
        Plug 'reedes/vim-textobj-quote' " Smart Unicode quotes (e.g. â€˜â€™ vs ''). Select a block,
                                        " and use <leader>qc to turn quotes into smart quotes
        Plug 'jceb/vim-orgmode' " Support for .org files
        Plug 'kshenoy/vim-signature' " See where marks are set ('m/' for a list of marks; 'dmx'
                                    " to delete all marks)
        Plug 'othree/eregex.vim' " Use '%S/find/replace/' for perl-esque regex search and replace
        Plug 'neomutt/neomutt.vim' " Syntax highlighting for neomutt
        call plug#end()

        "...All your other bundles...
        if install_plugs == 1
            echo "Installing plugins (ignore key map error messages)"
            echo ""
            :PlugInstall
        endif

        set mousehide		" Hide the mouse when typing text
        set showmatch
        set incsearch
        set hlsearch
        set ignorecase
        set smartcase
        set wildmenu
        set wildmode=list:longest
        set guioptions-=T
        set guioptions-=m
        set hidden
        set shortmess+=filmnrxoOtT  " Abbrev. of messages (avoids 'hit enter')
        set history=10000           " Store lots of history (default is 20)
        set backspace=indent,eol,start
        set ttyfast
        set tw=80
        set fo=cq
        set tabstop=4
        set softtabstop=4
        set expandtab
        inoremap <S-Tab> <C-V><Tab>
        set softtabstop=4
        set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
        set autoindent
        set display+=lastline
        set nojoinspaces
        set lazyredraw

        set spelllang=en_gb

        " Basic editing sanity

        nnoremap <Down> gj
        nnoremap <Up> gk
        noremap <BS> <Left>X
        inoremap <S-BS> <C-o>db
        noremap <S-BS> db
        inoremap <S-Del> <C-o>dw
        noremap <S-Del> dw


        " Misc

        let output=system("find ~/.vim/spell/en.utf-8.add -cnewer ~/.vim/spell/en.utf-8.add.spl | wc -l")
        if str2nr(output) == 1
            mkspell! ~/.vim/spell/en.utf-8.add
        endif
        let g:tex_flavor='latex'
        let g:tex_conceal=''
        filetype plugin indent on
        autocmd FileType mail set spell |
          \ set textwidth=76 |
          \ let &colorcolumn=join(range(81,9999), ',')

        autocmd FileType html,markdown,python,rust,tex set spell

        autocmd FileType html,tex autocmd BufEnter * :syntax sync fromstart

        autocmd FileType gitcommit set spell |
          \ set textwidth=80 |
          \ let &colorcolumn=join(range(81,9999), ',')

        au BufRead,BufNewFile *.cv set filetype=converge
        au BufRead,BufNewFile */blog/entries/* set filetype=html


        " Airline

        set laststatus=2
        let g:airline_theme             = 'gruvbox'
        let g:airline#extensions#branch#enabled    = 1
        let g:airline#extensions#ale#enabled = 1
        if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif
        let g:airline_left_sep = 'â–¶'
        let g:airline_right_sep = 'â—€'
        let g:airline_symbols.branch = 'âŽ‡'
        let g:airline_symbols.paste = 'âˆ¥'
        let g:airline_symbols.linenr = 'Â¶'
        let g:airline_symbols.whitespace = 'Îž'
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#bufferline#enabled = 0


        " Bufferline

        let g:bufferline_echo = 0
        let g:bufferline_rotate = 2
        let g:bufferline_fname_mod = ':.'
        nmap <C-PageUp> :bp!<CR>
        imap <C-PageUp> <C-o>:bp!<CR>
        nmap <C-PageDown> :bn!<CR>
        imap <C-PageDown> <C-o>:bn!<CR>


        " Ctrl-P

        let g:ctrlp_by_filename = 0
        let g:ctrlp_regexp = 0
        let g:ctrlp_working_path=0
        let g:ctrlp_match_window = 'order:ttb,min:10,max:100,results:100'
        let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
        let g:ctrlp_max_files = 0
        let g:ctrlp_clear_cache_on_exit = 1
        let g:ctrlp_custom_ignore = '\.(class|o|rlib|swp|pyc)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'

        if executable('ag')
            let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
        else
            let s:ctrlp_fallback = 'find %s -type f'
        endif
        if exists("g:ctrlp_user_command")
            unlet g:ctrlp_user_command
        endif
        let g:ctrlp_user_command = {
            \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
                \ 2: ['.hg', 'ag %s --files-with-matches -g ""'],
            \ },
            \ 'fallback': s:ctrlp_fallback
        \ }

        nmap <C-b> :CtrlPBuffer<CR>
        imap <C-b> <C-o>:CtrlPBuffer<CR>
        nmap <C-p> :CtrlPMixed<CR>
        imap <C-p> <C-o>:CtrlPMixed<CR>


        " Funky

        nnoremap <C-f> :CtrlPFunky<Cr>
        let g:ctrlp_funky_matchtype = 'path'
        let g:ctrlp_funky_syntax_highlight = 1


        " Gundle
        nnoremap <F5> :GundoToggle<CR>


        " Jedi

        "let g:jedi#auto_initialization = 0
        let g:jedi#popup_on_dot = 0
        "autocmd FileType python setlocal completeopt-=preview
        let g:jedi#show_call_signatures = 0
        let g:jedi#use_tabs_not_buffers = 0
        let g:jedi#goto_command = "gd"
        let g:jedi#documentation_command = "K"
        let g:jedi#usages_command = "<leader>n"
        let g:jedi#rename_command = "<leader>r"


        " gruvbox

        syntax enable
        set background=dark
        function! Togglebg()
            if &background == "dark"
                set background=light
            else
                set background=dark
            endif
        endfunction
        colorscheme gruvbox
        map <silent> <F6> :call Togglebg()<CR>
        imap <silent> <F6> <ESC>:call Togglebg()<CR>a
        vmap <silent> <F6> <ESC>:call Togglebg()<CR>gv


        " Sy

        let g:signify_vcs_list = ['hg', 'git']


        " echodoc

        set cmdheight=2 " Set height of bottom status bar to 2
        let g:echodoc_enable_at_startup = 1


        " neocomplete

        let g:acp_enableAtStartup = 0
        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#sources#syntax#min_keyword_length = 3
        let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
        let g:neocomplete#enable_smart_case = 1
        let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
        let g:neocomplete#enable_auto_delimiter = 1
        set completeopt-=preview
        let g:neocomplete#enable_auto_close_preview=1
        let g:neocomplete#sources#dictionary#dictionaries = {
                    \ 'default' : '',
                    \ }
        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '' "'\h\w*'
        inoremap <expr><C-g>     neocomplete#undo_completion()
        inoremap <expr><C-l>     neocomplete#complete_common_string()

        let g:neocomplete#enable_auto_select = 1
        let g:neocomplete#disable_auto_complete = 1

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType mail,tex NeoCompleteLock

        if !exists('g:neocomplete#sources#omni#input_patterns')
          let g:neocomplete#sources#omni#input_patterns = {}
        endif
        if !exists('g:neocomplete#force_omni_input_patterns')
          let g:neocomplete#force_omni_input_patterns = {}
        endif

        let g:neocomplete#sources#omni#input_patterns.rust = '[^.[:digit:] *\t]\%(\.\|\::\)\%(\h\w*\)\?'


        " EasyMotion and incsearch

        let g:EasyMotion_do_mapping = 0 " Disable default mappings
        let g:EasyMotion_smartcase = 1
        let g:EasyMotion_use_upper = 1
        let g:incsearch#auto_nohlsearch = 1
        map n  <Plug>(incsearch-nohl-n)
        map N  <Plug>(incsearch-nohl-N)
        map *  <Plug>(incsearch-nohl-*)
        map #  <Plug>(incsearch-nohl-#)
        map g* <Plug>(incsearch-nohl-g*)
        map g# <Plug>(incsearch-nohl-g#)
        map / <Plug>(incsearch-easymotion-/)
        map ? <Plug>(incsearch-easymotion-?)
        map h <Plug>(easymotion-bd-w)
        omap h <Plug>(easymotion-bd-w)
        vmap h <Plug>(easymotion-bd-w)


        " ack.vim

        if executable('ag')
          let g:ackprg = 'ag --vimgrep'
        endif


        " tmuxline

        let g:tmuxline_preset = {
            \'c': '#(whoami)@#h',
                \'win'     : '#T',
                \'cwin'    : '#T',
                \'y'       : '%Y-%m-%d %l:%M%p',
                \'z'       : '#W',
                \'options' : {'status-justify': 'left'}}


        " Email formatting

        command -range=% -nargs=* EmailFormat <line1>,<line2>!email_format

        fun EmailFormatBuffer()
            let Pos = line2byte( line( "." ) )
            :EmailFormat
            exe "goto " . Pos
        endfun

        fun InsertFile(f)
            let p = '~/.vim/' . a:f
            :exe "read " . p
        endfunction

        nnoremap <F2> :call EmailFormatBuffer()<CR>
        vnoremap <F2> :Email_format<CR>
        nnoremap <F3> :call InsertFile('sig_normal')<CR>
        nnoremap <S-F3> :call InsertFile('sig_kings')<CR>
        inoremap <F3> <Esc>:call InsertFile('sig_normal')<CR>
        inoremap <S-F3> <Esc>:call InsertFile('sig_kings')<CR>
        inoremap <f4> <Esc>O<Esc>:call InsertFile('reminder')<CR>
        nnoremap <f4> O<Esc>:call InsertFile('reminder')<CR><Esc>ggJ$a<Left>


        " Rust (including Racer, an auto-completer for Rust)

        let racer_dir=$HOME . "/.vim/racer"
        if executable('rustc')
            if !isdirectory(racer_dir)
                echo "Downloading and building racer and rust in the background."
                echo "This will take some time. Whilst this is ongoing, you may quit"
                echo "this VIM and start others without issue."
                silent !sh -c "git clone https://github.com/phildawes/racer $HOME/.vim/racer && cd $HOME/.vim/racer && cargo build --release" > /dev/null 2> /dev/null &
                let g:racer_cmd = ""
            else
                let g:racer_cmd = "/home/ltratt/.vim/racer/target/release/racer"
            endif
            let rust_src_dir = $HOME . "/.vim/rust/src"
            if !isdirectory($rust_src_dir)
                silent !git clone https://github.com/rust-lang/rust $HOME/.vim/rust > /dev/null 2> /dev/null &
            endif
            let $RUST_SRC_PATH=rust_src_dir
            let g:rustfmt_command=$HOME . "/.cargo/bin/rustfmt"
        endif
        let g:racer_experimental_completer = 1
        au FileType rust nmap gd <Plug>(rust-def)
        au FileType rust nmap gs <Plug>(rust-def-split)
        au FileType rust nmap <leader>gd <Plug>(rust-doc)


        " Tagbar

        nmap <F8> :TagbarToggle<CR>
        if executable('ectags')
          let g:tagbar_ctags_bin = "ectags"
        endif
        let g:tagbar_type_rust = {
          \ 'ctagstype' : 'rust',
          \ 'kinds' : [
              \'T:types,type definitions',
              \'f:functions,function definitions',
              \'g:enum,enumeration names',
              \'s:structure names',
              \'m:modules,module names',
              \'c:consts,static constants',
              \'t:traits,traits',
              \'i:impls,trait implementations',
          \]
          \}


        " vimtex

        let g:vimtex_imaps_enabled = 0


        " easyclip

        set clipboard=unnamedplus " Make Vim share the Unix clipboard by default
        let g:EasyClipShareYanks = 1
        nmap <a-p> <plug>EasyClipSwapPasteForward
        nmap <a-P> <plug>EasyClipSwapPasteBackwards
        let g:EasyClipUseCutDefaults = 0
        let g:EasyClipAlwaysMoveCursorToEndOfPaste = 1
        nmap d <Plug>MoveMotionPlug
        xmap d <Plug>MoveMotionXPlug
        nmap dd <Plug>MoveMotionLinePlug


        " clevertab

        inoremap <silent><tab> <c-r>=CleverTab#Complete('start')<cr>
                              \<c-r>=CleverTab#Complete('tab')<cr>
                              \<c-r>=CleverTab#Complete('neocomplete')<cr>
                              \<c-r>=CleverTab#Complete('stop')<cr>
        inoremap <silent><s-tab> <c-r>=CleverTab#Complete('prev')<cr>


        " textobj-quote

        let g:textobj#quote#educate = 0
        augroup textobj_quote
            autocmd!
            autocmd BufNewFile,BufReadPre,FilterReadPre,FileReadPre * call textobj#quote#init() | call textobj#sentence#init()
        augroup END
        map <silent> <leader>qc <Plug>ReplaceWithCurly
        map <silent> <leader>qs <Plug>ReplaceWithStraighit


        " eregex

        let g:eregex_default_enable = 0


        " ale

        let g:ale_rust_cargo_check_all_targets = 1 " Check tests for errors too
        nmap <silent> <C-k> <Plug>(ale_previous_wrap)
        nmap <silent> <C-j> <Plug>(ale_next_wrap)
        autocmd FileType tex ALEDisable


        " Persistent undo

        set undofile                " Save undo's after file closes
        set undodir=$HOME/.vim/undo " where to save undo histories
        set undolevels=1000         " How many undos
        set undoreload=10000        " number of lines to save for undo


        " Highlight Word, initial version from:
        "   https://gist.github.com/emilyst/9243544#file-vimrc-L142
        "
        " This mini-plugin provides a few mappings for highlighting words temporarily.
        "
        " Sometimes you're looking at a hairy piece of code and would like a certain
        " word or two to stand out temporarily.  You can search for it, but that only
        " gives you one color of highlighting.  Now you can use <leader>N where N is
        " a number from 1-6 to highlight the current word in a specific color.
        "
        " \0 unsets all highlighting

        function! HiInterestingWord(n)
            hi def HiInterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
            hi def HiInterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
            hi def HiInterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
            hi def HiInterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
            hi def HiInterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
            hi def HiInterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

            " HiInterestingWord(0) clears all the matches, including the general
            " search highlighting.
            if a:n == 0
                let i = 1
                while i <= 6
                    let mid = 86750 + i
                    silent! call matchdelete(mid)
                    let i += 1
                endwhile
                set hlsearch!
                return
            endif

            " Save our location.
            normal! mz
            " Yank the current word into the z register.
            normal! "zyiw
            " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
            let mid = 86750 + a:n
            " Clear existing matches, but don't worry if they don't exist.
            silent! call matchdelete(mid)
            " Construct a literal pattern that has to match at boundaries.
            let pat = '\V\<' . escape(@z, '\') . '\>'
            " Actually match the words.
            call matchadd('HiInterestingWord' . a:n, pat, 1, mid)
            " Move back to our original location.
            normal! `z
        endfunction

        " Default Highlights

        nmap <silent> <leader>0 :call HiInterestingWord(0)<cr>
        nmap <silent> <leader>1 :call HiInterestingWord(1)<cr>
        nmap <silent> <leader>2 :call HiInterestingWord(2)<cr>
        nmap <silent> <leader>3 :call HiInterestingWord(3)<cr>
        nmap <silent> <leader>4 :call HiInterestingWord(4)<cr>
        nmap <silent> <leader>5 :call HiInterestingWord(5)<cr>
        nmap <silent> <leader>6 :call HiInterestingWord(6)<cr>


        " Allow the font sizes to be quickly bumped up and down with Ctrl-â†‘ and Ctrl-â†“

        let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
        let s:minfontsize = 6
        let s:maxfontsize = 16
        function! AdjustFontSize(amount)
          if has("gui_gtk2") && has("gui_running")
            let fontname = substitute(&guifont, s:pattern, '\1', '')
            let cursize = substitute(&guifont, s:pattern, '\2', '')
            let newsize = cursize + a:amount
            if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
              let newfont = fontname . newsize
              let &guifont = newfont
            endif
          else
            echoerr "You need to run the GTK2 version of Vim to use this function."
          endif
        endfunction

        function! LargerFont()
          call AdjustFontSize(1)
        endfunction
        command! LargerFont call LargerFont()

        function! SmallerFont()
          call AdjustFontSize(-1)
        endfunction
        command! SmallerFont call SmallerFont()

        nnoremap <C-Up> :LargerFont<CR>
        nnoremap <C-Down> :SmallerFont<CR>


        " Don't shuffle the screen and cursor when switching between buffers
        " From http://vim.wikia.com/wiki/Avoid_scrolling_when_switch_buffers

        " Save current view settings on a per-window, per-buffer basis.
        function! AutoSaveWinView()
            if !exists("w:SavedBufView")
                let w:SavedBufView = {}
            endif
            let w:SavedBufView[bufnr("%")] = winsaveview()
        endfunction

        " Restore current view settings.
        function! AutoRestoreWinView()
            let buf = bufnr("%")
            if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
                let v = winsaveview()
                let atStartOfFile = v.lnum == 1 && v.col == 0
                if atStartOfFile && !&diff
                    call winrestview(w:SavedBufView[buf])
                endif
                unlet w:SavedBufView[buf]
            endif
        endfunction

        " When switching buffers, preserve window view.
        if v:version >= 700
            autocmd BufLeave * call AutoSaveWinView()
            autocmd BufEnter * call AutoRestoreWinView()
        endif
