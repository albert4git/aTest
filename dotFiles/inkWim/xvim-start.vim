" Author: stardiviner ( numbchild at gmail dot com )

" TODO
" :e ftplugin/example.template
" :help ftplugin
" write some language specified filetype settings into ftplugin/

" [[ vimrc structure ]] {{{
" .vimrc -- global settings
" .vim/
"   after/  -- files that are loaded after sourced system plugins. override
"               system settings.
"       ftplugin/
"       plugin/
"       syntax/
"       ...
"   autoload/ -- automatically loaded scripts.
"   colors/   -- custom color schemes.
"   doc/      -- plugin documentation.
"   ftdetect/ -- filetype detection scripts.
"   ftplugin/ -- filetype plugins (load before system files, override by system)
"   indent/   -- indent scripts.
"   plugin/   -- plugins.
"   syntax/   -- syntax scripts.
"
" }}}

" before any other settings {{{
    " [ key prefix -> Leader ] {{{ [ '\', ',']
    " NOTICE: set this before any mappings.
    let mapleader = ','
    " <LocalLeader> is to be used for mappings which are local to a buffer. (filetypes)
    let maplocalleader = '\'
    " }}}
" }}}

" separate configs clean vimrc {{{
" TODO
" for f in split(glob('~/.vim/vimrc/*.vim'), '\n')
"     exe 'source' f
" endfor
" }}}

" [[ DISPLAY ]] {{{
if $DISPLAY != ""
endif
" }}}

" [[ Vim Settings ]] {{{
    " vimrc set options howto
    " :help options.txt, :options/:browse set, to show all setted options.

    " [ compatiable ] {{{
    set nocompatible " not vim compatible. must be first one, will affect other options
    " set cpoptions= " flags for Vi compatible behavior.
    " }}}

    " [ updating vimrc file on the fly ] {{{
    if has("autocmd")
        augroup SourceVimrc
            au!
            autocmd bufwritepost .vimrc source $MYVIMRC
        augroup END
    endif
    nnoremap <Leader>ev :split $MYVIMRC<CR>
    nnoremap <Leader>tv :tabedit $MYVIMRC<CR>
    nnoremap <Leader>sv :source $MYVIMRC<CR>
    " }}}

    " [ tty ] {{{
    " set ttytype " default from $TERM
    set ttybuiltin " on: the builtin termcaps are searched before external ones.
    set ttyscroll=100 " small number to speed up displaying.
    set ttyfast " for tmux, screen. when TERM=screen, rxvt etc.
    " }}}

    " [ system detection ] {{{
    "if system('uname -v') =~ 'Ubuntu'
    "endif
    " }}}

    " [ mouse ] {{{ " :help 'mouse'
    if has('mouse')
        " set mouse=""           " disable mouse
        set mouse=v " a: all modes, v: visual,
        set mousemodel=extend
        set ttymouse=urxvt " make terminal support mouse: xterm/urxvt/...
    endif
    " }}}

    " [ help ] {{{ vim internal HELP
    set keywordprg="man -s"
    " }}}

    " [ history & undo ] {{{
    set history=50 " history lines
    " undo
    set undolevels=1000
    " if has("presistent_undo")
    "     if isdirectory(expand("~/.vim/undodir"))
    "         set undodir=~/.vim/undodir/
    "     endif
    "     set undofile
    " endif
    " }}}

    " [ command line ] {{{ <C-n>/<C-p>, <C-f>(cmdline-window), [q:/q/|q?]
    set wildmenu wildmode=list:full " show matches above cmdline <C-N/P>
    set showcmd         " show (partial) command in the last line of screen.
    set cmdheight=2     " Prevent 'Press Enter' message after most commands
    set shortmess=xtToO " Limit Vim's 'hit-enter' messages
    set wildchar=<Tab>     " <Tab> to complete in cmdline.
    set wildignorecase     " ignore case when completing file names and directories.
    " cmdline-window
    set cmdwinheight=10
    " }}}

    " Ex-mode {{{ 'Q'
    " }}}

    " [ encode ] {{{
    set encoding=utf-8
    set fileencoding=utf-8
    set fileencodings=utf-8,ucs-bom,enc-cn,cp936,gbk,latin1
    set ambiwidth="double" " ambiguous character width.
        " ambiwidth: only effect when 'encoding' is 'utf-8'
    " "set isfname+=32 " let vim support filename with white spaces when  using "gf".
    " }}}

    " [ register ] {{{
    " you can use ["+p and "+y] to paste and yank
    " "* for clipboard,
    " "+ for X11 select board.
    set clipboard+=unnamed   " "* is the clipboard register in Linux, OS X.
    " }}}

    " [ diff, paste & select mode ] {{{
    " diff mode
    set diffopt=vertical,filler,context:10,foldcolumn:1
    " set scrollbind
    " paste mode
    set nopaste " Start in normal (non-paste) mode
    set pastetoggle=<F2>
    nnoremap <F2> :set invpaste paste?<CR>
    " select mode -> visual mode, with gh or <Ctrl-G>
    " set selectmode=mouse
    " }}}

    " [ modeline ] {{{
    set modeline     " =/* vim: set ai ft=config: */
    set modelines=5  " the number of lines that is checked for set commands.
    set columns=80
    set colorcolumn=+1 " 80 columns: highlight column after 'textwidth', a red line.
    " set cc=+1,+2,+3  " highlight three columns after 'textwidth'
    " set colorcolumn=4,+1
        " add bellowing to colorscheme file.
        "hi ColorColumn     ctermfg=None ctermbg=233
    " }}}

    " [ buffer ] {{{
    " set autowrite                    " auto write when changed
    " set autowriteall
    " set autochdir
    set autoread         " auto read changed files
    set updatetime=3000  " swap write to disk, and for CursorHold event
    set confirm          " prompt to save unsaved changes when exiting
    if has("vms")
        set nobackup " do not keep a backup file, use version instead
    else
        set backup		" keep a backup file
    endif
    if isdirectory(expand("~/.backup-vim"))
        set backupdir=$HOME/.backup-vim/  " backup dir
    else
        call system("mkdir " . expand("~/.backup-vim"))
    endif
    set backupcopy=auto " auto, breakhardlink(for hardlink, to create separate swap)
    set dir=.,~/.tmp,/var/tmp,/tmp  " swap file dir
    " }}}

    " [ tags ] {{{
    " tags
	" ':help tagsrch.txt'
	" {Visual}C-], [count]C-T, {Visual}g], C-w C-], {Visual}g C-],
	" :tag [ident: main, /^get (tag-regexp)],
	" :tags (tag stack), :[count]tnext/tprevious,
	" :ptag [ident] (show in preview window).
	" :tselect [ident] (tag match list), :stselect [ident] (split),
    " ctags
	" $ ctags
    " ; means recurse upwards to deep under your project.
    set tags+=tags    " search current dir
    " set tags+=./tags  " search dir of current file.
    " set tags+=./tags;  " search current dir, recursively to parent dir until root
    " set tags+=./tags;/  " walk up the tree towards root until one is found
    set tags+=./tags;$HOME " walk up the tree towards $HOME.
    " ----------------
    " TODO improve those tags settings
    " TODO migrate those filetype specific tags settings into ftplugin/filetype.vim ???
    " libraries:
    " set tags+=/lib/**/tags " * and ** wildchar. (slow)
    " set tags+=/usr/lib/**/tags
    " set tags+=/usr/include/**/tags
    set tags+=~/tmp/vim/tags/usr_include.ctags
    "	$ ctags -R --fields=+S -f ~/tmp/vim/tags/usr_include.ctags /usr/include/
    set tags+=~/tmp/vim/tags/cpp.tags
    "   $ ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f ~/tmp/vim/tags/cpp.ctags /usr/include/c++/4.6/
    set tags+=~/tmp/vim/tags/ruby1.9.1.ctags
    "	$ ctags -R -f ~/tmp/vim/tags/ruby1.9.1.ctags /usr/lib/ruby/1.9.1/
    set tags+=~/tmp/vim/tags/python3.2.ctags
    "	$ ctags -R -f ~/tmp/vim/tags/python3.2.ctags /usr/lib/python3.2/
    " ----------------
    set taglength=0 " number(N): up to this number of characters.
    set tagrelative
    " }}}

    " [ cscope ] {{{
    "	    <C-\> [s/g/d/c/t/e/f/i]
    " :cscope [add/find/kill/reset/show], :scscope (split), :lcscope, :cstag,
    " ------------
    "	$ cscope -b -- build up cscope database for source code.
    "	$ cscope -R -- recursively
    "	:cscope add cscope.out -- add database to vim. establishes a connection.
    if has("cscope")
        set cscopeprg=cscope " cscope program.
        " find {querytype}: + append, - clear, 0/absence -> don't use quickfix.
        set nocscopetag " cscopetag: use cscope for tag commands, cscope -> tags
        set cscopetagorder=0 " 0: cscope -> tags file, 1: tags file -> cscope
        " set cscoperelative
        set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i- " use quickfix to show result
        set cscopepathcomp=3 " how many components of a file's path to display
        set cscopeverbose " print message indicate success or failure.

	" original is <C-_>
        " keep regular tag behavior and have a different shortcut access :cstag
        nnoremap <C-Bslash> :cstag <C-R>=expand("<cword>")<CR><CR>
        " following scheme.
        " s: Find this C symbol
        " g: Find this definition
        " d: Find functions called by this function
        " c: Find functions calling this function
        " t: Find this text string
        " e: Find this egrep pattern
        " f: Find this file
        " i: Find files #including this file
        nnoremap <C-Bslash>s :cscope find s <C-R>=expand("<cword>")<CR><CR>
        nnoremap <C-Bslash>g :cscope find g <C-R>=expand("<cword>")<CR><CR>
        nnoremap <C-Bslash>d :cscope find d <C-R>=expand("<cword>")<CR><CR>
        nnoremap <C-Bslash>c :cscope find c <C-R>=expand("<cword>")<CR><CR>
        nnoremap <C-Bslash>t :cscope find t <C-R>=expand("<cword>")<CR><CR>
        nnoremap <C-Bslash>e :cscope find e <C-R>=expand("<cword>")<CR><CR>
        nnoremap <C-Bslash>f :cscope find f <C-R>=expand("<cfile>")<CR><CR>
        nnoremap <C-Bslash>i :cscope find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    endif

    " auto loading cscope database
    " similar functionality with tags -> set tags=tags;/ (auto towards)
    fun! LoadCscope()
	let db = findfile("cscope.out", '.;')
	if (!empty(db))
	    let path = strpart(db, 0, match(db, "/cscope.out$"))
	    set nocscopeverbose " suppress 'duplicate connection' error
	    exe "cs add " . db . " " . path
	    set cscopeverbose
	endif
    endfun
    au BufEnter * call LoadCscope()
    " }}}

    " [ search ] {{{
        " [ regex ]
        " magic/nomagic: changes special chars that can be used in search patterns
        set magic
            " \v: 'very magic', make every character except a-zA-Z0-9 and '_' have special meaning
            " use \v and \V to switch 'very magic' on or off.
            " \m, \M: 'magic' mode.
            " use \m and \M to switch 'magic' on or off.

        " [ search ]
        set hlsearch   " highlight searchs
        set ignorecase " Do case insensitive matching
        set smartcase  " except when using capital letters
        set incsearch  " incremental searching
        set wrapscan   " wrapscan used for ]s and [s spelling mistake.

        " [ grep ]
        " internal(vimgrep) : use Vim search patterns, slower(read into memory)
        " external(grep) : used when the vim grep does not do what you want.
        if system("grep 'Ubuntu' /etc/issue") =~? 'Ubuntu' || executable("ack-grep")
            " set grepprg=ack-grep\ -H\ --nogroup\ --nocolor
            set grepprg=ack-grep\ -a
        elseif executable("ack")
            " set grepprg=ack\ -H\ --nogroup\ --nocolor
            set grepprg=ack\ -a
        else
            " 'grep -n', 'grep -n $* /dev/null'
            set grepprg=grep\ -n\ $*\ /dev/null
        endif

        " [ match ]
        set showmatch
        set matchpairs+=(:),{:},[:],<:>
        set matchpairs+=':'
        set matchtime=5
    " }}}

    " [ spell check ] {{{ C-X,C-N,C-P ]s [s zg zw zuw zug z= :help spell.txt
    set nospell
    set dictionary=/usr/share/dict/words " dictionary for spell.
    augroup ToggleSpell
        au!
        au FileType mail,tex,markdown,vimwiki,org,tpp setlocal spell
    augroup END
    set spelllang=en " en: all, en_gb: Great Britain.
    set spellsuggest=best " default and fast list.
    set spellfile=~/.vim/spell/en.utf-8.add " 'zg': add, 'zw': remove.
        " :mkspell command to generate a vim spell file from word lists.
    nnoremap <silent> <Leader>sc :set invspell spell?<CR>
    " }}}

    " [ completion ] {{{ auto popup menu: Tab, C-x + C-?, C-y, C-e
    " [ completion options ]
    set complete=.,w,b,t,i,u,k       " completion buffers
    "            | | | | | | |
    "            | | | | | | `-dict
    "            | | | | | `-unloaded buffers
    "            | | | | `-include files
    "            | | | `-tags
    "            | | `-other loaded buffers
    "            | `-windows buffers
    "            `-the current buffer
    set completeopt=menuone " menu,menuone,longest,preview
    set completeopt-=preview " dont show preview window

    " [ popup menu ]
    set pumheight=20 " popup menu height. 0: long

    " [ preview ] window
    " set previewwindow " identifies the preview window. normally not set directly.
    set previewheight=15

    " set file path completion.
    set path+=.,/usr/include,/usr/local/include

    " [ wildignore ]
    " ignore those files when completion.
    set wildignore+=*.swp,*~,*.o,*.obj,*.py[co]
    " set wildignore+=*/.git/*,*/.hg/*,*/.svn/*  " Linux/MacOSX
    " set wildignore+=.git\*,.hg\*,.svn\*        " Windows

    set infercase " adjust ins-completion case for ..th completion.
    set report=0 " always report changed lines

    " [ omni ]
    " complete with "<C-X><C-O>"
    " set omnifunc=syntaxcomplete#Complete " for other languages
    " set completefunc=
    " inoremap <C-space> <C-x><C-o>

        " SuperCleverTab() for omni-completion or insert <Tab> {{{
        function! SuperCleverTab()
            if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
                return "\<Tab>"
            else
                " use omnifunc
                if &omnifunc != ''
                    return "\<C-X>\<C-O>"
                " use dictionary option with /usr/share/dict/words
                elseif &dictionary != ''
                    return "<C-X>\<C-K>"
                else
                    return "\<C-X>\<C-N>"
                endif
            endif
        endfunction

        " inoremap <Tab> <C-R>=SuperCleverTab()<cr>
        " }}}
    " }}}

    " [ templates ] {{{
    " FIXME this code does not work.
    augroup TemplatesAutocmd
        autocmd!
        autocmd BufNewFile * silent! 0r "~/.vim/templates/" . &filetype. "/template" . %:e
    augroup END
    " }}}

    " [ session ] {{{
    set sessionoptions+=blank
    set sessionoptions+=buffers
    set sessionoptions+=curdir
    set sessionoptions+=folds
    set sessionoptions-=help
    set sessionoptions+=options
    set sessionoptions+=tabpages
    set sessionoptions+=resize
    set sessionoptions+=winsize
    set sessionoptions+=winpos

    "au BufReadPost *
                "\if line("'\"") > 1 && line("'\"") <= line("$")
                "\| exe "normal! g`\""
                "\| endif
    "set viminfo='10,\"100,:20,%,n~/.viminfo " help :viminfo , notice permission is wrong on viminfo
    " }}}

    " [ bell ] {{{
    set errorbells " error bells
    set visualbell " Flash the screen insteal of beeping on errors
    set t_vb=      " And then disable even the flashing
    " }}}

    " [ filetype ] {{{
    " ~/.vim/ftplugin/ " source first, then load system files.
    " ~/.vim/after/ftplugin/ " source later, after load system files.
    filetype plugin indent on " combine three into one.
    " }}}

    " [ encrypt ] {{{
    " :X to encrypt.
    " :set key=  to reset the 'key' option to an empty value.
    set cryptmethod=blowfish " zip, blowfish.
    " }}}

    " [ maps ] {{{
    set timeout  timeoutlen=1500 " map sequence timeout
    set ttimeout ttimeoutlen=100 " key code timeout
    " }}}

    " [ binary ] {{{ editing binary files
    " `:help edit-binary`
    " binary
        " `$ vim -b filename` or running: `:set binary`
        " When navigating binary files, `[count]go` is useful because it moves
        " the cursor to a byte offset.

    " xxd
        " Another good tip is to convert files to the hexdump format using
        " `:%!xxd`.  It's actually possible to convert a binary to hexdump, edit
        " it, then convert it back to binary using xxd's `-r` (revert) flag.
    " binary diff
        " By using anonymous pipes (supported by bash and zsh), it's fairly easy
        " to get Vim to diff files by redirecting the output of xxd:
        " `$ vimdiff <(xxd bin_file_1) <(xxd bin_file_2)`
    " }}}
" }}}

" [[ gVim ]] {{{
" :help gui.txt :help gui_x11.txt
    " $MYGVIMRC
if has('gui') && has('gui_running')
    " [ looks ] {{{
    set guioptions+=a " autoselect for pasting
    set guioptions+=c " use vim's console dialogs.
    set guioptions+=i " use a Vim icon.
    set guioptions+=m " m - Display a menu bar.
    set guioptions+=g " maek menu items not active grey.
    set guioptions+=T " T - Display a toolbar.
    set guioptions-=r " r - Always display the right-hand scrollbar.
    set guioptions-=R " R - Display the right-hand scrollbar if the window is split vertically.
    set guioptions-=l " l - Always display left-hand scrollbar.
    set guioptions-=L " L - Display the left-hand scrollbar if the window is split vertically.
    set guioptions-=b " b - Display the horizontal scrollbar.
    set guioptions+=F " F - Footer
    set toolbar=icons,tooltips
    set toolbariconsize=small
        " use command :set guifont=*  to select font, then use :set guifont?
    set guifont=Monaco:h9:cANSI
    set lines=100 columns=165
    set antialias

    set t_Co=256
    set background=light " dark/light
    colorscheme solarized

    "winsize 110 40 " width & height

    " set guicursor=
    " }}}

    "function! GVimEnter()
        "set guifont=Monaco\ 9
        "set lines=90 columns=160
    "endfunction
    "augroup GUI_Enter
        "autocmd GUIEnter * call GVimEnter()
    "augroup end

endif
" }}}

" [[ Windows ]] {{{
" Windows specific settings
if has('win32')
    " Windows gVim-specific settings
    if has('gui_running')
    endif
endif
" }}}

" [[ looks ]] {{{
    " [ basic looks ] {{{
    set linespace=1 " 1 for Win32 GUI, space for underline.
    set lazyredraw
    " }}}

    " [ scroll ] {{{
    set sidescroll=1
    set scrolloff=999  " N: lines up and down of cursor, 999: cursor always in middle.
        " let cursor line in middle will make popup menu have enough space to display.
    " }}}

    " [ listchars ] {{{
        " use `:digraphs` command in vim to display.
        " vert: \|, \┆, \│, \ ,
        " fold: ┄, -,
        " diff: -, ×,
        " stl: \ ,
        " stlnc: \ ,
        " tab: \┆\ , »·, ⇥, >-, \␣, \⋮\ ,
        " tail: \·,
        " extends: \«, ◂,
        " precedes: \», ▸,
        " nbsp: \✖,
        " conceal: ≠,
        " eol: ↵, ¶
        " showbreak: "↪ ", "> ", "+++ ",
        " ------------------------------------------
    set fillchars=vert:│,fold:┄,diff:-
    set list
    set listchars=tab:\ \ , " use whitespace to hide tab.
                \trail:\·, " trailing line whitespaces
                \extends:\◂,
                \precedes:\▸,
                \nbsp:\✖, " non-breakable space.
                \conceal:≠ " conceal symbol.
    set showbreak="↪ " " string at start of lines that have been wrapped.

    " use listchars tab flag to show tab vertical line.
    " toggle fold level vertical lines before line number.
    " FIXME
    fun! TabIndentLineToggle(toggle_vertline)
        if (a:toggle_vertline == 1)
            let g:TabIndentLine = 1
            hi SpecialKey      ctermfg=237 ctermbg=NONE cterm=none
            set noexpandtab
            set listchars+=tab:\┆\ ,
            " TODO detect IndentGuides here.
            if exists('g:indent_guides_enable_on_vim_startup')
                let g:indent_guides_enable_on_vim_startup = 0
                :IndentGuidesDisable
            endif
        else
            let g:TabIndentLine = 0
            set expandtab
            set listchars+=tab:\ \ ,
            if exists('g:indent_guides_enable_on_vim_startup')
                let g:indent_guides_enable_on_vim_startup = 1
                :IndentGuidesEnable
            endif
        endif
    endfunction

    fun! ListModeToggle()
        set invlist list?
    endfun

    " autocmd FileType *      call TabIndentLineToggle(1)
    " autocmd FileType python call TabIndentLineToggle(0)

    nnoremap <silent> <Leader>lc :set invlist list?<CR>
    " }}}

    " [ linenumber ] {{{
    set number         " show number
    " set relativenumber " show relative number
    set numberwidth=2 " minimal number of columns for line number.
    " }}}

    " [ window ] {{{
    " <C-w> [s/v/+/-/</>/|/-]
    " set winfixheight
    " set winfixwidth
    " }}}

    " [ colorscheme ] {{{
    " if $COLORTERM == 'gnome-terminal'
    if $TERM ==? "rxvt-unicode-256color"
        set t_Co=256
        colorscheme molokai
        " colorscheme molokai_transparent " for transparent urxvt.
    elseif $TERM ==? "xterm-256color"
        set t_Co=256
        colorscheme molokai
    elseif $TERM ==? "screen-256color"
        set t_Co=256
        colorscheme molokai
    else
        colorscheme wombat256mod
    endif
    " }}}

    " [ cursor ] {{{ :help terminal-options
    " color from /etc/x11/rgb.txt
    " [ cursor color ]
    " if &term =~ "rxvt-unicode-256color\\|rxvt-unicode"
    "     "if &term == 'rxvt-256color'
    "     "" urxvt
    "     "let &t_SI = ']12;#89b6e2'
    "     "let &t_EI = ']12;#dd4010'
    "     set ttyfast
    "     let &t_EI = "\<Esc>]12;RoyalBlue1\x9c"
    "     let &t_SI = "\<Esc>]12;IndianRed1\x9c"
    "     silent !echo -e "\e]12;orange\x9c"
    " "elseif $TMUX != ''
    "     "" tmux
    "     "let &t_SI = 'Ptmux;]12;#89b6e2\'
    "     "let &t_EI = 'Ptmux;]12;#dd4010\'
    " elseif &term =~ "screen-256color"
    "     " screen
    "     :silent !echo -ne "\eP\e]12;IndianRed2\007\e\\"
    "     let &t_SI = "\eP\e]12;RoyalBlue1\007\e\\"
    "     let &t_EI = "\eP\e]12;IndianRed2\007\e\\"
    "     autocmd VimLeave * :!echo -ne "\eP\e]12;green\007\e\\"
    " elseif &term =~ "xterm"
    "     " xterm
    "     :silent !echo -ne "\e]12;IndianRed2\007"
    "     let &t_SI = "\e]12;RoyalBlue1\007"
    "     let &t_EI = "\e]12;IndianRed2\007"
    "     autocmd VimLeave * :!echo -ne "\e]12;green\007"
    " elseif &term =~ "xterm\\|rxvt"
    "     let &t_SI = "\<Esc>]12;orange\x7"
    "     let &t_EI = "\<Esc>]12;red\x7"
    "     silent !echo -ne "\033]12;red\007"
    "     " reset cursor when vim exits
    "     autocmd VimLeave * silent !echo -ne "\033]112\007"
    "     " use \003]12;gray\007 for gnome-terminal
    " endif

    " [ cursor shape ]
    " = '\<Esc>[1 q'
    " 1/0: blinking block, 2: solid block, 3: blinking underscore, 4: solid underscore
    " if &term =~ 'rxvt-unicode-256color\\|rxvt-unicode'
    "     let &t_SI = "\<Esc>[1 q"
    "     let &t_EI = "\<Esc>[3 q"
    " elseif &term =~ '^xterm'
    "     let &t_SI .= "\<Esc>[4 q"
    "     let &t_EI .= "\<Esc>[2 q"
    "     " =~ "^xterm"
    "     " let &t_SI = "\<Esc>]12;purple\x7"
    "     " let &t_EI = "\<Esc>]12;blue\x7"
    " else
    "     let &t_SI = "\<Esc>]50;CursorShape=2\x7"
    "     let &t_EI = "\<Esc>]50;CursorShape=4\x7"
    " endif
    " }}}

    " [ current line ] {{{
    set cursorline
    " plugin: ~/.vim/plugin/CursorLineCurrentWindow.vim
    " }}}

    " [ syntax & highlight ] {{{
    syntax enable   " enable syntax highlighting
    syntax on       " follows colorscheme to highlight.
    " }}}

    " [ indent ] {{{
    " help indent.txt
    set backspace=indent,eol,start " Better handling of backspace key
    set autoindent " Sane indenting when filetype not recognised
    " set smartindent  " autoindent, smartindent, cindent, indentexpr.
        " use 'filetype indent on' to per-filetype indent
    set nostartofline   " Emulate typical editor navigation behaviour

    "st whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
    "             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual
    " }}}

    " [ tab ] {{{
    set smarttab " <Tab> insert shiftwidth at beginning of a line.
    set shiftwidth=2 " Number of spaces for each indent level
    set softtabstop=2 " Even when using <Tab>'s
    set expandtab " When pressing <Tab>, replace with spaces
    " set tabstop=8 " number of spaces that a <Tab> counts for.
    " }}}

    " [ format ] {{{
    set formatprg=par " external program used to format with gq operator

    " formatoptions: how automatic formatting is to be done.
    set formatoptions+=t " auto-wrap text using textwidth
    set formatoptions+=c " auto-wrap comments using textwidth
    set formatoptions+=r " auto insert current comment leader after <Enter> in Insert
    set formatoptions+=o " auto insert current comment leader after <o/O> in Normal
    set formatoptions+=q " allow formatting of comments with "gq"
    set formatoptions-=w " trail white space indicates paragraph continues next line
    set formatoptions-=a " auto reformat of paragraphs when inserted or deleted
    set formatoptions+=n " when formatting, recognize numbered lists
    set formatoptions+=m " also break at a multi-byte character above 255
    set formatoptions+=2 " when formatting, use second line's indent
    " }}}

    " [ comment ] {{{
    " set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
    set commentstring=#%s " #%s, /*%s*/
    " }}}

    " [ wrap ] {{{
    set wrap        " wrap long length text
    set textwidth=80 " =0:unlimited, =80.
    " }}}

    " [ conceal ] {{{
    if has('conceal')
        set conceallevel=2 " 0:, 1:, 2:completely hidden, 3
        set concealcursor=nc " n: normal v: visual i: insert c: command line editing
    endif
    " }}}

    " [ balloon ] {{{
    if has('balloon_eval')
        set ballooneval
        set balloondelay=600

        function! MyBalloonExpr()
            return 'Cursor is at line ' . v:beval_lnum .
                        \ ', column ' . v:beval_col .
                        \ ' of file ' .  bufname(v:beval_bufnr) .
                        \ ' on word "' . v:beval_text . '"'
                        \ ' Error: ' . v:errmsg ? v:errmsg : ""
        endfunction
        set bexpr=MyBalloonExpr()
    endif
    " }}}

    " [ title ] {{{
    if $TERM == "screen-256color"
        set notitle " for tmux/screen session do not set window name.
    else
        set title
    endif
    set titleold="Shape ideas into code with Vim"
    set titlestring="Shape ideas into code with Vim"
    set titlestring=VIM:\ %-25.55F\ %a%r%m
    "                            |   | | |
    "                            |   | | m: modified flag
    "                            |   | r: readonly flag
    "                            |   a: argument list status
    "                            F : full path to file in the buffer
    " set titlelen=95
    " }}}

    " [ statusline ] {{{
    set laststatus=2 " Always show the statusline
        " %-0{minwid}.{maxwid}{item}
        " %!expression to evaluate the expression.
        " %{} items will be evaluated too.
        "   NOTE: in %{}, Unclosed expression sequence:
        "   - you can not has space in %{}
        "   - you can not use double quote in %{}, use single quote instead.
        " Require: fugitive, current-func-info, syntastic,
        " - fugitive
        "   - %{fugitive#statusline()}
        "   - %{fugitive#head(7)}
        " - current-func-info
        "   - %{cfi#get_func_name()}
        " - syntastic
        "   - %{SyntasticStatuslineFlag()}
    function! SetStatusline()
        set statusline=
        " set statusline+=\%#StatusSeparator#\|\%#StatusStop#
        set statusline+=\%#StatusBufferNumber#\b:%n
        " set statusline+=\%#StatusSeparator#\|\%#StatusStop#
        set statusline+=\%#StatusReadOnly#\%r\%#StatusList#\%q
        set statusline+=\ \%#StatusFugitive#\%{fugitive#statusline()} " plugin fugitive
        set statusline+=\%#StatusFugitive#\%{HGRev()?'[r'.HGRev().']':''} " plugin hgrev
        set statusline+=\ \%{virtualenv#statusline()}
        set statusline+=\%#StatusChar#\pain\»
        set statusline+=\ \%#StatusModFlag#\%{&modified?'✖':''}
                    \\%#StatusModFlag2#\%{&modified?'':'✔'}
        set statusline+=\ \%#StatusProgramInfo#\%{SyntasticStatuslineFlag()} " plugin Syntastic
        set statusline+=\ \%#StatusFilePath#\%<%t
        set statusline+=\ \%#StatusProgramInfo#\%{cfi#get_func_name()} " plugin current-func-info
        set statusline+=\ \%#StatusProgramInfo#\%{(tagbar#currenttag('%s','','s')?tagbar#currenttag('%s',''):'')} " plugin tagbar
        " set statusline+=\ \%#StatusProgramInfo#\%{tagbar#currenttag("[%s]", "", "f")}
        " set statusline+=\ \%#StatusProgramInfo#\%{tagbar#currenttag("[%p]", "")} " prototype
        set statusline+=\%#StatusHELP#\%H
        set statusline+=\%=
        set statusline+=\ \%{rvm#statusline()} " plugin vim-rvm
        " set statusline+=\%#StatusFileType#\%y
        set statusline+=\%#StatusFileType#\%{neocomplcache#get_context_filetype()==#&ft?'['.&ft.']':'['.neocomplcache#get_context_filetype().']'} " plugin neocomplcache
        " set statusline+=\%#StatusSeparator#\|\%#StatusStop#
        set statusline+=\ \%<%(\%#StatusNormal#\%{&ff==#'unix'?'':&ff}%)
        set statusline+=\%#StatusChar#\%{&ff=~'unix'&&&fenc==#'utf-8'?'':'•'}
        set statusline+=\%#StatusNormal#\%{&fenc==#'utf-8'?'':&fenc}
        " set statusline+=\%#StatusSeparator#\|\%#StatusStop#
        " set statusline+=\ \%#StatusLineNumber#\%-(L:%l/%L\ C:%c%V%)
        set statusline+=\ \%#StatusLineNumber#\%-(⭡:%l/%c%)
        set statusline+=\ \%#StatusPercent#\%P
    endfunction

    " if Powerline is not available, use my custom statusline settings.
    if !exists('g:Powerline_loaded')
        call SetStatusline()
    endif

    " a good tip for different format statusline for non-current.
    " let g:Active_statusline=&g:statusline
    " let g:NCstatusline=substitute(
    "             \                substitute(g:Active_statusline,
    "             \                'User1', 'User3', 'g'),
    "             \                'User2', 'User4', 'g')
    " au WinEnter * let&l:statusline = g:Active_statusline
    " au WinLeave * let&l:statusline = g:NCstatusline

    " function! StatusLineSet()
    "     if &l:modified
    "         setlocal statusline=✖
    "     else
    "         setlocal statusline=✔
    "     endif
    " endfunction
    " set statusline=%!StatusLineSet()

    set ruler              " show the cursor position all the time in status line.
    set showmode           " show insert, visual, replace mode on last line.
    " }}}

    " [ digraph ] {{{
    " entering of graphs
    "   - :digraphs -> show up currently defined digraphs.
    "   - in command line mode with {char1} <BS> {char2}
    "       (without space, those press are continuously)
    "   - in command line mode with CTRL-K {char1} {char2} -- when digraph option is set.
    "   - in command line mode, :digraphs {char1}{char2} {number}...
    " set digraph
    " }}}

    " [ folding ] {{{
    set foldenable         " enable fold
    " indent, syntax, manual, expr, diff, marker
    set foldmethod=manual  " manual: to create a fold with foldmarker.
	"   - zf{motion}
	"   - visual selection, zf
    set foldnestmax=3      " maximum nesting of fold
    set foldlevel=2        " fold start from which level
    set foldlevelstart=0   " which level start fold. 0: all folds closed.
    set foldmarker={{{,}}} " fold marker
    set foldminlines=3     " fold minlines
    set foldcolumn=0       " colums ahead of line number.
    if &foldmethod ==# 'indent'
        set foldignore="#"
        " lines start with characters in foldignore will get their fold level
        " from surrounding lines.
    endif
    set foldopen=block,mark,percent,quickfix,search,tag,undo " open fold for commands

        " set foldtext=VimrcFoldText() " {{{
        " function! VimrcFoldText()
        "     let line = foldtext()
        "     let foldSize = 1 + v:foldend - v:foldstart
        "     let lineCount = line("$")
        "     let foldPercentage = printf("%4.1f", (foldSize*1.0)/lineCount*100)
        "     " Show fold Percentage along with # of lines
        "     return substitute(line, '^\([-+]\+\)\(\s\+\)\(\d\+\) lines', '\1 '.foldPercentage.'%\2(\3 lines)', 'g')
        " endfunction " }}}

        function! VimFoldText() " {{{4
            " get first non-blank line
            let fs = v:foldstart
            while getline(fs) =~ '^\s*$'
                let fs = nextnonblank(fs + 1)
            endwhile
            if fs > v:foldend
                let line = getline(v:foldstart)
            else
                let line = getline(fs)
            endif
            let line = " ➜ " . substitute(line, '/\*\|\*/\|{'.'{{\d\=', '', 'g') . " "
            let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
            let foldSize = 1 + v:foldend - v:foldstart
            let foldSizeStr = " " . foldSize . " lines "
            let foldLevelStr = repeat("+ ", v:foldlevel) . "「" . v:foldlevel . "」"
            let lineCount = line("$")
            let foldPercentage = "[" . printf("%4.1f", (foldSize*1.0)/lineCount*100) . "%] "
            let expansionString = repeat("┈", w - strlen(foldSizeStr) - strlen(line) - strlen(foldLevelStr) - strlen(foldPercentage))
            return foldLevelStr . line . expansionString . foldSizeStr. foldPercentage
        endfunction
        set foldtext=VimFoldText()
        " }}}
        " }}}
    " }}}
" }}}

" [[ mappings ]] {{{
    " hasmapto()
    " mapcheck()
    " maparg()

    " TODO facilitate this into a function for easy usage.
    " Suppose you do not know the mapping which mapped to a command or function.
    " A VimL script already mapped it to. So you want to `unmap` it, then remap
    " the command to another mapping. (you need to reverse the mapcheck() to get
    " the mapping)
    " unmap reverse_mapcheck('<Plug>Func')
    " use :redir and :map
    " with vimple: filter(vimple#redir('map'), 'v:val =~ "UltiSnips_SaveLastVisualSelection"')

    " TODO learn those if conditions and hasmapto etc.
    " TODO apple this if map condition into other mappings like: <F1~9>
    " if !hasmapto('', 'n') && maparg("<C-a>", "n") ==# ''
    " if !hasmapto('', 'n') && mapcheck("<C-a>", "n") ==# ''
    " if g:ctrlp_map != '' && !hasmapto(':<c-u>'.g:ctrlp_cmd.'<cr>', 'n')
    "     nnoremap ...
    " endif

    " F1~12 {{{
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
    ":ShowFuncKeys
    " }}}

    " windows navigation {{{
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    " <C-w> 9+, <C-w> [H,J,K,L], <C-w> T,
    " maximum window (<C-w> [|, _ ])
    " resize window continuously [ <C-w>(-,+,<,>), Mouse ]
    nmap         <C-W>+     <C-W>+<SID>winsize
    nmap         <C-W>-     <C-W>-<SID>winsize
    nmap         <C-W><     <C-W><<SID>winsize
    nmap         <C-W>>     <C-W>><SID>winsize
    nnoremap <script>  <SID>winsize+   <C-W>+<SID>winsize
    nnoremap <script>  <SID>winsize-   <C-W>-<SID>winsize
    nnoremap <script>  <SID>winsize<   <C-W><<SID>winsize
    nnoremap <script>  <SID>winsize>   <C-W>><SID>winsize
    nmap         <SID>winsize      <Nop>
    " }}}

    " fold {{{
    nnoremap <SPACE> za
    " nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<cr>
    " }}}

    " quickfix/location list {{{
    nnoremap <Leader>qo :cindow<CR>
    nnoremap <Leader>qc :cclose<CR>
    nnoremap <Leader>lo :lwindow<CR>
    nnoremap <Leader>lc :lclose<CR>
    " }}}

    " help/doc/reference {{{
    augroup KeywordprgMappings
        au!

        fun! AvailableKCworld(keywordprg) abort
            " FIXME how to get the checked return value.
            let l:available = exec a:keywordprg expand("<cWORD>")
            if l:available == 1
                let l:result = exec a:keywordprg expand("<cWORD>")
            else
                let l:result = exec a:keywordprg expand("<cword>")
            endif
            return l:result
        endfun
        " au FileType vim,help nnoremap K :call AvailableKCworld("help")<CR>

        " TODO
        fun! OpenInSplitWindow() abort
        endfun

        "-Vim-:help-
        au FileType vim,help nnoremap K :exec "help" expand("<cword>")<CR>

        " Shell/man $ man
        au FileType sh,man,zsh setlocal keywordprg="man -s"
        " C $ man
        " au FileType c,cpp setlocal keywordprg="man -s"
        " Python $ pydoc
        au FileType python nnoremap K :exec "!pydoc" expand("<cword>")<CR>
        " Ruby $ ri
        au FileType ruby nnoremap K :exec "!ri" expand("<cword>")<CR>
        " Go $ godoc
        au FileType go nnoremap K :exec "!godoc" expand("<cword>")<CR>
    augroup END
    " }}}

    " / ? search {{{
    " very magic regex in search with '\v', and always enable 'hlsearch' before search
    " nnoremap / <ESC>:set hlsearch<CR>/\v
    " nnoremap ? <ESC>:set hlsearch<CR>?\v
    " Temporarily clear highlighting
    " nnoremap <silent> <Leader>nh :set invhlsearch hlsearch?<cr>
    " -----------------------------------------------------
    " very magic regex in search with '\v', and always enable 'hlsearch' before search
    nnoremap / /\v
    nnoremap ? ?\v
    " more better and simple version solution
    " should not disable hlsearch, only :nohlsearch is fine. Because Vim search
    " will turn hlsearch back.
    nnoremap <Leader>nh :nohlsearch<CR>
    " }}}

    " NOTICE use nonrecursive mapping.
    " Each of the *map commands has a *noremap counterpart that ignores other mappings
    " nnoremap, vnoremap, and inoremap. onoremap(operator).
    " mapping a sequence of multiple keys. like: nnoremap jk dd
    " buffer-local options and mapping. like: inoremap <buffer> <Leader>d dd
    " Operator-Pending mapping, like dw (d: Operator, w: movement),

    " speed up pressing
    " inoremap jk <esc>
    " inoremap <esc> <nop> " (no operation)

    " [ ins-completion ] {{{ C-n/p, CTRL-E: stop, CTRL-Y: accept.
    " i_CTRL-X_CTRL-L               -- whole lines
    " i_CTRL-X_CTRL-N               -- keywords in current file
    " i_CTRL-X_CTRL-K               -- keywords in dictionary
    " i_CTRL-X_CTRL-T               -- keywords in thesaurus, thesaurus-style
    " i_CTRL-X_CTRL-I               -- keywords in the current and included files
    " i_CTRL-X_CTRL-]               -- tags
    " i_CTRL-X_CTRL-F               -- file names
    " i_CTRL-X_CTRL-D               -- definitions or macros
    " i_CTRL-X_CTRL-V               -- vim command-line
    " i_CTRL-X_CTRL-U               -- user defined completion
    " i_CTRL-X_CTRL-O               -- omni completion
    " i_CTRL-X_s                    -- spelling suggestions
    " i_CTRL-N                      -- keyword in 'complete'
    " }}}
" }}}

" [[ commands ]] {{{
    " Grep help files for pattern
    " command! -nargs=* -complete=help HG helpgrep <args>

    " `:write !sudo tee %` hack ->
    command! -bar -nargs=0 SudoWrite  :setl nomod|silent exe 'write !sudo tee % >/dev/null'|let &mod = v:shell_error
" }}}

" [[ functions ]] {{{
" Vimscript functions must start with a capital letter if they are unscoped!
" you can call function with ":source file.vim" then ":call"

    " [ execute mode ] {{{
        " [ chmod +x % -> sh / rb / py / pl ] {{{
            function! ScriptExecute()
                :!chmod u+x %
                :w
            endfunction

            augroup ScriptExecutePermission
                autocmd!
                autocmd BufWritePost *.sh :call ScriptExecute()
                " autocmd BufWritePost *.rb :call ScriptExecute()
                " autocmd BufWritePost *.py :call ScriptExecute()
                " autocmd BufWritePost *.pl :call ScriptExecute()
            augroup END
        " }}}
    " }}}

    " [ skeleton/template ] {{{
    "autocmd BufNewFile *.sh 0r ~/.vim/skeletons/skeleton.sh
    "autocmd BufNewFile *.py 0r ~/.vim/skeletons/skeleton.py
    " }}}

    " {{{ Visual OR :10,50TOhtml :TOhtml
    " FIXME do not support script: indent-guides.vim
    " convert code to HTML used for website or paste
    " let g:html_no_progress = 1 " disable progress.
    let g:html_number_lines = 1 " 1: enable linenumber, 0: no linenumber. (default: unlet g:html_number_lines)
    let g:html_use_css = 1 " generate CSS file.
    let g:html_ignore_folding = 0 " does not ignore fold.
    let g:html_dynamic_folds = 1 " mouse over will expand fold on html
    let g:html_no_foldcolumn = 0 " show foldcolumn too for dynamic_folds.
    let g:html_hover_unfold = 1 " unfold when mouse hover.
    " let g:html_no_pre = 1 " do not use <pre>
    let g:html_expand_tabs = 1
    " let g:html_diff_one_file = 1 " disable diff when in diff mode.
    " let g:html_whole_filler = 1
    let g:html_use_encoding = "UTF-8"
    " let g:html_use_xhtml = 1 " use XHTML instead of HTML.
    " script
    " for f in *.[ch]; do gvim -f +"syn on" +"run! syntax/2html.vim" +"wq" +"q" $f; done

    " command :MyToHtml
    " Now you can select a range of lines, type :MyToHtml and use the result to post your code
    " to an HTML-enabled web forum.
    function! MyToHtml(line1, line2)
        " make sure to generate in the correct format
        let old_css = 1
        if exists('g:html_use_css')
            let old_css = g:html_use_css
        endif
        let g:html_use_css = 0
        " generate and delete unneeded lines
        exec a:line1.','.a:line2.'TOhtml'
        %g/<body/normal k$dgg
        " convert body to a table
        %s/<body\s*\(bgcolor="[^"]*"\)\s*text=\("[^"]*"\)\s*>/<table \1 cellPadding=0><tr><td><font color=\2>/
        %s#</body>\(.\|\n\)*</html>#\='</font></td></tr></table>'#i
        " restore old setting
        let g:html_use_css = old_css
    endfunction
    command! -range=% MyToHtml :call MyToHtml(<line1>,<line2>)
    " }}}

    " [ matchit ] {{{
        " '%' to match more than just single characters.
        " %, g%, [%, ]%, a%,
        runtime macros/matchit.vim " load system matchit.vim plugin
    " }}}

    " [ convert file into unix & utf-8 ] {{{
    function! ConvertFile2UnixUTF8()
        if &fileformat != 'unix' || &fileencoding != 'utf-8'
            echoerr 'your file format and encoding is not unix and utf-8'
            echohl WarningMsg
            let g:ConvertFileFormatEncodePrompt = input("convert to unix ? (y or n) ")
            set fileformat=unix
            set fileencoding=utf-8
        endif
    endfunction
    " }}}

" }}}

" [ autogroup -> autocmd ] {{{
    if has("autocmd")
        augroup vimrc
            au!

            " Jump to last-known-position when editing files
            autocmd BufReadPost *
                        \ if line("'\"") > 1 && line("'\"") <= line("$") |
                        \   exe "normal! g'\"" |
                        \ endif

            " Default omni completion based on syntax
            if exists("+omnifunc")
                autocmd Filetype *
                            \ if &omnifunc == "" |
                            \   setlocal omnifunc=syntaxcomplete#Complete |
                            \ endif
            endif
        augroup END
    endif
" }}}

" [[ Misc ]] {{{

    " [ abbreviations ] {{{
    " Abbreviations are used in Insert, Replace and Command-line mode.
    " three types of abbreviations: full-id, end-id, non-id.
    " show current buffer all abbreviates with command: ':verbose abbreviate'.
    source ~/.vim/misc/abbreviations.vim
    " }}}

    " [ large file ]

    " for Awesome Mod4-d sdcv ( OR replace viw with "vaw" )

    " for binary files (such as exe, bin, etc)
        " vim -b : edit binary using xxd-format!
        "augroup Binary
          "au!
          "au BufReadPre  *.bin let &bin=1
          "au BufReadPost *.bin if &bin | %!xxd
          "au BufReadPost *.bin set ft=xxd | endif
          "au BufWritePre *.bin if &bin | %!xxd -r
          "au BufWritePre *.bin endif
          "au BufWritePost *.bin if &bin | %!xxd
          "au BufWritePost *.bin set nomod | endif
        "augroup END
" }}}

" [ local/project specific vimrc ] {{{
" if filereadable('~/.vim/local.vim')
"     " local vimrc
"     source ~/.vim/local.vim
" elseif filereadable('.local.vim')
"     " project vimrc
"     source .local.vim
" endif
" }}}

" ----------------------------------------------------------------

" [ plugins list ] {{{
    " Github
"vim-github",
"github:tpope/vim-rhubarb",
    " CSV & CVS
"csv",
"cvsmenu",
    " Completion <Tab>
"github:mbbill/code_complete",
    " snippet
"SnippetComplete",
    " skeleton / template
"SonicTemplate",
    " buffers
"Tagma_Buffer_Manager",
"LustyJuggler",
    " syntax checker
"flymake",
    " Debugger
"GdbFromVim",
"gdbmgr",
    " task list
"GrepTasks",
    " search & find
"unite-ssh",
"FuzzyFinder",
"SearchParty",
"Area_search",
"asyncfinder",
    " indent guides & indent & align & splijoin
"splitjoin",
    " REPL
    " session & undo & history
    " other small functions
"TagmaLast",
"SwapIt",
    " Author info & License
"AuthorInfo",
    " regexp
"Vim-Support",
"runVimTests",
    " Python
"python_match",
"python_open_module",
"PyREPL",
"selfdot",
    " Django
"vim-htmldjango_omnicomplete",
"vim-django-support",
"vim-django",
    " Web: HTML/CSS/XML etc
"HTML_AutoCloseTag",
"css3_mod",
    " JavaScript
"jsflakes%4057",
"jsruntime",
"jsoncodecs",
"jsbeautify",
"sourcebeautify",
"javaScriptLint",
"jQuery",
    " Dart
"Dart",
    " PHP
"DBGPavim",
"Xdebug",
"vim-addon-xdebug",
"phpqa",
"PHPUnit_QF",
"pdv-standalone",
"Drupal",
"cakephp",
"cake",
"behat.zip",
    " vimwiki & note
"github:mattn/calendar-vim",
"VikiDeplate",
"vikitasks",
"vktheming",
"viske",
"vim-pad",
    " GTD
"github:gregsexton/Vomodoro",
    " outliner
"HyperList",
"VOoM",
    " TeX & LaTeX
"auctex",
"TeX_9",
"AutomaticLaTeXPlugin",
"TeX-PDF",
    " markup & markdown
"riv",
    " encrypt
"tGpg",
"openssl",
        " vim-gnupg
"gnupg%3645",
"github:jamessan/vim-gnupg",
    " post/paste/www micro-blog/twitter/code/text/www
"wwwsearch",
"Tumble",
"TwitVim",
    " color/syntax
"Colorizer",
"CSSMinister",
"ScrollColors",
"ColorSchemeEditor",
"EasyColour",
"VIM_Color_Picker",
"nosyntaxwords",
    " colorschemes
"DynamicSigns",
"Mark%2666",
    " format
"Txtfmt_The_Vim_Highlighter",
"HybridText",
"open-browser",
"trailing-whitespace",
    " write & spell checker & speak
"Engspchk",
"SpellCheck",
"LanguageTool",
"VimSpeak",
        " 2HTML
"formatvim",
    " TUI : Text User Interface
"forms",
    " Vim Extension
"LineJuggler",
"StarRange",
"exjumplist",
"AsyncCommand",
    " marks
"mathematic",
"SudoEdit",
"sudo",
"dwm",
"ZoomWin",
"CompleteHelper",
"AmbiCompletion",
"LargeFile",
    " small tools
"bestfriend",

" call vam#ActivateAddons(plugins)
" call neobundle#source(plugins)

" for plugin_name, plugin_source in items(plugins)
"     " or if plugin_source =~# '' is empty
"     if check_plugin_name_key_available_for_plugin_manager(plugin_name)
"         plugin_manager_active(plugin_name)
"     else
"         plugin_manager_active(plugin_source)
"     endif
" endfor
" }}}

" [[ addons manager: VAM, neobundle, vundle, pathogen, tplugin, ]] {{{
    " [ pathogen ] {{{ .vim/bundle/
        " " .vim/autoload/pathogen.vim || .vim/bundle/* || :Helptags ||
        " call pathogen#infect()
        " call pathogen#helptags()
    " }}}

    " [ vundle ] {{{ .vim/bundle/
        " Usage:
        " after update, press 'u' to see git repo changlog, (commits)

        " simple way
        " set runtimepath+=~/.vim/bundle/vundle/
        " call vundle#rc()
        " " let Vundle manage Vundle
        " Bundle 'gmarik/vundle'

        " [ advanced way ]
        " filetype off " required !
        " let root = '~/.vim/bundle'
        " let src = 'http://github.com/gmarik/vundle.git'
        " if !isdirectory(expand(root).'/vundle')
        "     exec '!git clone '.src.' '.root.'/vundle'
        " endif
        " exec 'set rtp+='.root.'/vundle'
        " call vundle#rc()

        " let vundle manage vundle
        " Bundle 'gmarik/vundle'

        " [ bundle list ] {{{
            " Bundle 'fugitive.vim'
        " }}}
    " }}}

    " [ neobundle ] {{{ NeoBundle is Vim plugin manager based on Vundle .vim/bundle/
        " Usage:
        " :NeoBundleUpdate
        " :NeoBundleInstall or :Unite neobundle/install
        " :Unite neobundle/search -- search plugin from sources.
        "   - <C-l> : remake cache.
        "   - sources:
        "       - vim-script.org -- http://vim-scripts.org
        "       - neobundle-vim-scripts -- from neobundle-recipe
        " :NeoBundleLog -- git updates commit messages
        " :NeoBundleUpdatesLog -- simple version of :NeoBundleLog
        " :NeoBundleList          - list configured bundles
        " :NeoBundleInstall(!)    - install(update) bundles
        " :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

        " options
        " let g:neobundle#types#raw#calc_hash_command = '' " 'sha1sum'/'md5sum'
        let g:neobundle#install_max_processes = 5 " async update

        " check neobundle installed {{{
        fun! InstallNeoBundle(path)
            if isdirectory(expand(a:path))
                return 1
            elseif confirm("install neobundle into " . a:path . "?", "&Y\n&N") == 1
                call mkdir(expand(a:path), 'p')
                execute '!git clone git://github.com/Shougo/neobundle.vim '
                            \ . expand(a:path)
                exec 'helptags' . fnameescape(a:path . '/doc')
                return 0
            endif
        endfun
        let neobundle_path = "~/.vim/bundle/neobundle"
        if !InstallNeoBundle(neobundle_path)
            echohl ErrorMsg ; echomsg "No neobundle found!" ; echohl NONE
        endif

        filetype off " Required!
        if has('vim_starting')
            set runtimepath+=~/.vim/bundle/neobundle/
        endif
        call neobundle#rc(expand('~/.vim/bundle/'))
        " }}}

        " [ bundles ] {{{
        " examples {{{
        " - Original repos on github
        " NeoBundle 'tpope/vim-fugitive'
        " NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
        " - vim-scripts repos
        " NeoBundle 'L9'
        " - Non github repos
        " NeoBundle 'git://git.wincent.com/command-t.git'
        " - Non git repos
        " NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'
        " - raw repository
        " NeoBundle 'https://raw.github.com/m2ym/rsense/master/etc/rsense.vim'
        " - recipe attributes
        "   - 'rtp' is a relative path.
        "	e.g. bundle/vimwiki/src/autoload
        "	    -> 'rtp': 'src',
        "   - 'name'
        "   - 'directory'
        "   - 'base'
        "   - 'type': -- 'git', 'hg', 'raw', 'nosync'
        "   - 'depends'
        "   - 'build'
        "   - 'external_commands': -- Dictionary or List.
        "   - 'rev': -- revision or branch name.
        "   - 'type__shallow': 1 -- use shallow clone
        "   - 'type__update_style': 'default'(master) / 'current'(topic)
        " nested attributes,
        " syntax suger -> every value in Dictionary can be nested with Dictionary/List.
        " NeoBundle 'https://bitbucket.org/ZyX_I/aurum', {'depends':
        "             \ [ 'https://bitbucket.org/ZyX_I/frawor',
        "               \ ['kk/kk', {'rtp': 'vim'}],
        "             \ ]}
        " NeoBundle 'https://bitbucket.org/ZyX_I/aurum', {
        "             \ 'type': 'hg',
        "             \ 'depends': [ ['https://bitbucket.org/ZyX_I/frawor', {'type': 'hg'}] ],
        "             \ }
        " NeoBundle 'neocomplcache.vim', {
        "             \ 'directory': 'neocomplcache',
        "             \ 'type': 'hg',
        "             \ 'depends': ['vimproc',]
        "             \ 'rtp': 'vim',
        "             \ 'base': '~/.vim/bundle',
        "             \ }
        " - revision lock
        " NeoBundle 'neocomplcache', '3787e5'
        " NeoBundle 'neocomplcache', 'master'
        " - name
        " NeoBundleLazy 'The-NERD-tree', {'augroup': 'NERDTree'}
        " NeoBundleSource The-NERD-tree
        " - build plugin
        " NeoBundle 'Shougo/vimproc', {
        "     \ 'build' : {
        "         \ 'windows': 'echo "vimproc binary file does not support Windows."',
        "         \ 'cygwin': 'make -f make_cygwin.mak',
        "         \ 'mac': 'make -f make_mac.mak',
        "         \ 'unix': 'make -f make_unix.mak',
        "         \ },
        "     \ }
        " }}}

        " Let NeoBundle manage NeoBundle
        NeoBundle 'Shougo/neobundle.vim', {
                    \ 'depends': [
                        \ 'Shougo/unite.vim',
                        \ 'Shougo/neobundle-vim-scripts',
                        \ ],
                    \ 'directory': 'neobundle',
                    \ }

        " [ Vim improve ] {{{
        " vimrc/startup/plugins/profile
        " NeoBundle 'tomtom/tplugin_vim'
        " NeoBundle 'joonty/vim-sauce'
        " envirement
        NeoBundle 'Shougo/vimproc', {
            \ 'build': {
                \ 'windows': 'echo "vimproc binary file does not support Windows."',
                \ 'unix': 'make -f make_unix.mak',
                \ 'mac': 'make -f make_mac.mak',
                \ 'cygwin': 'make -f make_cygwin.mak',
                \ },
            \ }
        " NeoBundle 'xolox/vim-shell'
        NeoBundle 'Lokaltog/vim-powerline'
        NeoBundle 'tyru/current-func-info.vim'
        " quickfix, marks, signatures, status
        NeoBundle 'tomtom/quickfixsigns_vim', {
                    \ 'depends': ['tomtom/tlib_vim', 'tomtom/tinykeymap_vim'],
                    \ }
        NeoBundle 'kshenoy/vim-signature'
        " NeoBundle 'vim-scripts/vmark.vim--Visual-Bookmarking'
        " TODO NeoBundle 'dannyob/quickfixstatus'
        " TODO NeoBundle 'osyo-manga/unite-quickfix'
        " TODO NeoBundle 'samiconductor/vim-sharefix'
        " NeoBundle 'xolox/vim-session'
        " TODO NeoBundle 'Shougo/unite-session'
        NeoBundle 'vim-scripts/restore_view.vim'
        NeoBundle 'chrisbra/Recover.vim'
        " Complete
        " NeoBundle 'ervandew/supertab'
        " NeoBundle 'caio/querycommandcomplete.vim'
        " Windows
        " NeoBundle 'roman/golden-ratio'
        " NeoBundle 'spolu/dwm.vim'
        " Buffer
        " FIXME NeoBundle 'fholgado/minibufexpl.vim'
        " NeoBundle 'jeetsukumaran/vim-buffergator'
        " Tab
        " TODO NeoBundle 'kien/tabman.vim'
        " Pairs
        NeoBundle 'tpope/vim-surround'
        NeoBundle 'jiangmiao/auto-pairs'
        " TODO NeoBundle 'Townk/vim-autoclose'
        " NeoBundle 'vim-scripts/AutoClose'
        " TODO NeoBundle 'Raimondi/delimitMate'
        " NeoBundle 'kien/rainbow_parentheses.vim'
        " NeoBundle 'tpope/vim-endwise'
        " Undo
        NeoBundle 'mbbill/undotree'
        " Colorscheme
        " NeoBundle 'tomasr/molokai'
        " NeoBundle 'sickill/vim-monokai'
        " NeoBundle 'altercation/vim-colors-solarized'
        " NeoBundle 'nanotech/jellybeans.vim'
        " NeoBundle 'w0ng/vim-hybrid'
        " NeoBundle 'ciaranm/inkpot'
            " colorsets
            " NeoBundle 'altercation/solarized'
            " NeoBundle 'chriskempson/tomorrow-theme'
            " NeoBundle 'hukl/Smyck-Color-Scheme'
        " Register
        NeoBundle 'tpope/vim-repeat'
        " Motion : text object,
        NeoBundle 'tpope/vim-unimpaired'
        NeoBundle 'vim-scripts/CountJump'
        " NeoBundle 'Lokaltog/vim-easymotion'
        " NeoBundle 'michaeljsmith/vim-indent-object'
        " NeoBundle 'kana/vim-textobj-user'
        " Shell
        " NeoBundle 'Shougo/vimshell'
        " NeoBundle 'sjl/clam.vim'
        " unicode symbol
        " TODO NeoBundle 'chrisbra/unicode.vim'
        " TODO NeoBundle 'https://bitbucket.org/Fanael/vim-transliterate', { 'type': 'hg' }
        " Outline
        NeoBundle 'h1mesuke/unite-outline'
        " NeoBundle 'insanum/votl'
        " Others
        NeoBundle 'zef/vim-cycle'
        " NeoBundle 'AndrewRadev/switch.vim'
        " NeoBundle 'tpope/vim-speeddating'
        " NeoBundle 'myusuf3/numbers.vim'
        NeoBundle 'kana/vim-gf-diff'
        NeoBundle 'kana/vim-gf-user'
        " TODO NeoBundle 'junkblocker/patchreview-vim'
        " menu
        " NeoBundle 'mbadran/headlights'
        " modeline
        " NeoBundle 'ciaranm/securemodelines'
        " }}}

        " [ VimL: Vim libraries/frameworks ] {{{
        NeoBundle 'tomtom/tlib_vim'
        NeoBundle 'https://bitbucket.org/ns9tks/vim-l9', { 'type': 'hg', 'directory': 'L9' }
        " NeoBundle 'tomtom/prototype_vim'
        " NeoBundle 'megaannum/self'
        " NeoBundle 'mattn/webapi-vim'
        " NeoBundle 'vim-jp/vital.vim'
        " NeoBundle 'tomtom/vimtlib'
        " NeoBundle 'https://bitbucket.org/ZyX_I/frawor', { 'type': 'hg' }
        " NeoBundle 'dahu/Chroma'
        " NeoBundle 'dahu/vimple'
        " }}}

        " [ program ] {{{
        " complete
        NeoBundle 'Shougo/neocomplcache', { 'depends': ['Shougo/vimproc'] }
        " NeoBundle 'https://bitbucket.org/ns9tks/vim-autocomplpop'
        " help
        NeoBundle 'thinca/vim-ref', {
                    \ 'external_commands': [
                        \ 'refe', 'pydoc', 'perldoc',
                        \ 'erl',
                        \ 'w3m',
                        \ ]
                    \ }
                    " FIXME 'clj' for Clojure, 'rsense' for Ruby.
        " NeoBundle 'powerman/vim-plugin-viewdoc', {
        "             \ 'external_commands': ['pydoc', 'perldoc', 'man'],
        "             \ }
        " TODO NeoBundle 'vim-scripts/Manuals'
        " NeoBundle 'tsukkee/unite-help', {'depends': 'Shougo/unite.vim'}
        " snippets
        " TODO
        NeoBundle 'Shougo/neocomplcache-snippets-complete', {
                    \ 'depends': 'Shougo/neocomplcache',
                    \ 'rev': 'neosnippet',
                    \ 'type__update_style': 'current',
                    \ }
        NeoBundle 'SirVer/ultisnips'
        " NeoBundle 'drmingdrmer/xptemplate'
        " NeoBundle 'garbas/vim-snipmate'
        " NeoBundle 'scrooloose/snipmate-snippets'
        " tags/cscope
        NeoBundle 'majutsushi/tagbar', { 'external_commands': ['ctags'], }
        " NeoBundle 'vim-scripts/taglist.vim', { 'external_commands': ['ctags'], }
        " NeoBundle 'abudden/TagHighlight'
        NeoBundle 'xolox/vim-easytags', { 'external_commands': ['ctags'], }
        " NeoBundle 'basilgor/vim-autotags', { 'external_commands': ['ctags', 'cscope', 'md5sum'] }
        " NeoBundle 'indexer.tar.gz', {
        "             \ 'depends': ['DfrankUtil', 'vimprj'],
        "             \ 'external_commands': ['ctags'],
        "             \ }
        " NeoBundle 'https://bitbucket.org/madevgeny/yate.git'
        " NeoBundle 'brookhong/cscope.vim', {'external_commands': ['cscope']}
        NeoBundle 'NagatoPain/cscope.vim', {
                    \ 'external_commands': ['cscope'],
                    \ 'rev': 'master',
                    \ 'type__update_style': 'current',
                    \ }
        " NeoBundle 'vim-scripts/CCTree'
        " NeoBundle 'wesleyche/SrcExpl'
        " TODO NeoBundle 'joonty/vim-taggatron', {'external_commands': ['ctags']}
        " NeoBundle 'vim-scripts/gtags.vim'
        " NeoBundle 'daisuzu/unite-gtags'
        " file manager
        NeoBundle 'scrooloose/nerdtree'
        NeoBundle 'ivalkeen/nerdtree-execute', { 'depends': ['scrooloose/nerdtree'] }
        NeoBundle 'toritori0318/vim-nerdtree-plugin', {
                    \ 'depends': ['scrooloose/nerdtree', 'mileszs/ack.vim'],
                    \ 'directory': 'nerdtree-plugin',
                    \ }
        " TODO NeoBundle 'troydm/easytree.vim'
        " TODO NeoBundle 'vim-scripts/project.tar.gz'
        " TODO NeoBundle 'Shougo/vimfiler'
        " NeoBundle 'troydm/easybuffer.vim'
        NeoBundle 'airblade/vim-rooter'
        " compile & run
        NeoBundle 'xuhdev/SingleCompile', {
                    \ 'external_commands': [
                        \ 'ruby', 'python', 'php', 'perl',
                        \ 'bash', 'zsh', 'sh',
                        \ 'gcc', 'clang',
                        \ 'make', 'cmake',
                        \ 'lua',
                        \ 'firefox', 'gcj', 'js', 'nodejs', 'gjs',
                        \ 'clisp', 'gcl',
                        \ 'ghc',
                        \ 'escript',
                        \ 'gfortran',
                        \ 'markdown',
                        \ 'latex',
                        \ ],
                    \ }
        " syntax checker
        NeoBundle 'scrooloose/syntastic', {
                    \ 'external_commands': [
                        \ 'zsh', 'bash',
                        \ 'ruby', 'python', 'flake8', 'php', 'perl',
                        \ 'clisp',
                        \ 'go',
                        \ 'luac',
                        \ 'gcc', 'clang',
                        \'g++', 'clang++',
                        \ 'coffee',
                        \ 'tidy',
                        \ 'xmllint',
                        \ 'lacheck',
                        \ 'ghc-mod',
                        \ 'erl',
                        \ 'escript',
                        \ 'gfortran',
                        \ 'cucumber',
                        \ 'javac',
                        \ 'nasm',
                        \ ],
                    \ }
        " search [grep, MRU, files]
        " TODO NeoBundle 'kien/ctrlp.vim'
        " TODO NeoBundle 'wincent/Command-T'
        NeoBundle 'vim-scripts/EasyGrep'
        NeoBundle 'mileszs/ack.vim'
        " TODO NeoBundle 't9md/vim-unite-ack'
        " regex
        " NeoBundle 'Raimondi/VimRegEx.vim', { 'depends': ['vsutil.vim'] }
        " syntax / indent / fold
        NeoBundle 'nathanaelkane/vim-indent-guides'
        " NeoBundle 'ciaranm/detectindent'
        NeoBundle 'conormcd/matchindent.vim'
        NeoBundle 'vim-scripts/simplefold'
        " REPL (Read-eval-print loop)
        " TODO NeoBundle 'jpalardy/vim-slime'
        " NeoBundle 'krisajenkins/vim-pipe'
        " Narrow Region
        " TODO NeoBundle 'chrisbra/NrrwRgn'
        " VCS
        " TODO
        " NeoBundle 'https://bitbucket.org/ZyX_I/aurum', {
        "             \ 'type': 'hg',
        "             \ 'depends': [
        "                 \ ['https://bitbucket.org/ZyX_I/frawor',
        "                     \ {'type': 'hg'}
        "                     \ ]
        "                 \ ],
        "             \ }
                    " (optional depends):
                        " - Command-T
                        " - ctrlp
                        " - FuzzyFinder
                        " - unite
                        " - ku
                        " - tlib
        NeoBundle 'tpope/vim-git'
        NeoBundle 'tpope/vim-fugitive', {'external_commands': ['git']}
        NeoBundle 'gregsexton/gitv', {'external_commands': ['git']}
        " TODO NeoBundle 'c9s/hypergit.vim', {'external_commands': ['git', 'hg', 'svn']}
        " TODO NeoBundle 'nsmgr8/vitra'
        NeoBundle 'vim-scripts/hgrev', {'external_commands': ['hg']}
        " NeoBundle 'taq/vim-git-branch-info'
        " TODO NeoBundle 'sjl/splice.vim'
        NeoBundle 'ConflictDetection'
        NeoBundle 'ConflictMotions', { 'depends': ['vim-scripts/CountJump'] }
        " comment
        NeoBundle 'tomtom/tcomment_vim'
        " NeoBundle 'scrooloose/nerdcommenter'
        " NeoBundle 'tpope/vim-commentary'
        " NeoBundle 'mklabs/vim-cowsay', {
        "             \ 'depends': ['tomtom/tcomment_vim'],
        "             \ 'external_commands': ['cowsay'],
        "             \ }
        " Tabular
        NeoBundle 'godlygeek/tabular'
        " TODO NeoBundle 'tsaleh/vim-align'
        " NeoBundle 'vim-scripts/filter'
        " debugger
        " TODO NeoBundle 'joonty/vdebug'
        " TODO NeoBundle 'kablamo/VimDebug'
        " TODO NeoBundle 'skibyte/gdb-from-vim'
        " Task List
        " NeoBundle 'LStinson/TagmaTasks'
        " NeoBundle 'vim-scripts/TaskList.vim'
        NeoBundle 'TaskMotions', { 'depends': ['vim-scripts/CountJump'] }
        " License
        " NeoBundle 'vim-scripts/license-loader'
        " }}}

        " [ languages ] {{{
        " VimL
        " NeoBundle 'Shougo/vesting', { 'depends': ['Shougo/unite.vim'] }
        " Ruby
        NeoBundle 'vim-ruby/vim-ruby'
        " NeoBundle 'taichouchou2/vim-rsense'
        " NeoBundle 'vadv/rubycomplete'
        " NeoBundle 'danchoi/ri.vim', {'external_commands': ['ri']}
        " NeoBundle 'astashov/vim-ruby-debugger'
        " NeoBundle 'ecomba/vim-ruby-refactoring'
        " NeoBundle 'tpope/vim-rails'
        " NeoBundle 'basyura/unite-rails'
        " NeoBundle 'ujihisa/unite-gem'
        NeoBundle 'tpope/vim-rvm', {'external_commands': ['rvm']}
        " NeoBundle 'tpope/vim-bundler', {'external_commands': ['bundle']}
        " NeoBundle 'tpope/vim-rake', {'external_commands': ['rake']}
        " TODO
        " NeoBundle 'ujihisa/neco-rake', {
        " 	    \ 'depends': ['Shougo/neocomplcache', 'Shougo/vimshell'],
        " 	    \ 'external_commands': ['rake'],
        " 	    \ }
        " TODO NeoBundle 'ujihisa/neco-rubymf', {
        " 	    \ 'depends': ['Shougo/neocomplcache', 'Shougo/vimshell'],
        " 	    \ }
        " NeoBundle 'nelstrom/vim-textobj-rubyblock'
        " NeoBundle 'Bogdanp/rbrepl.vim'
        " TODO NeoBundle 'MarcWeber/vim-addon-ruby-debug-ide'
        " NeoBundle 'janx/vim-rubytest'
        " NeoBundle 'skalnik/vim-vroom'
        " NeoBundle 'pgr0ss/vimux-ruby-test'
        " NeoBundle 'cloud8421/vimux-cucumber'
        " TODO NeoBundle 'jgdavey/vim-turbux'
        " NeoBundle 'skwp/vim-ruby-conque'
        " Python
        NeoBundle 'vim-scripts/pythoncomplete'
        " NeoBundle 'fs111/pydoc.vim', {'external_commands': ['pydoc']}
        " NeoBundle 'kevinw/pyflakes-vim'
        NeoBundle 'jmcantrell/vim-virtualenv', {'external_commands': ['virtualenv']}
        " NeoBundle 'ivanov/vim-ipython', {'external_commands': ['ipython']}
        NeoBundle 'ehamberg/vim-cute-python', {
                    \ 'rev': 'moresymbols',
                    \ 'type__update_style': 'current',
                    \ }
        " NeoBundle 'alfredodeza/pytest.vim'
        " NeoBundle 'julienr/vimux-pyutils'
            " Django
            " TODO NeoBundle 'yodiaditya/vim-pydjango'
        " C / C++(cpp)
        NeoBundle 'Shougo/neocomplcache-clang', { 'depends': ['Rip-Rip/clang_complete'] }
        " NeoBundle 'yandy/vim-omnicppcomplete'
        " Go
        " NeoBundle 'undx/vim-gocode'
        " NeoBundle 'jnwhiteh/vim-golang'
        " Lua
        " TODO NeoBundle 'xolox/vim-lua-ftplugin'
        " TODO NeoBundle 'vim-scripts/lua_omni'
        " TODO NeoBundle 'vim-scripts/luarefvim'
        " TODO NeoBundle 'xolox/vim-lua-inspect'
        " SQL
        " TODO NeoBundle 'vim-scripts/dbext.vim'
        " TODO NeoBundle 'mattn/vdbi-vim'
        " TODO NeoBundle 'vim-scripts/SQLUtilities'
        " NoSQL
        " NeoBundle 'vim-scripts/nosql.vim'
        " HTML
        " NeoBundle 'mattn/zencoding-vim'
        " TODO NeoBundle 'rstacruz/sparkup', { 'rtp': 'vim/' }
        NeoBundle 'gregsexton/MatchTag'
        NeoBundle 'othree/html5.vim'
        " NeoBundle 'tpope/vim-ragtag'
        " XML
        " NeoBundle 'sukima/xmledit'
        " NeoBundle 'vim-scripts/onsgmls.vim'
        " NeoBundle 'vim-scripts/xmlwf.vim', {'external_commands': ['xmlwf']}
        " CSS
        " NeoBundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
        " NeoBundle 'hail2u/vim-css3-syntax'
        " NeoBundle 'skammer/vim-css-color'
            " Vim runtime files for Haml, Sass, and SCSS
            " TODO NeoBundle 'tpope/vim-haml'
            " LESS
            " TODO NeoBundle 'groenewege/vim-less'
            " SCSS
            " TODO NeoBundle 'cakebaker/scss-syntax.vim'
            " Stylus
            " TODO NeoBundle 'wavded/vim-stylus'
        " JavaScript
        NeoBundle 'pangloss/vim-javascript'
        " NeoBundle 'teramako/jscomplete-vim'
        " NeoBundle 'jelera/vim-javascript-syntax'
        " NeoBundle 'hallettj/jslint.vim'
        " TODO NeoBundle 'walm/jshint.vim'
            " jQuery
            " NeoBundle 'itspriddle/vim-jquery'
            " JSON
            " TODO NeoBundle 'alfredodeza/jacinto.vim'
        " CoffeeScript
        " TODO NeoBundle 'kchmck/vim-coffee-script'
        " NeoBundle 'lukaszkorecki/CoffeeTags', {'depends': 'majutsushi/tagbar'}
        " Clojure
        " TODO NeoBundle 'vim-scripts/VimClojure'
        " Haskell
        " TODO NeoBundle 'Twinside/vim-haskellConceal'
        " Erlang
        " TODO NeoBundle 'oscarh/vimerl'
        " Scala
        " TODO NeoBundle 'derekwyatt/vim-scala'
        " PHP
        " NeoBundle 'shawncplus/phpcomplete.vim'
        " TODO NeoBundle 'tobyS/vip'
        " TODO NeoBundle 'spf13/PIV'
        " TODO NeoBundle 'techlivezheng/tagbar-phpctags', {'depends': 'majutsushi/tagbar'}
        " Lisp
        " TODO NeoBundle 'vim-scripts/slimv.vim'
        " TODO NeoBundle 'mattn/lisper-vim'
        " TODO NeoBundle 'paredit.vim'
        " Haskell
        " NeoBundle 'ujihisa/neco-ghc', { 'external_commands': {'unix': 'ghc-mod'} }
        " TODO NeoBundle 'eagletmt/ghcmod-vim', {
        "             \ 'depends': 'Shougo/vimproc',
        "             \ 'external_commands': {'unix': 'ghc-mod'},
        "             \ 'build': { 'unix': 'cabal install ghc-mod' },
        "             \ }
        " TODO NeoBundle 'dag/vim2hs'
        " Perl
        " NeoBundle 'c9s/perlomni.vim'
        " R
        " NeoBundle 'jcfaria/Vim-R-plugin', {
        "             \ 'depends': ['jalvesaq/VimCom', 'ervandew/screen'],
        "             \ 'external_commands': ['R', 'tmux',],
        "             \ }
        " TODO NeoBundle 'vim-scripts/R.vim'
        " TODO NeoBundle 'vim-scripts/GNU-R'
        " Assembly
        " NeoBundle 'pksunkara/vim-dasm'
        " Markdown
        " NeoBundle 'tpope/vim-markdown'
        " NeoBundle 'suan/vim-instant-markdown'
        " NeoBundle 'greyblake/vim-preview'
        " NeoBundle 'jeffbuttars/Vimdown'
            " pacdoc
            " TODO NeoBundle 'vim-pandoc/vim-pandoc'
            " TODO NeoBundle 'vim-pandoc/vim-pandoc-extras'
            " Textile
            " TODO NeoBundle 'timcharper/textile.vim'
        " XQuery
        " NeoBundle 'vim-scripts/XQuery-indentomnicompleteftplugin'
        " NeoBundle 'coledarr/vim-xqmarklogic'
        " }}}

        " [ frameworks ] {{{
        " Android
        " TODO NeoBundle 'pwicks86/eclim-for-vundle'
        " }}}

        " [ tools ] {{{
        " Wiki / Note / Org
        NeoBundle 'https://code.google.com/p/vimwiki/', { 'rtp': 'src' }
        " TODO NeoBundle 'danchoi/soywiki'
        " TODO NeoBundle 'xolox/vim-notes'
        " TODO NeoBundle 'hsitz/VimOrganizer'
        " Paste
        NeoBundle 'mattn/gist-vim', { 'depends': ['mattn/webapi-vim'] }
        " NeoBundle 'tpope/vim-pastie'
        " NeoBundle 'sickill/vim-pasta'
        " Color
        " NeoBundle 'Rykka/colorv.vim'
        " Tmux & Screen
        " NeoBundle 'benmills/vimux', {'external_commands': ['tmux']}
        " TODO NeoBundle 'ervandew/screen', {'external_commands': ['tmux', 'screen']}
        " Draw
        " TODO NeoBundle 'vim-scripts/DrawIt'
        " TODO NeoBundle 'vim-scripts/ditaa', {'external_commands': ['ditaa']}
        " IM
        " FIXME after my patch merged by upstream, use switch back to original repo
        " NeoBundle 'vimim/vimim'
        NeoBundle 'NagatoPain/vimim', {
                    \ 'rev': 'develop',
                    \ 'type__update_style': 'current',
                    \ }
        " binary/hex files
        " NeoBundle 'rbtnn/hexript.vim', {
        "             \ 'depends': [ 'Shougo/vimproc', ],
        "             \ 'external_commands': {'unix': 'xxd',},
        "             \ }
        " NeoBundle 'tpope/vim-afterimage'
        " NeoBundle 'Shougo/vinarise'
        " time
        " NeoBundle 'mnick/vim-pomodoro'
        " others
        NeoBundle 'vim-scripts/utl.vim'
        " TODO NeoBundle 'thinca/vim-quickrun'
        NeoBundle 'bitc/vim-bad-whitespace'
        NeoBundle 'thinca/vim-visualstar'
        NeoBundle 'vim-scripts/SpitVspit'
        " NeoBundle 'dahu/VimLint'
        " NeoBundle 'tomtom/startup_profile_vim'
        " TODO NeoBundle 'mikewest/vimroom'
        " }}}
        " }}}

        " Installation check.
        if neobundle#exists_not_installed_bundles()
            echomsg 'Not installed bundles : ' .
                        \ string(neobundle#get_not_installed_bundle_names())
            echomsg 'Please execute ":NeoBundleInstall" command.'
            "finish
        endif
    " }}}

    " [ VAM : vim addon manager ] {{{ .vim/addons/
        " [ minimal setup ]
            " set runtimepath+=PATH/TO/VAM
            " call vam#ActivateAddons([list of plugins], {'auto_install' : 0})

        " [ complex setup ] {{{
        function! EnsureVamIsOnDisk(vam_install_path) " {{{
            let is_installed_c = "isdirectory(a:vam_install_path.'/vim-addon-manager/autoload')"
            if eval(is_installed_c)
                return 1
            elseif confirm("Clone VAM into ".a:vam_install_path."?","&Y\n&N") == 1
                call mkdir(a:vam_install_path, 'p')
                execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(a:vam_install_path, 1).'/vim-addon-manager'
                exec 'helptags '.fnameescape(a:vam_install_path.'/vim-addon-manager/doc')
                return eval(is_installed_c)
            endif
        endfunction " }}}

        function! SetupVAM() " {{{ options, custom. addons.
            " [ options ] {{{
            let g:vim_addon_manager = {
                        \ 'shell_commands_run_method': 'system',
                        \ 'known_repos_activation_policy': 'autoload',
                        \ 'auto_install': 1,
                        \ 'do_diff': 1,
                        \ 'log_to_buf': 0,
                        \ 'log_buffer_name': '/tmp/vam_install.log',
                        \ 'debug_activation': 0,
                        \ 'addon_completion_lhs': 0,
                        \ }
            " }}}

            " [ custom ] {{{
            " let g:vim_addon_manager.post_install_hook_functions
            let g:vim_addon_manager.pre_update_hook_functions = [
                        \ "vam#install#CreatePatch",
                        \ ]
            let g:vim_addon_manager.post_update_hook_functions = [
                        \ "vam#install#ApplyPatch",
                        \ "VAMShowUpdates",
                        \ ]
            " vam#install#ShowShortLog -> show Git commit updates.
            let g:vim_addon_manager.post_scms_update_hook_functions = [
                        \ "vam#install#ShowShortLog",
                        \ ]
            " }}}

            " VAM install location {{{
            let vam_install_path = expand('$HOME') . '/.vim/addons'
            if !EnsureVamIsOnDisk(vam_install_path)
                echohl ErrorMsg ; echomsg "No VAM found!" ; echohl NONE
                return
            endif
            exec 'set runtimepath+=' . vam_install_path . '/vim-addon-manager'
            " }}}

            " custom source, use your own repository {{{
            let g:vim_addon_manager.plugin_sources = {}
            let g:vim_addon_manager.plugin_sources['neocomplcache-clang'] = {
                        \ 'type': 'git',
                        \ 'url': 'git://github.com/Shougo/neocomplcache-clang',
                        \ 'branch': 'master',
                        \ }
            " vundle compatible version gocode stand alone
            let g:vim_addon_manager.plugin_sources['gocode'] = {
                        \ 'type': 'git',
                        \ 'url': 'git://github.com/undx/vim-gocode',
                        \ 'branch': 'master',
                        \ }

            let plugins = [
                        \ 'neocomplcache-clang',
                        \ 'gocode',
                        \ ]

            call vam#ActivateAddons(plugins, {'auto_install': 1})
            " }}}

            " Plugins List: {{{
            " call vam#ActivateAddons({addons}[, {opts}])
            " call vam#ActivateAddons(plugins)
            " }}}

        endfunction " }}}

        " call SetupVAM() " comment out to disable VAM

        " }}}

        " [ experimental ] {{{ load plugins lazily depending on filetype
        " }}}
    " }}}

filetype plugin indent on " required !
syntax on
" }}}

"AAA XXX
" [ Program ] {{{
    " [ syntax ] {{{
        NeoBundle 'majutsushi/tagbar', { 'external_commands': ['ctags'], }
        " NeoBundle 'vim-scripts/taglist.vim', { 'external_commands': ['ctags'], }
        " NeoBundle 'abudden/TagHighlight'
        "NeoBundle 'xolox/vim-easytags', { 'external_commands': ['ctags'], }


        " TagHighlight {{{ highlight names of class, variable, types in code.
            " Usage: :UpdateTypesFile
            if !exists('g:TagHighlightSettings')
                let g:TagHighlightSettings = {}
            endif
            let g:TagHighlightSettings['TagFileName'] = 'tags'
            let g:TagHighlightSettings['CtagsExecutable'] = 'ctags'
            let g:TagHighlightSettings['CtagsVariant'] = 'exuberant'
            let g:TagHighlightSettings['CtagsArguments'] = []
            let g:TagHighlightSettings['CtagsExtraArguments'] = []
            let g:TagHighlightSettings['ForcePythonVariant'] = 'if_pyth3'
            let g:TagHighlightSettings['PythonVariantPriority'] = [
                        \ "if_pyth3", "if_pyth", "python", "compiled",
                        \ ]

            " Integration other plugins.
            let g:TagHighlightSettings['LanguageDetectionMethods'] =
                        \ ['FileType', 'Extension']
            " Tagbar Integration
            " let g:TagHighlightSettings['FileTypeLanguageOverrides'] =
            "             \ {'tagbar': 'c'}
            " Git Integration
            " let g:TagHighlightSettings['FileTypeLanguageOverrides'] =
            "             \ {'gitcommit': 'python'}

            " Standard Library
            " TODO Android, JDK, PySide, Qt4, wxpython, wxWidgets, etc.
        " }}}
    " }}}

    " [ indent, align, fold ] {{{
        " indent-guides {{{ <Leader>ig, :IndentGuidesToggle
            let g:indent_guides_enable_on_vim_startup = 1
            let g:indent_guides_start_level = 2
            let g:indent_guides_indent_levels = 30
            let g:indent_guides_color_change_percent = 10 " 0~100
            let g:indent_guides_guide_size = 1 " indent vertical lines width.
              " 0: same as shiftwidth, 0~shiftwidth value.
            let g:indent_guides_space_guides = 1 " consider spaces as indention.
                let g:indent_guides_auto_colors = 0
                " autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=3
                " autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=red ctermbg=4
                " alternately
                " hi IndentGuidesOdd  guibg=red   ctermbg=3
                " hi IndentGuidesEven guibg=green ctermbg=4
                if &background == "dark"
                    hi IndentGuidesEven ctermbg=233 guibg=#6F7500
                    hi IndentGuidesOdd  ctermbg=234 guibg=LightRed
                elseif &background == "light"
                    "molokai's background = light, guibg for peachpuff
                    hi IndentGuidesEven ctermbg=233 guibg=#6F7500
                    hi IndentGuidesOdd  ctermbg=234 guibg=LightRed
                endif
        " }}}

        " matchindent {{{ match others's indent style: tab, 4 spaces, 2 spaces.
            " scans through a file when it's opened and attempts to guess which
            " style of indentation is being used. It then overrides your
            " preferences so that you match the style of the file.
        " }}}

        " detect-indent {{{ automatically detecting indent settings
            " Usage:
            " :DetectIndent --> try to set 'shiftwidth', 'expandtab', 'tabstop'.
            " let g:detectindent_perferred_expandtab = 1 " set 'expandtab' as default
            " let g:detectindent_perferred_indent = 4 " set 4 spaces as default
            " let g:detectindent_max_lines_to_analyse = 1024
        " }}}

        " Indent_Highlight

        " simplefold : space-optimized, configurable folds, supports Ruby ...

        " Splitjoin: || https://github.com/AndrewRadev/splitjoin.vim.git
            " {{{ switching between a single-line statement and a multi-line one.
            nmap <Leader>sj :SplitjoinJoin<cr>
            nmap <Leader>ss :SplitjoinSplit<cr>
            "let b:splitjoin_join_callbacks
            "let b:splitjoin_split_callbacks
            let g:splitjoin_normalize_whitespace = 0
            let g:splitjoin_align = 0
        " }}}

        " Align%294
    " }}}

    " [ completion: autocomplete popup menu candidates ] {{{
        " neocomplcache {{{ Ultimate auto Completion system for Vim.
            " Require: vimproc.vim $ make -f make_unix.mak (make proc.so)
            " with vimproc, neocomplcache creates the cache asynchronously.
            " comment out :set complete option.
            " Usage: {{{ auto popup menu, <Tab>, <C-j/k/n/p>, <C-y>, <C-g>, <C-e>
            " - Add other language completion:
            "   :NeoComplCacheSetFileType [filetype]
            "   neocomplcache#get_context_filetype()
            "   unite#get_context_filetype()
            "   this [filetype] only used inside of neocomplcache.
            "   -- to use local composite filetype for neocomplcache
            " - :set ft=html.python
            "   -- to use global composite filetype.
            "   so you can complete HTML and Python as same time.
            "   -- but this will affect other plugins which use 'filetype' too.
            " - :NeoComplCacheCachingTags command to make cache.
            " }}}

            " [ common options ] {{{
            let g:neocomplcache_enable_debug = 0
            let g:acp_enableAtStartup = 0 " Disable AutoComplPop
            let g:neocomplcache_enable_at_startup = 1 " enable at startup time.
            let g:neocomplcache_disable_auto_complete = 0 " 0: enable auto complete
            let g:neocomplcache_skip_auto_completion_time = "0.5" " skip auto completion (+reltime)
                " '' empty to disable
                " if completion time is higher than it, neocomplcache will skip auto completion.
            let g:neocomplcache_force_overwrite_completefunc = 1 " override other completefunc
            let g:neocomplcache_use_vimproc = 1
            let g:neocomplcache_max_list = 100 " candidate number display in popup menu
            let g:neocomplcache_max_keyword_width = 50 " popup menu candidate width
            let g:neocomplcache_max_menu_width = 15 " popup menu width
            let g:neocomplcache_auto_completion_start_length = 2 " auto complete min length
            let g:neocomplcache_manual_completion_start_length = 0 " manually min length
            let g:neocomplcache_min_keyword_length = 3 " keyword complete min length
            let g:neocomplcache_min_syntax_length = 2 " syntax complete min length
            let g:neocomplcache_enable_ignore_case = 1 " ignorecase
            let g:neocomplcache_enable_smart_case = 1 " smartcase
            let g:neocomplcache_enable_wildcard = 1 " wildcard '*', '-' for input-saving
            let g:neocomplcache_enable_cursor_hold_i = 0 " 'CursorHoldI' event
            " 1: 'InsertCharPre' event, version >= 7.3.461
            if v:version == 703 && has("patch461")
                let g:neocomplcache_enable_insert_char_pre = 1
            else
                let g:neocomplcache_enable_insert_char_pre = 0
            endif
            let g:neocomplcache_enable_auto_select = 0 " select first candidate auto
            let g:neocomplcache_disable_select_mode_mappings = 1
            let g:neocomplcache_enable_auto_delimiter = 0 " auto insert delimiter
            let g:neocomplcache_cursor_hold_i_time = 100 " time of auto complete
            let g:neocomplcache_enable_camel_case_completion = 0 " ArgumentExcep -> ArE (not AE)
            let g:neocomplcache_enable_underbar_completion = 0 " public_html -> pu_h (not p_h)
            let g:neocomplcache_enable_fuzzy_completion = 0 " this match is too heavy
            let g:neocomplcache_fuzzy_completion_start_length = 3 " fuzzy complete min length
            let g:neocomplcache_enable_caching_message = 1 " display message in cmdline when cache
            let g:neocomplcache_caching_limit_file_size = 500000 " set file size to make cache
            let g:neocomplcache_tags_caching_limit_file_size = 500000 " tags file size
            let g:neocomplcache_release_cache_time = 900
                " use :NeoComplCacheCachingTags command to make cache.
            let g:neocomplcache_disable_caching_file_path_pattern = '' " pattern of buffer un-cache
            let g:neocomplcache_lock_buffer_name_pattern = '' " pattern of buffer do not auto-complete
            let g:neocomplcache_compare_function = 'neocomplcache#compare_rank'
            if v:version > 703 || v:version == 703 && has('patch519')
                let g:neocomplcache_enable_prefetch = 0
            elseif has('gui_running') && has('xim')
                let g:neocomplcache_enable_prefetch = 1
            endif
            let g:neocomplcache_lock_iminsert = 0 " lock when 'iminsert' is non zero
            let g:neocomplcache_temporary_dir = '~/.neocomplcache'
            " }}}

            " [ complex dictionary options ] {{{
            " [ refers to: neocomplcache/autoload/neocomplcache/sources/ ]
            " those g:neocomplcache_* options only are initialized in first
            " completion, not in Vim's initialization.
            " you can see neocomplcache default value of option by command:
            " :echo g:neocomplcache_*
            " if value/key is "_", means all buffers in neocomplcache.
            " wildcard {{{
            if !exists('g:neocomplcache_wildcard_characters')
                let g:neocomplcache_wildcard_characters = {}
            endif
            " _ for all filetype, default is {'_': '*'}
            let g:neocomplcache_wildcard_characters['_'] = '-'
            " -> e.g. public-html -> p-h [B] -> p-h
            " -> e.g. public_html -> p_h [B] -> p-h
            " -> e.g. HellowWorld -> H-W [B] -> H-W
            " }}}
            " keyword patterns {{{
            if !exists('g:neocomplcache_keyword_patterns')
                let g:neocomplcache_keyword_patterns = {}
            endif
            " let g:neocomplcache_keyword_patterns['_'] = '\h\w*'
            if !exists('g:neocomplcache_next_keyword_patterns')
                let g:neocomplcache_next_keyword_patterns = {}
            endif
            " }}}
            " vim completefunc {{{
            if !exists('g:neocomplcache_vim_completefuncs')
                let g:neocomplcache_vim_completefuncs = {}
            endif
            " }}}
            " omni patterns {{{
            " every filetype or 'omnifunc' need omni_patterns setted, if not
            " setted, neocomplcache will not call omnifunc. partial omnifunc has
            " problem when neocomplcache call. (e.g. rubycomplete, clang_complete).
            " so you should use force_omni_patterns instead.
            if !exists('g:neocomplcache_force_omni_patterns')
                let g:neocomplcache_force_omni_patterns = {}
            endif
            " . -> methods, :: -> class method, # -> instance method.
            let g:neocomplcache_force_omni_patterns['ruby'] = '[^. *\t]\.\w*\|\h\w*::'
            if !exists('g:neocomplcache_omni_patterns')
                let g:neocomplcache_omni_patterns = {}
            endif
            let g:neocomplcache_omni_patterns['python'] = '[^. \t]\.\w*'
            " FIXME this 'go' pattern
            " let g:neocomplcache_omni_patterns['go'] = '[^. \t]\.\w*' " gocode plugin
            let g:neocomplcache_omni_patterns['c'] = '[^.[:digit:] *\t]\%(\.\|->\)'
            let g:neocomplcache_omni_patterns['cpp'] = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
            let g:neocomplcache_omni_patterns['javascript'] = '[^. \t]\.\%(\h\w*\)\?'
            " FIXME
            " let g:neocomplcache_omni_patterns['haskell'] = ''
            " FIXME
            let g:neocomplcache_omni_patterns['clojure'] = '\w\|-\|\.\|+\|*\|/'
            let g:neocomplcache_omni_patterns['sql'] = '[[:alpha:]_.][[:alnum:]_.]*'
            let g:neocomplcache_omni_patterns['r'] = '[[:alnum:].\\]\+' " vim-R-plugin
            let g:neocomplcache_omni_patterns['php'] = '[^. \t]->\h\w*\|\h\w*::' " default / plugin phpcomplete.vim
            let g:neocomplcache_omni_patterns['xquery'] = '\k\|:\|\-\|&' " plugin XQuery-indentomnicompleteftplugin
            " }}}
            " omni functions {{{
            if !exists('g:neocomplcache_omni_functions')
                let g:neocomplcache_omni_functions = {}
            endif
            " if the key is '_', used for all filetypes.
            let g:neocomplcache_omni_functions['_'] = 'syntaxcomplete#Complete' " default syntax omni
            " rsense plugin -> RsenseCompleteFunction
            " vim-ruby plugin -> rubycomplete#Complete
            let g:neocomplcache_omni_functions['ruby'] = 'rubycomplete#Complete'
            if has('python3/dyn') || has('python3')
                let g:neocomplcache_omni_functions['python'] = 'python3complete#Complete' " default python3 omni
            elseif has('python/dyn') || has('python')
                let g:neocomplcache_omni_functions['python'] = 'pythoncomplete#Complete' " default python omni
            endif
            " clang compiler front / ctags / omni complete ==> C, cpp, Go
            let g:neocomplcache_omni_functions['go'] = 'gocomplete#Complete' " plugin gocode
            let g:neocomplcache_omni_functions['c'] = 'ccomplete#Complete' " default
            let g:neocomplcache_omni_functions['cpp'] = 'omni#cpp#complete#Main' " plugin omnicppcomplete
            let g:neocomplcache_omni_functions['hpp'] = 'omni#cpp#complete#Main' " plugin omnicppcomplete
            " - 'javascriptcomplete#CompleteJS' -- default javascript omni
            " - 'jscomplete#CompleteJS' -- jscomplete-vim plugin
            let g:neocomplcache_omni_functions['javascript'] = 'jscomplete#CompleteJS' " jscomplete-vim plugin
            let g:neocomplcache_omni_functions['haskell'] = 'necoghc#omnifunc' " neco-ghc plugin
            let g:neocomplcache_omni_functions['clojure'] = 'vimclojure#OmniCompletion' " VimClojure plugin
            let g:neocomplcache_omni_functions['html'] = 'htmlcomplete#CompleteTags' " html5 plugin
            let g:neocomplcache_omni_functions['sql'] = 'sqlcomplete#Complete' " default
            let g:neocomplcache_omni_functions['r'] = 'rcomplete#CompleteR' " vim-R-plugin
            let g:neocomplcache_omni_functions['php'] = 'phpcomplete#CompletePHP' " default / phpcomplete plugin
            let g:neocomplcache_omni_functions['xquery'] = 'xquerycomplete#CompleteXQuery' " plugin XQuery-indentomnicompleteftplugin
            " }}}
            " member patterns {{{
            if !exists('g:neocomplcache_member_patterns')
                let g:neocomplcache_member_patterns = {}
            endif
            " let g:neocomplcache_member_patterns['default'] = '\h\w*\%(()\|\[\h\w*\]\)\?'
            if !exists('g:neocomplcache_member_prefix_patterns')
                let g:neocomplcache_member_prefix_patterns = {}
            endif
            " }}}
            " delimiter patterns {{{
            if !exists('g:neocomplcache_delimiter_patterns')
                let g:neocomplcache_delimiter_patterns = {}
            endif
            " }}}
            " dictionary {{{
            if !exists('g:neocomplcache_dictionary_filetype_lists')
                let g:neocomplcache_dictionary_filetype_lists = {}
            endif
            " if empty, use Vim 'dictionary' option.
            let g:neocomplcache_dictionary_filetype_lists['default'] = ''
            let g:neocomplcache_dictionary_filetype_lists['text'] = '/usr/share/dict/words'
            if !exists('g:neocomplcache_dictionary_patterns')
                let g:neocomplcache_dictionary_patterns = {}
            endif
            " }}}
            " ctags {{{
            let g:neocomplcache_ctags_program = 'ctags'
            if !exists('g:neocomplcache_ctags_arguments_list')
                let g:neocomplcache_ctags_arguments_list = {}
            endif
            " let g:neocomplcache_ctags_arguments_list['_'] = ''
            " let g:neocomplcache_ctags_arguments_list['c'] =
            " let g:neocomplcache_ctags_arguments_list['cpp'] =
            " let g:neocomplcache_ctags_arguments_list['python'] =
            " let g:neocomplcache_ctags_arguments_list['ruby'] =
            " let g:neocomplcache_ctags_arguments_list['go'] =
            if !exists('g:neocomplcache_tags_filter_patterns')
                let g:neocomplcache_tags_filter_patterns = {}
            endif
            " }}}
            " include: paths, exprs, patterns, functions {{{
            if !exists('g:neocomplcache_include_paths')
                let g:neocomplcache_include_paths = {}
            endif
            let g:neocomplcache_include_paths['c'] = '/usr/include'
            let g:neocomplcache_include_paths['cpp'] = '/usr/include/c++'
            if !exists('g:neocomplcache_include_exprs')
                let g:neocomplcache_include_exprs = {}
            endif
            if !exists('g:neocomplcache_include_patterns')
                let g:neocomplcache_include_patterns = {}
            endif
            if !exists('g:neocomplcache_include_functions')
                let g:neocomplcache_include_functions = {}
            endif
            let g:neocomplcache_include_max_processes = 25
            if !exists('g:neocomplcache_include_exprs')
                let g:neocomplcache_include_exprs = {}
            endif
            if !exists('g:neocomplcache_filename_include_exts')
                let g:neocomplcache_filename_include_exts = {}
            endif
            let g:neocomplcache_filename_include_exts['cpp'] = ['', 'h', 'hpp', 'hxx']
            let g:neocomplcache_filename_include_exts['python'] = ['py', 'pyw']
            " TODO let g:neocomplcache_filename_include_exts['ruby'] = ['rb']
            " }}}
            " sources {{{
            if !exists('g:neocomplcache_sources_list')
                let g:neocomplcache_sources_list = {}
            endif
            " let g:neocomplcache_sources_list['_'] = ['buffer_complete']
            " let g:neocomplcache_sources_list['cpp'] = ['buffer_complete', 'include_complete']
            if !exists('g:neocomplcache_source_disable')
                let g:neocomplcache_source_disable = {}
            endif
            " let g:neocomplcache_source_disable['dictionary_complete'] = 1
            let g:neocomplcache_source_disable['clang_complete'] = 1 " avoid clang's error
            if !exists('g:neocomplcache_source_completion_length')
                let g:neocomplcache_source_completion_length = {}
            endif
            let g:neocomplcache_source_completion_length['include_complete'] = 2
            let g:neocomplcache_source_completion_length['member_complete'] = 2
            let g:neocomplcache_source_completion_length['filename_complete'] = 3
            let g:neocomplcache_source_completion_length['buffer_complete'] = 3
            let g:neocomplcache_source_completion_length['tags_complete'] = 2
            let g:neocomplcache_source_completion_length['syntax_complete'] = 2
            let g:neocomplcache_source_completion_length['vim_complete'] = 2
            let g:neocomplcache_source_completion_length['look'] = 3 " plugin neco-look
            " TODO
            let g:neocomplcache_source_completion_length['js_complete'] = 2 " plugin jscomplete.vim
            let g:neocomplcache_source_completion_length['ghc'] = 3 " plugin neco-ghc
            " }}}
            " same filetypes {{{
            " a dictionary to connect file type mutually.
            if !exists('g:neocomplcache_same_filetype_lists')
                let g:neocomplcache_same_filetype_lists = {}
            endif
            " The value are comma-separated filetypes.
            " If value contains '_', neocomplcache completes from all buffers.
            " If key is '_', the value will be used for default same filetypes.
            " let g:neocomplcache_same_filetype_lists['_'] = '_'
            "   -> default, complete from all buffers
            let g:neocomplcache_same_filetype_lists['gitcommit'] = '_'
            let g:neocomplcache_same_filetype_lists['c'] = 'cpp,d'
            let g:neocomplcache_same_filetype_lists['cpp'] = 'c'
            let g:neocomplcache_same_filetype_lists['markdown'] = 'html'
            " }}}
            " composite file type (only use one completion) {{{
            if !exists('g:neocomplcache_ignore_composite_filetype_lists')
                let g:neocomplcache_ignore_composite_filetype_lists = {}
            endif
            " let g:neocomplcache_ignore_composite_filetype_lists['python.unit'] = 'python'
            " let g:neocomplcache_ignore_composite_filetype_lists['ruby.spec'] = 'ruby'
            " }}}
            " context filetypes (one filetype in another filetype) {{{
            if !exists('g:neocomplcache_context_filetype_lists')
                let g:neocomplcache_context_filetype_lists = {}
            endif
            let g:neocomplcache_context_filetype_lists['vimwiki'] = [
                        \ {
                            \ 'filetype': 'python',
                            \ 'start': '^\s*{{{python$',
                            \ 'end': '^\s*}}}',
                        \ },
                        \ {
                            \ 'filetype': 'ruby',
                            \ 'start': '^\s*{{{ruby$',
                            \ 'end': '^\s*}}}',
                        \ },
                        \ {
                            \ 'filetype': 'vim',
                            \ 'start': '^\s*{{{vim$',
                            \ 'end': '^\s*}}}',
                        \ },
                        \ {
                            \ 'filetype': 'javascript',
                            \ 'start': '^\s*{{{javascript$',
                            \ 'end': '^\s*}}}',
                        \ },
                        \ {
                            \ 'filetype': 'bash',
                            \ 'start': '^\s*{{{bash$',
                            \ 'end': '^\s*}}}',
                        \ },
                        \ {
                            \ 'filetype': 'zsh',
                            \ 'start': '^\s*{{{zsh$',
                            \ 'end': '^\s*}}}',
                        \ },
                        \ {
                            \ 'filetype': 'go',
                            \ 'start': '^\s*{{{go$',
                            \ 'end': '^\s*}}}',
                        \ },
                        \ {
                            \ 'filetype': 'c',
                            \ 'start': '^\s*{{{c$',
                            \ 'end': '^\s*}}}',
                        \ },
                        \ {
                            \ 'filetype': 'html',
                            \ 'start': '^\s*{{{html$',
                            \ 'end': '^\s*}}}',
                        \ },
                        \ {
                            \ 'filetype': 'css',
                            \ 'start': '^\s*{{{css$',
                            \ 'end': '^\s*}}}',
                        \ },
                        \ {
                            \ 'filetype': 'tex',
                            \ 'start': '^\s*{{{tex$',
                            \ 'end': '^\s*}}}',
                        \ },
                        \ ]
            " }}}
            " text mode filetypes {{{
            " in text mode, neocomplcache supports word convertion to write English.
            " For example, if you input 'Fo', neocomplcache will convert
            " candidate 'foo' to 'Foo'. If you input 'foo', neocomplcache will
            " convert candidate 'FooBar' to 'foobar'. If you input 'FO',
            " neocomplcache will convert candidate 'foo' to 'FOO'.
            if !exists('g:neocomplcache_text_mode_filetypes')
                let g:neocomplcache_text_mode_filetypes = {}
            endif
            let g:neocomplcache_text_mode_filetypes['gitcommit'] = 1
            let g:neocomplcache_text_mode_filetypes['markdown'] = 1
            let g:neocomplcache_text_mode_filetypes['vimwiki'] = 1
            let g:neocomplcache_text_mode_filetypes['text'] = 1
            " }}}

            " }}}

            " [ complete candidates: priority ] {{{
            " control each source's completion candidate priority.
            " The higher value is, the higher priority.

            " abbrev_complete            -> [A]
            " filename_complete          -> [F] {filename}
            " dictionary_complete        -> [D] {words}
            " member_complete            -> [M] member
            " buffer_complete            -> [B] {buffername}
            " syntax_complete            -> [S] {syntax-keyword}
            " include_complete           -> [FI] or [I]
            " snippets_complete          -> [Snip] (none placeholders) or
            " <Snip> (contains placeholders)
            " vim_complete               -> [vim] type
            " omni_complete              -> [O]
            " tags_complete              -> [T]
            " other plugin sources       -> [plugin-name-prefix]
            " other completefunc sources -> [plugin-name-prefix]
            " other ftplugin sources     -> [plugin-name-prefix]

            " default
            let g:neocomplcache_source_rank = {
                        \ 'abbrev_complete' : 500,
                        \ 'filename_complete' : 5,
                        \ 'dictionary_complete' : 6,
                        \ 'member_complete' : 7,
                        \ 'buffer_complete' : 9,
                        \ 'syntax_complete' : 10,
                        \ 'include_complete' : 700,
                        \ 'snippets_complete' : 400,
                        \ 'vim_complete' : 300,
                        \ 'omni_complete' : 300,
                        \ 'tags_complete' : 350,
                        \ 'other plugin sources' : 5,
                        \ 'other completefunc sources' : 15,
                        \ 'other ftplugin sources' : 100,
                        \ }
                        " \ 'keyword_complete' : 8, " deleted
            " }}}

            " [ neocomplcache functions ] {{{
            " inoremap <expr> <C-n>
                " pumvisible() ? "\<C-n>" : "\<Tab>"
                " pumvisible() ? "\<C-j>" : "\<C-n>"
                " pumvisible() ? "\<C-j>" : neocomplcache#...()
                " neocomplcache#manual_filename_complete()
                " neocomplcache#manual_omni_complete()
                " neocomplcache#smart_close_popup()
                " neocomplcache#close_popup
                " neocomplcache#complete_common_string()
                " ----------------------------------------------
                " function! s:check_back_space()
                "     let col = col('.') - 1
                "     return !col || getline('.')[col - 1] =~ '\s'
                " endfunction
                " ----------------------------------------------
            " Awesome EXample.
            "imap <expr> <Tab> neocomplcache#sources#snippets_complete#expandable()
                    "\ ? "\<Plug>(neocomplcache_snippets_expand)"
                    "\ : pumvisible() ? "\<C-n>"
                    "\ : <SID>check_back_space() ? "\<TAB>"
                    "\ : "\<C-x>\<C-u>"

            "inoremap <expr> <Tab> pumvisible()
                        "\ ? "\<C-n>"
                        "\ : <SID>check_back_space() ? "\<TAB>"
                        "\ : "\<C-x>\<C-u>"
            " }}}

" AAA XXX
            " [ key mappings ] {{{
            " if !exists('*neocomplcache#is_enabled')
            if !exists('g:loaded_neocomplcache')
                " <Tab> -- complete or jump in snippet placeholder.
                " <C-j> -- next popup selection or jump forwards in snippet placeholder
                " <C-k> -- prev popup selection or jump backward in snippet placeholder
                " <C-n> -- next popup selection.
                " <C-p> -- prev popup selection.
                " <C-o> -- manual omni complete.
                " <C-y> -- smart close popup.
                " <C-e> -- cancel popup.
                " <C-g> -- undo completion.
                " <C-h> -- smart close popup.
                " <C-l> -- common string complete.
                " <BS>  -- smart close popup.

                inoremap <expr> <C-x><C-f> neocomplcache#manual_filename_complete()
                inoremap <expr> <C-o> neocomplcache#manual_omni_complete()
                inoremap <expr> <C-l> neocomplcache#complete_common_string()
                inoremap <expr> <C-y> neocomplcache#smart_close_popup()
                inoremap <expr> <C-e> neocomplcache#cancel_popup()
                inoremap <expr> <C-g> neocomplcache#undo_completion()
                " use close_popup for e.g. pythoncomplete.vim's subprocess.os.
                " dot candidate can not auto popup in next string after dot.
                " without ."\<C-h>"
                inoremap <expr> <C-h> neocomplcache#smart_close_popup()
                inoremap <expr> <BS>  neocomplcache#smart_close_popup()."\<C-h>"

                " <CR>: close popup and save indent.
                " inoremap <expr><silent> <CR> <C-R>=neocomplcache#smart_close_popup()<CR><CR>

                function! s:my_cr_function()
                    return neocomplcache#smart_close_popup() . "\<CR>"
                    " For no inserting <CR> key.
                    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
                endfunction
                inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

                inoremap <expr> <C-n> pumvisible() ? "\<C-n>" : "\<Tab>"
                inoremap <expr> <C-p> pumvisible() ? "\<C-p>"

                " imap <expr> <Tab> neocomplcache#sources#snippets_complete#expandable()
                "             \ ?  "\<Plug>(neocomplcache_snippets_expand)"
                "             \ : <SID>check_back_space() ? "\<TAB>"
                "             \ : "\<C-x>\<C-u>"

                " ------------------------------------------------------------
                " { neosnippet } {{{
                " }}}

                " { UltiSnips } {{{
                " <C-j>/<C-k> is used by UltiSnips jump backwards and forwards.
                " - UltiSnips_ExpandSnippet() -- expand snippet
                " - UltiSnips_ExpandSnippetOrJump()
                " - UltiSnips_JumpForwards()
                " - UltiSnips_JumpBackwards()
                " - UltiSnips_ListSnippets()
                " ----------------------------------------------
                " function! Ulti_ExpandOrJump_and_getRes()
                "     call UltiSnips_ExpandSnippetOrJump()
                "     return g:ulti_expand_or_jump_res
                " endfunction
                " inoremap <expr> <Tab> <C-R>=(UltiSnips_ExpandSnippetOrJump() > 0) ?
                "             \ UltiSnips_ExpandSnippet()
                "             \ : pumvisible() ? "\<C-n>" : "\<Tab>"

                "AAA XXX UUU

                imap <expr> <C-Tab> UltiSnips_ListSnippets() ?
                            \ UltiSnips_ExpandSnippet()
                            \ : pumvisible() ? "\<C-n>" : "\<Tab>"
                inoremap <expr> <C-j> UltiSnips_JumpForwards()
                inoremap <expr> <C-k> UltiSnips_JumpBackwards()
                " }}}

                " { snipMate } {{{
                " TODO snipMate#GetSnippets(), snipMate#ShowAvailableSnips(),
                " "\<c-r>=snipMate#ShowAvailableSnips()\<cr>"
                " ----------------------------------------------
                " imap <expr> <Tab> snipMate#ShowAvailableSnips() ?
                "             \ snipMate#
                "             \ : pumvisible() ? "\<C-n>" : "\<Tab>"
                " }}}

                " [ unite ] {{{ TODO
                " completion with unite.vim
                " <Plug>(neocomplcache_start_unite_complete)
                " <Plug>(neocomplcache_start_unite_quick_match)
                " imap <C-k> <Plug>(neocomplcache_start_unite_complete)
                " imap <C-q> <Plug>(neocomplcache_start_unite_quick_match)
                " ----------------------------------------------------------
                " inoremap <expr> - pumvisible()
                "     \ ? "\<Plug>(neocomplcache_start_unite_quick_match)"
                "     \ : '-'
                " inoremap <expr> <C-Space> pumvisible()
                "             \ ? "\<Plug>(neocomplcache_start_unite_complete)"
                "             \ : "\<C-Space>"
                " }}}
            endif
            " }}}
        " }}}

        " neco-look : neocomplcache-look (/usr/bin/look)

        " AutoComplPop

        " SuperTab {{{ <Tab> perform all your insert completions.
            " context, <c-n>, <c-p>,
            " <c-x><c-o> (omni), <c-x><c-u> (user defined func), <c-x><c-]>
            let g:SuperTabDefaultCompletionType = "context"
            " when upper option is 'context'
            let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
            let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
                " let g:SuperTabContextTextFileTypeExclusions =
            let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
            let g:SuperTabContextDiscoverDiscovery =
                \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

            " how long the time retains: completion, insert, session
            let g:SuperTabRetainCompletionDuration = 'insert'

            " prevent completion after ...
            let g:SuperTabNoCompleteBefore = []
            let g:SuperTabNoCompleteAfter = ['^', '\s', ',']
            let g:SuperTabMappingForword = '<c-space>' " <tab>, <c-space>, <nul>
            let g:SuperTabMappingBackward = '<s-tab>' " <s-tab>, <s-c-space>, <s-nul>
            let g:SuperTabMappingTabLiteral = '<c-tab>' " insert true TAB
            let g:SuperTabLongestEnhanced = 0 " if 'longest' in completeopt
            let g:SuperTabLongestHighlight = 1 " highlight first one in popup menu
            let g:SuperTabCrMapping = 0 " 1: cancel completion mode.
            let g:SuperTabClosePreviewOnPopupClose = 0 " close preview window ?

            " autocmd FileType *
            "             \ if &omnifunc != '' |
            "             \   call SuperTabChain(&omnifunc, "<c-p>") |
            "             \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
            "             \ endif

            " [ extra ] {{{
            " function! MyTagContext()
            "     if filereadable(expand('%:p:h') . '/tags')
            "         return "\<c-x>\<c-]>"
            "     endif
            "     " no return will result in the evaluation of the next
            "     " configured context
            " endfunction

            " let g:SuperTabCompletionContexts =
            "             \ ['MyTagContext', 's:ContextText', 's:ContextDiscover']
            " }}}
        " }}}

        " code_complete {{{ function parameter complete, code snippets, etc
            " Usage: <A-D> to raise up completion popup menu.
        " }}}
    " }}}

    " [ snippets ] {{{ <Tab>, <Ctrl-j/k>
        " neosnippet {{{
            " :NeoSnippetMakeCache [filetype]
            " :NeoSnippetEdit [{options}] [filetype]
            " key mappings:
            "   - <Plug>(neosnippet_expand_or_jump)
            "   - <Plug>(neosnippet_jump_or_expand)
            "   - <Plug>(neosnippet_expand)
            "   - <Plug>(neosnippet_jump)
            "   - i_<Plug>(neosnippet_start_snippet)
            "   - neosnippet#expandable()
            "   - neosnippet#jumpable()
            " unite.vim
            "   - :Unite snippet
            "   - source actions TODO how to use this actions.
            "   - snippet
            "       - expand
            "       - edit
            "       - preview

            let g:neosnippet#snippets_directory = "~/.vim/snippets/neosnippet/"
            let g:neosnippet#disable_select_mode_mappings = 1
                " disable key-mappings in select-mode when snippets_complete
                " performs. usually enable it.
            " '_': 1, to disable all runtime snippets.
            " 'c': 1,
            let g:neosnippet#disable_runtime_snippets = {
                        \ '_': 1,
                        \ }

            " TODO
            if !exists('g:loaded_neosnippet')
            endif

            " because <Tab> and <C-j> is conflict with UltiSnips.
            " Can't use 'inoremap' here.
            imap <expr> <Tab> neosnippet#expandable() ?
                        \ "\<Plug>(neosnippet_expand_or_jump)"
                        \ : pumvisible() ? "\<C-n>" : "\<Tab>"
            smap <expr> <Tab> neosnippet#expandable() ?
                        \ "\<Plug>(neosnippet_expand_or_jump)"
                        \ : "\<Tab>"
            " imap <expr> <C-j> neosnippet#jumpable() ?
            "             \ "\<Plug>(neosnippet_jump)"
            "             \ : neosnippet#expandable() ?
            "             \ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-n>"

            " TODO ask Shougo where to use this mapping. in Unite buffer or
            " insert mode in vim ?
            " and how to use snippet source ? edit/preview/expand.
            " FIXME imap <C-s> <Plug>(neosnippet_start_unite_snippet)
            nnoremap <buffer> <Leader>es
                \ :exec ':NeoSnippetEdit -split -direction=topleft -horizontal'<CR>
                " \ . &filetype<CR>

            " for snippets_complete marker.
            if has('conceal')
                set conceallevel=2 concealcursor=i
            endif
        " }}}



        " UltiSnips {{{ VISUAL, <Tab>, <C-Tab>, <C-J/K>
            " commands:
            " - :UltiSnipsEdit
            " - :UltiSnipAddFiletypes
            "       cuda.cpp.c (merging of two filetypes snippets)
            " functions:
            " - UltiSnips_AddSnippet(trigger, value, desc ...) -- add snippet
            " - UltiSnips_Anon() -- expand anonymous snippet
            " - UltiSnips_ExpandSnippet() -- expand snippet
            " - UltiSnips_ExpandSnippetOrJump()
            " - UltiSnips_JumpForwards()
            " - UltiSnips_JumpBackwards()
            " - UltiSnips_ListSnippets()
            " - UltiSnips_FileTypeChanged()

            if has('python3')
                let g:UltiSnipsUsePythonVersion = 3 " use python 3.X
            elseif has('python')
                let g:UltiSnipsUsePythonVersion = 2 " use python 2.X
            endif
            let g:snips_author = 'stardiviner <numbchild@gmail.com>'
            let g:UltiSnipsEditSplit = "horizontal" " normal, horizontal, vertical.
            " let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets/UltiSnips"]
            " do not use snippets come with UltiSnips.
            let g:UltiSnipsSnippetDirectories = ["snippets/UltiSnips"]
            let g:UltiSnipsDontReverseSearchPath = 0 " traverse runtimepath
            let g:UltiSnipsExpandTrigger = "<C-Tab>" " <Tab>
            let g:UltiSnipsListSnippets = "<M-Tab>" " <C-Tab>
            let g:UltiSnipsJumpForwardTrigger = "<C-j>" " <C-j> jump to next tabstop.
            let g:UltiSnipsJumpBackwardTrigger = "<C-k>" " <C-k> previous tabstop.
            let g:UltiSnipsDoHash = 1 " check and reload new snip file.
            " let g:UltiSnipsRemoveSelectModeMappings = 1 " issues a :sunmap cmd.
            " let g:UltiSnipsMappingsToIgnore = [ "somePlugin", "otherPlugin" ]

            if exists(':UltiSnipsEdit')
                nnoremap <buffer> <Leader>es :UltiSnipsEdit<CR>
                " nnoremap <buffer> <Leader>as :UltiSnipsAddFiletypes vimwiki.python
            endif
        " }}}

        " Xptemplate

        " SnipMate {{{
            " :SnipMateOpenSnippetFiles, create snippet on the fly.
            " <C-R><Tab> show list of available snippets.
            " XX<Tab> show list or expand if match.
            " <shift-tab> to jump tab stops in reverse order.
            " let g:snips_trigger_key='<c-space>' " <tab>, <c-space>
            let g:snips_author = 'stardiviner'

            let g:snipMate = {}
            let g:snipMate.scope_aliases = {}
                " add both ruby and ruby-rails snippets for filetype='ruby'.
            let g:snipMate.scope_aliases['ruby'] = 'ruby,ruby-rails'
                " for html.javascript etc filetype.
            let g:snipMate['no_match_completion_feedkeys_chars'] = ""

            " TODO
            " default implementation collecting snippets by handlers
            "let g:snipMate['get_snippets'] = snipMate#GetSnippets
            " default handler:
            "let g:snipMateSources['default'] = snipMate#DefaultPool
            " default directories containing snippets:
            "let g:snipMate['snippet_dirs'] = funcref#Function('return split(&runtimepath,",")')

            " FIXME on the fly creating python snippet using the registers.
            " snipmate/autoload/snipMate_python_demo.vim
            " call snipMate_python_demo#Activate() in ftplugin/python.vim

            let g:commentChar = {
                        \ 'vim': '"',
                        \ 'c': '//',
                        \ 'cpp': '//',
                        \ 'sh': '#',
                        \ 'python': '#'
                        \ }
        " }}}

        " SnippetComplete {{{
            " Insert mode completion for abbre and snippets.
            " i_CTRL-X_] : find matches for abbr that start with text in front of cursor
            " imap <C-x><Tab> <Plug>(SnippetComplete)
            " inoremap <C-Space> <Plug>(SnippetComplete)
        " }}}
    " }}}

    " [ skeleton/template ] {{{
        " SonicTemplate {{{ Easy and high speed coding method.
            " :Template <Tab>
            let g:template_vim_template_dir = [
                        \ '$HOME/.vim/template/SonicTemplate/'
                        \ ]
                " template filename rule:
                " [kind]-[name].[extension]
                "  `- 'base' or 'snip'
                " template file keyword: {{_name_}}, {{_cursor_}}, {{_input_:var}} ....
        " }}}

        " template {{{ read the template file automatically when edit new file.
            " Usage:
            "   - :[line]TemplateLoad[!] [pattern]
            let g:template_basedir = ['$HOME/.vim/template/template']
            let g:template_files = 'template/**'
            let g:template_free_pattern = 'template'
        " }}}

        " qtmplsel {{{ select a template on creating a new file.
            " Usage:
            "   - Search Rules:
            "       - by filetype:
            "           filetype=python -> template/python_*
            "       - by suffix:
            "           *.cpp -> template/*.cpp
            "       - by filename:
            "           Makefile -> template/Makefile_*
            " Note that especially in case 3, 'Makefile_' is a legal template
            " name but 'Makefile' is not even if you have no other template file.
            " String surrounded by '@{@' '@}@' in the template file is regarded
            " as a vim expression, and will be eval()ed on loading.
            "   e.g.
            "       @{@expand('%:t')@}@          ->  newfile.py
            "       @{@strftime('%Y-%m-%d')@}@   ->  2009-08-30
            let g:qts_templatedir = "$HOME/.vim/template/qtmplsel"
        " }}}

        " TagmaLast : Update the 'Last Changed' line in a file.
    " }}}

    " [ tags/cscope ] {{{ <F12>
        " Tagbar {{{ <F12> Display tags of a file ordered by scope.
            " <Space> display prototype of a tag. <Enter> jump to tag o: toggle fold
            " access symbols:
            "   - + -> public
            "   - # -> protected
            "   - - -> private
            let g:tagbar_ctags_bin = '/usr/bin/ctags' " default empty, '/usr/bin/ctags'
            let g:tagbar_width = 25
            let g:tagbar_compact = 0 " omitting heading help line and blank lines.
            let g:tagbar_left = 0
            let g:tagbar_autoshowtag = 1 " auto open folds when tag in folds.
            let g:tagbar_autofocus = 0 " autofocus to tagbar window when opened.
            let g:tagbar_autoclose = 0 " auto close tagbar when you jump to tag
            let g:tagbar_sort = 1 " sort according to their name.
            let g:tagbar_expand = 1 " window be expanded by width of tagbar win if GVim.
            let g:tagbar_foldlevel = 2 " level higher than this number will be closed.
            let g:tagbar_usearrows = 0 " { Windows only }
            let g:tagbar_iconchars = ['▶', '▼'] " default on Linux and Mac.
            let g:tagbar_indent = 1 " indent for compact view.
            let g:tagbar_updateonsave_maxlines = 10000 " update when file has fewer
            " let g:tagbar_systemenc = "utf-8" " value of 'encoding'.
            " let g:tagbar_type_javascript = {
            "             \ 'ctagsbin' : '/usr/local/bin/jsctags',
            "             \ }

            " Ruby {{{
            let g:tagbar_type_ruby = {
                        \ 'kinds' : [
                            \ 'm:modules',
                            \ 'c:classes',
                            \ 'd:describes',
                            \ 'C:contexts',
                            \ 'f:methods',
                            \ 'F:singleton methods'
                            \ ]
                        \ }
            " }}}

            " Go {{{
            let g:tagbar_type_go = {
                        \ 'ctagstype': 'go',
                        \ 'kinds' : [
                            \'p:package',
                            \'f:function',
                            \'v:variables',
                            \'t:type',
                            \'c:const'
                            \ ]
                        \ }
            " }}}

            " Markdown {{{
            let g:tagbar_type_markdown = {
                        \ 'ctagstype' : 'markdown',
                        \ 'kinds' : [
                        \ 'h:Heading_L1',
                        \ 'i:Heading_L2',
                        \ 'k:Heading_L3'
                        \ ]
                        \ }
            " }}}

            " Xquery {{{
            let g:tagbar_type_xquery = {
                        \ 'ctagstype' : 'xquery',
                        \ 'kinds'     : [
                            \ 'f:function',
                            \ 'v:variable',
                            \ 'm:module',
                            \ ]
                        \ }
            " }}}

            nnoremap <F12> :TagbarToggle<CR>

            " 1. auto open for any files.
            " autocmd VimEnter * nested :TagbarOpen
            " 2. auto open for supported filetypes.
            " augroup TagbarAutoToggle
            "     au!
            "     au VimEnter * nested :call tagbar#autoopen(1)
            " augroup END

            " {{{ colors for Tagbar.vim
            " cyan
            highlight TagbarHighlight       ctermfg=051 ctermbg=none cterm=bold
            " gray
            highlight TagbarComment         ctermfg=238 ctermbg=none cterm=none
            " green
            highlight TagbarKind            ctermfg=154 ctermbg=none cterm=bold
            " dark green
            highlight TagbarNestedKind      ctermfg=070 ctermbg=none cterm=none
            " blue
            highlight TagbarScope           ctermfg=039 ctermbg=none cterm=none
            " yellow
            highlight TagbarType            ctermfg=190 ctermbg=none cterm=none
            " orange
            highlight TagbarSignature       ctermfg=202 ctermbg=none cterm=none
            " pink
            highlight TagbarPseudoID        ctermfg=205 ctermbg=none cterm=bold
            " red
            highlight TagbarFoldIcon        ctermfg=197 ctermbg=none cterm=none
            " dark green
            highlight TagbarAccessPublic    ctermfg=022 ctermbg=none cterm=none
            " dark red
            highlight TagbarAccessProtected ctermfg=088 ctermbg=none cterm=bold
            " red
            highlight TagbarPrivate         ctermfg=196 ctermbg=none cterm=italic
            " }}}
        " }}}

        " tagbar-phpctags {{{
            " Require: phpctags https://github.com/techlivezheng/phpctags
            let g:tagbar_phpctags_bin='$HOME/compile/phpctags/phpctags'
        " }}}

        " Taglist {{{ <F12>
            " :Tlist[AddFiles, AddFilesRecursive, Close, Debug, Lock, Messages,
            " Open, ShowPrototype, ShowTag, HighlightTag, Toggle, Undebug,
            " Unlock, Update]
            let g:Tlist_Auto_Open = 0 " open taglist window when vim starts.
            let g:Tlist_Process_File_Always = 1 " processing tag even not open tags win.
            let g:Tlist_Auto_Highlight_Tag = 1 " highlight current tag.
            let g:Tlist_Show_One_File = 0 " display tags for all files and buffers.
            let g:Tlist_Sort_Type = "order" " name or order
            let Tlist_Use_Horiz_Window = 0 " use vertical window.
            let g:Tlist_WinWidth = 25
            let g:Tlist_Inc_Winwidth = 0 " don't reduce vim window after close tag-win.
                " if = 1 you can set height with:
            " let g:Tlist_WinHeight = 20
            let g:Tlist_Use_Right_Window = 1 " use right window.
            let g:Tlist_Compact_Format = 1 " reduce empty lines.
            let g:Tlist_Enable_Fold_Column = 0 " enable window fold column.
            let g:Tlist_File_Fold_Auto_Close = 1 " Close tag folds for inactive buffers.
            let g:Tlist_Display_Prototype = 1 " display tag's prototype instead of name.
            let g:Tlist_Display_Scope = 1 " display the scope of the tags next name.
            let g:Tlist_Close_On_Select = 0
            let g:Tlist_GainFocus_On_ToggleOpen = 0 " get focus.
            let g:Tlist_Highlight_Tag_On_BufEnter = 1 " auto highlight current tag.
            " let g:Tlist_Max_Tag_Length = 25
            let g:Tlist_javascript_Hide_Extras = 0 " hide extra tag data

            highlight TagListTagName    ctermfg=250
            highlight TagListTagScope   ctermfg=045
            highlight TagListTitle      ctermfg=226
            highlight TagListComment    ctermfg=235
            highlight TagListFileName   ctermfg=255 ctermbg=232

            " TODO nnoremap <F12> :TlistToggle<CR>
        " }}}

        " Tag_Signature_Balloons (Tag Signatures in Balloon Tooltips)
            let g:loaded_tag_signature = 1
            let g:TagSignatureAllowFileLoading = 1
            let g:TagSignatureMaxMatches = 1

"AAA 
        " easytags {{{ Automated tag file generation & syntax highlighting of tags
            " Usage:
            " :UpdateTags[!]
            " :UpdateTags -R ~/.vim => ctags -R ~/.vim
            " :TagsByFileType
            " :HighlightTags
            " let g:easytags_cmd = '/usr/bin/ctags'
            let g:easytags_file = '~/tmp/vim/tags/easytags/global.tags' " global tags
            let g:easytags_dynamic_files = 2
                " 1: if project specific tags exists, otherwise -> use global tags file
                " 2: auto create project specific tags based on first name in 'tags' option
            let g:easytags_by_filetype = '~/tmp/vim/tags/easytags'
            let g:easytags_always_enabled = 0 " this slow down Vim
            let g:easytags_on_cursorhold = 0 " disable periodic highlight
            let g:easytags_updatetime_min = 4000
            let g:easytags_updatetime_autodisable = 1
            let g:easytags_auto_update = 1 " auto update tags and highlights
            let g:easytags_auto_highlight = 1 " auto highlight tags
            let g:easytags_autorecurse = 1 " 0: file, 1: current dir, 2: recursively
            let g:easytags_resolve_links = 1 " unix symbolic link and hard link
            let g:easytags_include_members = 1 " let ctags include struct/class members
            let g:easytags_suppress_ctags_warning = 0 " suppress ctags warnings
            " let g:easytags_ignored_syntax_groups = '.*String.*,.*Comment.*,cIncluded'
            let g:easytags_python_enabled = 1 " use python interface to speed up
            " let g:easytags_python_script =

            if exists('g:loaded_easytags')
                set tags+=~/tmp/vim/tags/easytags/global.tags " for easytags
            endif
            " au FileType python let b:easytags_last_highlighted = 0
        " }}}

        " vim-autotags {{{ easy ctags and cscope handling in a separate directory
            " Features:
            " - build/rebuild index for project
            " - tags are loaded automatically when a file is opened anywhere in project tree.
            " - tags are stored in a separate directory and don't clog your project tree.
            " Usage:
            " - AutotagsUpdate()
            " - AutotagsAdd()
            " - AutotagsRemove()
            " FIXME make this automatically or create a command for it.
            " command! -nargs=? AutotagsUpdate :call AutotagsUpdate()<CR>
            let g:autotagsdir = $HOME."/tmp/vim/tags/autotags.vim"
            let g:autotags_global = $HOME . "/.autotags/global_tags"
            let g:autotags_ctags_exe = "ctags"
            let g:autotags_ctags_opts = "--c++-kinds=+p --fields=+iaS --extra=+q"
            let g:autotags_ctags_languages = "all" " ctags --languages
            let g:autotags_ctags_langmap = "default" " ctags --langmap
            let g:autotags_no_global = 0 " generate global tags for /usr/include
            let g:autotags_ctags_global_include = "/usr/include/*"
            let g:autotags_cscope_exe = "cscope"
            let g:autotags_cscope_file_extensions = ".cpp .cc .cxx .m .hpp .hh .h .hxx .c .idl"
            let g:autotags_pathhash_humanreadable = 1
        " }}}

        " indexer.tar.gz

        " gtags.vim {{{
            " | http://www.vim.org/scripts/script.php?script_id=893#0.6
            " $ sudo apt-get install global || .vim/plugin/gtags.vim
            " The gtags.vim plugin script integrates the GNU GLOBAL source code
            " tag system with Vim.  About the details, see
            " http://www.gnu.org/software/global/.
            " First of all, you must execute gtags at the root of source
            " directory to make tag files.
            " $ cd /var/src ; gtags
            " General form of Gtags command is as follows:
            " :Gtags [option] pattern
            " To go to func, you can say :Gtags func
            " Input completion is available. <Tab>
            " QucikFix windows, go to any entry with commands: :cn :cp :ccN :cl
            " You can use POSIX regular expression too. :Gtags ^[sg]et_
            " To go to the referenced point of func. add -r option. :Gtags -r func
            " More details please refer vim/plugin/gtags.vim
            " TODO
        " }}}

        " taggatron {{{ A simple tag file manager for vim.
            " allow user to setup rules for creating your tag files based on language.
            " Usage:
            " :TagUpdate
            " let g:tagdefaults = "/path/to/other/tag.file"
            " let g:taggatron_verbose = 1 " debug
            let g:tagcommands = {
                        \ "python" : {"tagfile": ".python.tags", "args": "-R"},
                        \ "php" : {"tagfile": ".php.tags", "args": "-R"},
                        \ "javascript" : {"tagfile": ".js.tags", "args": "-R"},
                        \ }
        " }}}

        " yate {{{ search in tags more convenient.
            " It holds query and search result in one buffer for faster jump to desired tag.
            " Usage:
            "	:YATE
        " }}}

        " SrcExpl {{{ (Source Explorer) exploring the source code based on "tags".
            " it works like the context window of 'Source Insight'
            let g:SrcExpl_winHeight = 8
            let g:SrcExpl_refreshTime = 500 " how ofen to refresh window.
            let g:SrcExpl_pluginList = [
                \ "Source_Explorer",
                \ "_NERD_tree_",
                \ "__Tag_List__",
                \ "*unite*",
                \ ]
            let g:SrcExpl_searchLocalDef = 1 " enable local definition searching.
            let g:SrcExpl_isUpdateTags = 1 " auto update tags file.
            let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
            " key mappings:
            let g:SrcExpl_jumpKey = "<CR>"
            let g:SrcExpl_gobackKey = "<Space>"
            let g:SrcExpl_updateTagsKey = ''

            nnoremap <F4> :SrcExplToggle<CR>
        " }}}

        " cscope.vim {{{ auto create cscope database and connect to existing database
            " Usage:
            " - <Leader>f[s/g/d/c/t/e/f/i] with cursor on a function name.
            " - <Leader>l -- toggle show found result in location list.
            "   - :CscopeGen [path], CscopeFind, :CscopeClear, CscopeList,
            " let g:cscope_cmd = '/path/to/cscope'
            " let g:cscope_preload_path .= "/usr/include/;"
            " let g:cscope_preload_path .= "/usr/include/c++;"
            " let g:cscope_preload_path .= "/usr/lib/ruby/1.9.1/;"
            " let g:cscope_preload_path .= "/usr/lib/python3.2/"
            " old/original mapping example with <leader>f[?]
            " " s: Find this C symbol
            " nnoremap <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>

            " s: Find this C symbol
            nnoremap <C-Bslash>s :call CscopeFind('s', expand('<cword>'))<CR>
            vnoremap <C-Bslash>s y:call CscopeFind('s', @")<CR>
            " g: Find this definition
            nnoremap <C-Bslash>g :call CscopeFind('g', expand('<cword>'))<CR>
            vnoremap <C-Bslash>g y:call CscopeFind('g', @")<CR>
            " d: Find functions called by this function
            nnoremap <C-Bslash>d :call CscopeFind('d', expand('<cword>'))<CR>
            vnoremap <C-Bslash>d y:call CscopeFind('d', @")<CR>
            " c: Find functions calling this function
            nnoremap <C-Bslash>c :call CscopeFind('c', expand('<cword>'))<CR>
            vnoremap <C-Bslash>c y:call CscopeFind('c', @")<CR>
            " t: Find this text string
            nnoremap <C-Bslash>t :call CscopeFind('t', expand('<cword>'))<CR>
            vnoremap <C-Bslash>t y:call CscopeFind('t', @")<CR>
            " e: Find this egrep pattern
            nnoremap <C-Bslash>e :call CscopeFind('e', expand('<cword>'))<CR>
            vnoremap <C-Bslash>e y:call CscopeFind('e', @")<CR>
            " f: Find this file
            nnoremap <C-Bslash>f :call CscopeFind('f', expand('<cword>'))<CR>
            vnoremap <C-Bslash>f y:call CscopeFind('f', @")<CR>
            " i: Find files #including this file
            nnoremap <C-Bslash>i :call CscopeFind('i', expand('<cword>'))<CR>
            vnoremap <C-Bslash>i y:call CscopeFind('i', @")<CR>
        " }}}

        " CCTree {{{ displays hierarchical call-trees for functions or files using cscope database.
            " FIXME do not know how to open CCTree window
            " Usage: Build cscope database, e.g.
            "   > cscope -b -i cscope.out
            " - :CCTreeLoadDB cscope.out        -- load database
            " - :CCTreeAppendDB ./cscope.out    -- append database
            " - :CCTreeShowLoadedDBs            -- show databases
            " - :CCTreeUnLoadDB                 -- unload database
            " Mappings:
            "   - <C-\>w    -- toggle window
            "   - <C-\><    -- get reverse call tree for symbol
            "   - <C-\>>    -- get forward call tree for symbol
            "   - <C-\>=    -- increase depth of tree and update
            "   - <C-\>-    -- decrease depth of tree and update
            "   - <CR>      -- open symbol in other window
            "   - <C-p>     -- preview symbol in other window
            "   - <C-l>     -- highlight current call-tree flow
            "   - zs        -- compress(fold) call-tree view (useful for viewing long call-tree)
            let g:CCTreeCscopeDb = "cscope.out" " cscope database file
            let g:CCTreeDbFileMaxSize = 40000000 " 40M
            let g:CCTreeUsePerl = 1 " enable the perl interface
            let g:CCTreeEnhancedSymbolProcessing = 1
            let g:CCTreeRecursiveDepth = 3 " max call levels
            let g:CCTreeMinVisibleDepth = 3 " max visible(unfolded) level
            let g:CCTreeUseUTF8Symbols = 1 " use symbols for drawing the tree.
            let g:CCTreeOrientation = "topleft" " orientation of window
                " standard vim options for split: [right|left][above|below]
            let g:CCTreeWindowVertical = 1 " use vertical window.
            let g:CCTreeWindowMinWidth = 20 " vertical window min width
            let g:CCTreeWindowWidth = -1 " horizontal, auto-select best width to fix.
            let g:CCTreeDisplayMode = 1 " 1:Ultra-compact, 2:Compact, 3:Wide
            let g:CCTreeKeyToggleWindow = '<C-\>w'
            let g:CCTreeKeyTraceForwardTree = '<C-\>>'
            let g:CCTreeKeyTraceReverseTree = '<C-\><'
            let g:CCTreeKeyDepthPlus = '<C-\>='
            let g:CCTreeKeyDepthMinus = '<C-\>-'
            let g:CCTreeKeyHilightTree = '<C-l>'    " static highlighting
            let g:CCTreeKeySaveWindow = '<C-\>y'
            let g:CCTreeKeyCompressTree = 'zs'     " compress(fold) call-tree

            " syntax highlighting groups:
                " CCTreeSymbol -- symbol name.
                " CCTreeMarkers -- include "|", "+--->"
                " CCTreeHiSymbol
                " CCTreeHiMarkers
        " }}}
    " }}}

    " [ search: MRU, Text, Regex, ] {{{
        " CtrlP {{{ <C-P> :CtrlP to full path fuzzy(regex grep) file buffer and MRU.
            let g:loaded_ctrlp = 0 " =1 to disable plug completely.
            let g:ctrl_map = '<c-p>' " for normal mode press Ctrl-P.
            let g:ctrlp_cmd = 'CtrlP' " default command to use when pressing mapping.
            let g:ctrlp_by_filename = 0 " 1: search by filename (not full path)
            let g:ctrlp_regexp = 1 " 1: to set full regexp search as default.
            let g:ctrlp_match_window_bottom = 1 " window position
            let g:ctrlp_match_window_reversed = 1 " show matching in reverse order
            let g:ctrlp_max_height = 10
            let g:ctrlp_switch_buffer = 2 " when file opened, jump to (tag, buffer)
            let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
            let g:ctrlp_working_path_mode = 'rc'
            let g:ctrlp_root_markers = ['.git', '.hg', '.svn', '.bzr',]
            let g:ctrlp_use_caching = 1 " 0: disable per-session caching.
            let g:ctrlp_clear_cache_on_exit = 1
            let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
            let g:ctrlp_prompt_mappings = {
                        \ 'PrtBS()':              ['<bs>', '<c-]>'],
                        \ 'PrtDelete()':          ['<del>'],
                        \ 'PrtDeleteWord()':      ['<c-w>'],
                        \ 'PrtClear()':           ['<c-u>'],
                        \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
                        \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
                        \ 'PrtHistory(-1)':       ['<c-n>'],
                        \ 'PrtHistory(1)':        ['<c-p>'],
                        \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
                        \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
                        \ 'AcceptSelection("t")': ['<c-t>', '<MiddleMouse>'],
                        \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
                        \ 'ToggleFocus()':        ['<s-tab>'],
                        \ 'ToggleRegex()':        ['<c-r>'],
                        \ 'ToggleByFname()':      ['<c-d>'],
                        \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
                        \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
                        \ 'PrtExpandDir()':       ['<tab>'],
                        \ 'PrtInsert("w")':       ['<F2>', '<insert>'],
                        \ 'PrtInsert("s")':       ['<F3>'],
                        \ 'PrtInsert("v")':       ['<F4>'],
                        \ 'PrtInsert("+")':       ['<F6>'],
                        \ 'PrtCurStart()':        ['<c-a>'],
                        \ 'PrtCurEnd()':          ['<c-e>'],
                        \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
                        \ 'PrtCurRight()':        ['<c-l>', '<right>'],
                        \ 'PrtClearCache()':      ['<F5>'],
                        \ 'PrtDeleteMRU()':       ['<F7>'],
                        \ 'CreateNewFile()':      ['<c-y>'],
                        \ 'MarkToOpen()':         ['<c-z>'],
                        \ 'OpenMulti()':          ['<c-o>'],
                        \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
                        \ }
                " in some terminal, <c-h> is <bs>, so use:
                    " \ 'PrtCurLeft()': ['<left>', '<c-^>']
            let g:ctrlp_mruf_max = 250
            let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*' " MacOSX/Linux
            " let g:ctrlp_mruf_exclude = '^C:\\dev\\tmp\\.*' " Windows
            " let g:ctrlp_mruf_include = '\.py$\|\.rb$'
            let g:ctrlp_mruf_relative = 0 " 1: show only MRU files in current working dir
            let g:ctrlp_mruf_case_sensitive = 1 " avoid duplicate MRU entries.
            let g:ctrlp_dotfiles = 1 " =0 to don't scan for dotfiles and dotdirs.
            let g:ctrlp_custom_ignore = {
                        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                        \ 'file': '\.exe$\|\.so$\|\.dll$',
                        \ }
                        " \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            let g:ctrlp_max_files = 10000 " maximum number of files to scan, 0: no limit.
            let g:ctrlp_max_depth = 40 " maximum depth of a dir tree to recurse into.
                " specify external tool for listing files instead of Vim's globpath()
            "let g:ctrlp_user_command = 'find %s -type f' " MacOSX/Linux
            "let g:ctrlp_user_command = 'find %s -type f | grep (?!tmp/.*)'
                " use grep to filter the result.
            " let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d' " Windows
            let g:ctrlp_max_history = &history " max of input strings CtrlP remember
                " 0: to disable prompt's history, <c-n>, <c-p> to browse.
            let g:ctrlp_open_new_file = 'v' " specify how newly file be opened when <c-y>
                " t: tab, h: horizontal split, v: vertical split, r: current window.
            let g:ctrlp_open_multiple_files = 'v' " open multiple files with <c-z>, <c-o>
            let g:ctrlp_arg_map = 0
                " 1: <c-o> <c-y> accept extra key as argument to override default
                " t, h, v, r, <esc>|<c-c> to go back to prompt.
            let g:ctrlp_follow_symlinks = 0 " 1: follow all symlinks indiscriminately.
            let g:ctrlp_lazy_update = 0 " only update match window after typing stopped
            let g:ctrlp_use_migemo = 0 " 1: use Migemo Pattern for Japanese filenames.
            let g:ctrlp_buftag_systemenc = &encoding
            " let g:ctrlp_buftag_ctags_bin = ''
            let g:ctrlp_default_input = 0 " seed the prompt with cur file's relat-path
            let g:ctrlp_match_func = {} " an external fuzzy matching function.
            let g:ctrlp_buffer_func = {} " after entering and before exiting buffer
            let g:ctrlp_mruf_default_order = 0 " show only MRU files in pwd
            let g:ctrlp_tabpage_position = 'ac'

            " statusline {{{
            " customize the statusline for CtrlP window.
            let g:ctrlp_status_func = {
                        \ 'main': 'Function_Name_1',
                        \ 'prog': 'Function_Name_2',
                        \ }

            " Arguments: focus, byfname, s:regexp, prv, item, nxt, marked
            " a:1 a:2 a:3 a:4 a:5 a:6 a:7
            "fu! CtrlP_Statusline_1(...)
                "let focus = '%#LineNr# '.a:1.' %*'
                "let byfname = '%#Character# '.a:2.' %*'
                "let regex = a:3 ? '%#LineNr# regex %*' : ''
                "let prv = ' <'.a:4.'>='
                "let item = '{%#Character# '.a:5.' %*}'
                "let nxt = '=<'.a:6.'>'
                "let marked = ' '.a:7.' '
                "let dir = ' %=%<%#LineNr# '.getcwd().' %*'
                "" Return the full statusline
                "retu focus.byfname.regex.prv.item.nxt.marked.dir
            "endf

            " Argument: len
            " a:1
            "fu! CtrlP_Statusline_2(...)
                "let len = '%#Function# '.a:1.' %*'
                "let dir = ' %=%<%#LineNr# '.getcwd().' %*'
                "" Return the full statusline
                "retu len.dir
            "endf
            " }}}

            " extensions {{{
            let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir',
                        \ 'rtscript']
                " the order of them in statusline when using <C-f>, <C-b>
            " }}}

            " file open funcs {{{
            let g:ctrlp_open_func = {
                        \ 'files'     : 'CtrlPHTMLOpenFunc',
                        \ 'buffers'   : 'Function_Name_2',
                        \ 'mru files' : 'Function_Name_3',
                        \ }

            fun! CtrlPHTMLOpenFunc(action, line)
                if a:action == 't' && fnamemodify(a:line, ':e') =~? '^html\?$'
                    let filename = fnameescape(fnamemodify(a:line, ':p'))
                    call ctrlp#exit()
                    silent! execute '!xdg-open' filename
                elseif a:action == 'x' && fnamemodify(a:line, ':e') !~? '^html\?$'
                    call feedkeys("\<c-o>")
                else
                    call call('ctrlp#acceptfile', [a:action, a:line])
                endif
            endf
            " }}}

            " [ mappings ] {{{
            " <c-p>     -- open CtrlP prompt. >>>
            " <c-r>     -- regexp mode. r>>
            " <c-d>     -- full-path or filename only search. >d>
            " <c-f>,<c-up>  -- scroll to next search mode.
            " <c-b>,<c-down> -- scroll to previous search mode.
            " <tab>     -- auto-complete dir names under current working dir.
            " <s-tab>   -- focus between the match window and the prompt.
            " <c-j>,<down>  -- move selection down.
            " <c-k>,<up>    -- move selection up.
            " <c-a>     -- move cursor to the start of the prompt.
            " <c-e>     -- move cursor to the end.
            " <c-h>,<left>,<c-^> -- move the cursor one char to the left.
            " <c-l>,<right>,     -- move the cursor one char to the right.
            " <c-]><bs> -- delete the preceding char.
            " <del>     -- delete the current char.
            " <c-w>     -- delete a preceding innder word.
            " <cr>      -- open selected file in active window.
            " <c-t>     -- open selected file in new tab after the last tabpage.
            " <c-v>     -- open selected file in vertical split.
            " <c-s>,<c-cr>,<c-x> -- open selected file in a horizontal split.
            " <c-y>     -- create a new file and its parent directories.
            " <c-n>     -- next string in the prompt's history.
            " <c-p>     -- previous string in the prompt's history.
            " <c-z>     -- mark/unmark a file to be opened with <c-o>. <c-y>
            " <c-o>     -- open files marked by <c-z>
            " <F5>      -- refresh window. and purge cache.
            " <F7>      -- wipe MRU list. delete MRU entries marked by <c-z>.
            " <insert>  -- ...
            " <esc>,<c-c>,<c-g> -- cancel. exit CtrlP.
            " }}}
        " }}}

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
        " }}}

        " Bundle 'FuzzyFinder'
            " buffer/file/command/tag/etc explorer with fuzzy matching.

        " asyncfinder {{{ asynchronous fuzzy file finder with Python threading module
            " Usage:
            " :AsyncFinder [-mode={mode}] [{pattern}]
            let g:asyncfinder_ignore_dirs = "['*.AppleDouble*','*.git*','*.hg*','*.bzr*',]"
            let g:asyncfinder_ignore_files = "['*.swp', '*~',]"
            let g:asyncfinder_initial_mode = "a" " a: all, b: buffer, f: files, m: mru.
            let g:asyncfinder_initial_pattern = "*"
            let g:asyncfinder_include_buffers = 1
            let g:asyncfinder_include_mru_files = 1
            let g:asyncfinder_edit_file_on_single_result = 1
        " }}}

        " EasyGrep {{{ make search and replace in files easy.
            " \vv: grep current word, \va: add to list,
            " \vr: replace, \vo: config options.
            " :GrepOptions, :Grep, :GrepAdd [-rRiIm],
            " :Replace [target] [replacement], :Replace /[target]/[re]/
            " :ReplaceUndo, :ResultListOpen
            let g:EasyGrepMode = 2 " 0 all file 1 opened buffer 2 track current extension
            let g:EasyGrepCommand = 0 " 0: vimgrep, 1: grep (follows grepprg).
            let g:EasyGrepRecursive = 1
            let g:EasyGrepIgnoreCase = 1
            let g:EasyGrepHidden = 0 " search hidden files
            let g:EasyGrepAllOptionsInExplorer = 1
            let g:EasyGrepWindow = 1 " 0: quickfix, 1: location list.
            let g:EasyGrepWindowPosition = "botright" " such as topleft, botright.
            let g:EasyGrepOpenWindowOnMatch = 1 " open window when has matches.
            let g:EasyGrepEveryMatch = 1 " multiple matches on same line as different
            let g:EasyGrepJumpToMatch = 1 " jump to first match.
            let g:EasyGrepSearchCurrentBufferDir = 1 " search current buffer's dir.
            " let g:EasyGrepInvertWholeWord =
                " 0: all files, 1: buffers, 2: associated extensions
            " let g:EasyGrepFileAssociations = '' " location of ext info file.
            let g:EasyGrepFileAssociationsInExplorer = 1 " show file associations list.
            let g:EasyGrepOptionPrefix='<leader>vy'
            let g:EasyGrepReplaceWindowMode = 0 " 0: new tab, 1: split, 2: autowriteall
            let g:EasyGrepReplaceAllPerFile = 1 " whether use 'a' (for all).
            let g:EasyGrepExtraWarnings = 1
        " }}}

        " Ack {{{ a front for the Perl module App::Ack to replace grep.
            " Usage:
            " - :Ack [options] {pattern} [{directory}]
            " QucikFix window keyboard shortcuts:
            " o, go, t, T, v, gv, q
            if !system("grep 'Ubuntu' /etc/issue") " Ubuntu ack-grep
                let g:ackprg="ack-grep -H --nocolor --nogroup --column"
            endif
        " }}}

        " vim-unite-ack : ack source for unite.vim

        " buffers_search_and_replace {{{ powerful buffer(s) search & replace tool.
            " Usage:
            "   - [range]Bs[flag] <search regex>
            "   - flags:
            "       - c -- current buffer
            "       - e -- exclude
            "       - f --
        " }}}

        " SearchParty {{{
        " }}}

        " Area_search
            " Usage:
            " - :AreaSearch hello math world
            " - ,,n -- jump to next area matching the query.
    " }}}

    " [ comment ] {{{
        " TComment {{{ An extensible & universal comment plugin
            " It provides easy to use, file-type sensible comments for Vim.
            " line, block, in-line, embed. (toggle)
            " Usage:
            " - tcomment#DefineType() to override and define file-type comment string.
            "   - g[c/C]{motion}    :: toggle comments.
            "   - <c-_>{action}	:: :TComment actions.
            let g:tcommentMapLeader1 = '<c-_>'
            let g:tcommentMapLeader2 = '<Leader>_'
            let g:tcommentMapLeaderOp1 = 'gc'
            let g:tcommentMapLeaderOp2 = 'gC'
            let g:tcommentModeExtra = '>>' " move cursor to end of comment and next line
            let g:tcommentOpModeExtra = '>>'
            let g:tcommentBlankLines = 1 " comment blank lines too.
            let g:tcommentOptions = {}
            " {'col': 1}
            "   put comment marker always in the first column regardless of block's indentation.
            let g:tcomment#ignore_char_type = 1
            let g:tcommentGuessFileType = 0 " guess filetype
            let g:tcommentGuessFileType_dsl = 'xml'
            let g:tcommentGuessFileType_php = 'html'
            let g:tcommentGuessFileType_vim = 1
            let g:tcommentGuessFileType_html = 1
            let g:tcommentGuessFileType_tskeleton = 1
            let g:tcommentGuessFileType_django = 1
            let g:tcommentIgnoreTypes_php = 'sql'
            let g:tcomment#syntax_substitute = {'\C^javaScript': {'sub': 'javascript'}}
            let g:tcommentSyntaxMap =
                        \ {
                        \ 'vimRubyRegion': 'ruby',
                        \ 'vimPythonRegion': 'python',
                        \ 'vimMzSchemeRegion': 'scheme',
                        \ 'vimPerlRegion': 'perl',
                        \ }
            "\ 'VimwikiPre': '??'
            " FIXME how to define 'vimwikiRubyRegion' etc ? for use in
            " vimwiki embed syntax ?
            " the dictionary key is a syntax group defined by vimwiki.
            " so you need to add code to syntax file.
            " you can write a function to get filetype from context, and
            " treat it as function parameter.
            " write this function at here.
            " let g:tcomment#replacements_c = {} " replacement for c filetype
            " let g:tcommentBlockC = {} " generic c-like block comments.
            " let g:tcommentBlockC2 = {} " generic c-like block comments (alternative markup)
            " let g:tcommentInlineC = g:tcommentLineC
            let g:tcommentBlockXML = "<!-- %s -->\n"
            let g:tcommentInlineXML = "<!-- %s -->"

            " tcomment#DefineType(name, commentdef)
            " - 'name' usually is 'filetype', you can use 'FILETYPE_block' for
            "	block comment. 'FILETYPE_inline' for inline comments. if no
            "	specialized comment definition exists, the normal one with
            "	'FILETYPE' is used.
            " - 'commentdef'. can be a string or a dictionary.
            " let g:tcomment_types {}
        " }}}

        " Nerd Commenter {{{ \cc, \cu, \cs, \cm, \cn, \c$, \c<space>
            " \cc: Comment, \cu: Uncomment, \cs, Sexily Comment, \cm: minimal.
            " \cn: Nested, \c<space>: Toggle, \ci: Invert,
            " \c$: EOL, \cy: "y", \cA: "A", \cI: "I", \ca: Alternative delimiters,
            " let loaded_nerd_comments=1 " turn off this script.
        " }}}

        " commentary {{{
            " \\{motion}, \\\, {Visual}\\ ==> comment
            " \\u ==> uncomment
        " }}}

        " vim-addon-commenting {{{ features: ( fork from commentary.vim )
            " - \ for commenting and uncommenting using selection or movement
            " - pays attention col of cursor so that you can indent at col 0 or
            "   indentation level
            " - n\\ comment n lines - prefer simple comemnts (// in C/C++ case)
            "   without configuration
            " work for repeat.vim
            " https://github.com/MarcWeber/vim-addon-commenting
            "let g:vim_addon_commenting = {'force_filetype_comments':
                        "\ {'php': ['#',''], 'c' : ['/*','*/']} }
        " }}}

        " vim-cowsay {{{
            " Require:
            "   - cowsay
            " Usage:
            "   - :Cow [string]
            "   - :[range]Cow -> e.g. :20,35Cow (surround words (20,35) with cow)
            "   - :Cowcomment [string] (use tComment)
            "   - :Cowfile [string] -- different style cows
            "   - :Cowsay [string] -- :echo
        " }}}
    " }}}

    " [ doc & help "K" ] {{{
        " ref {{{ {Visual}'K', ref is a Vim plugin to view the reference.
            " TODO enhance ref with feature of completion in vim command line
            " TODO change ref-viewer open style, like viewdoc open content in
            " preview window with syntax highlighting.
            " take this as an option for ref.
            " This plugin can be separated to core of viewer and sources of
            " reference.  As a result, various references can be viewed by the
            " same interface.
            " :help ref@en
            " Usage:
            "   - 'K'
            "   - :Unite ref/??
            "   - :Ref [{options}] {source-name} [{query}]
            "       - options:
            "           - -open={command} -- overwrite the g:ref_open
            "           - -new -- open viewer newly
            "       - source: (source is a Dictionary)
            "       - function: (function is a Dictionary-function)
            "       - query: (a string passed by :Ref command)
            "   - <Plug>(ref-keyword) => 'K' / '<CR>' / '<C-]>'
            "   - history
            "       - <Plug>(ref-forward)   => '<C-i>'
            "       - <Plug>(ref-back)      => '<C-t>' / '<C-o>'
            " Supports:
            "   - Ruby -> refe/resense (ReFe)
            "   - Python -> pydoc
            "   - C/command -> man
            "   - Perl -> perldoc
            "   - PHP -> phpmanual
            "   - Clojure -> clojure
            "   - Erlang -> erlang
            "   - rfc -> Web RFC
            "   - webdict - > web dictionary

            " let g:ref_no_default_key_mappings = 1 " no default mappings
            let g:ref_open = 'split' " split/vsplit/tabnew
            let g:ref_use_vimproc = 1 " ref#system() use vimproc.
                " comment out: open in vim buffer instead of less
            let g:ref_noenter = 0 " 1: always enable -noenter option for :Ref
            if !exists('g:ref_detect_filetype')
                let g:ref_detect_filetype = {}
            endif
            let g:ref_detect_filetype['_'] = 'man'
                " key is filetype.
                " value is source name in ref/
                " '_' means all filetypes.
                " '_' key used when filetype was not registered
            " FIXME let g:ref_detect_filetype['vim'] = 'Funcref'

            " [ Vim ]
                " -> :help
                "  FIXME let ref support this.
            " [ Ruby ]
                " -> refe (ReFe)
                " Requirements:
                "       - ref + ReFe
                "       - or ref-man + RSense
                let g:ref_refe_cmd = ["refe",]
                    " allow a List includes command and arguments.
                let g:ref_refe_version = 2 " 1/2 <- $ refe --version
                let g:ref_refe_encoding = &termencoding
                " ref-man: RSense
                let g:ref_refe_rsense_cmd = 'rsense'
                    " specific RSense command.
            " [ Python ]
                " -> pydoc
        " NeoBundle 'fs111/pydoc.vim', {'external_commands': ['pydoc']}
                let g:ref_pydoc_cmd = 'pydoc'
                let g:ref_pydoc_complete_head = 1
            " [ C / command ]
                " -> man
                let g:ref_man_cmd = 'man' " man/info/'man -P cat'
                let g:ref_man_lang = $LANG " $LANG
            "  [ Go ]
                " -> godoc
                " TODO support godoc
            " [ JavaScript ]
                " -> ???
                "  TODO support JavaScript
            " [ R ]
                " -> ???
                " TODO support R
            " [ Perl ]
                " -> perldoc
                let g:ref_perldoc_cmd = 'perldoc'
                let g:ref_perldoc_complete_head = 1
                let g:ref_perldoc_auto_append_f = 1
            " [ PHP ]
                " -> phpmanual
                let g:ref_phpmanual_cmd = 'w3m -dump %s'
                let g:ref_phpmanual_path = 'http://php.benscom.com/download-docs.php'
            " [ Clojure ]
                " -> clojure
                let g:ref_clojure_cmd = 'clj'
                let g:ref_clojure_overview = 1
                " let g:ref_clojure_classpath =
                    " specific $CLASSPATH by string or List.
                " let g:ref_clojure_precode = '' " 'use'/'require'
                    " specific the code executed before searching.
            " [ Erlang ]
                " -> erlang
                let g:ref_erlang_cmd = 'erl' " 'erl'/'erl -man'
                let g:ref_erlang_man_dir =
                            \ 'erl -noshell -eval' .
                            \ 'io:fwrite(code:root_dir()). -s init stop'
            " [ RFC ]
                " -> rfc
                let g:ref_rfc_cmd = 'elinks'
                let g:ref_rfc_encoding = &termencoding
            " [ webdict ]
                " -> webdict
                let g:ref_source_webdict_cmd = 'w3m -dump %s'
                if !exists('g:ref_source_webdict_sites')
                    let g:ref_source_webdict_sites = {}
                endif
                " TODO add my firefox bookmarks: youdao, google, chinese ...
                " FIXME %s after ?q= is the query keyword
                " let g:ref_source_webdict_sites['youdao'] = {
                "             \ 'url': 'http://dict.youdao.com/search?q=%s&keyfrom=dict.index',
                "             \ 'keyword_encoding': 'utf-8',
                "             \ 'output_encoding': 'utf-8',
                "             \ 'cache': 0,
                "             \ 'filter': '',
                "             \ 'line': '',
                "             \ }
                let g:ref_source_webdict_encoding = &termencoding
        " }}}

        " viewdoc {{{ {Visual}'K', Flexible viewer for any documentation (vim help/man/perl/python)
            " support python dot operator help.
            " e.g. module.fun|<K>ction(args)
            " TODO more customize
            " Usage:
            " - <K>/<F1>, <C-]>/<C-T>, <CR>/<BS>(tag navigation),
            "   q (close), <Tab> completion.
            " - :doc[!] {topic} [{filetype}]
            " - :doc[!] <cword> [{filetype}]
            " - :ViewDoc, :man, :ViewDocMan, :help, :ViewDocHelp,
            "   :perldoc, :ViewDocPerl.
            " - e.g. :ViewDoc string.split in Python filetype.
            " - :ViewDocMan [Man/C/...]
            "   e.g. :ViewDocMan 3 printf -- for C Man Page.
            let g:viewdoc_open = "topleft new" " tabnew, topleft new, belowright vnew
            let g:viewdoc_only = 0 " :only, hide all other window only keep doc window.
            let g:viewdoc_prevtabonclose = 1
            let g:viewdoc_openempty = 0 " do not open anything if not found tag.
            let g:viewdoc_dontswitch = 0 " immaculately switch to opened document.
            let g:viewdoc_man_cmd = "/usr/bin/man"
            let g:ViewDoc_DEFAULT = 'ViewDoc_man' " ViewDoc_man, ViewDoc_help

            " customize {{{
            " TODO add other doc like HTML5, CSS3, JavaScript. Go,
            " support ruby doc (ri), Go doc (godoc) etc
            " Dart, Lisp, muttrc, fvwm,
            " Functions:
            " - ViewDoc({target}, {topic}, {filetype})
            " - ViewDoc({target}, {topic})
            " - ViewDoc({target}, <cword>, {filetype})
            " - ViewDoc({target}, <cword>)
            " Handlers:
            " to add documentation handler for new {filetype}, it's enough
            " to create on function in ~/.vimrc (or some plugin):
            " ViewDoc_{filetype}({topic}/<cword>, {filetype}, synid, have_context)
            " synid = Syntax id for requested topic as returned by synID().
            " Can be non-zero only if |:ViewDoc| was called with <cword>.
            " have_context : true if we've context.
            " The function return Dictionary with these keys. (all optional)
            " 'topic', 'cmd', 'ft', 'line', 'col', 'search', 'tags', 'docft'.

            " function ViewDoc_pydoc(topic, ...)
            "     return  { 'cmd':	printf('pydoc %s', shellescape(a:topic,1)),
            "                 \ 'ft':	'pydoc',
            "                 \ }
            " endfunction
            " let g:ViewDoc_pydoc  = function('ViewDoc_pydoc')
            " let g:ViewDoc_python = function('ViewDoc_pydoc')

            " help_custom ~/.vim/ftdoc/{filetype}
            " autocmd VimEnter * let g:ViewDoc_cmake = function('ViewDoc_help_custom')
            " }}}
        " }}}

        " Manuals {{{ An extensible help system
        " }}}

        " unite-help {{{ Vim :help command in unite interface through doc tags file
            " Usage: :Unite help
        " }}}
    " }}}

    " [ syntax checker ] {{{
        " Syntastic2 {{{
        " }}}

        " Syntastic {{{ :w saving to check. or daemon automatic check.
            " Commands: :Errors, :SyntasticToggleMode, :SyntasticCheck,
            let g:syntastic_check_on_open = 0 " check when buffers first loaded/save
            let g:syntastic_echo_current_error = 1 " error associated with lines
            let g:syntastic_enable_signs = 1 " :sign interface to mark syntax errors
            let g:syntastic_error_symbol = '✗'
            let g:syntastic_style_error_symbol = 'S✗'
            let g:syntastic_warning_symbol = '⚠'
            let g:syntastic_style_warning_symbol = 'S⚠'
            let g:syntastic_enable_balloons = 1 " mouse hover, need '+balloon_eval'
            let g:syntastic_enable_highlighting = 1 " syntax highlighting to mark errors
            let g:syntastic_auto_jump = 0 " jump to first detected error
            let g:syntastic_auto_loc_list = 2 " 0/1/2: auto open/close error window
            let g:syntastic_loc_list_height = 10
                " fine tune when automatic syntax checking is done.
            let g:syntastic_mode_map = {
                        \ "mode": "active",
                        \ "active_filetypes":
                            \ [
                                \ 'ruby', 'python', 'php', 'perl',
                                \ 'lisp',
                                \ 'c', 'cpp', 'go',
                                \ 'javascript', 'coffee',
                                \ 'css',
                                \ 'xml', 'tex',
                            \ ],
                        \ "passive_filetypes":
                            \ ['html'],
                        \ }
            let g:syntastic_quiet_warnings = 0 " 1: care syntax errors not warning
            " let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
            " --------------------------------------------------------------
            "  let g:syntastic_[ft]_checker = 'checkstyle'
            " C
            let g:syntastic_c_checker = "gcc"
            let g:syntastic_c_compiler = "gcc" " gcc/clang
            let g:syntastic_c_check_header = 1 " check header files
            let g:syntastic_c_no_include_search = 0
            " 1: disable search of included header files after special libraries.
            let g:syntastic_c_include_dirs = [ 'includes', 'headers', ]
            " add some custom include directories.
            let g:syntastic_c_auto_refresh_includes = 1
            " enable header files being re-checked on every file write.
            let g:syntastic_c_remove_include_errors = 1
            " remove errors of files included via the g:syntastic_cpp_include_dirs
            let g:syntastic_c_compiler_options = ' -ansi'
            " add additional compiler options.
            " let g:syntastic_c_errorformat = ''
            " use this variable to override the default error format.
            " cpp
            let g:syntastic_cpp_compiler = 'g++' " clang++, g++
            let g:syntastic_cpp_check_header = 1 " check header files
            let g:syntastic_cp_no_include_search = 0
            " 1: disable search of included header files after special libraries.
            let g:syntastic_cpp_include_dirs = [ 'includes', 'headers', ]
            " add some custom include directories.
            let g:syntastic_cpp_auto_refresh_includes = 1
            " enable header files being re-checked on every file write.
            let g:syntastic_cpp_remove_include_errors = 1
            " remove errors of files included via the g:syntastic_cpp_include_dirs
            let b:syntastic_cpp_cflags = ' -I/usr/include/libsoup-2.4'
            " alternately, set buffer local variable.
            let g:syntastic_cpp_compiler_options = ' -std=c++0x'
            " add additional compiler options.
            " let g:syntastic_cpp_config_file = '.config'
            " default: '.syntastic_cpp_config'
            " let g:syntastic_cpp_errorformat = ''
            " use this variable to override the default error format.
            " JavaScript
            " let g:syntastic_javascript_checker = "jslint"
            " CSS
            " let g:syntastic_csslint_options = "--warning=none" " disable warning
        " }}}

        " checksyntax {{{
        " }}}

        " flymake {{{ on-the-fly syntax checking using external syntax checking tool.
            " autocmd BufWritePost <buffer> call FlyMake({checker}, {err-regexp}, {warn-regexp})
            " autocmd BufWinLeave <buffer>  call FlyMakeCloseWindows()
        " }}}
    " }}}

    " [ debugger ] {{{ <F5~F8>
        " Vdebug {{{ Multi-language DBGP protocol debugger client for Vim.
            " (PHP, Python, Perl, Ruby, etc.)
        " }}}

        " VimDebug {{{ Integrate your debugger with Vim
            " 'Vim::Debug' - Perl wrapper around a command line debugger
        " }}}

        " GdbFromVim {{{ debug your application with gdb from Vim relies on gdblib
            " Usage:
            " :GdbFromVimRun
            " :GdbFromVimStep
            " :GdbFromVimNext
            " :GdbFromVimContinue
            " :GdbFromVimAddBreakpoint
            " :GdbFromVimDeleteBreakpoint
            " :GdbFromVimDeleteAllBreakpoints
            " :GdbFromVimClear
            " :GdbFromVimPrint
            " :GdbFromVimPrintBreakpoints
            " :GdbFromVimClose
            " :GdbFromVimTty
            " :GdbFromVimRemote
            " :GdbFromVimSymbolFile

            " let g:GdbFromVim_App =
            " let g:gdb_from_vim_app = ''
            " let g:gdb_from_vim_args = ''
            let g:gdb_from_vim_path = 'gdb'
        " }}}

        " gdbmgr {{{ Vim interface to gdb
        " }}}
    " }}}

    " [ Compiler ] {{{ <F5>
        " SingleCompile {{{ <F5> compile&run
            " Usage:
            " :SCChooseCompiler
            " :SCViewResult
            " :SCCompileRunAsync
            let g:SingleCompile_alwayscompile = 1 " 0: to disable it.
            let g:SingleCompile_asyncrunmode = 'auto' " mode: auto, none, python,
            let g:SingleCompile_autowrite = 1 " save file when compile.
            let g:SingleCompile_usequickfix = 1 " use QuickFix.
            let g:SingleCompile_menumode = 2 " 0 don't show menu, 1 sub menu, 2 menu bar
            let g:SingleCompile_resultheight = 10
            let g:SingleCompile_showquickfixiferror = 1 " auto show up quickfix window
            let g:SingleCompile_showresultafterrun = 0 " show result even no error
            let g:SingleCompile_usedialog = 0 " show dialog, +dialog_con, +dialog_gui

            let g:SingleCompile_common_out_file = '$(FILE_TITLE)$'
            let g:SingleCompile_common_run_command = './$(FILE_TITLE)$'

            if exists('g:loaded_SingleCompile')
                call SingleCompile#SetCompilerTemplate(
                            \ 'c', 'gcc_custom', 'GNU C Compiler',
                            \ 'gcc', '-std=gnu99 -Wall -g -o $(FILE_TITLE)$',
                            \ g:SingleCompile_common_run_command
                            \ )

                call SingleCompile#ChooseCompiler('python', 'python3')
                call SingleCompile#ChooseCompiler('sh', 'bash')
                call SingleCompile#ChooseCompiler('bash', 'bash')
                call SingleCompile#ChooseCompiler('zsh', 'zsh')
                " call SingleCompile#ChooseCompiler('c', 'gcc')
                call SingleCompile#ChooseCompiler('c', 'gcc_custom')
                call SingleCompile#ChooseCompiler('cpp', 'g++')
                call SingleCompile#ChooseCompiler('html', 'firefox')
                call SingleCompile#ChooseCompiler('javascript', 'node.js')
            endif

            nnoremap <F5> :SCCompileRun<cr>
        " }}}
    " }}}

"AAA XXX
    " [ quickfix & location list ] {{{
        " quickfixsigns {{{ marks, quickfix & location list items with signs.
            " Usage:
            " <Leader>ms -- jump from sign to sign (vcsdiff)
            let g:quickfixsigns_classes = ([
                        \ 'qfl', 'loc',
                        \ 'marks', 'breakpoints',
                        \ 'vcsdiff'
                        \ ])
            let g:quickfixsigns_events = ([
                        \ 'BufEnter',
                        \ 'CursorHold', 'CursorHoldI',
                        \ 'InsertLeave', 'InsertEnter', 'InsertChange',
                        \ ])
            let g:quickfixsigns_balloon = 1
            let g:quickfixsigns_max = 500 " don't display signs if longer than this.
            let g:quickfixsigns_blacklist_buffer = '^__.*__$'
            let g:quickfixsigns_icons = {}
            let g:quickfixsigns#vcsdiff#guess_type = 1
            " let g:quickfixsigns#vcsdiff#cmd_separator = '&&'
        " }}}

        " scmdiff : Highlight changed lines in a file via SCM diff command

        " svndiff%1881 {{{ similar with quickfixsigns. colored signs for diff.
        " }}}

        " Unimpaired {{{ provides several pairs of bracket maps.
            " [, ],
                " a - :Next/:Previous
                " b - buffer
                " l - location list
                " q - quickfix
                " t - tag
                " n - SCM conflict marker
            " encoding & decoding
                " [ - encoding -> <foo bar="baz"> => &lt;foo bar=&quot;baz&quot&gt;
                " ] - decoding ->
                " .....
        " }}}

        " sharefix {{{ sharefix addresses the pain point of your quickfix list
        " being wiped out between running different commands or functions that
        " update the list.
        " }}}
    " }}}

    " [ VCS: Git, bzr, svn, ] {{{ <F9>
        " aurum {{{ dealing with source files under various VCS control
            " Usage:
            " TODO
        " }}}

        " fugitive {{{ Intuitive and Simple Git wrapper for Vim.
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

        " Gitv {{{ 'gitk clone' plugin for Vim as similar set of func as a repo viewer.
            " Usage:
            "   - [Browser/File] mode
            "   - [range]Gitv[!] [args]
            "   - arguments:
            "       - Gitv is a wrapper of 'git log', support all options for `git log`
            "       - --all
            "       - <since>..<until>
            "       - --merges
            "       - -S<string>
            "       - -G<regex>
            "   - back to working revision file
            "       press <Enter> on top line:
            "       -- [filename] --
            "   - Altering the range (input search regex/string)
            "       press <C-Enter> on line below this line:
            "       -- Showing (up to 56) commits affecting lines in the range:
            let g:Gitv_CommitStep = &lines
            let g:Gitv_OpenHorizontal = 'auto' " 0: vertical, 1: horizontal, auto:
            let g:Gitv_GitExecutable = 'git'
            let g:Gitv_WipeAllOnClose = 0 " wipe all buffers when q to close
            let g:Gitv_WrapLines = 0 " wrap long commit
            let g:Gitv_TruncateCommitSubjects = 0 " 1: truncate for vertical display
            let g:Gitv_OpenPreviewOnLaunch = 1 " launch preview window when open gitv
            let g:Gitv_PromptToDeleteMergeBranch = 1 " prompt delete branch when merge
            let g:Gitv_DoNotMapCtrlKey = 0

            nnoremap <F9> :Gitv<cr>

            " resize gitv window.
            " augroup MyGitv
            "     au!
            "     au WinEnter gitv-* resize 20
            "     " WinEnter, WinCreate -> two events.
            " augroup END
        " }}}

        " extradite {{{ A git commit log browser that extends fugitive.vim
            " :Extradite | :Extradite! -- vertical.
            " nnoremap <F9> :Extradite<cr>
            " let g:extradite_width = 60
            let g:extradite_showhash = 1 " show abbre commit hashes.
        " }}}

        " hypergit {{{ Git plugin for Vim.
            " Features:
            " - Git Actions in TreeMenu
            " - Commit Buffer
            " - Rebase (interactive) Helper. when git rebase -i [branch]
        " }}}

        " vitra {{{ Vim client for Trac
        " TODO
        " }}}

        " vim-github {{{ A vim plugin to access to Github.
            " Usage: :Github {feature} [arguments]
            " Function: github#connect({path} [, {param}] [, {raw}])
            " e.g. :edit github://issues/thinca/vim-github
            let g:github#user="NagatoPain"
            " let g:github#token=$GITHUB_TOKEN
            let g:github#curl_cmd="curl"
        " }}}

        " rhubarb {{{ fugitive extension for GitHub
            " Usage: i_CTRL-X_CTRL-O to complete when editing commit.
            " let g:github_user = '<user>'
            " let g:github_password = '<password>'
        " }}}

        " gf-diff : extend gf and other commands.
        " Usage: open code file in 'diff' output with 'gf'.

        " svndiff%1881 : show diff signs for svn/git.

        " [ conflict ] {{{
        " Splice  {{{ plugin for resolving conflicts during three-way merges.
            " setup in ~/.gitconfig
            let g:splice_debug = 0 " Splice is loaded only once.
            let g:splice_disable = 0 " Splice is enabled as usual.
            let g:splice_initial_diff_grid = 0 " the diff the grid mode starts in.
            let g:splice_initial_diff_loupe = 0
            let g:splice_initial_diff_compare = 0
            let g:splice_initial_diff_path = 0
            let g:splice_initial_layout_grid = 0 " grid mode layout 0
            let g:splice_initial_layout_loupe = 0 " single file
            let g:splice_initial_layout_compare = 0 " 0: vsplit, 1: hsplit
            let g:splice_initial_layout_path = 0 " 0,1,2,3,4
            let g:splice_initial_scrollbind_grid = 0
            let g:splice_initial_scrollbind_loupe = 0
            let g:splice_initial_scrollbind_compare = 0
            let g:splice_initial_scrollbind_path = 0
            let g:splice_initial_mode = "grid" " grid, loupe, compare, path
            let g:splice_prefix = "-"
            let g:splice_wrap = "None" " wrap, nowrap, None
        " }}}

        " ConflictDetection {{{ highlight markers >>>>>> <<<<<<< =========
            let g:ConflictDetection_WarnEvents = 'BufWritePost'
            " TODO set statusline+=%!ConflictCheck()
            " set statusline+=%!g:ConflictDetection_AutoDetectEvents
            " set statusline+=%!g:ConflictDetection_WarnEvents
            " let g:ConflictDetection_AutoDetectEvents = ''
                " empty to disable auto detect
            " highlight def link conflictOurs                     guibg=Green
            " highlight def link conflictBase                     guibg=Brown
            " highlight def link conflictTheirs                   guibg=Red
            " highlight def link conflictSeparatorMarkerSymbol    guifg=Black
            " highlight def conflictOursMarker                    guifg=Green
            " highlight def conflictBaseMarker                    guifg=Brown
            " highlight def conflictTheirsMarker                  guifg=Red
        " }}}

        " ConflictMotions {{{ defines movement commands and text objects.
            " Require: CountJump
            " Usage:
            " ]z, [z on conflict marker.
            " ]x, [x next/previous start of a conflict.
            " To change the default motion mappings, use:
            let g:ConflictMotions_ConflictBeginMapping = 'x'
            let g:ConflictMotions_ConflictEndMapping = 'X'
            let g:ConflictMotions_MarkerMapping = 'z'
            " To change the default text object mappings, use:
            let g:ConflictMotions_ConflictMapping = 'x'
            let g:ConflictMotions_SectionMapping = 'z'
        " }}}
        " }}}

        " patchreview : allows easy single or multipatch code or diff reviews.
            " Usage:
            " - :DiffReview
            "   -- reviewing current changes in your workspace.
            " - :DiffReview git staged --no-color -U5
            "   -- reviewing staged git changes.
            " - :PatchReview some.patch
            "   -- reviewing a patch.
            " - :ReversePatchReview some.patch
            "   -- reviewing a previously applied patch.
    " }}}

    " [ FileManager ] {{{ <F11>
        " NERDtree {{{ <F11> :NERDTree [dir|bookmark-name]
            " Usage:
            "   Keys:
            "       - t/i/s/o -- open in tab/split/vsplit/preview
            "       - m -- show NERDTree menu
            "       - R -- refresh
            "       - ? -- show quick help
            " let loaded_nerd_tree=1 " let vim can not load NERDTree.
            let NERDChristmasTree = 1 " colourful. =0 for more vanilla looking tree.
            let NERDTreeAutoCenter = 1 " default = 1.
            let NERDTreeAutoCenterThreshold = 3 " default = 3.
            let NERDTreeCaseSensitiveSort = 0 " default = 0.
            let NERDTreeChDirMode = 2 " 0/1/2
            let NERDTreeHighlightCursorline = 1 " highlight cursorline.
            let NERDTreeHijackNetrw = 1 " for :edit <dir> open 'secondary' NERD tree.
            let NERDTreeIgnore = ['\~$', '\.log', '\.pyo', '\.pyc', '\.swp', '\.bak', '\.git', '\.hg']
            let NERDTreeBookmarksFile="$HOME/.vimNERDTreeBookmarks"
            let NERDTreeQuitOnOpen = 0 " does not close after open. default=0.
            let NERDTreeShowBookmarks = 1 " show Bookmarks when open NERD-tree.
            let NERDTreeShowHidden = 0 " does not show hidden files.
            let NERDTreeShowLineNumbers = 0 " do not show line numbers, default=0
            let NERDTreeWinPos = "left" " NERD-tree window position.
            let NERDTreeWinSize = 25 " window size, default=31.
            "let NERDTreeDirArrows =
            "new own syntax highlight gnap.
            "let NERDTreeMinimalUI =
            let NERDTreeCasadeOpenSingleChildDir = 1 " cascade single child directory


            nnoremap <silent> <F11> :NERDTreeToggle<CR>

            " TODO au FileType nerdtree
        " }}}

        " nerdtree-execute
            " Usage:
            " When navigating in NERDTree, select file or directory, press 'm'
            " key, and NERDTree menu will appear. Press 'x' then to execute
            " system default application for selected file/directory, using this
            " plugin.  You can open your favourite image editor for images, pdf
            " reader for pdfs etc.

        " nerdtree-plugin
            " ack_menuitem.vim
            " quickrun_keymap.vim
            " callex_keymap.vim
            " callsh_keymap.vim
            " callfinder_keymap.vim

        " easytree {{{ Tree file manager.
            " Usage:
            " :EasyTree [directory path]

            let g:easytree_cascade_open_single_dir = 1 " cascade expands all subsequent single dir
            let g:easytree_show_line_numbers = 0 " disable showing line numbers
            let g:easytree_show_hidden_files = 0
            let g:easytree_highlight_cursor_line = 1
            let g:easytree_ignore_dirs = ['.git']
            let g:easytree_ignore_files = ['*.swp', '*~']
            let g:easytree_ignore_find_result = ['*.swp', '*~', 'tags']
            let g:easytree_hijack_netrw = 1 " replace netrw with easytree

            " TODO nnoremap <silent> <F11> :EasyTree<CR>
        " }}}

        " vimfiler {{{ Powerful file explorer implemented by VimL.
            " Usage: :VimFiler
            " Require: unite.vim
            let g:vimfiler_as_default_explorer = 1 " behaves as netrw
        " }}}

        " easybuffer {{{ quickly switch between buffers using corresponding keys
        " or buffer numbers displayed in easybuffer quick switch window
            " Usage: :EasyBuffer
        " }}}
    " }}}

    " [ buffers ] {{{
        " Tagma_Buffer_Manager {{{
            " h/<Tab> , l/<S-Tab>. <Cr>/o S/s V/v Ctrl-[hjkl]
            " :MgrToggle :help TagmaBufMgr
            let g:TagmaBufMgrAutoDisplay = 1 " =0 to disable autodisplay.
            let g:TagmaBufMgrBufferNumbers = 1 " buffer number
            let g:TagmaBufMgrCloseSelect = 0 " close buffer when selected.
            let g:TagmaBufMgrLastWindow = 1 " default =0.
            let g:TagmaBufMgrLocation = 'T' " Top, Bottom, Left, Right, Float
            let g:TagmaBufMgrMapCArrow = 1 " Ctrl-Arrow
            let g:TagmaBufMgrMapChjkl = 0 " Ctrl-[hjkl] to nav buffers.
            let g:TagmaBufMgrPrefix = '<Leader>tb' " prefix for all commands.
            let g:TagmaBufMgrPopUp = 1 " Right-Click PopUp menu
            let g:TagmaBufMgrWidth = 25 " when at the Left or Right.
            let g:TagmaBufMgrLastLine = 0 " Display Manager Window on last line
        " }}}

        " minibufexplorer {{{
            let g:miniBufExplSplitBelow = 0  " position at bottom or top.
            let g:miniBufExplSplitToEdge = 1 " force MBR to open at the edge of screen
            let g:miniBufExplorerMoreThanOne = 1 " open when more than one.
            let g:miniBufExplMapWindowNavVim = 1 " Ctrl + h/j/k/l
            let g:miniBufExplMapWindowNavArrows = 0 " Ctrl + Arrow keys
            let g:miniBufExplMapCTabSwitchBufs = 1 " <C-TAB> and <C-S-TAB>
            let g:miniBufExplMapCTabSwitchWindows = 0 " <C-TAB> and <C-S-TAB>
            let g:miniBufExplUseSingleClick = 1 " single click or tabs.
            let g:miniBufExplModSelTarget = 1 " if use other explorer like TagList.
            let g:miniBufExplCloseOnSelect = 0 " close after select buffer.
            let g:miniBufExplCheckDupeBufs = 0 " when >15 buffers
            let g:miniBufExplShowBufNumbers = 1 " show buffer number, 0 to omit them
            " let g:miniBufExplForceSyntaxEnable = 1 " conflict with Powerline.
            let g:miniBufExplorerDebugLevel = 0  " MBE serious errors output. [0/4/10]
            let g:miniBufExplorerDebugMode  = 1  " Uses VIM's echo function
            let g:miniBufExplMaxSize = 0
            let g:miniBufExplMinSize = 1
            " Vertical mode
            " let g:miniBufExplVSplit = 20   " column width in chars in virtical.
            " let g:miniBufExplMaxSize = <max width: default 0>
            " let g:miniBufExplMinSize = <min width: default 1>
            " MiniBufExpl Colors
            hi MBENormal guifg=#808080 ctermfg=250
            hi MBEChanged guifg=#CD5907 ctermfg=208 cterm=bold
            hi MBEVisibleNormal guifg=#5DC2D6 ctermfg=024
            hi MBEVisibleNormalActive guifg=#5DC2D6 ctermfg=026 cterm=bold
            hi MBEVisibleChanged guifg=#F1266F ctermfg=208 cterm=bold
            hi MBEVisibleChangedActive guifg=#F1266F ctermfg=232 ctermbg=208 cterm=bold
            " FIXME how to auto open MiniBufExpl
        " }}}

        " LustyJuggler {{{ fast and responsive way to manage files and buffers in Vim.
            " Usage:
            " :LustyFilesystemExplorer
            " :LustyFilesystemExplorerFromHere
            " :LustyBufferExplorer
            " :LustyBufferGrep (for searching through all open buffers)
            " <Leader>lf  - Opens filesystem explorer.
            " <Leader>lr  - Opens filesystem explorer at the directory of the current file.
            " <Leader>lb  - Opens buffer explorer.
            " <Leader>lg  - Opens buffer grep.
            " <Leader>lj  - Launch the juggler.
            set hidden
        " }}}

        " Tabman {{{ <Leader>tm, :TMToogle, || ? [count] <cr> e x b t o O l h <Tab> r
            let g:loaded_tabman = 0 " set 1 to disable plugin completely
            let g:tabman_toggle = '<leader>tm'
            let g:tabman_width = 25
            let g:tabman_side = 'left'
            let g:tabman_specials = 0 " show help and quickfix window created by plugin
            let g:tabman_number = 0 " disable line number in TabMan
        " }}}
    " }}}

    " [ REPL (Read-eval-print loop) ] {{{
	" vim-slime {{{ A vim plugin to give you some slime. (Emacs)
	    " Grab some text and "send" to GNU screen / tmux session.
	    "	VIM ---(text)---> screen / tmux
	    " Usage:
	    " [{Visual}]<C-c><C-c>
	    " :<range>SlimeSend
	    let g:slime_target = "tmux" " tmux/screen
	" }}}
    " }}}

    " [ tools ] {{{
        let g:TasksListTokens = ['FIXME', 'TODO', 'BUG', 'ISSUE', 'ERROR', 'XXX',]

        " TagmaTasks {{{
            " :TagmaTasks [*.pl|*|**/*], :TagmaTasksMarks
            " :TagmaTasksClear, :TagmaTasksToggle
            " \tt, \tc, \tm, \tw. => [t, ]t, [T, ]T.
            let g:TagmaTasksAutoUpdate = 1
            let g:TagmaTasksHeight = 10
            let g:TagmaTasksIdleUpdate = 0
            let g:TagmaTasksJumpTask = 1
            let g:TagmaTasksJumpKeys = 1
            let g:TagmaTasksMarks = 1
            let g:TagmaTasksOpen = 1
            let g:TagmaTasksPrefix = '<Leader>t'
            let g:TagmaTasksTokens = g:TasksListTokens
        " }}}
"AAA
        " TaskList {{{ \tl ( \t map conflict with CommandT.vim )
            map <Leader>tl <Plug>TaskList
            let g:tlWindowPosition = 1 " 1: bottom, 0: top.
            let g:tlRememberPosition = 1
            let g:tlTokenList = g:TasksListTokens
        " }}}

        " GrepTasks {{{ Grep for tasks and todo markers.
        " }}}

        " TaskMotions {{{ Motions to task and todo markers.
            " Require: CountJump
            " Usage:
            " ]t -- go to [count] next start of a task or todo marker.
            " [t -- .... previous start of ...
            let g:TaskMotions_Pattern = '\<TODO:'
            let g:TaskMotions_Mapping = 't'
        " }}}

        " endwise : end certain structures automatically. if, do, def ...

        " Rainbow_Parentheses_Improved {{{ show parentheses in different color
            " Usage: :RainbowToggle, rainbow#toggle()
            " au syntax * call rainbow#load([
            "             \ ['(',')'],['\[','\]'],['{','}'],
            "             \ ['begin','end'],
            "             \ ])
            " au syntax * call rainbow#activate()
        " }}}

        " switch {{{ swap a pattern and substition.
            " let g:switch_no_builtins
            nnoremap - :Switch<cr>
            let g:switch_definitions =
                        \ [
                            \ ['foo', 'bar', 'baz'],
                            \ ['是', '否'], ['男', '女'],
                        \ ]
                        " foo -> bar -> baz -> foo
            " let b:switch_definitions = [
            "                 \ {
            "                 \ }
            "             \ ]
        " }}}

        " SwapIt {{{ <C-A>, <C-X>
            " to integrate with other incrementor scripts (such as speeddating.vim)
            " to the keys that be invoked when swapit doesn't have a proper option
            nmap <Plug>SwapItFallbackIncrement <Plug>SpeedDatingUp
            nmap <Plug>SwapItFallbackDecrement <Plug>SpeedDatingDown
            " Multi word Swaps
            " Filetype Swaps
            " OmniCompletion Swaps
            let b:swap_completefunc = 'cssswapit#CssSwapComplete'
        " }}}

        " vim-cycle {{{ toggle words between pairs or lists of related words.
        " TODO
            " Usage:
            "   - <C-A> / <C-X> -- increment / decrement
            " Customization
            " * You can add your own word groups:
            " call AddCycleGroup(['one', 'two', 'three'])
            "
            " * To deal with conflicts, Cycle.vim also supports adding groups that
            "   are specific to a certain filetype:
            " call AddCycleGroup('ruby', ['class', 'module'])
            " call AddCycleGroup('python', ['else', 'elif'])
            "
            " * Providing a list of filetypes is also supported:
            " call AddCycleGroup(['ruby', 'eruby', 'perl'], ['else', 'elsif'])
            "
            " However, if there are no conflicting cases it is preferable to
            " define all cycle groups in the global namespace, using
            " filetype-specific groups only in case of conflict.
        " }}}

        " AuthorInfo {{{ Insert Author Info with :AuthorInfoDetect
            "noremap <Leader>ai <Esc>:AuthorInfoDetect<CR>
            let g:vimrc_author = 'stardiviner'
            let g:vimrc_email = 'numbchild@gmail.com'
            " let g:vimrc_homepage = ''
        " }}}

        " license-loader {{{ load a license template
            " Usage: :call LoadMyLicense('apache')
            " license template in template/license/*
            let g:T_AUTHOR = "stardiviner"
            let g:T_AUTHOR_EMAIL = "numbchild@gmail.com"
            let g:T_DATE_FORMAT = "%c"
        " }}}
    " }}}

    " [ project ] {{{ different settings for every projects
        " project.tar.gz {{{
        " TODO
        " }}}

        " vimprj {{{ managing options for different projects
        " }}}

        " vim-rooter {{{ Changes Vim working directory to project root
            " Usage:
            "   - <Leader>cd -- locate to root directory
            "   - :Rooter
            "   - <Plug>RooterChangeToRootDirectory
            " map <silent> <unique> <Leader>cd <Plug>RooterChangeToRootDirectory
            let g:rooter_patterns = [
                        \ '.git/', '.hg/', '.bzr/', '.svn/', '_darcs/',
                        \ 'Rakefile', 'Makefile',
                        \ ]
            let g:rooter_use_lcd = 1 " use :lcd to locally

            " easytags
            " TODO auto execute :UpdateTags (easytags) for projects if tags file
            " not exist.
            augroup RootEasyTags
                autocmd!
                " autocmd BufEnter *.rb,*.html,*.haml,*.erb,*.rjs,*.css,*.js :Rooter
            augroup END

            " TODO implement this in VimL
            " Recursively add directories from a project with *.h in them to user_options
            " au FileType c,cpp let g:clang_user_options = "-I" . system("find . -print0 -iname *.h | xargs -0 -r -n 1 dirname | grep -v .git | sort -u | sed ':a;N;$!ba;s/\n/ -I/g'")
        " }}}
    " }}}
" }}}

" [ languages ] {{{
    " [ VimL ] {{{
        " vesting {{{ best VimScript VimL test framework.
        " TODO
        " }}}

        " Vim-Support {{{ Vim Script IDE for Vim/gVim.
            " :h vimsupport.
        " }}}

        " runVimTests {{{ A testing framework for Vim.
        " }}}

        " Self {{{ Vim prototype object system.
        " }}}

        " vimple {{{ provides VimLOO (Object Oriented VimL) objects for write-only :ex commands
        " }}}
    " }}}

    " [ Ruby ] {{{
        let ruby_operators = 1 " highlight operations
        let ruby_space_errors = 1 " highlight space errors
        let ruby_fold = 1
        "let ruby_no_comment_fold = 1

        " vim-ruby {{{
            " :help vim-ruby.txt ft-ruby-syntax.txt ft-ruby-omni.txt
            " Usage:
                " Ruby motions
                " Ruby text objects
            " syntax
            let ruby_no_expensive = 1 " smart end color etc
            let ruby_minlines = 100
            let ruby_operators = 1 " highlight operators
            let ruby_space_errors = 0 " highlight whitespace erros
                " disable this, because use other script

            " omni completefunc rubycomplete#Complete() settings : CTRL-X CTRL-O
            let g:rubycomplete_buffer_loading = 1 " load/evaluate code to provide completions
            let g:rubycomplete_classes_in_global = 1 " parse buffer to complete classes, constants and globals
            let g:rubycomplete_rails = 1 " detect & load Rails env for files in Rails project

            " TODO where are those options from ??
            " let g:rubycomplete_include_object = 1
            " let g:rubycomplete_include_objectspace = 1
            " " Ruby completion will parse your buffer on demand in order to
            " " provide a list of completions.

            " autocmd FileType ruby compiler ruby
        " }}}

        " neco-rubymf {{{ a neocomplcache plugin to integrate methodfinder
            " Requires:
            "   - Ruby 1.9.3
            "   - gem install methodfinder
        " }}}

        " ri.vim {{{ Ruby documentation ri
            " lets you search and navigate Ruby library and gem documentation inside Vim
            " Advantages over the venerable ri command-line tool:
            " - write code and browse pertinent documentation in adjacent Vim windows
            " - search with autocompletion help
            " - hyperlinking lets you jump from definition to definition
            " - run back and forth through your jump history with CTRL-o and CTRL-i
            " - jump directly to gem READMEs and into the gem source directories
            " - directly open corresponding HTML-formatted rdoc documentation
            " Usage:
            " Invoking the plugin
            "	- <Leader>r
            "	    -- opens the search/autocomplete window, and will use a
            "	    horizontal split to display matching documentation.
            "	- <Leader>R
            "	    -- opens the search/autocomplete window, and will use a
            "	    vertical split to display matching documentatoin.
            "	- <Leader>K
            "	    -- opens the search/autocomplete window and prefills it with
            "	    the keyword under the cursor.
            "	- K
            "	    -- is automatically remapped to use ri.vim if the current
            "	    buffer is a *.rb file.
            " Using the search/autocomplete window
            "	With the search/autocomplete window open, start typing the name
            "	of the class, module, or method you want to lookup.
            " Press `TAB` to start autocompletion.
        " }}}

        " vim-rake {{{ it's like rails.vim without rails.
            " TODO :help rake
        " }}}

        " neco-rake {{{ A neocomplcache plugin for Rake on vimshell
        " TODO
        " }}}


        " vim-rvm {{{ switch Ruby versions from inside Vim
            " Usage:
            " - :Rvm 1.9.3
            " - :Rvm use default
            " * leave off the version
            "	- :Rvm
            "	- :Rvm use
            " - :Rvm install 1.9.3
            " - statusline
            "   %{rvm#statusline()}
            " If you really want to get crazy, you can make this happen
            " automatically as you switch from buffer to buffer.
            " autocmd BufEnter * Rvm
        " }}}

        " vim-bundler {{{ Lightweight support for Ruby's Bundler
            " Usage:
            " - :Bundle -- wraps 'bundle'
            " - :Bopen/Bsplit/Btabedit
        " }}}

        " vim-rails {{{ Ruby on Rails
            " easy file navigation, enhanced syntax highlighting, and more
	    " TODO `:help rails`
        " }}}

        " unite-rails {{{ a unite.vim plugin for Rails.
            " Usage: :Unite rails/???
        " }}}

        " RbREPL {{{ Rub a Ruby REPL in Vim.
        " }}}

        " rsense {{{
            " <C-x><C-u> after . and :: to start omni completion.
            " 1. Type Help
            "   You can infer types of an expression at point by
	    "   :RSenseTypeHelp.
            " 2. Definition Jump
            "   You can jump to definition of a method or a constant you are
            "   pointing at by
	    "   :RSenseJumpToDefinition.
            " 3. Where Is
            "   You can find which class/method you are editing by
            "   :RSenseWhereIs.
	    " other commands:
	    " :RSenseVersion
	    "	See RSense version.
	    " :RSenseOpenProject
	    "	Open a project of specified directory.
	    " :RSenseCloseProject
	    "	Close currently opened project.
	    " :RSenseServiceStart
	    "	Start Windows service.
	    " :RSenseServiceStop
	    "	STop Windows service.
	    " :RSenseServiceStatus
	    "	Show Windows service status.
	    " :RSenseClear
	    "	Clear current environment.
	    " :RSenseExit
	    "	Exit RSense server.
            let g:rsenseHome = $RSENSE_HOME
            let g:rsenseUseOmniFunc = 1 " start completion automatically
        " }}}

        " ruby-debugger {{{ debug Ruby App with ruby-debug-ide gem
            " TODO :help ruby_debugger.txt
        " }}}

        " ruby-refactoring {{{ Ruby Refactoring Tool for Vim
        " TODO https://www.relishapp.com/despo/vim-ruby-refactoring/docs
        " }}}

        " rake.vim {{{ it's like rails.vim without the rails
            " With rake.vim, you can use all those parts of rails.vim that you
            " wish you could use on your other Ruby projects on anything with a
            " Rakefile, including :R/:A, :Rlib and friends, and of course :Rake.
            " It's great when paired with gem open and bundle open and
            " complemented nicely by bundler.vim.
            " TODO
        " }}}

        " unite-gem {{{ A Unite plugin for RubyGems (search)
            " :Unite gem -input=
            " XXX very slow
        " }}}

        " rbrepl.vim {{{ allows you to run a Ruby REPL inside a VIM buffer.
            " Usage:
            " :RbREPLToggle
            " :RbREPLEvalFile
        " }}}

        " vim-rubytest {{{ run ruby test: vanilla test, rspec, ...
        " TODO
        " }}}

        " vim-vroom {{{ Ruby tests! Supports RSpec, Test::Unit/MiniTest, and Cucumber.
        " TODO
        " }}}

        " vimux-ruby-test {{{
        " TODO
        " }}}

        " vimux-cucumber {{{ Run Cucumber Features through Vimux plugin.
        " TODO
        " }}}

        " vim-ruby-conque {{{ display ruby, rake, and rspec output colorized in ConqueTerm
        " TODO
        " }}}

        " vim-textobj-rubyblock {{{ A custom text object for selecting ruby blocks.
        " TODO
        " }}}
    " }}}

    " [ regexp ] {{{ Regular Expression
        " VimRegEx {{{ Regular Expression Developer for Vim
            " Usage:
            " :Vimrex -- opens within the current vim session.
            " :VimRegEx -- starts a new vim.
        " }}}
    " }}}

    " [ Python ] {{{
        " if has('python3/dyn') || has('python/dyn')
        "             \ || has('python3') || has('python')
        " endif

        " [ IDE ] {{{
            " Python-mode-klen {{{ Python IDE.
                " K: doc <C-space>: Rope autocomp
                " <Leader>r: run <Leader>b: set/unset breakpoint.
                " pylint, rope, pydoc  :help Python-mode-contents Show documentation
                    " key <-> command {{{
                    " [[      jump on previous  class or function.
                    " ]]      jump on next class or function.
                    " [m      jump on previous class or method.
                    " ]m      jump on next class or method.
                    " ac      select a class. Ex: vac, dac, yac, cac.
                    " ic      select inner class. Ex: vic, dic, yic, cic.
                    " am      select a function or method. Ex: vam, dam, yam, cam.
                    " im      select inner function or method. Ex: vim, dim, yim, cim.
                    " }}}
                let g:pymode_doc = 1 " Load show documentation plugin
                let g:pymode_doc_key = 'K' " Key for show python documentation
                let g:pydoc = 'pydoc' " Executable command for documentation search
                " Run python code
                let g:pymode_run = 1 " Load run code plugin
                let g:pymode_run_key = '<LocalLeader>r' " Key for run python code
                " Pylint checking
                let g:pymode_lint = 1 " Load pylint code plugin
                let g:pymode_lint_checker = "pyflakes" " pylint, pyflakes or PEP8
                let g:pymode_lint_config = "$HOME/.pylintrc" " Pylint configuration file
                let g:pymode_lint_write = 1 " Check code every save
                let g:pymode_lint_cwindow = 1 " Auto open cwindow if errors be finded
                let g:pymode_lint_jump = 1 " Auto jump on first error
                let g:pymode_lint_signs = 1 " Place error signs
                let g:pymode_lint_minheight = 3 " Minimal height of pylint error window
                let g:pymode_lint_maxheight = 6 " Maximal height of pylint error window
                " Rope refactoring library
                let g:pymode_rope = 1 " Load rope plugin
                let g:pymode_rope_auto_project = 1 " Auto create and open ropeproject
                let g:pymode_rope_enable_autoimport = 1 " Enable autoimport
                let g:pymode_rope_autoimport_generate = 1 " Auto generate global cache
                let g:pymode_rope_autoimport_underlineds = 0
                let g:pymode_rope_codeassist_maxfixes = 10
                let g:pymode_rope_sorted_completions = 1
                let g:pymode_rope_extended_complete = 1
                let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]
                let g:pymode_rope_confirm_saving = 1
                let g:pymode_rope_global_prefix = "<C-x>p"
                let g:pymode_rope_local_prefix = "<C-c>r"
                let g:pymode_rope_vim_completion = 1 " use vim's complete function.
                let g:pymode_rope_guess_project = 0 " scan project slow completion speed
                let g:pymode_rope_goto_def_newwin = 1
                let g:pymode_rope_always_show_complete_menu = 1 " default=0
                " Other stuff
                let g:pymode_breakpoint = 1 " Load breakpoints plugin
                let g:pymode_breakpoint_key = '<LocalLeader>b' " set/unset breakpoint
                let g:pymode_utils_whitespaces = 1 " Autoremove unused whitespaces
                let g:pymode_options_indent = 1 " default pymode python indent options
                let g:pymode_options_fold = 1 " Set default pymode python fold options
                let g:pymode_options_other = 1 " Set default pymode python other options
                " utils
                let g:pymode_utils = 1 " utils script
                let g:pymode_utils_whitespaces = 1 " autoremove unused whitespaces
                " virtualenv
                let g:pymode_virtualenv = 1 " virtualenv support
                " syntax
                let g:pymode_syntax = 1 " use custom syntax highlighting
                let g:pymode_syntax_builtin_objs = 1
                let g:pymode_syntax_builtin_funcs = 1
                " indent
                let g:pymode_options_indent = 1
                " fold
                let g:pymode_options_fold = 1
                " others
                let g:pymode_options_other = 1
                " PyLintWindowToggle command
                " motion
                let g:pymode_motion = 1 " pymode enable some python motions.
            " }}}
        " }}}

        " [ complete ] {{{
            " pythoncomplete {{{ updated version of python omni completion
            " }}}
        " }}}

        " [ help ] {{{
            " pyref {{{ Python Language and Library reference, Django document.
                " Usage:
                " :PyRef [string]
                " misc/spider.py index file.
                let g:pyref_mapping = 'K'
                " package python2.6-doc document default in
                " /usr/share/doc/python2.6/html/
                " if you want another location document.
                let g:pyref_python = '/usr/share/doc/python3/html/'
                " package python-django-doc
                " let g:pyref_django = '/usr/share/doc/python-django-doc/html/'
                " let g:pyref_index =
            " }}}

            " pydoc.vim

            " py3stdlib : ~/.vim/doc/py3stdlib.txt
            " :help py3stdlib
        " }}}

        " [ debug ] {{{
            " pyflakes & pylint {{{ check when saving file.
            "function! Pyflakes()
                "let tmpfile = tempname()
                "execute "w" tmpfile
                "execute "set makeprg=(pyflakes\\ " . tmpfile . "\\\\\\|sed\\ s@" . tmpfile ."@%@)"
                "make
                "cw
            "endfunction
            "autocmd BufWrite *.{py} :call Pyflakes()

            "function! Pylint()
                "setlocal makeprg=(echo\ '[%]';\ pylint\ %)
                "setlocal efm=%+P[%f],%t:\ %#%l:%m
                "silent make
                "cwindow
            "endfunction
            "autocmd BufWrite *.{py} :call Pylint()
            " }}}

	    " pyflakes {{{ a faster smurfier pyflakes fork using _ast instead of compiler
        " NOTE has been merged into Syntastic
	    " }}}
        " }}}

        " [ test ] {{{
            " pytest.vim {{{ Runs your UnitTests with py.test displaying red/green bars and errors
            " TODO
            " }}}

            " vimux-pyutils {{{ run code blocks in IPython through vimux plugin
            " TODO
            " }}}
        " }}}

        " [ indent & syntax & fold ] {{{
            " SimpylFold
                " correct fold for python class/function indent.
                let g:SimpylFold_docstring_preview = 1

            " ~/.vim/syntax/python[3.0].vim {{{
                "    If you want all Python highlightings above:
                let g:python_highlight_all = 1
                "    (This option not override previously set options)
                ""    For highlight builtin functions:
                "let g:python_highlight_builtins = 1
                ""    For highlight builtin objects:
                "let g:python_highlight_builtin_objs = 1
                ""    For highlight builtin funtions:
                "let g:python_highlight_builtin_funcs = 1
                ""    For highlight standard exceptions:
                "let g:python_highlight_exceptions = 1
                ""    For highlight string formatting:
                "let g:python_highlight_string_formatting = 1
                ""    For highlight str.format syntax:
                "let g:python_highlight_string_format = 1
                ""    For highlight string.Template syntax:
                "let g:python_highlight_string_templates = 1
                ""    For highlight indentation errors:
                "let g:python_highlight_indent_errors = 1
                ""    For highlight trailing spaces:
                "let g:python_highlight_space_errors = 1
                ""    For highlight doc-tests:
                "let g:python_highlight_doctests = 1
                "    For fast machines:
                "       python_slow_sync
                " }}}

            " python_match.vim
                " %, g%, [%, ]%, d]%, v]%d,
                " cycle through:
                " if/elif/else, try/except/catch,
                " for/continue/break, while/continue/break,
        " }}}

        " [ virtualenv ] {{{
            " vim-virtualenv {{{ Python virtualenv for Vim.
                " Usage:
                " statusline: %{virtualenv#statusline()}
                " Commands:
                " :VirtualEnvList
                " :VirtualEnvDeactivate
                " :VirtualEnvActivate <Tab> [name]
                let g:virtualenv_directory = "~/.virtualenvs"
                let g:virtualenv_auto_activate = 1
                let g:virtualenv_stl_format = '[%n]'
            " }}}

            " vim-python-virtualenv {{{
            " }}}
        " }}}

        " [ other: open & jump, module ] {{{
            " Vimpy%3752 {{{ helps in Navigating through Python code easy.
                "<leader>om : Open Module. Go to a module with a given name.
                "<leader>oc : Open Class. Go to a class with a given name.
                "<leader>of : Open Function. Go to a funtion with a given name.
                "<leader>gm : Goto Module given by word under cursor (Eg. use
                "this to navigate to a module under an 'import' statement).
                "<leader>gc : Goto Class given by word under cursor.
                "<leader>gf : Goto Function given by word under cursor.
            " }}}

            " python_open_module : open the python module on cursor
                " FIXME cannot open module like from .module import text,
                " or from kk.jj import text.
                let g:pom_key_open='<LocalLeader>oo' " open module in the current window
                let g:pom_key_open_in_win='<LocalLeader>ow' " open module in a new window
                let g:pom_key_open_in_tab='<LocalLeader>ot' " open module in a tab
        " }}}

        " [ REPL ] {{{
            " vim-ipython {{{ A two-way integration between Vim and IPython
            " TODO
            " }}}

            " PyREPL.vim {{{ Provide a way to run python REPL inside buffer.
                " Usage: :PyREPLToogle or \r to toggle the REPL on or off.
            " }}}
        " }}}

        " others {{{
            " vim-cute-python : Unicode goodness for Python code by using vim's 'conceal' feature
        " }}}

        " [ Django ] {{{
            " vim-django-support {{{ Django omni completion.
            " }}}

            " vim-htmldjango_omnicomplete {{{ htmldjango ft OmniCompletion
                " Usage:
                "   Filters:
                "   {{ somevar|a<c-x><c-o>}} complete 'add', 'addslashes'
                "   Tags:
                "   {% cy<c-x><x-o> %} should complete 'cycle'
                "   Load Statements:
                "   It also should grab any libs you have {% load tag_lib %} in
                "   the file. Although it needs them in INSTALLED_APPS.
                "   {% load <c-x><c-o> %} will complete libraries (eg. 'cache',
                "   'humanize')
                "   Template Filenames:
                "   {% extends '<c-x><c-o>' %} will list base.html ... etc
                "   URL Complete:
                "   {% url <c-x><c-o> %} should complete views and named urls
                "   Super Block Complete:
                "   {% block c<c-x><c-o> %} to complete 'content' or something
                "   defined in an extended template.
                "   Optional Variable Name Completion: (placeholder)
                "   {{ s<c-x><x-o> }} will complete any maps defined in the
                "   python htmldjango_opts['variable'] dict list.
                au FileType htmldjango
                        \ set omnifunc=htmldjangocomplete#CompleteDjango
                let g:htmldjangocomplete_html_flavour = 'html5'
                    " html5,html401s,html401t,....
                " :verbose function htmlcomplete#CheckDoctype
                    " for DocType details
                " Testing:
                " django needs to be in sys.path along with
                " DJANGO_SETTINGS_MODULE in your environment.
                " :python import django
                " :python from django.conf import settings; print settings.INSTALLED_APPS
                " :python from django.conf import settings; print settings.TEMPLATE_DIRS
                " should show the apps template dirs you need.
            " }}}

            " vim-django {{{ Django vim wraps the manage.py.
                " Usage:
                "   - DjangoAdmin
                "   - DjangoManage
                "   - DjangoProjectActivate
                " let g:django_projects = "$HOME/Projects"
                " let g:django_apps =
            " }}}
        " }}}
    " }}}

    " [ Lisp ] {{{
        " Slimv {{{ Super Lisp Interaction Mode for Vim. ("SLIME for Vim")
        " }}}

        " paredit {{{ performs Structured Editing of Lisp S-expressions in Vim.
            " similar to paredit.el for Emacs.
            " paredit.vim is a part of Slimv.vim
            " let g:paredit_loaded = 0
            let g:paredit_electric_return = 0 " electric return feature
            " let g:paredit_leader = '\'
            let g:paredit_matchlines = 100
            let g:paredit_mode = 1
            let g:paredit_shortmaps = 1 " <, >, J, O, W, S.
        " }}}

        " Lisper {{{ Yet Another Lisp Engine Written In Pure VimScript
            " Usage:
            " - call lisper#eval() to evaluate expression.
            " - let engine = lisper#engine() ; echo engine.eval()
            " - Repl for Lisp -> :LisperRepl -> lisp>
        " }}}
    " }}}

    " [ Shell ] {{{
        " vim shell settings :
            let g:is_sh = 1 " default: Bourne shell.
            let g:sh_fold_enabled = 3 " 1: function, 2: heredoc, 4: if/do/for
            let sh_minlines = 200
            "let sh_maxlines = 100
            " iskeyword:
            "let g:sh_isk =
            "let g:sh_noisk = 1

        " bash-support {{{ Bash Support implements a bash-IDE for Vim/gVim.
        " }}}
    " }}}

    " [ SQL ] {{{
        " :h ft_sql.txt,
            let msql_sql_query = 1 " like SQL highlighting inside Strings.
            let msql_minlines = 200 " for syncing, minlines defaults to 100.
            let g:sql_type_default = 'mysql' " or 'sqlanywhere'

            " [ OmniCompletion SQL static/dynamic ] {{{ :help ft-sql-omni
                " [ static mode ] {{{
                " All, Statement, Functions, Keywords, Options, Types.
                let g:ftplugin_sql_omni_key = '<C-C>'
                imap <buffer> <C-C>a <C-\><C-O>:call sqlcomplete#Map('syntax')<CR><C-X><C-O>
                imap <buffer> <C-C>k <C-\><C-O>:call sqlcomplete#Map('sqlKeyword')<CR><C-X><C-O>
                imap <buffer> <C-C>f <C-\><C-O>:call sqlcomplete#Map('sqlFunction')<CR><C-X><C-O>
                imap <buffer> <C-C>o <C-\><C-O>:call sqlcomplete#Map('sqlOption')<CR><C-X><C-O>
                imap <buffer> <C-C>T <C-\><C-O>:call sqlcomplete#Map('sqlType')<CR><C-X><C-O>
                imap <buffer> <C-C>s <C-\><C-O>:call sqlcomplete#Map('sqlStatement')<CR><C-X><C-O>
                " }}}

                " [ dynamic mode ] {{{
                "       Table List, Procedure List, View List, Column List.
                " <C-C>     t           p               v       c
                " Require: dbext.vim
                    " Drilling In / Out: replace column <-> table when viewing popup window.
                let g:ftplugin_sql_omni_key_right = '<Right>'
                let g:ftplugin_sql_omni_key_left  = '<Left>'
                imap <buffer> <C-C>R <C-\><C-O>:call sqlcomplete#Map('ResetCache')<CR><C-X><C-O>
                " }}}

            " Completion Customization
            " let omni_sql_no_default_maps = 1
            let omni_sql_ignorecase = 1
            let omni_sql_include_owner = 1
            let omni_sql_precache_syntax_groups = ['syntax', 'sqlKeyword', 'sqlFunction', 'sqlOption', 'sqlType', 'sqlStatement']
            " }}}

        " Dbext {{{ enable Vim to access several databases
            " \sbp -- SQL Buffer Prompt.
            " \se  -- SQL Execute
            " \sel -- SQL Execute Line
            " Visual(V) -- linewise-visual to execute.
            " TODO
        " }}}

        " VDBI {{{ Database client for Vim: browsing, operation, view.
            " :VDBI
            " viewer keys: q, <cr>, <leader>s/d/y,
            " query editor keys: q, <leader>e/r.
            " Datasource Viewer keys: q, <cr>
            " TODO
        " }}}

        " SQLUtilities {{{ Formatting, generate - columns lists, procedures for databases
            " automatically captilize all SQL keywords and statements.
        " }}}
    " }}}

    " [ NoSQL ] {{{
        " nosql.vim {{{ syntax for NoSQL tables, or any tab-separated (TSV) tables
        " }}}
    " }}}

    " [ R ] {{{
        " Vim-R-plugin {{{ Plugin to work with R
            " TODO make plugin auto generate and update R tags.
            " add this into easytags.
            " XXX :help r-plugin.txt
            " Features:
            "   - Communication with R.
            "   - Omni completion (auto-completion) for R objects.
            "   - Ability to see R's documentation in a Vim's buffer.
            "   - Object Browser.
            "   - Syntax highlighting for R and RHelp code.
            "   - Smart indentation for R and RHelp syntax.
            "   - Most of the plugin's behavior is customizable.
            " INSTALL:
            " $ R
            "   > install.packages(c('colorout', 'vimcom', 'setwidth'))
            " Usage:
            "   - <LocalLeader>rf -- start vim-R-plugin R, can send commands to R
            "   - <LocalLeader>rq -- close (q: quit)
            "   - <LocalLeader>rh -- help (h: help)
            "   - <LocalLeader>ro -- update the Object Browser.
            "   - <LocalLeader>rp -- Print (cur) vim.print() (p: print)
            "   - <LocalLeader>aa -- send File (a: all)
            "   - <LocalLeader>ao -- send File (open .Rout) (a: all)
            "   - <LocalLeader>bb -- send Block (cur) (b: block)
            "   - <LocalLeader>cc -- send Chunk (cur) (c: chunk)
            "   - <LocalLeader>ff -- send Function (cur) (f: function)
            "   - <LocalLeader>ss -- send Selection (s: selection)
            "   - <LocalLeader>pp -- send Paragraph (p: paragraph)
            "   - <LocalLeader>l  -- send Line (l: line)
            "   - :RUpdateObjectList
            "       -- start R and update objects for omni completion and syntax highlighting
            "   - :Rhelp topic  -- help. <Tab> to complete R objects names. <C-D> to list
            "   - :RAddLibToList [[lib1] [lib2]] -- add the objects of libraries.
            "   - :RSourceDir   -- source all .R files in a directory.
            "   - :RBuildTags   -- build tags file
            "   - <Plug>RStart  -- \rf to start R
            "   - <Plug>RDSendSelection     -- send visual selected
            "   - <Plug>RDSendLine          -- send current line
            "   Edit:
            "       _           -- type '_' auto insert ' <- ',
            "                      press '_' again to insert '_' literally.
            "       <C-x><C-o>  -- complete object name
            "       <C-x><C-a>  -- complete function arguments
            "       gn          -- go (next R chunk)
            "       gN          -- go (previous R chunk)
            let vimrplugin_term = "rxvt"
            " let vimrplugin_term_cmd = 'urxvt --title R -e'
            let vimrplugin_assign = 1 " auto convert '_' to ' <- '
            " let vimrplugin_assign_map = "<M-->" " map key to convert into ' <- '
            let vimrplugin_rnowebchunk = 1 " auto change < to <<>>=\n@
            let vimrplugin_objbr_w = 40 " Object Browser default width
            let vimrplugin_objbr_place = "console,left" " Object Browser split position
                " 'script'/'console', 'right'/'left'
            let vimrplugin_external_ob = 1 " in case R running in external terminal emulator
            let vimrplugin_vimpager = "horizontal" " see R doc in vim's buffer as a pager
                " 'tab'/'vertical'/'horizontal'/'tabnew'/'no'
            let vimrplugin_editor_w = 80 " min window width
            let vimrplugin_editor_h = 30 " min window height
            " without screen.vim
                " let vimrplugin_nosingler = 0
                    " 0: all buffers of Vim instances send code to 'same' R process.
                    " 1: each vim buffer uses its own R process.
                " let vimrplugin_by_vim_instance = 0
            " with screen.vim
            " behaves as if the vimrplugin_by_vim_instance was enabled.
            let vimrplugin_i386 = 1 " use 23 bit version of R
            " let vimrplugin_r_path = "/path/to/R/version/bin"
            " let vimrplugin_r_args = "--sdi --no-save --quiet" " default args for Windows
                " On Linux, there is no default value for vimrplugin_r_args
            let vimrplugin_buildwait = 240 " time to build the list of objects
            let vimrplugin_routmorecolors = 1 " color .Rout file
            let vimrplugin_routnotab = 1 " prefer open .Rout in split instead of tab
            let vimrplugin_indent_commented = 0
            let vimrplugin_sleeptime = 0.2 " time of R to process the paste command
            let vimrplugin_notmuxconf = 0 " whether use tmux config file
            if winwidth(0) > 120
                let vimrplugin_screenvsplit = 1 " prefer split tmux vertically
            else
                let vimrplugin_screenvsplit = 0 " tmux horizontal split
            endif
            let g:ScreenImpl = 'Tmux'
            " let g:ScreenShellWidth = 80 " R console width
            let vimrplugin_tmux = 1 " 1: prefer use tmux
            " let vimrplugin_only_in_tmux = 1
            let vimrplugin_screenplugin = 1 " integrate screen.vim plugin
            let vimrplugin_listmethods = 1 " args() lists the arguments of a function
            let vimrplugin_specialplot = 1
            let vimrplugin_latexcmd = "pdflatex" " build PDF from .tex, pdflatex/latex
            let vimrplugin_never_unmake_menu = 0 " always keep R menu and bar
            let vimrplugin_map_r = 0
            let vimrplugin_openpdf = 1 " auto open PDF after process Rnoweb file
            let vimrplugin_openpdf_quietly = 1 " disable open PDF verbose
            let vimrplugin_openhtml = 1 " auto open HTML after process .Rmd file
            let vimrplugin_strict_rst = 1 " strict rst
            let g:vimrplugin_insert_mode_cmds = 0 " disable insert mode R commands
            let g:vimrplugin_allnames = 1 " also show hidden objects
            let g:vimrplugin_rmhidden = 1 " remove hidden objects
            let r_indent_align_args = 1 " auto align multi lines of function arguments
            let r_indent_ess_comments = 0 " like Emacs/ESS
            let r_indent_comment_column = 40
            let r_indent_ess_compatible = 0 " not Emacs/ESS compatiable
            let r_syntax_folding = 1 " R folding
            " let vimrplugin_pandoc_args = "--toc -V lang=german"
            let g:rmd_syn_hl_chunk = 1
            let g:rrst_syn_hl_chunk = 1

            vnoremap K <Esc>:call RAction("help")<CR>
            nnoremap K :call RAction("help")<CR>
            vnoremap <Space> <Plug>RDSendSelection
            nnoremap <Space> <Plug>RDSendLine
            " run Makefile within R to build
            nnoremap <LocalLeader>sm :update<CR>:call SendCmdToR('system("make")')<CR>
        " }}}

        " R.vim {{{
        " }}}

        " GNU-R {{{
        " }}}

        " rcom : Evaluate R code via rcom, rserve, screen, or tmux

    " }}}

    " [ Web: HTML5 & CSS, XML ] {{{
        " [ HTML5 ] {{{
            " ZenCoding {{{ powerful abbreviation engine. "<C-Y>[,vn...]"
                " Usage: :verbose map <c-y>  --> to show all ZenCoding mappings.
                let g:user_zen_leader_key = '<c-y>' " prefix.
                " define tag's behavior.
                let g:user_zen_settings = {
                            \ 'lang': 'en',
                            \ 'html': {
                            \       'filters': 'html',
                            \       'indentation': ' ',
                            \   },
                            \  'php' : {
                            \    'extends' : 'html',
                            \    'filters' : 'html,c',
                            \   },
                            \  'css' : {
                            \    'filters' : 'fc',
                            \   },
                            \  'javascript' : {
                            \    'snippets' : {
                            \      'jq' : "$(function() {\n\t${cursor}${child}\n});",
                            \      'jq:each' : "$.each(arr, function(index, item)\n\t${child}\n});",
                            \      'fn' : "(function() {\n\t${cursor}\n})();",
                            \      'tm' : "setTimeout(function() {\n\t${cursor}\n}, 100);",
                            \       },
                            \   },
                            \ }
                let g:use_zen_complete_tag = 1 " complete tags with omnifunc.
            " }}}

            " Sparkup {{{ Sparkup lets you write HTML code faster.
		let g:sparkupExecuteMapping = '<c-e>' " expand/execute sparkup
		let g:sparkupNextMapping = '<c-n>' " jump to next empty tag/attribute
            " }}}

            " html5 {{{ HTML5 omnifunc and syntax for Vim.
                " based on the default htmlcomplete.vim.
                " Features:
                "   - Support all new elements and attributes.
                "   - Support microdata
                "   - Support RDFa.
                "   - Support WAI-ARIA.
                " TODO learn upper features reference can find link in script readme.
                " enable event-handler attributes support:
                let g:html5_event_handler_attributes_complete = 1
                " enable RDFa attributes support:
                let g:html5_rdfa_attributes_complete = 1
                " enable microdata attributes support:
                let g:html5_microdata_attributes_complete = 1
                " enable WAI-ARIA attribute support:
                let g:html5_aria_attributes_complete = 1
            " }}}

            " MatchTag

            " HTML_AutoCloseTag

            " vim-ragtag {{{ ghetto HTML/XML mappings
                " TODO
            " }}}
        " }}}

        " [ CSS ] {{{
            " ~/.vim/after/syntax/css3.vim
            " au BufRead,BufNewFile *.css setlocal ft=css syntax=css3

            " Better_CSS_Syntax_for_Vim {{{
                " Highlights for full CSS2, most of HTML5 & CSS3 properties (include prefix like -moz-).
                " 1. Support most of HTML & CSS properties, including HTML5 & CSS3.
                " 2. Different highlight colors for properties, value, units and so on.
            " }}}

            " vim-css3-syntax : Add CSS3 syntax support to vim's built-in syntax/css.vim
            " TODO https://github.com/hail2u/vim-css3-syntax

            " vim-css-color : highlight colors

            " css3_mod

            " vim-haml :

            " vim_less {{{ support for LESS CSS.
                " syntax highlight
                " indent support
                " compile the file.less to file.css if you have lessc installed
                " and echo any errors.
            " }}}

            " vim-less : syntax support for LESS CSS.
        " }}}

        " [ XML ] {{{
            " xmledit {{{ A filetype plugin for VIM to help edit XML files
            " TODO
            " }}}

            " xmlwf : A compiler plugin for the xmlwf xml well-formedness checker
        " }}}
    " }}}

    " [ CoffeeScript ] {{{
        " vim-coffee-script {{{ CoffeeScript support for Vim.
            " Features:
            " syntax, indenting, compiling.
            " included eco syntax, support for CoffeeScript in Haml and HTML.
            " Usage:
            "   - :CoffeeMake[!] {options} -- :make
            "   - :[range]CoffeeCompile [vertical] [{win-size}]
            "       -- show how the current file or [range] is compiled to
            "       JavaScript. close with "q"
            "   - :[range]CoffeeLint[!] {options} -- run coffeelint
            "   - :[range]CoffeeRun -- compiles file and run resulting JavaScript
            let g:coffee_compiler = '/usr/bin/coffee'
            let g:coffee_make_options = '--bare'
            let g:coffee_compile_vert = 1 " split CoffeeCompile buffer vertically
            let g:coffee_linter = '/usr/bin/coffeelint'
            let g:coffee_lint_options = '-f lint.json'

            " TODO change to command :CoffeeRun
            au FileType coffee nnoremap <F5> :CoffeeCompile<cr>
            au FileType coffee vnoremap <F5> <esc>:'<,'>:CoffeeCompile<CR>
            " Stack Tracks
            " :C{line number} takes you to the given line number in the
            " compiled Javascript of the CoffeeScript file you are editing.
            command! -nargs=1 C CoffeeCompile | :<args>
        " }}}

        " CoffeeTags {{{ Ctags-like tag generator for CoffeeScript
        " TODO https://github.com/lukaszkorecki/CoffeeTags
        " }}}
    " }}}

    " [ JavaScript ] {{{
        " vim-javascript {{{ provides syntax and indent plugins.
            " - very correct indentation for javascript
            " - support javascript indentation in html
        " }}}

        " vim-javascript-syntax {{{ Enhanced Javascript Syntax for Vim
            au FileType javascript call JavaScriptFold()
        " }}}

        " jscomplete-vim {{{ vim omnifunc for JavaScript
            " [Optional extensions]
            " extension scripts under the 'autoload/js/' will be loaded with set
            " list to 'g:jscomplete_use' or 'b:jscomplete_use' in ~/.vimrc
            " dom: adding DOM keywords completion.
            " moz: Mozilla JavaScript keywords.
            " xpcom: Mozilla XPCOM component keywords.
            " es6th: ECMAScript keywords.
            let g:jscomplete_use = ['dom', 'moz', 'xpcom', 'es6th',]
            " :JSCompleteUse for loading jscomplete's extensions.
            " :JSCompleteUse [<pluginName>, ...]
            " show loaded and non-loaded extensions if omitted arguments
            "   + => loaded extensions.
            "   - => non-loaded extensions.
        " }}}

        " jshint.vim : Vim plugin and command line tool for running JSLint.
            " :JSLintUpdate
            " TODO
            let g:JSLintHighlightErrorLine = 1

        " jshint.vim : A plugin that integrates JSHint with Vim

        " jsflakes%4057 {{{ powerful vim plugin lint javascript code on the fly.
            " Require: jsruntime, jsoncodecs.
            " :cl, clopen
            " :RunJS, :RunJS 1,2 -> run js from line 1 to line 2.
            " :RunHtml, :RunHtmlBlock 1,2
            "let g:jshint_rcfile = {PATH}
        " }}}

        " jsruntime {{{ javascript runtime library in vim.
            " Interpreter: PyV8, node, cscript, spiderMonkey.
            " let g:js_interpreter = 'pyv8'
        " }}}

        " jsoncodecs {{{ Dumps lines from vim to a valid JSON string.
        " }}}

        " jsbeautify : a javascript source code formatter
            " <Leader>ff -- Function g:Jsbeautify()
        " sourcebeautify : Beautify your source code, js, css, html.

        " javaScriptLint: Displays JavaScript Lint warnings in quickfix window

        " [ jQuery ] {{{
            " vim-jquery : Vim syntax file to add some colorations for jQuery keywords and css selectors.

            " jQuery : Syntax file for jQuery.
                au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
        " }}}
    " }}}

    " [ Dart ] {{{
        " Dart : Dart Lang Syntax for Vim.
    " }}}

    " [ Web App ] {{{
        " vim-brunch {{{ makes navigating your brunch projects comfortable
            " Brunch -> https://github.com/brunch/brunch.git
            " is a lightweight approach to building HTML5 applications
            " with emphasis on elegance and simplicity.
            let g:brunch_path_app = 'app' " the dir of the app folder.
            let g:brunch_path_test = 'test' " the dir of the test folder.
            let g:brunch_ext_script = 'js' " the extension for script files
            let g:brunch_ext_stylesheet = 'less' " the extension for stylesheets
            let g:brunch_ext_template = 'hbs' " the extension for templates
        " }}}
    " }}}

    " [ PHP ] {{{
        let php_sql_query = 1 " highlight SQL syntax in strings.
        let php_baselib = 1 " highlight Baselib methods.
        let php_htmlInStrings = 1 " HTML syntax highlight inside strings.
        let php_oldStyle = 1 " use the old colorstyle.
        let php_asp_tags = 1 " enable highlight ASP-style short tags.
        let php_noShortTags = 1 " disable short tags
        let php_parent_error_close = 1 " highlight parent error ] or )
        let php_parent_error_open = 1 " skip php end tag, if exists, open (, [
        let php_folding = 1 " folding for classes and functions.
        let php_sync_method = -1 " selecting syncing method. -1/0/>0

        " [ completion ] {{{
            " phpcomplete {{{ Improved PHP omnicompletion.
            " }}}
        " }}}

        " [ debugger ] {{{
            " DBGPavim {{{ enable PHP debug in vim with Xdebug.
                " Requires:
                "       - install xdebug for PHP.
                "       - and edit php.ini file.
                "           - zend_extension=path_to_xdebug.so
                "           - xdebug.remote_enable=1
                "       - edit apache config file.
                "           - php_value xdebug.remote_port 9009
                " Usage:
                " :Bl/:Bp => list all breakpoints, toggle breakpoint on current line.
                " - <F1>    => toggle help window.
                " - <F2>    => step into.
                " - <F3>    => step over
                " - <F4>    => step out
                " - <F5>    => start debugger backend.
                " - <F6>    => stop debugger backend.
                " - <F7>    => evalute expression and display result.
                " - <F9>    => toggle layout.
                " - <F11>   => show all variables.
                " - <F12>   => show variable on current cursor.
                " :Pg       => to print value of complex variables like $this->savings[3]
                " :Up       => goto upper level of stack
                " :Dn       => goto lower level of stack
                let g:dbgPavimBreakAtEntry = 0
                "let g:dbgPavimPathMap = [['D:/works/php','/var/www'],]
                let g:dbgPavimPort = 9009
            " }}}

            " Xdebug {{{ An awesome debugging client for Vim, Xdebug and PHP.
                " This is YET another version of the DBGP client script that
                " Seung Woo Shin created The reason I've added this as a new
                " script is because I've added enough new features to warrant
                " it.
            " }}}

            " vim-addon-xdebug  {{{
                " :XDbgStart
            " }}}
        " }}}

        " [ syntax checker ] {{{
            " phpqa {{{ Run PHP QA tools and show highlighted results.
                " This is a plugin for Vim that integrates PHP quality checking
                " tools, to allow you to code to a particular standard and
                " easily spot errors and violations.
            " }}}
            " PHPUnit_QF : Run PHPUnit tests from within vim and put the errors
            " into the quickfix list.
        " }}}

        " [ Integration ] {{{
            " PIV {{{ PHP Integration for Vim.
                " Usage:
                "   - K --> doc
            " }}}

            " pdv-standalone {{{ standalone version of phpDocumentor for Vim plugin.
                let g:pdv_cfg_Package = 'placeholder'
                let g:pdv_cfg_Version = '1.0.0'
                let g:pdv_cfg_Author = 'stardiviner <numbchild@gmail.com>'
                "let g:pdv_cfg_Copyright =
                "let g:pdv_cfg_License =
                let g:pdv_cfg_ReturnVal = "void"
                let g:pdv_cfg_Type = "mixed"
                let g:pdv_cfg_Uses = 0
                let g:pdv_cfg_paste = 1 " set paste before documenting
                let g:pdv_cfg_php4always = 0
                let g:pdv_cfg_php4guess = 1
                let g:pdv_cfg_php4guessval = "protected"
                let g:pdv_cfg_CommentHead = "/**"
                let g:pdv_cfg_Comment1 = " * "
                let g:pdv_cfg_Commentn = " * "
                let g:pdv_cfg_CommentTail = " */"
                let g:pdv_cfg_CommentSingle = "//"

                nnoremap <K> :call PhpDocSingle()<CR>
                vnoremap <K> :call PhpDocRange()<CR>
            " }}}
        " }}}

        " [ Framework ] {{{
            " cakephp {{{ navigating, managing CakePHP applications with Vim
            " }}}
            " cake {{{ easy jumping between Controller, Model and View files
                " Usage:
                " specified the app directory of your CakePHP.
                " :CakePHP /path/to/cakephp_app/
                " Automatically perform at startup.
                let g:cakephp_enable_fix_mode = 1
                let g:cakephp_app = "/path/to/cakephp_app/"
                " When you find a project from open file automatically,
                " please set it as follows.
                let g:cakephp_enable_auto_mode = 1
            " }}}
        " }}}

        " [ Framework ] {{{
            " [ Drupal ] {{{
                " Drupal {{{ someone's Drupal work Vim settings, use Drush.
                    " Usage:
                    "  - :Hook -> Implement the named hook, where the cursor is.
                    "  - :EditDrupal
                    "  - :ResetVimDrupalCache
                " }}}
            " }}}

            " [ behat ] {{{
                " vim-behat
            " }}}
        " }}}
    " }}}

    " [ Go ] {{{
        " gocode {{{ autocompletion daemon for Go Language
            " Features: Context-sensitive autocompletion
        " }}}

        " vim-golang {{{ Go lang runtime vim scripts.
        " }}}
    " }}}

    " [ C & C++ ] {{{
        augroup CSettings
            au!
            au FileType c,cpp setlocal cindent
            au FileType c,cpp,java set matchpairs+==:;
        augroup END

        " clang_complete {{{ use of clang to complete in C/C++.
            " :h clang_complete.txt
            let g:clang_auto_select = 0 " 0/1/2 auto select first entry in popup menu
            " disable with 0 to solve neocomplcache problem
            let g:clang_complete_auto = 1 " auto complete after -> . ::
            let g:clang_complete_copen = 1 " 1: open quickfix window on error
            let g:clang_hl_errors = 1 " highlight warnings and errors
            let g:clang_periodic_quickfix = 0 " periodically update quickfix
                " you can use g:ClangUpdateQuickFix() with a mapping to do this
            let g:clang_snippets = 1
            " clang_complete, snipmate, ultisnips
            let g:clang_snippets_engine = "ultisnips"
            let g:clang_conceal_snippets = 1
            let g:clang_trailing_placeholder = 0 " for clang_complete snippet engine
            let g:clang_close_preview = 0 " auto close preview window after completion
            let g:clang_exec = "clang" " name or path of clang executable.
            let g:clang_user_options =
                        \ '-std=gnu99' .
                        \ '-stdlib=libc' .
                        \ '-I /usr/include'
            " let g:clang_user_options = '-std=gnu++0x -include malloc.h -fms-extensions -fgnu-runtime'
            " let g:clang_user_options = '-std=c++11 -stdlib=libc++'
            let g:clang_auto_user_options = "path, .clang_complete, clang"
            let g:clang_use_library = 1
            let g:clang_library_path = "/usr/lib/"
            let g:clang_sort_algo = "priority"
            let g:clang_complete_macros = 1
            let g:clang_complete_patterns = 1
        " }}}

        " neocomplcache-clang {{{ clang_complete for neocomplcache.
            " Require: clang_complete
                " clang.so, clang.dll, libclang.dylib
            let g:neocomplcache_clang_use_library = 1 " use clang library
            let g:neocomplcache_clang_library_path = '/usr/lib/'
            let g:neocomplcache_clang_executable_path = '/usr/bin/clang'
            let g:neocomplcache_clang_macros = 1 " -code-completion-macros option
            let g:neocomplcache_clang_patterns = 1 " -code-completion-patterns option
            let g:neocomplcache_clang_auto_options = "path, .clang_complete, clang"
            let g:neocomplcache_clang_user_options = '-std=gnu99 -stdlib=libc'
            " let g:neocomplcache_clang_user_options = '-std=c++11 -stdlib=libc++'
            let g:neocomplcache_clang_debug = 0 " enable debug message.
        " }}}

        " OmniCppComplete {{{ C/C++ omni-completion with ctags database
        " TODO
        " }}}

        " inccomplete {{{ Vim plugin for #include directive completion
            let g:inccomplete_addclosebracket = "always"
            let g:inccomplete_sort = "ignorecase"
            let g:inccomplete_showdirs = 1
            let g:inccomplete_appendslash = 0 " append slash to directory name
        " }}}

        " c.vim {{{ C/C++ IDE
        " }}}
    " }}}

    " [ Clojure ] {{{
        " VimClojure {{{ A filetype, syntax and indent plugin for Clojure
            " Features:
            " contains a filetype, a syntax and an indent plugin
            " * docstring lookup
            " * javadoc lookup
            " * repl in a vim buffer
            " * omni completion
        " }}}
    " }}}

    " [ Haskell ] {{{
        let hs_highlight_delimiters = 1
        let hs_highlight_boolean = 1
        let hs_highlight_types = 1
        let hs_highlight_more_types = 1
        let hs_highlight_debug = 1
        let hs_allow_hash_operator = 1
        "let lhs_markup = tex " tex/none

        " neco-ghc {{{ neocomplcache complete for Haskell.
	    " omnifunc=necoghc#omnifunc
	    " au Filetype haskell setlocal omnifunc=necoghc#omnifunc
        " }}}

        " ghcmod-vim {{{
        " Features
        " - Displaying the type of sub-expressions (ghc-mod type)
        " - Displaying error/warning messages and their locations (ghc-mod check and ghc-mod lint)
        " - Displaying the expansion of splices (ghc-mod expand)
        " }}}
    " }}}

    " [ Perl ] {{{
        " perlomni {{{ perl omnicompletion for vim (including base class function compleltions .etc)
        " }}}
    " }}}

    " [ Lua ] {{{
        "let lua_version = 4 " activate Lua 4.0 syntax highlight
        let lua_version = 5 " activate Lua 5.0 syntax highlight
            " to restore highlighting for Lua 5.1:
            "let lua_version = 5
            "let lua_subversion = 1

        " lua {{{ Lua filetype plugin for Vim
            " let g:lua_path =
            let g:lua_check_syntax= 1
            let g:lua_check_globals = 1
            let g:lua_compiler_name = 'luac' " luac, lualint
            let g:lua_compiler_args = '-p'
            " let g:lua_error_format =
            let g:lua_complete_globals = 1
            let g:lua_complete_library = 1
            let g:lua_complete_dynamic = 1
            let g:lua_complete_omni = 0 " have unintended consequences and slow
        " }}}

        " lua_omni {{{ omni completion function for Lua.
            " It works by scanning _G and parsing Vim buffers.
            " CTRL-X CTRL-O,
            " :help lua_omni
            let b:lua_inner_folds = 1
            " To regenerate folds use the zx or zX normal commands.
        " }}}

        " luarefvim {{{ Lua reference manual
        " }}}

        " luainspect {{{ Semantic highlighting for Lua in Vim.
            " Usage:
            "   - :LuaInspect, :LuaInspectToggle.
            "let g:lua_inspect_events = 'CursorHold,CursorHoldI,BufReadPost,BufWritePost'
            let g:lua_inspect_warnings = 1 " 0: do not show warnings.
            let g:lua_inspect_internal = 1
        " }}}
    " }}}

    " [ Erlang ] {{{
        "let erlang_keywords = 1 " to disable keywords highlighting.
        "let erlang_functions = 1
        "let erlang_characters = 1
    " }}}

    " [ Java ] {{{
        let java_highlight_java_lang_ids=1 " highlight Identifiers in java.lang.*

	" javacomplete
	" http://www.vim.org/scripts/script.php?script_id=1785

	" Vim JDE : Vim - Just a Development Envirement (Java/C++)
	" http://www.vim.org/scripts/script.php?script_id=1213
    " }}}

    " [ Sed ] {{{
        let highlight_sedtabs = 1 " make tabs stand out from regular blanks
    " }}}

    " [ Rust ] {{{
    " }}}

    " [ Assembly ] {{{
        " files syntax
            "asm		GNU assembly (the default)
            "asm68k		Motorola 680x0 assembly
            "asmh8300	Hitachi H-8300 version of GNU assembly
            "ia64		Intel Itanium 64
            "fasm		Flat assembly (http://flatassembler.net)
            "masm		Microsoft assembly (probably works for any 80x86)
            "nasm		Netwide assembly
            "tasm		Turbo Assembly (with opcodes 80x86 up to Pentium, and MMX)
            "pic		PIC assembly (currently for PIC16F84)
        let filetype_i = "asm" " files matching *.i could be Progress or Assembly.
        " let b:asmsyntax = "nasm"
        " let asmsyntax = "nasm"

        " vim-dasm {{{ vim syntax highlighting for dasm & dasm16
            au BufNewFile,BufReadPost *.dasm,*.dasm16 setl shiftwidth=2 expandtab
        " }}}
    " }}}

    " [ TeX ] {{{
    " }}}

    " [ Markdown ] {{{
        " vim-markdown {{{ Vim Markdown runtime files
        " }}}

        " vim-instant-markdown {{{ Instant Markdown previews from Vim
        " TODO
        " }}}

        " vim-preview {{{ preview markup files (markdown,rdoc,textile,html)
        " TODO
        " }}}

        " riv {{{ Reading , Writing and Managing reStructuredText documents in Vim
        " }}}

        " Vimdown {{{ A dirty tool to convert .vimrc and .vim script files to markdown
        " TODO
        " }}}
    " }}}

    " [ binary, hex ] {{{
        " hexript {{{ write a binary easily, and it is a code writing on free-format.
            " Require:
            "   - `xxd` program
            "   - vimproc
            "   - quickrun (optional)
            "   - vinarise (optional)
            " TODO
        " }}}

        " afterimage.vim {{{
            " Edit ICO, PNG, and GIF icons. No really. They're converted with
            " ImageMagick to XPM, a plain text image format with beautiful
            " syntax highlighting in GUI versions of Vim. Here, it's easier just
            " to show you:
	    " Oh, and it can also handle PDFs (with pdftk), Word Documents
	    " (read-only, with Antiword), and Mac OS X plist files.
        " }}}

        " vinarise {{{ Ultimate hex editing system with Vim
        " }}}
    " }}}

    " [ XQuery ] {{{
        " XQuery-indentomnicompleteftplugin {{{ indent/omnicomplete/ftplugin
        " }}}

        " vim-xqmarklogic {{{ ftplugin to run an xquery against a MarkLogic server
        " }}}
    " }}}
" }}}

" [ Android ] {{{
    " Eclim {{{ bring Eclipse functionality to Vim support various languages
        " code complete: <C-X><C-U>
        " :Validate/:w to check syntax error.
    " }}}
" }}}

" [ Vim Extension ] {{{
    " [ plugins ] {{{
        " tplugin  {{{
        " }}}

        " Sauce  {{{ Dynamic vimrc manager for load different envirements.
            " a manager for multiple vimrc files, which can be used to
            " load different settings for different environments.
            " ---------------------
            " Usage:
            "   - :Sauce <name> -- Load a sauce
            "   - :SauceNew <name> -- create a new sauce.
            "   - :SauceEdit <name> -- Edit an existing sauce.
            "   - :SauceCopy <name>
            "   - :sauceDelete <name>
            " This can be used as a simple project organiser tool.
            " e.g. Load the MyProject sauce: :Sauce MyProject
            let g:sauce_path = "~/.vimsauce"
        " }}}

        " VimLint {{{ a correctness and sanity checker of Vim configuration
            " Usage: :VimLint
        " }}}

        " startup_profile_vim {{{ profile vim startup
            " Usage: insert this line at top of .vimrc file.
            " runtime macros/startup_profile.vim
        " }}}
    " }}}

    " [ Vim envirement ] {{{
        " vimproc {{{ a great asynchronous execution library for Vim.
        " }}}

        " vim-shell {{{ Improved integration between Vim and its environment
            " This plug-in aims to improve the integration between Vim and its
            " environment by providing functions to switch to full-screen
        " }}}
    " }}}

"AAA

    " [ completion ] {{{
        " unite.vim {{{ Ultimate interface to unite all sources
            " Usage:
            "   - :Unite [{options}] {source's'}
            "       - {source's'}
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

            let g:unite_update_time = 500 " update time interval of candidates
            let g:unite_enable_start_insert = 1 " startup into insert mode
            let g:unite_split_rule = "topleft"
            let g:unite_enable_split_vertically = 0 " 1:split unite window vertically
            let g:unite_winheight = 15
            let g:unite_winwidth = 50
            let g:unite_kind_openable_cd_command = "cd"
            let g:unite_kind_openable_lcd_command = "lcd"
            let g:unite_cursor_line_highlight = "PmenuSel"
            let g:unite_abbr_highlight = "Normal"
            let g:unite_enable_use_short_source_names = 0
            " let g:unite_quick_match_table = {}
            let g:unite_data_directory = expand('~/.unite')
            " let g:unite_no_default_keymappings = 1 " don't map default key mappings
        " }}}

        " CompleteHelper {{{ Generic functions to support custom insert mode completions
            " Externals:
            " - CamelCaseComplete
            " - MotionComplete
            "   - BracketComplete
            "   - LineEndComplete
            " - PatternComplete
            " - PrevInsertComplete
            " - SameFiletypeComplete
        " }}}

        " querycommandcomplete {{{ completions from an external query command
            " External command that queries for contacts If empty,
                " TODO for other external command tools.

            " QueryCommandComplete tries to guess what command to run by
            " executing `mutt -Q query_command`
            let g:qcc_query_command = 'abook'
            au BufRead /tmp/mutt* setlocal omnifunc=QueryCommandComplete
            let g:qcc_pattern = "^\(To\|Cc\|Bcc\|From\|Reply-To\):"
            let g:qcc_line_separator = "\n"
            let g:qcc_field_separator = "\t"
        " }}}
    " }}}

    " [ register & operation ] {{{
        " YankRing

        " repeat {{{ improve Vim's "."'s repeat.
            " support in:
            " surround.vim, speeddating.vim, abolish.vim, unimpaired.vim, commentary.vim
            " single/last/multiple/visual/complex repeats, using vim scripts.
            " `=> . @: :[range][v]g[lobal][!]/{pattern}/[cmd] V[Visual] q(record)->@
        " }}}

        " Visualrepeat {{{ Repeat command extended to visual mode.
            " Usage: {Visual}.
        " }}}

        " operator-user : Define your own operator easily
    " }}}

    " [ position & session & marker ] {{{
	" vim-session {{{ Extended session management for Vim ':mksession'
	    " Usage:
	    " - :SaveSession
	    " - :OpenSession
	    " - :CloseSession
	    " - :DeleteSession
	    " - :ViewSession
	    " - :RestartVim
	    let g:session_autoload = 'prompt' " 'prompt'/'yes' - auto load session or prompt ?
	    let g:session_autosave = 1
	    let g:session_directory = "~/.vim-sessions/"
	    let g:session_default_to_last = 0 " default open last session instead of default
	    let g:session_command_aliases = 1 " :SessionOpen <-> :OpenSession
	" }}}

        " restore_view : automatically restoring file's cursor position and folding
            " view info in ~/.vim/view/*
            " set viewoptions=cursor,folds,slash,unix
            set viewoptions=cursor,unix
            " let g:skipview_files = ['*\.vim']

        " Recover {{{ A diff buffer way to see diff between recover and on disk files.
            " :RecoverPluginDisable, :RecoverPluginEnable
            " :FinishRecovery, RecoveryPluginFinish
        " }}}

        " StarRange.vim | Select a string in visual mode. Press * or # key.

        " visualstar: | *,#,g*,g# for visual mode.
"AAA
        " exjumplist | a Vim plugin to provide extra commands for |jumplist|
            nmap <C-M-i>  <Plug>(exjumplist-go-last)
            nmap <C-M-o>  <Plug>(exjumplist-go-first)
            nmap <M-)>  <Plug>(exjumplist-next-buffer)
            nmap <M-(>  <Plug>(exjumplist-previous-buffer)

        " gf-user: extend 'gf' operation to open code file.
    " }}}

    " [ bookmark & mark ] {{{
        " vim-signature {{{ toggle, display and navigate marks.
            " Usage:
            " mark
            "   - ma -- toggle the mark a.
            "   - m<Space> -- delete all marks.
            "   - m, -- place the next available mark.
            "   - ]` -- Jump to next mark
            "   - [` -- Jump to prev mark
            "   - ]' -- Jump to start of next line containing a mark
            "   - [' -- Jump to start of prev line containing a mark
            "   - `] -- Jump by alpha order to next mark
            "   - `[ -- Jump by alpha order to prev mark
            "   - '] -- Jump by alpha order to start of next line containing a mark
            "   - '[ -- Jump by alpha order to start of prev line containing a mark
            " marker
            "   - m[0-9] -- toggle the corresponding marker!@#$%^&*()
            "   - m<S-[0-9]> -- Remove all markers of the same type
            "   - ]=    -- Jump to next line having same marker
            "   - ]-    -- Jump to prev line having same marker
            "   - m<Backspace> -- Remove all markers.
            let g:SignatureDefaultMappings = 1
            " let g:SignatureIncludeMarks =
            let g:SignatureWrapJumps = 1
            let g:SignatureMarkLeader = 'm'
            let g:SignatureLcMarkStr = "\p\m"
            let g:SignatureUcMarkStr = "\p\m"
            let g:SignatureMarkerLeader = 'm'
            " let g:SignatureIncludeMarkers =
            let g:SignatureDisableMenu = 0
            let g:SignatureMenuStruct = "P&lugins.&Signature"
            let g:SignaturePurgeConfirmation = 1
            let g:SignaturePeriodicRefresh = 1 " periodic auto refresh
        " }}}
"AAA
        " vmark.vim--Visual_Bookmarking {{{
        " Toggle visual bookmarking and jump through bookmarks
        " Usage:
        " - mm    -- toggle visual bookmark current line.
        "   - ma    -- remove all bookmarks
        "   - mn    -- move to next bookmark below current line.
        "   - mp    -- move to prev bookmark above current line.
            "let b:vm_maxmarks " max number of bookmarks in buffer.
            "let b:vm_guifg
            "let b:vm_guibg
            let b:vm_ctermfg = 'black'
            let b:vm_ctermbg = 'cyan'
            " FIXME un-map <F2>, <F3> maps.
            "nunmap <F2>
            "nunmap <F3>
        " }}}

        " Mark%2666 {{{ Highlight several words in different colors simultaneously.
            " {Visual}[N]<Leader>m, {Visual}<Leader>r, [N]<Leader>n, :[N]Mark {pattern}
            " :Marks
            " 1: Cyan  2:Green  3:Yellow  4:Red  5:Magenta  6:Blue ~
            if has('gui_running')
                let g:mwDefaultHighlightingPalette = 'extended'
                "let g:mwDefaultHighlightingNum = 9 " restrict color numbers
            endif
            highlight MarkWordN ctermbg=Cyan ctermfg=Black guibg=#8CCBEA guifg=Black
            highlight link SearchSpecialSearchType MoreMsg
            "let g:mwDefaultHighlightingPalette = [
            "\{ 'ctermbg':'Cyan', 'ctermfg':'Black', 'guibg':'#8CCBEA', 'guifg':'Black'},
            "\	...
            "\]
            "let g:mwHistAdd = '/@' " don't add marked words to search(/), input(@) history
            let g:mwAutoLoadMarks = 1 " restore marks from previous Vim session.
            "let g:mwAutoSaveMarks = 0 " turn off auto save session, Manually :MarkSave.
            nnoremap <Leader>M <Plug>MarkToggle
            nnoremap <Leader>N <Plug>MarkAllClear
                " remove the default overriding of * and #
            "nmap <Plug>IgnoreMarkSearchNext <Plug>MarkSearchNext
            "nmap <Plug>IgnoreMarkSearchPrev <Plug>MarkSearchPrev
        " }}}


"AAA
        " DynamicSigns {{{ Use Signs for different things.
            let g:Signs_IndentationLevel = 1 " numeric indentation level.
            let g:SignsMixedIndentation = 1 " mixed indentation
            let g:Signs_Bookmarks = 1 " display marks
            let g:Signs_QFList = 1 " display quickfix items signs.
            let g:Signs_Diff = 1 " display signs for viewing changes to the buffer
            let g:Signs_Alternate = 1 " alternating colors
        " }}}
    " }}}

    " [ Motions ] {{{
        " EasyMotion {{{ provide a much simpler way to use some motion in vim.
            " <Leader><Leader>w -- trigger "word" motion w.
            " <Leader><Leader>f{char} -- trigger "f" motion.
            " and other mappings: w/W, f/F, t/T, b/B, e/E, ge/gE, j/k, n/N.

            "let g:EasyMotion_keys = '1234567890'
            "let g:EasyMotion_do_shade = 0
            "let g:EasyMotion_leader_key = '<Leader>' " default: <Leader><Leader>
            " Custom keys
            "let g:EasyMotion_mapping_{motion} = {mapping}
        " }}}

        " CountJump {{{ Create custom motions and text objects via repeated jumps.
        " TODO
        " }}}
    " }}}

    " [ statusline ] {{{
        " Powerline {{{ customize Vim statusline.
            let g:Powerline_cache_enabled = 0
            let g:Powerline_symbols = "fancy" " compatible, fancy, unicode.
            set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
            " ∓ [0x2213], ⭠ [0x2b60], ⭡ [0x2b61], ⭢⭣ [0x2b62, 0x2b63].
            let g:Powerline_symbols_override = {
                        \ 'BRANCH': [0x2b60],
                        \ 'RO'    : [0x2b64],
                        \ 'FT'    : [0x2b62, 0x2b63],
                        \ 'LINE'  : [0x2b61],
                        \ }
            "let g:Powerline_dividers_override = ['>>', '>', '<<', '<']
            let g:Powerline_theme = "default" " default, skwp
            let g:Powerline_colorscheme = "default" " default, skwp
            let g:Powerline_stl_path_style = "filename" " filename/short/relative/full
            let g:Powerline_mode_n  = " N " " normal
            let g:Powerline_mode_i  = "INSERT" " insert
            let g:Powerline_mode_R  = "REPLACE" " replace
            let g:Powerline_mode_v  = "VISUAL" " visual mode
            let g:Powerline_mode_V  = "V⋅LINE" " visual line
            let g:Powerline_mode_cv = "V⋅BLOCK" " visual block
            let g:Powerline_mode_s  = "SELECT" " select mode
            let g:Powerline_mode_S  = "S⋅LINE" " select line
            let g:Powerline_mode_cs = "S⋅BLOCK" " select block

            " Customization {{{
            if !exists('g:Powerline_loaded')
                "call Pl#Theme#InsertSegment({newsegment}, {location}, {targetsegment})
                "{location} : 'before', 'after'
                "call Pl#Theme#RemoveSegment({targetsegment})
                "call Pl#Theme#ReplaceSegment({targetsegment}, {newsegment})

                " call Pl#Theme#Buffer(
                "             \ 'bt_help',
                "             \ )

                call Pl#Theme#RemoveSegment('fileencoding')
                call Pl#Theme#RemoveSegment('fileformat')
                " FIXME call Pl#Theme#ReplaceSegment('fileencoding', '%{&ff==#"unix"?"":&ff}')
                " FIXME call Pl#Theme#ReplaceSegment('fileformat', '%{&fenc==#"utf-8"?"":&fenc}')
                " TODO call Pl#Theme#ReplaceSegment('filetype', '%{neocomplcache#get_context_filetype()==#&ft?"":neocomplcache#get_context_filetype()}')
                " FIXME whether is this function to show on statusline.
                " call Pl#Theme#InsertSegment('%{ConflictCheck()}', 'before', 'tagbar')
                " call Pl#Theme#InsertSegment('static_str', 'before', 'filetype')
                " call Pl#Theme#InsertSegment('filesize', 'before', 'scrollpercent')
                " call Pl#Theme#InsertSegment('currhigroup', 'before', 'filetype')
                call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')
            endif
            " }}}
        " }}}

        " fugitive
        " hgrev {{{ show current buffer's HG revision.
            " set statusline+=%[r%{HGRev()}]
            " set statusline+=%{HGRev()?'[r'.HGRev().']':''}
            let g:hgrevFlags = '-nbt' " n: rev id, b: branch, t: tags.
            let g:hgrevAddStatus = 1
            let g:hgrevAutoUpdate = 1
            let g:hgrevNoRepoChar = '-'
        " }}}
        " current-func-info
        " syntastic.vim %{SyntasticStatuslineFlag()}
    " }}}

    " [ command line ] {{{
    " }}}

    " [ line numbers ] {{{
        " numbers.vim {{{ relative line numbers.
            " :NumbersToggle
        " }}}
    " }}}

    " [ history/undo ] {{{ <F10>
        " Vim's builtin undo tree:
            " "u" -> undo
            " "<C-R>" -> redo
            " :undo (is useful if you know what change you want to jump to.)
            " [count]g-, [count]g+ (are useful if you don't know exactly what
            " the change number is.)
            " :undolist :earlier/:later [time] {time travelling}

        " Gundo {{{ Visual Vim Undo tree and list.
            " let g:gundo_disable = 1 " disable Gundo.
            let g:gundo_prefer_python3 = 1
            let g:gundo_right = 0 " right/left position.
            let g:gundo_help = 1 " show help.
            let g:gundo_width = 45
            let g:gundo_auto_preview = 1
            let g:gundo_preview_height = 25
            let g:gundo_preview_buttom = 0 " 0 default.
            let g:gundo_preview_statusline = 'Preview'
            let g:gundo_tree_statusline = 'Tree'
            let g:gundo_map_move_older = "j"
            let g:gundo_map_move_newer = "k"
            let g:gundo_close_on_revert = 0

            nnoremap <F10> :GundoToggle<CR>
        " }}}

        " undotree {{{ Display your undo history in a graph.
            " Usage:
            " ?, u, <C-r>, g+, g-, :earlier, :later.
            let g:undotree_SetFocusWhenToggle = 1
            let g:undotree_SplitLocation = 'topleft'
            let g:undotree_SplitWidth = 35
            let g:undotree_diffAutoOpen = 1
            let g:undotree_diffpanelHeight = 25
            let g:undotree_RelativeTimestamp = 1
            let g:undotree_TreeNodeShape = '*'
            let g:undotree_HighlightChangedText = 1 " highlight changed text line
            let g:undotree_HighlightSyntax = "UnderLined"

            nnoremap <F10> :UndotreeToggle<CR>

            " function! g:undotree_CustomMap()
            "     map <C-n> J
            "     map <C-p> K
            " endfunction
        " }}}
    " }}}

    " [ simulate ] {{{
        " Clam {{{ A lightweight Vim plugin for working with shell commands.
            " :Clam ls -l, :%Clam sort, :1,10Clam python
            " :ClamVisual sort | uniq -c | sort -n
            " :ClamVisual wc -c, :'<,'>ClamVisual wc -c
            let g:clam_autoreturn = 1
            let g:clam_autoreturn = 'vertical botright'
        " }}}
    " }}}

    " [ REPL: Read-Eval-Print Loop ] {{{
        " vim-pipe {{{ Send a vim buffer through a command and instantly see the output.
            " provides REPL-like development for other shell tools For example
            " you can instantly send an SQL script to the database and see the
            " results in a temporary buffer.
            " Usage:
            "   <LocalLeader>r
            "   <LocalLeader>p
            " - b:vimpipe_command = ''
            " - b:vimpipe_filetype = ''
            " Once b:vimpipe_command is configured, type <LocalLeader>r to get
            " the list results. There's no need to save the file first. It works
            " on the current buffer, not the contents on disk.
            " au FileType sql let b:vimpipe_command = 'sqlite3 ' . % " sqlite
            au FileType markdown let b:vimpipe_command = "markdown" " markdown
            au FileType markdown let b:vimpipe_filetype="html"
            au FileType html let b:vimpipe_command="lynx -dump -stdin" " HTML
            " au FileType javascript let b:vimpipe_command='jslint <(cat)' " JSLint (JavaScript)
        " }}}

"AAA

        " Screen {{{ (vim + gnu screen/tmux) ['Screen_vim__gnu_screentmux']
            " simulate an embedded shell in vim by allowing you convert vim
            " session into one running in Screen or Tmux with a split window.
            " :help screen.txt
            " Workflow:
            " $ vim filename.py edit a python file.
            " :ScreenShell python Run all or pieces of code in interactive
            " python shell.
            " [Visual]:ScreenSend Send code from a vim buffer to the shell.
            " :ScreenQuit or :qa Quit the screen session return to vim session.
            " --- :ScreenShellVertical [cmd], :IPython
            " :ScreenShellReopen command for tmux.
            let g:ScreenImpl = 'Tmux' " 'GnuScreen' , 'Tmux'
            " Note: With tmux, :ScreenShellAttach is currently not supported.
            "let g:ScreenShellScreenInitArgs =
            let g:ScreenShellTmuxInitArgs = '-2' " tmux 256 color support
            let g:ScreenShellHeight = 15
            let g:ScreenShellWidth = -1
            let g:ScreenShellQuitOnVimExit = 1
            let g:ScreenShellExternal = 0
            let g:ScreenShellInitialFocus = 'vim' " focus: 'vim', 'shell'
            let g:ScreenShellServerName = 'vim'
            let g:ScreenShellTerminal = "" " for GVim open terminal.
            let g:ScreenShellExpandTabs=1 " avoid tab be interept as complete performing
            let g:ScreenShellSendPrefix = ''
            let g:ScreenShellSendSuffix = ''

                " map depending on whether you have an active screen shell open
                " or not.
                "function! s:ScreenShellListener()
                    "if g:ScreenShellActive
                        "nmap <C-c><C-c> :ScreenSend<cr>
                        "nmap <C-c><C-x> :ScreenQuit<cr>
                    "else
                        "nmap <C-c><C-c> :ScreenShell<cr>
                    "endif
                "endfunction

                "nmap <C-c><C-c> :ScreenShell<cr>
                "augroup ScreenShellEnter
                    "autocmd User * call <SID>ScreenShellListener()
                "augroup END
                "augroup ScreenShellExit
                    "autocmd User * call <SID>ScreenShellListener()
                "augroup END
        " }}}

        " vimux {{{ easily interact with tmux from vim.
            " Usage:
            " - :VimuxRunCommand("command")
            " - :VimuxRunLastCommand
            " - :VimuxCloseRunner
            " - :VimuxClosePanes
            " - :VimuxCloseWindows
            " - :VimuxInspectRunner
            " - :VimuxInterruptRunner
            " - :VimuxPromptCommand
            " - :VimuxClearRunnerHistory

            let g:VimuxHeight = "25"
            let g:VimuxOrientation = "h" " h: horizontal, v: vertical
            let VimuxUseNearestPane = 0 " if found, use existing tmux pane.
            let VimuxUseNearestPane = "q C-u"

            " " Run the current file with rspec
            " nnoremap <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
            " " Prompt for a command to run
            " nnoremap <Leader>rp :VimuxPromptCommand<CR>
            " " Run last command executed by VimuxRunCommand
            " nnoremap <Leader>rl :VimuxRunLastCommand<CR>
            " " Inspect runner pane
            " nnoremap <Leader>ri :VimuxInspectRunner<CR>
            " " Close all other tmux panes in current window
            " nnoremap <Leader>rx :VimuxClosePanes<CR>
            " " Close vim tmux runner opened by VimuxRunCommand
            " nnoremap <Leader>rq :VimuxCloseRunner<CR>
            " " Interrupt any command running in the runner pane
            " nnoremap <Leader>rs :VimuxInterruptRunner<CR>
        " }}}

        " inline_edit {{{ Edit code that's embedded within other code.
            " Visual select -> <Leader>e - any area that you mark.
            " JS/CSS in HTML, SQL in RUby, code in markdown, Django block in template.
            if exists('g:loaded_inline_edit')
                " normal mode:
                nnoremap <leader>e :InlineEdit<cr>
                " visual mode:
                xnoremap <leader>e :InlineEdit<cr>
                " insert mode:
                inoremap <c-e> <esc>:InlineEdit<cr>a
                let b:inline_edit_autowrite = 0 " =1, save proxy to buffer instead of write
                " detect <script> <style> tags like HTML
                let b:inline_edit_html_like_filetypes = ['vimwiki', 'markdown', 'tex']
            endif
        " }}}

        " NrrwRgn (NarrowRegion) {{{ A Narrow Region Plugin similar to Emacs
            "Narrowing means focussing on a region and making the rest
            "inaccessible." This is a script emulates Emacs Narrowing feature,
            "by opening a selected range in a new scratch buffer.  In the
            "scratch buffer simply save it and the changes will be copied into
            "the original file.
            " Usage:
            "   - :NarrowRegion/:NR, :NarrowWindow/:NW, :WidenRegion[!]
            "   - {Visual select} \nr
        " }}}

        " partedit {{{ Edit part of buffer by another buffer.
        " }}}
    " }}}

    " [ unicode & symble & sign ] {{{
        " unicode.vim  {{{ A Completion function for Unicode glyphs
            " e.g. type "AE", <C-X><C-U>, / <C-X><C-G>
            " <Leader>un -- swaps between unicode name and glyphs function complete.
            " Functions :
                " setlocal omnifunc=unicode#CompleteUnicode
                " :EnableUnicodeCompletion
                " :DisableUnicodeCompletion
                " :UnicodeName
            let g:enableUnicodeCompletion = 0 " always enable Unicode completion.
            let g:unicode_complete_name = 0 " only complete Unicode Names instead glyphs
            let g:showDigraphCode = 1
        " }}}

        " mathematic {{{
            " Usage: {{{
                " Superscript And Subscript:
                    " `0 ⁰  `+ ⁺ ... ( 0-9 + - (  ) / ^ . , > <  )
                    " `a ᵃ  `A ᴬ ... ( a-z except q , Some of A-Z )
                    " _0 ₀  _+ ₊ ... ( 0-9 + - (  ) / ^  )
                    " _a ₐ  _e ₑ ... (a e h i k l m n o p r s t u v x )
                " Short CMD:
                    " Greek Alphabet:
                        " \GA  => Α , \GD   => Δ
                        " \Ga  => α , \Gg   => γ
                    " Fractions:
                        " \1/2   => ½ , \1/3 => ⅓
                        " \2/3   => ⅔ , \3/5 => ⅗
                    " Arrows:
                        " \<--   => ←  , \--v => ↓  , \==>  => ⇒
                        " \<---  => ⟵  , \--^ => ↑  , \===> => ⟹
                    " Grouping:
                        " \(U    => ⎛  , \]U  => ⎤
                        " \(M    => ⎜  , \]M  => ⎥
                        " \(B    => ⎝  , \]B  => ⎦
                        " \(V    => ︵ , \]V  => ︺
                    " Operator:
                        " \U.    => ⨃ , \UU   => ∪  , \UN  => ∩
                        " \I1    => ∫ , \I3   => ∭  , \I=  => ⨎
                        " \IO1   => ∮ , \IO3  => ∰  , \IOW => ∳
                        " \PDF   => ∂ , \THF  => ∴  , \BCS => ∵
                        " \MUL   => × , \DIV  => ÷
                        " \SQRT2 => √ , \SQRT3 => ∛ , \SQRT4 => ∜
                    " Relations:
                        " \<=    => ≤ , \>=  => ≥   , \!=  => ≠
                        " \<~    => ⪝ , \>~  => ⪞   , \!>  => ≯
                        " \o+    => ⊕ , \o-  => ⊖   , \ox  => ⊗
                        " \O+    => ⨀ , \O+  => ⨁   , \OX  => ⨂
                    " Sets:
                        " \SUBO  => ⊂ , \SUBE => ⊆  , \SUBN => ⊄
                        " \SUPO  => ⊃ , \SUPE => ⊇  , \SUPX => ⊉
                        " \AND   => ∧ , \OR   => ∨  , \NOT  => ¬
                        " \XOR   => ⊕
                        " \EXTS  => ∃ , \EXTN => ∄  , \FALL => ∀
                        " \BOT   => ⊥ , \TOP => ⊤   , \LFT  => ⊣
                        " \RGT   => ⊢
                    " Misc:
                        " \INF  => ∞  , \PRT  => ∝
                        " \ARC   => ⌒ , \ANG  => ∠
                        " \DEGC  => ℃ , \DEGF => ℉
                        " \OHM   => Ω , \MHO  => ℧  , \ANGS => Å
                        " \a/c   => ℀ , \a/s  => ℁  , \No   => №
                        " \TM    => ™ , \CO   => ©  , \RO   => ®
                        " \AE    => Æ , \ae   => æ  , \fi   => ﬁ
                    " Fonts:
                        " \BBA   => 𝔸 , \BBH => ℍ   , \BB0  => 𝟘
                        " \FKH   => ℋ , \FKI => ℑ   , \FKL  => ℒ
                " Latex CMD:
                " Key Helper:
                " :KeyHelper => makes viewing and inputting these symbols easier.
                " It will dynamicly showing matching keymap with your input.  And
                " press '<Enter>' in the KeyHelper window to append to file.
                " And you can input more unicode symbols:
                " 0x2500-0x2800,  0x1D100 - " 0x1D1DD
            " }}}

            "nmap <Leader>kk :KeyHelper<CR>
            "" Active
            "map <Leader>km :set keymap=mathematic<CR>
            "" Stop
            "map <Leader>kn :set keymap=<CR>
            "" view it's details, modify it at your convenience.
            "map <leader>kvm :sp ~/.vim/addons/mathematic/keymap/mathematic.vim<CR>
            "let g:mathematic_user_dir = "~/.vim/addons/mathematic/keymap/mathematic.vim"
            "let g:mathematic_fuzzy_match = 1
        " }}}
    " }}}

    " [ session ] {{{
        " LargeFile: disable some option to speed up on time.

        " sudo.vim
            " Usage: put it in plugin directory.
            "  - (command line): $ vim sudo:/etc/passwd
            "  - (within vim): :e sudo:/etc/passwd
            " Commands:
            "   - SudoRead
            "   - SudoWrite

        " SudoEdit {{{ Edit Files using Sudo/su.
            " Usage:
            " <Tab>
            " :SudoRead[!] [file] ---> :r !sudo cat file.
            " :e sudo:/etc/fstab ---> compatibility with the old sudo.vim.
            " :[range]SudoWrite[!] [file] ---> :w !sudo tee >/dev/null file.

            " let g:sudoAuth = "ssh" " first try to use this tool before falling back
            " let g:sudoAuthArg = "root@localhost"
                " example: for su, use g:sudoAuthArg="-c",
            let g:sudo_askpass = '/usr/bin/ssh-askpass'
            let g:sudo_no_gui = 1 " disable GUI
        " }}}
    " }}}

    " [ color ] {{{
        let rgb_file = "/usr/X11/lib/X11/rgb.txt"

        " colorv {{{ Easier colors handling - HEX, RGB, W3C, X11,
            " View, Edit, Preview, Generate, Pick, Mark ... Colors and more.
            " Usage:
            " - ? -- show tips
            " - H -- show help document
            " - q -- quit colorv
            " - <leader>cv -- :ColorV -- ColorV Window
            " - <leader>ce -- :ColorEdit on cursor color.
            " - <Space>/<Enter>/+/- -- view and edit color in window on items.
            " - <leader>cn -- :ColorVName -- Colornames list (W3C)
            " - <leader>cw -- :ColorVView -- View color-text.
            " - <leader>cd -- :ColorVPicker -- A GUI colorpicker.
            let g:colorv_no_global_map = 1 " disable global mappings.
            " let g:colorv_global_leader
            let g:colorv_win_pos = "bot" " bot, top
            let g:colorv_gen_space = "hsv" " hsv, yiq
            let g:colorv_preview_name = 1
            let g:colorv_preview_area = 0 " preview color-text with same fg/bg
            let g:colorv_preview_ftype = 'css,html,javascript'
            let g:colorv_max_preview = 200 " max line when preview color-text
            let g:colorv_debug = 3 " 3: +python3, 2: +python, 0: no python.
            " let g:colorv_has_python = 0 " use 0 to disable use of python.
            let g:colorv_cache_file = '$HOME/.vim_colorv_cache'
        " }}}

        " Colorizer {{{ W3-Colors, X11, hex, RGB, rgb(RR,GG,BB) HVL hvl(H,V,L)
            " :[range]ColorHighlight[!], :ColorToggle, :ColorClear, :ColorContrast
            " :RGB2Xterm [#]RRGGBB,  " :HSL2RGB
            let g:auto_color = 1
            let g:color_x11_names = 1
        " }}}

        " CSSMinister
            " CSSMinister provides functions and mappings that convert any
            " hexadecimal, keyword, RGB(A) or HSL(A) color values from one format to
            " another.

        " EasyColour {{{ makes it really easy to create your own colour scheme.
        " }}}

        " VIM_Color_Picker {{{ <F5>, :ColorPicker
        " }}}

        " nosyntaxwords
            " find words that are not syntactically highlighted in current
            " buffer.
    " }}}

    " [ colorscheme ] {{{
        " galaxy {{{ a colorscheme tries to make colorscheming simpler.
            " Require: colorv
            " Usage:
            " - :colorscheme galaxy -- start galaxy
            " - :Galaxy {scheme}  -- Schemes Window
            " - :GalaxyScreen -- Schemes details
            " - :GalaxyLoad {scheme} -- Load Galaxy scheme.
        " }}}

        " ScrollColors
            " :ScrollColors
            " \[n|p] to choose colorscheme

        " ColorSchemeEditor {{{ PyGTK GUI to more easily create colorschemes
            " (keywords: color scheme editor)
        " }}}

        " tomasr/molokai
            let g:molokai_original = 0 " 0: dark gray background, 1: light gray

        " vim-colors-solarized
            " if has('gui_running')
            "     set background=light
            " else
            "     set background=dark
            " endif
            " colorscheme solarized
            let g:solarized_termcolors = 256 " 256colors
            let g:solarized_termtrans = 1 " terminal emulator transparent background
            let g:solarized_bold = 1
            let g:solarized_italic = 1
            let g:solarized_underline = 1
            let g:solarized_degrade = 0
            let g:solarized_contrast = "normal" " Stick with normal!
            let g:solarized_diffmode = "high"
            let g:solarized_hitrail = 1
            let g:solarized_menu = 1
            let g:solarized_visibility = "normal" " special characters
            " normal/high/low
                " such as trailing whitespace, tabs, newlines, when displayed
                " using :set list can be set to one of three levels depending on
                " your needs. Default value is normal with high and low options.
        " jellybeans.vim
            " colorscheme jellybeans
            " let g:jellybeans_overrides = {
            "             \ 'Todo': {
            "                 \ 'guifg': '303030', 'guibg': 'f0f000',
            "                 \ 'ctermfg': 'Black', 'ctermbg': 'Yellow',
            "                 \ 'attr': 'bold' },
            "             \ }
        " vim-hybrid
            " let g:hybrid_use_Xresources = 1
            " colorscheme hybrid
        " Lucius
    " }}}

"AAA bagatel

    " [ syntax for *** ] {{{
        " Txtfmt_The_Vim_Highlighter {{{ "Rich text" highlighting formatted with Vim
            " modeline: vim:ft=txtfmt || ft=c.txtfmt (mix)
            " token(define, concealed), attributes,
            " au! filetypedetect BufRead,BufNewFile *.txt setfiletype txtfmt
            " nested region
            "augroup filetypedetect
                "au!
                "au BufRead,BufNewFile *.c    let b:txtfmtNested = 1
                "au BufRead,BufNewFile *.c    setf c.txtfmt
            "augroup END
            let g:txtfmtMapwarn = "mMoOcC"
            let g:txtfmtModelines = 5
            let g:txtfmtNested = 1
            let b:txtfmtEscape = 'bslash'
            let g:txtfmtTokrange = '&enc == "utf-8" ? "0xE000X" : "180X"'
            let g:txtfmtUndercurl = 1
            "let g:txtfmtUsermap{}
        " }}}

        " HybridText : Hybrid of useful syntax for general use in text files.
            " ~/.vim/after/syntax/hybrid.vim
            au! BufRead,BufNewFile *.txt set syntax=txt

        " Bundle 'mutewinter/nginx.vim.git'

        " Nginx config syntax.
    " }}}

    " [ window ] {{{
	" golden-ratio {{{ Automatic resizing of Vim windows to the golden ratio
	    " let g:loaded_golden_ratio = 0 " 1: to disable load golden-ratio
	    " let g:golden_ratio_autocommand = 1 " 0: disable autocommand events
	    " let g:golden_ratio_wrap_ignored = 0 " set line wrapping of ignored windows
	" }}}

        " dwm.vim {{{ Tiled Window Management for Vim inspired from dwm.
            " Usage:
            " - Ctrl-N => creates a new window and place it in the area [M],
            "   stacks all previous windows in the [S] areas.
            " - Ctrl-C => close the current window if no unsaved changes.
            " - Ctrl-J => jumps to next window (clockwise)
            " - Ctrl-K => jumps to previous window (anti-clockwise)
            " - Ctrl-F => focus the current window, that is, place it in the [M]
            "   area & stacks all other windows in the [S] areas.
        " }}}

        " ZoomWin {{{ <c-w>o :ZoomWin, :call ZoomWin() to zoom window.
            let g:zoomwin_preserve_taglist = 1
            let g:zoomwin_preserve_winmanager = 1
        " }}}
    " }}}

    " [ conceal ] {{{
        " vim-ocaml-conceal
    " }}}

    " [ complete ] {{{
        " CompleteHelper {{{ 'completefunc', i_CTRL-X_CTRL-U,
            " Functions: {{{
                " CompleteHelper#FindMatches( matches, pattern, options )
                " CompleteHelper#ExtractText( startPos, endPos, matchObj )
                " CompleteHelper#Abbreviate#Word( matchObj )
                " CompleteHelper#JoinMultiline( text )
                " CompleteHelper#Repeat#TestForRepeat()
            " }}}
            "" Example: {{{
            "function! SimpleComplete( findstart, base )
                "if a:findstart
                    "" Locate the start of the keyword.
                    "let l:startCol = searchpos('\k*\%#', 'bn', line('.'))[1]
                    "if l:startCol == 0
                        "let l:startCol = col('.')
                    "endif
                    "return l:startCol - 1 " Return byte index, not column.
                "else
                    "" Find matches starting with a:base.
                    "let l:matches = []
                    "call CompleteHelper#FindMatches( l:matches, '\V\<' . escape(a:base, '') . '\k\+', {'complete': '.'} )
                    "return l:matches
                "endif
            "endfunction

            "inoremap <C-x><C-z> <C-o>:set completefunc=SimpleComplete<CR><C-x><C-u>
            "" }}}
        " }}}

        " AmbiCompletion {{{ ambiguous word completion.
            " complete a word with no only start-with match but also ends-with
            " and contains match.
            if &completefunc == ''
                set completefunc=g:AmbiCompletion
            endif
            let g:AmbiCompletion_richerSupportForMultibyte = 1
            let g:AmbiCompletion_allBuffers = 1
        " }}}
    " }}}

    " [ window: split, navigation ] {{{
        " SpitVspit {{{ Powerful multiple files splitting; split/vsplit/edit.
            " Usage:
            "   - :Spit[Up/Down]
            "   - :[V/W]spit[Left/Right]
            let g:loaded_SpitVspit = 0 " =1 to disable load script.
        " }}}
    " }}}

    " [ menu ] {{{
        " Headlights {{{ add bundles to menu and show features they provide.
            " Headlights adds a Bundles [^1] menu to Vim, revealing your bundles
            " (aka. plugins) and the features they provide.
            " TODO
        " }}}
    " }}}

    " [ modeline ] {{{
        " securemodelines {{{ whitelist certain options for modeline.
        " }}}
    " }}}

    " [ key maps/bindings ] {{{
	" tinykeymap {{{ tiny, temporary keymaps
	    " Usage:
	    " * press <Esc> deactivates the tinykeymap.
	    " - tinykeymap#Map()
	    " - tinykeymap#EnterMap()
	    " - tinykeymap#Load()
	    " - tinykeymap#Complete()
	    " - tinykeymap#PressEnter()
	    " * :Tinykeymap
	    "
	    " gt               --  tabs
	    " windows          --  <C-W>
	    " buffers          --  <Leader>mb
	    " diff             --  <Leader>md
	    " filter           --  <Leader>mf
	    " lines            --  <Leader>ml
	    " location list    --  <Leader>mo
	    " quickfix         --  <Leader>mq
	    " undo             --  <Leader>mu
	    " quickfixsigns    --  <Leader>ms

	    " list of tinykeymaps be loaded on startup
	    let g:tinykeymaps_default = "*" " wildcard * to load all tinykeymaps.
	    let g:tinykeymap#mapleader = mapleader . 'm'
	    let g:tinykeymap#conflict = 4 " 0/1/2/3/4 -- throw an error
	    let g:tinykeymap#map#quickfixsigns#map = g:tinykeymap#mapleader . 's' " quickfixsigns plugin
	" }}}

        " vim-addon-actions {{{ customization for key bindings
        " }}}
    " }}}

    " [ timestamp ] {{{
    " }}}

    " bad-whitespace highlight bad whitespace, but disable in insert mode.
        " Usage:
        " - EraseBadWhitespace
        " - ShowBadWhitespace
        " - HideBadWhitespace
        " - ToggleBadWhitespace

    " trailing-whitespace
        " Usage:
        " - highlight trailing whitespace in red color.
        " - :FixWhitespace to fix whitespace errors.
        " - [range]FixWhitespace to visual select range to pass.

    " TUI (Text User Interface) {{{
        " forms {{{ A Vim TUI library.
        " }}}
    " }}}

    " [ Vim FAQ / Tips ] {{{
        " tips.vim {{{ show vim tips everytime when you enter vim.
            " :NextTip
        " }}}

        " Bundle 'chrisbra/vim_faq.git'
    " }}}
" }}}

" [ tools ] {{{
    " [ GTD, wiki, note, outliner & calendar ] {{{
        " vimwiki {{{
            let g:vimwiki_list = [
                \ {
                    \ 'path': '~/Wiki/vimwiki/wiki/',
                    \ 'path_html': '~/Wiki/vimwiki/output/',
                    \ 'auto_export': 0, 'index': 'index', 'ext': '.wiki',
                    \ 'syntax': 'default',
                    \ 'css_name': 'style.css',
                    \ 'template_path': '~/Wiki/vimwiki/templates/wiki/',
                    \ 'template_default': 'default',
                    \ 'template_ext': '.html',
                    \ 'custom_wiki2html': '',
                    \ 'maxhi': 0,
                    \ 'list_margin': -1,
                    \ 'nested_syntaxes': {
                        \ 'python': 'python', 'ruby': 'ruby',
                        \ 'bash': 'sh', 'vim': 'vim',
                        \ 'javascript': 'javascript', 'coffee': 'coffee',
                        \ 'c': 'c', 'go': 'go',
                        \ 'lisp': 'lisp', 'scheme': 'scheme',
                        \ 'git': 'git', 'diff': 'diff', 'gitdiff': 'gitdiff',
                    \ },
                \ },
                \ {
                    \ 'path': '~/Wiki/vimwiki/personal/',
                    \ 'path_html': '~/Wiki/vimwiki/personal_output/',
                    \ 'auto_export': 0, 'index': 'index', 'ext': '.wiki',
                    \ 'css_name': 'style.css', 'syntax': 'default',
                    \ 'template_path': '~/Wiki/vimwiki/templates/personal/',
                    \ 'template_default': 'default',
                    \ 'template_ext': '.template',
                \ },
                \ {
                    \ 'diary_rel_path': 'Diary/',
                    \ 'diary_index': 'diary',
                    \ 'diary_header': 'Diary',
                    \ 'diary_sort': 'desc',
                \ },
            \ ]
            let g:vimwiki_hl_headers = 1 " use VimwikiHeader1-6
            let g:vimwiki_hl_cb_checked = 1 " checked list items
            let g:vimwiki_global_ext = 1 " make temporary wiki in dir.
            let g:vimwiki_ext2syntax = {
                        \ 'wiki': 'default',
                        \ }
                        " \ 'md': 'markdown',
                        " \ 'mkd': 'markdown',
            let g:vimwiki_auto_checkbox = 1 " if is not checkbox then create.
            let g:vimwiki_menu = 'Plugin.Vimwiki' " GUI sub menu for available wikies
            let g:vimwiki_listsyms = ' .oOX'
            let g:vimwiki_use_mouse = 0 " disable mouse.
            let g:vimwiki_folding = 1 " disable folding. speed up file.
            let g:vimwiki_fold_lists = 1 " enable list subitem's folding.
            let g:vimwiki_list_ignore_newline = 0
            let g:vimwiki_table_mappings = 0 " disable Table mapping
                " to disbale vimwiki <Tab> map
            let g:vimwiki_table_auto_fmt = 0
            let g:vimwiki_dir_link = '' " [[dir/]] to open directory with netrw.
            let g:vimwiki_html_header_numbering = 2
            let g:vimwiki_html_header_numbering_sym = '.'
            " let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr'
            let g:vimwiki_user_htmls = '404.html,search.html'
            let g:vimwiki_conceallevel = 2 " vimwiki set this everytime
            let g:vimwiki_url_mingain = 25 " min chars be gained by concealing URLs
            let g:vimwiki_url_maxsave = 30
            let g:vimwiki_debug = 0
            let g:vimwiki_diary_months = {
                        \ 1: 'January', 2: 'February', 3: 'March',
                        \ 4: 'April', 5: 'May', 6: 'June',
                        \ 7: 'July', 8: 'August', 9: 'September',
                        \ 10: 'October', 11: 'November', 12: 'December',
                        \ }
            let g:vimwiki_use_calendar = 1
        " }}}

        " Calendar {{{
            " Usage:
            "   :Calendar, :Calendar 2001 8
            let g:calendar_focus_today = 1
            let g:calendar_mark = 'right' " place mark(*|+) after the day.
                " left, left-fit, right.
            let g:calendar_navi = 'both' " use navigator: top, bottom, both
            let g:calendar_navi_label = 'Prev,Today,Next'
            " let g:calendar_erafmt = 'Heisei,-1988'   " replace header: for Japanese
            "let g:calendar_mruler = 'Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec'
            "let g:calendar_wruler = 'Su Mo Tu We Th Fr Sa'
            let g:calendar_monday = 1 " start with monday.
            let g:calendar_weeknm = 5 " 1: WK01, 2: WK 1, 3: KW01, 4: KW 1, 5: 1
            let g:calendar_datetime = 'statusline' " title, statusline, ''
            " let g:calendar_no_mappings =
        " }}}

        " VikiDeplate {{{ adds wiki-like hypertext capabilities to Vim.
        " }}}

        " vikitasks {{{
        " }}}

        " vktheming {{{ make vimwiki more colorful in GUI.
        " }}}

        " viske {{{ manage your daily schedule on vim with timeline calendar.
            " Usage:
            "   - :Viske
            let g:ViskeDir = '$HOME/Schedule/'
            let g:ViskeSubWinHeight = 7 " height of the Sub-Window
            let g:ViskeCalWinWidth = 25 " width of the calendar-window
            let g:ViskecutDownMsg = 1 " Trim the summary of tasks or not
            let g:ViskeStartTime = 7 " Start time of a day.
            let g:ViskeEndTime = 21 " End time of a day.
            let g:ViskeWidthFuzzy = 4 " Acceptable length that run over a screen.
            let g:ViskeLang = "us,cn,jp" " Language setting
            let g:ViskeTaskTypeLabel = [
                        \ '\ ', 'seminar', 'circle',
                        \ 'part time job', 'family', 'TODO',
                        \ ]
            let g:ViskeDayLabel = ['S', 'M', 'Tu', 'W', 'Th', 'F', 'S']
        " }}}

        " vimgtd {{{ gtd by vim.
            " :TaskToday, :TaskAll, :TaskDoneOrDoingByDate {date}, :TaskToggle ....
            "let g:loaded_wikigtd = 1
            let g:wikigtd_index = 'task/task'
        " }}}

        " notes {{{ Easy note taking in Vim.
            " Usage:
            " - :Note -- start a new note.
            " - `:[edit|tabedit|split] note:filename`
            " - [visual text]<Leader>en/sn/tn.
            " - :[Split|Tab]NoteFromSelectedText
            " - :write or :update to save notes.
            " - :Note strings -- to edit existing notes or new note be created.
            " - :SearchNotes keyword  or :SearchNotes /pattern/ for regex.
            " - :RelatedNotes -- back-references, find all notes refer to this file.
            " - :RecentNotes
            " - Navigating: gf, CTRL-W_f, CTRL-W_gf. (jump to open, split, tab)
            " - C-X_C-U, C-X_C-O for completing,
            " - embed filetype: embed highlighting, {{{type ...}}}
            " - bullets: <Tab>, <S-Tab>, <Alt-Left>, <Alt-Right>
            let g:notes_directory = '~/Wiki/Notes/'
            let g:notes_suffix = '.note'
            let g:notes_title_sync = 'prompt' " prompt, change_title, rename_file, no
            let g:notes_smart_quotes = 1
            let g:notes_ruler_text = '* * *'
            let g:notes_list_bullets = "['•', '◦', '▸', '▹', '▪', '▫']"
            "let g:notes_list_bullets = '['*', '-', '+']'
            let g:notes_shadowdir = '~/Wiki/Notes/vimPlugin/shadow'
            let g:notes_indexfile = '~/Wiki/Notes/vimPlugin/index.pickle'
            "let g:notes_indexscript =
            let g:notes_tagsindex = '~/Wiki/Notes/vimPlugin/tags.txt'
            " Make the C-] combination search for @tags:
            "imap <C-]> <C-o>:SearchNotes<CR>
            "nmap <C-]> :SearchNotes<CR>
            " Make double mouse click search for @tags. This is actually quite a lot of
            " fun if you don't use the mouse for text selections anyway; you can click
            " between notes as if you're in a web browser:
            "imap <2-LeftMouse> <C-o>:SearchNotes<CR>
            "nmap <2-LeftMouse> :SearchNotes<CR>
            " ~/.vim/ftplugin/notes.vim : setlocal filetype=notes.txtfmt
        " }}}

        " vim-pad {{{ A quick notetaking plugin
            " Workflow:
            "       - open your notes.
            "       - search in your notes.
            "       - create a new note.
            " file is free format, you can use modeline like markdown etc.
            " Usage:
            "   - :ListPads (`Ctrl-Esc`, <Leader><Esc>) <Plug>PadListPads.
            "       - <Enter> to open pad in list.
            "       - dd, <Del> to delete.
            "       - <Esc> to close buffer.
            "       - <Shift-F> to search.
            "       - <Shift-S> select sort.
            "   - in a note: <Leader>dd will delete note file.
            "   - in a note: <Leader>+m to ask for filetype and insert modeline.
            "   - (`<Leader>s`) <Plug>PadSearchPads.
            "   - :OpenPad (<Leader>n) <Plug>PadOpenPad. create new note
            let g:pad_dir = "~/Wiki/vim-pad/"
            let g:pad_format = "markdown" " markdown,pandoc,
            let g:pad_modeline_position = "bottom" " bottom, top,
            let g:pad_window_height = 20
            let g:pad_highlighting_variant = 1
            let g:pad_search_backend = 'grep' " grep, ack
            let g:pad_search_ignore_case = 1
            let g:pad_read_nchars_from_files = 200 " read 200 chars summary from files
            " XXX change mappings.
        " }}}

        " HyperList: <= WOIM {{{
            " HyperList is a way to describe anything: any state, item(s),
            " pattern, action, process, transition, program, instruction etc
        " }}}

        " VOoM {{{ <F2> Vim two-pane outliner
            " Usage:
            "   - :Voom {MarkupMode}, :Voomhelp.
            "   - :Voomexec [vim/py], :Voomlog,
            let g:voom_tree_placement = "left" " left, right, top, bottom.
            let g:voom_tree_width = 30
            let g:voom_tree_height = 12
            let g:voom_log_placement = "bottom" " right, left, top, bottom.
            let g:voom_log_width = 30
            let g:voom_log_height = 12
            let g:voom_return_key = "<Return>"
            let g:voom_tab_key = "<Tab>"
            " let g:voom_ft_modes = {'markdown': 'markdown', 'pandoc': 'markdown'}
            " let g:voom_default_mode = 'asciidoc'
            " let g:voom_verify_oop =
            " let g:voom_rstrip_chars_{filetype}
                " let g:voom_rstrip_chars_vim = "\"# \t"
                " let g:voom_rstrip_chars_text = " \t"
                " let g:voom_rstrip_chars_help = " \t"
            " let g:voom_user_command
            " let g:voom_create_devel_commands

            nnoremap <F2> :VoomToggle<CR>
        " }}}

        " unite-outline {{{ provides your Vim's buffer with the outline view.
        " TODO custom by myself :help unite-outline
            " Usage:
            " - :Unite outline
            " - :Unite outline:! -- force update
            " or <C-l> in unite interface to force update.
            if !exists('g:unite_source_outline_info')
                let g:unite_source_outline_info = {}
            endif
            " let g:unite_source_outline_info['vimwiki'] = {
            "           \ }
            let g:unite_source_outline_indent_width = 2 " indent width in heading lists
            if !exists('g:unite_source_outline_filetype_options')
                let g:unite_source_outline_filetype_options = {}
            endif
            let g:unite_source_outline_filetype_options['*'] = {
                        \ 'auto_update': 1,
                        \ 'auto_update_event': 'write',
                        \ }
            let g:unite_source_outline_filetype_options['javascript'] = {
                        \ 'ignore_types': ['comment'],
                        \ }
            let g:unite_source_outline_cache_limit = 1000 " biggest cache value.
                " otherwise, bigger than this value will stored in file.
            if !exists('g:unite_source_outline_highlight')
                let g:unite_source_outline_highlight = {}
            endif

            call unite#sources#outline#alias('xhtml', 'html')

            nnoremap <F2> :Unite outline<CR>
        " }}}

        " Speeddating : <C-A>, <C-X>, {Visual}<C-A/X>

        " Vomodoro {{{ facilitates planning, tracking and archiving Pomodoros.
            " Usage:
            "   - :PomodoroOpenArchive -- open the archived Pomodoros.
            "   - :PomodoroPerformArchive --- copy todo list to Pomodoros.
            "   - :PomodoroToDoToday -- open the todo list buffer.
            " keys:
            "   - <esc>/q   -- close buffer window.
            "   - <CR>      -- add a check box to current line.
            "   - <space>   -- check off a box on the current line.
            "   - -         -- check of the remaining boxes on line using dashes
            let g:Pomo_ArchiveFilePath = "$HOME/Wiki/Vomodoro/todotoday"
            let g:Pomo_ToDoTodayFilePath = "$HOME/Wiki/Vomodoro/archive"
        " }}}

        " vim-pomodoro {{{ a Vim plugin for the pomodoro time management technique
            " Require: AsyncCommand
        " }}}
    " }}}

    " [ shell ] {{{
        " vimshell {{{ powerful shell inplemented by vim script
            "built-in functionalities that you had to set up to enable if it's on zsh.
            " :VimShell[Create,Tab,Pop,Interactive,....] [{options}...] [{path}]
            let g:vimshell_prompt = "vimshell%"
            let g:vimshell_user_prompt = "getcwd()\n"
            "let g:vimshell_right_prompt =
            let g:vimshell_no_default_keymappings = 0 " disable all key mapping in vimshell
            let g:vimshell_use_terminal_command = "urxvt -e"
            "let g:vimshell_temporary_directory = "expand('~/.vimshell')"
            let g:vimshell_max_command_history = 1000
            let g:vimshell_max_directory_stack = 100
            "let g:vimshell_vimshrc_path = "expand('~/.vimshrc')"
            "let g:vimshell_escape_colors =
            let g:vimshell_disable_escape_highlight = 0
            let g:vimshell_cat_command = "cat" " $PAGER command path
            "let g:vimshell_editor_command = " $EDITOR command path
            let g:vimshell_environment_term = "rxvt-unicode-256color" " $TERM env
            let g:vimshell_split_command = "nicely" " nicely, tabnew, vsplit
            let g:vimshell_popup_command = ""
            let g:vimshell_popup_height = 30
            let g:vimshell_cd_command = "lcd"
            let g:vimshell_no_save_history_commands = {'history' : 1, 'h' : 1, 'histdel' : 1}
            let g:vimshell_scrollback_limit = 1000
            let g:vimshell_interactive_no_save_history_commands = {}
            let g:vimshell_interactive_update_time = 500
            "let g:vimshell_interactive_command_options
            "let g:vimshell_interactive_interpreter_commands =
            "let g:vimshell_interactive_encodings =
            "let g:vimshell_interactive_echoback_commands =
            let g:vimshell_terminal_cursor = 'i:block-Cursor/lCursor'
            "let g:vimshell_terminal_commands =
            "let g:vimshell_interactive_cygwin_commands =
            let g:vimshell_interactive_cygwin_path = 'c:/cygwin/bin'
            let g:vimshell_interactive_cygwin_home = ''
            "let g:unite_source_vimshell_external_history_path =
        " }}}
    " }}}

    " [ TeX & LaTeX ] {{{
        let g:tex_fold_enabled = 1
        let g:tex_comment_nospell = 1 " useful when include source code in comments
        let g:tex_verbspell = 1 " spell checking in Verbatim Zones
        "let tex_no_error=1
        let g:tex_conceal = "admgs"
            "accents/ligatures, delimiters, math symbols, Greek, superscripts/subscripts

        " auctex {{{ a large collection of LaTex macros.
        " }}}

        " TeX_9 {{{ semi-automatic LaTeX ftplugin with lots of firepower !
        " }}}

        " TeX-PDF {{{ Lightweight "stay-out-of-your-way" TeX-to-PDF dev support.
        " }}}

        " AutomaticLaTeXPlugin {{{ background compilation, completion, bib search, toc etc.
        " }}}

        " tex_autoclose
        " auctex : macros for LaTeX.
    " }}}

    " [ markup & write ] {{{
        " preview%3344 {{{
            " <Leader>P => preview markup: markdown, rdoc, textile, html, rst
            let g:PreviewBrowsers='firefox,luakit,chromium-browser'
            " let g:PreviewCSSPath='/path/to/css/file'
            let g:PreviewMarkdownExt='markdown,md,mkd,mkdn,mdown'
            let g:PreviewTextileExt='textile,txt'
            let g:PreviewRdocExt='rdoc'
            let g:PreviewHtmlExt='html,htm'
            let g:PreviewRonnExt='ronn'
            let g:PreviewRstExt='rst'
        " }}}

        " Engspchk {{{ on-the-fly spellcheck uses Vim's native syntax highlighting.
            " English Spelling Checker Manual
            " The engspchk source uses Vim's native syntax highlighting to catch
            " spelling errors, so you get quick on-the-fly spellchecking!
            " for source code, only check on comment instead of variables.
            " Usage:
            "   - on-the-fly spellcheck.
            "   - \ec : startup, \en : next, \ep : prev, \ee : end.
            "   - \ea : alternative, \er : RareWord<>Error, (user dict)
            "   - \es : save to dict, \eS : remove. (proj dict)
            "   - \ev : check on visual, \eV : turn off.
            " for alternative window:
            "   - <cr> : select, <tab> : select and global substitute.
            "   - q : quit.
            " Commands: ':Engspchk'
            " Keys:
            "   - <leftmouse>/<rightmouse>/<middlemouse>.
            if exists(':Engspchk')
                set mouse+=n
            endif
            let g:spchkmouse = 1
            let g:spchkautonext = 1
            let g:spchkdialect = "usa" " 'usa', 'can', 'uk'
            let g:spchklang = "eng"
            " let g:spchknonhl = " force all non-syntax-highlighted text.
            let g:spchkpunc = 1
            let g:spchksilent = 1
            " let g:spchkaltright=20 " let alternate-spelling window on right side
            " let g:spchkacronym=
            " let g:cvimsyn= expand('${HOME}/.vim/plugin/CVIMSYN')
            " let g:DrChipTopLvlMenu

            " highlighting groups:
                " BadWord, Dialect, RareWord,
        " }}}

        " SpellCheck {{{ populates quickfix-list spelling errors workflow.
            " :[range]SpellCheck
            " :SpellCheck[!] (quickfix window), :SpellLCheck[!] (location window)
                " auxiliary commands:
                    " issue an error when spelling errors exist.
                    " :BDeleteUnlessSpellError[!], :WriteUnlessSpellError[!]
                    " :WriteDeleteUnlessSpellError[!], :XitUnlessSpellError[!]
                    " auto open quickfix list when spelling errors.
                    " :BDeleteOrSpellCheck[!], :WriteOrSpellCheck[!]
                    " :WriteDeleteOrSpellCheck[!], :XitOrSpellCheck[!],
                    " :UpdateAndSpellCheck[!]
            let g:SpellCheck_OnNospell = function('SpellCheck#AutoEnableSpell')
            "let g:SpellCheck_OnNospell = '' " :SpellCheck fail when 'spell' is off
            let g:SpellCheck_DefineAuxiliaryCommands = 1 " disable auxiliary commands

            "autocmd BufWritePre /tmp/mutt-* :UpdateAndSpellCheck
        " }}}

        " LanguageTool {{{ check language grammar. en, fr, etc.
            " :LanguageToolCheck
            let g:languagetool_jar=$HOME . '/languagetool/LanguageTool.jar'
            "autocmd BufWritePre /tmp/mutt-* :LanguageToolCheck
        " }}}

        " SpellCheck & LanguageToolCheck {{{
        " }}}
    " }}}

    " [ ebooks ] {{{
        au BufReadCmd *.epub call zip#Browse(expand("<amatch>"))
            " let vim edit epub. because vim can auto edit files inside zip file
    " }}}

    " [ POST/Search(WWW): blog, microblog, twitter, WWW etc ] {{{
        " UltraBlog: local database for Blog WordPress.

        " Tumble {{{ Tumble for Vim.
            " :[range]Tumble [draft|published]
            " :[ranger]TumbleLink
            " :TumblesList [draft|publish]
            " ( here [ranger] can be selected by visual.)
            " markdown title at first line.
            let tumblr_email = 'numbchild@gmail.com'
            let tumblr_password = 'chrisM.sprite324'
            let tumblr_tumblelog = 'stardiviner.tumblr.com'
            " let tumblr_http_proxy =
        " }}}

        " wwwsearch {{{ Search WWW easily from Vim.
            " Usage:
            " :Wwwsearch [{search-engine}] {keyword}
            " Functions:
                " wwwsearch#search({keyword}, [{search-engine}])
                " wwwsearch:add({search-engine}, {uri-template})
                " wwwsearch:remove({search-engine})
            let g:wwwsearch_command_to_open_uri = '/usr/bin/luakit {uri} &'
            "nnoremap <Space>*  :<C-u>Wwwsearch -default <cword><Return>
            nnoremap <Space>* <Plug>(operator-wwwsearch)
                " search-engine :
                    " -default : same as "-google"
                    " -dictionary : Dictionary (Max OS X only)
                    " -google : Google
                    " -twitter : Twitter
                    " -vim.org : Google for www.vim.org
                    " -wikipedia : Wikipedia
                " call wwwsearch#default(
                "             \   'default',
                "             \   'http://en.wikipedia.org/w/index.php?search={keyword}'
                "             \ )
                " call wwwsearch#add(
                "             \ 'blekko',
                "             \ 'http://blekko.com/ws/+{keyword}'
                "             \ )
                " call wwwsearch#add(
                "             \ 'duckduckgo',
                "             \ 'http://duckduckgo.com/?q={keyword}'
                "             \ )
                " call wwwsearch#add(
                "             \ 'github',
                "             \ 'http://github.com/search?q={keyword}'
                "             \ )
                " call wwwsearch#add(
                "             \ 'googlecode',
                "             \ 'http://code.google.com/query/#q={keyword}'
                "             \ )
                " call wwwsearch#add(
                "             \ 'baidu',
                "             \ 'http://www.baidu.com/s?wd={keyword}'
                "             \ )
                " call wwwsearch#add(
                "             \ 'digg',
                "             \ 'http://digg.com/search?s={keyword}'
                "             \ )
            " }}}

        " [ paste ] {{{
            " Gist {{{ GitHub paste server.
                " Requires: curl, webapi-vim, git command.
                " :'<,'>Gist -- visual
                " :Gist -- post current buffer to gist.
                " :Gist -s describ -- post with description
                " :Gist -p -- create a private gist.
                " :Gist -P -- create a public gist.
                " :Gist -a -- create a anonymously gist.
                " :Gist -e -- edit the gist. :w to save
                " :Gist -e -s describ -- post/edit with the description.
                " :Gist -d -- delete the gist. (need opened gist buffer).
                " :Gist -f -- fork (need opened gist buffer).
                " :Gist -l [pattern] -- list
                " :Gist -ls -- list gists from your started gists.
                " :Gist -la -- list everyone's gists.
                " :Gist +/-1 -- star the gist.
                " :Gist --abandon -- when have problem.
                " GitHub auth stored in ~/.gist-vim, to revoke, just remove it
                " To make a already opened gist buffer.
                "   - :Gist -l
                "   - <Enter> on a file to open a gist.
                "   - :Gist -e git@gist.github.com:3358356.git
                "   - :w to save and update.
                let g:gist_clip_command = 'xclip -selection clipboard' " Linux
                let g:gist_detect_filetype = 1 " detect filetype from the filename.
                let g:gist_open_browser_after_post = 1 " open browser after post.
                let g:gist_browser_command = 'firefox %URL% &' " 'elinks %URL%'
                let g:gist_show_privates = 1 " show private gist in :Gist -l.
                let g:gist_get_multiplefile = 1 " edit all files contains more than one.
            " }}}

            " PasteBin {{{ interface for pastebin.com
                " http://pastebin.com/api config reference.
                " <Visual>PasteBin
                let g:pastebin_browser_command = "firefox %URL% &"
                let g:pastebin_private = 1 " 0: Public, 1: Unlisted, 2: Private.
                let g:pastebin_api_dev_key = '1587f97dfac0e24806b9d5092f710dc6'
                let g:pastebin_api_user_name = 'numbchild'
                let g:pastebin_api_user_password = 'numbchild324'
                let g:pastebin_expire_date = '1M'
                    " N:Never, 1H: 1 Hour, 1D: 1 Day, 1M: 1 Month
            " }}}

            " vim-pastie : interface for pastie.org
                " :[range(v):/1,10/%(file)]Pastie[!] file.txt/register
                " :[%|visual]Pastie!

            " vim-pasta {{{ pasting in Vim with indentation adjusted to destination context
                " this plugin remaps `p` and `P` (put command) in normal and
                " visual mode to do context aware pasting.  What it means is
                " that indentation of pasted text is adjusted properly to match
                " indentation of surrounding code.

                " disable plugin override default p and P mappings.
                " let g:pasta_paste_before_mapping = ',P'
                " let g:pasta_paste_after_mapping = ',p'
                " let g:pasta_disabled_filetypes = ['python', 'coffee', 'yaml']
                " let g:pasta_enabled_filetypes = ['ruby', 'javascript', 'css', 'sh']
            " }}}
        " }}}

        " WebAPI {{{
        " }}}

        " TwitVim {{{ Vim Twitter client.
            let twitvim_login = "numbchild:numbchild324"
            "let twitvim_proxy = "proxyhost:proxyport"
            let twitvim_browser_cmd = 'firefox'
            let twitvim_filter_enable = 1
        " }}}
    " }}}

    " [ mail ] {{{
        let mail_minlines = 30 " highlight all the standard elements of an email.

        " mail filetype settings from scripts and plugins.
        " ~/.vim/ftplugin/mail.vim
    " }}}

    " [ translate ] {{{
    " }}}

    " [ format ] {{{
        " Tabular {{{ flexible, intuitive text aligning.
            " Usage:
            " /{char} -> /,
            " /{char}/[range] -> /,/r0 -> [range]: l,r,c => left, right, center.
            " :Tabularize [first_comma,multiple_spaces,]
            " /,/r1c1l0 | /^[^,]*\zs,/r0c0l0
            " Tabularize scripts.
        " }}}

        " vim-align

        " surround {{{ cs, ds, ys[(text object)|iw|W|t(<p>)], (Visual)S
            " cs"', cs'<q>, cst", ds", ysiw], yss(, ds{, ds),
            " Visual(V): S<p class="important">
            " :help surround.txt
        " }}}

        " Abolish {{{ quick find, substitute, abbreviate
        " several variations of a word at once
            " three case variants (foo, Foo, and FOO) are operated on by every command.
            " :Abolish, :Subvert.
        " }}}

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

        " jiangmiao/auto-pairs : insert or delete brackets, parens, quotes in pair

        " delimitMate {{{ auto closing of quotes, parenthesis, brackets etc.
        " }}}

        " formatvim {{{ convert current file to colored HTML, BBCode or whatever.
            " :help format.txt
            " :[{range}]Format format/diffformat/list [{formatName} [{option1} {value1}]
        " }}}
    " }}}

    " [ ASCII Draw ] {{{
        " DrawIt {{{ Ascii drawing plugin: lines, ellipses, arrows, fills, and more!
            " \di to start DrawIt, \ds to stop DrawIt.
            " <left>, <right>, <up>, <down>, -- move and draw left
            " <shift-left> <shift-....> -- move left ...
            " >, <, ^, v, -- draw (-> <- ^ v) arrow.
            " <pgup> <pgdn> ... -- replace with a \, move down and right, and insert a \.
            " \>, \<, \^, \v, -- draw fat (-> <- ^ v) arrow
            " \a           draw arrow based on corners of visual-block
            " \b           draw box using visual-block selected region
            " \e           draw an ellipse inside visual-block
            " \f           fill a figure with some character
            " \h           create a canvas for \a \b \e \l
            " \l           draw line based on corners of visual block
            " \s           adds spaces to canvas
            " <leftmouse>  select visual block
            " <s-leftmouse>  drag and draw with current brush (register)
            " \ra ... \rz  replace text with given brush/register
            " \pa ...      like \ra ... \rz, except that blanks are considered
                            " to be transparent
        " }}}

        " boxdraw
            " Draw diagrams and tables using boxdrawing characters

        " sketch.vim
            " Draw with mouse: boxes, arrows, lines, fills.
            " Transparent/opaque drag and drop.

        " drawing.vim
            " Ascii drawing primitives with mouse in vim GUI (box, arrow, line).

        " ditaa {{{ convert ASCII diagrams into proper bitmap graphics.
        " }}}
    " }}}

    " [ text-object ] {{{
    " }}}

    " [ open with \o ] {{{ open: URL, preview doc: markdown, TeX, etc.
        " Utl {{{ :Utl to open links, files.
            nnoremap <leader>o :Utl<CR>
                " Syntax: no need to escape 'spaces'.
                " use '' contain filename(url) strings. e.g. = ":silent !evince '%p' &"
                " <url:#r=here> id=here | <url:tn=some text> <url:filename.txt#line=-10>
                " <url:foo bar.pdf> | <url:./temp> folder |
                " <url:../plugin/utl.vim#tn=text>
                " <url:file:///home/stb/.vim/plugin/utl.vim>
                " <url:http://www.google.com> www.vim.org
                " <url:man:ls> || <url:config:>
                " download from [1] || [1] www.google.com
                " It brings the benefits of URL-based hyperlinking to plain text,
                " extending the URL syntax for plain text needs.
            let g:utl_opt_verbose=0 " 0=no (default), 1=yes
            let g:utl_opt_highlight_urls='yes' " 'yes' is default / 'no'

            " reference utl_rc.vim
            " HTTP
            " %u, %p for Unix, %P for Windows.
            if !exists("g:utl_cfg_hdl_scm_http_system")
                if has("unix")
                    " let g:utl_cfg_hdl_scm_http_system = 'silent !xdg-open %u' " for ubuntu system
                    "let g:utl_cfg_hdl_scm_http_system = "!xterm -e lynx '%u#%f'" "	console browser
                    " if browser is GUI, don't use "silent" => "silent !browser", will crash terminal vim screen
                    " Check if an instance is already running, and if yes use it, else start firefox.
                    " let g:utl_cfg_hdl_scm_http_system = "silent !firefox -remote 'ping()' && firefox -remote 'openURL( %u )' || firefox '%u#%f' &"
                    " use lightweight browser like : luakit, jumanji, urbl etc.
                    let g:utl_cfg_hdl_scm_http_system = "!luakit '%u#%f' &"
                endif
                let g:utl_cfg_hdl_scm_http=g:utl_cfg_hdl_scm_http_system
            endif
            " http wget:
            let g:utl_cfg_hdl_scm_http__wget="call Utl_if_hdl_scm_http__wget('%u')"
            " scp
            if !exists("g:utl_cfg_hdl_scm_scp")
                let g:utl_cfg_hdl_scm_scp = "silent %d %u"
            endif
            " mailto:
            if !exists("g:utl_cfg_hdl_scm_mailto")
                let g:utl_cfg_hdl_scm_mailto = "!urxvt -e mutt '%u'"
            endif
            " generic
            if !exists("g:utl_cfg_hdl_mt_generic")
                if has("unix")
                    if $WINDOWMANAGER =~? 'kde'
                        let g:utl_cfg_hdl_mt_generic = 'silent !konqueror "%p" &'
                    else
                        let g:utl_cfg_hdl_mt_generic = 'silent !urxvt -e sh -c ranger "%p"'
                    endif
                endif
            endif
            " directory
            let g:utl_cfg_hdl_mt_text_directory__cmd = ':!urxvt -e sh -c ranger "%p"'
            let g:utl_cfg_hdl_mt_text_directory__vim = 'VIM'   " Vim builtin file explorer
            " let g:utl_cfg_hdl_mt_text_directory='VIM'
            " let g:utl_cfg_hdl_mt_text_directory = ':silent !nautilus "%p" &'
            let g:utl_cfg_hdl_mt_text_directory=g:utl_cfg_hdl_mt_text_directory__cmd
            " application/pdf
            let g:utl_cfg_hdl_mt_application_pdf = ":silent !evince '%p' &"
            " TODO application/djvu
            let g:utl_cfg_hdl_mt_application_djvu = ":silent !evince '%p' &"
            " application/chm
            " let g:utl_cfg_hdl_mt_application_chm = ":silent !chmsee '%p' &"
            " application/doc
            let g:utl_cfg_hdl_mt_application_msword = ":silent !libreoffice '%p' &"
        " }}}

        " Elinks {{{ <Leader>o/<leader>O, <C-j>/<C-k> :[n]LMarks :[n]LHist
            " Require: must have Elinks already running in another Terminal
            " window or Tmux/Screen pane.  The plugin talks to the running
            " instance of ELinks.  If you want to change the keybindings, just
            " edit the nnoremap lines at the bottom of the plugin file.
        " }}}
    " }}}

    " [ smalltools ] {{{
        " vimim {{{ Vim Input Method
            " Usage:
            "   - [normal] gi --> no popup menu input.
            "   - [normal] n  --> no popup menu input.
            "   - [insert] i_CTRL-_     --> toggle VimIM
            "   - [insert] i-CTRL-^     --> toggle popup menu
            "   - [insert] i_CTRL-U     --> undo inserted characters
            "   - [insert] i_CTRL-L     --> when .. is set: go to .. mode
            let g:vimim_map = 'm-space'
                " 'c-bslash' -> <C-Bslash> <C-_> (Ctrl-\)
                " 'c-space' -> <C-Space> <C-_> (Ctrl-Space)
                " 'm-space' -> <M-Space> <C-_> (Alt-Space)
                " 'tab' -> <Tab> <C-^>
                " 'tab_as_gi' -> <Tab> <C-R>g:vimim_tab(1)
                " 'tab_as_onekey' -> <Tab> <C-R>=g:vimim_tab(0)
            let g:vimim_mode = 'dynamic'
            " TODO set popup menu height
            let g:vimim_pumheight = 5 " my own branch
            " let g:vimim_plugin = '/path/to/plugin' " plugin path
            let g:vimim_punctuation = 0
                " 1: basic chinese punctuation
                " 2: usual chinese punctuation (default)
                " 3: include " and /
                " 0: do not use chinese punctuation
                " -1: totally close chinese punctuation
            let g:vimim_toggle = 'pinyin,google' " toggle cycle
                " -1: close toggle cycle
                " 'wubi,pinyin'
            let g:vimim_shuangpin = 0 " 双拼
                " 0: disable
                " 'abc': 智能 ABC
                " 'ms': 微软
                " 'nature': 自然码
                " 'plusplus': 拼音加加
                " 'purple': 紫光
                " 'flypy': 小鹤
            let g:vimim_cloud = 'sougou' " 云输入
                " -1 : close cloud
                " 'baidu': 百度云输入
                " 'google': 谷歌云输入
                " 'shougou': 搜狗云输入
                " 'qq': QQ云输入
                " 'sougou.dynamic': 搜狗纯云输入，动态
                " 'sougou.static': 搜狗纯云输入，静态
                " 'qq.[fanti/mixture/fuzzy/wubi]': QQ云输入，开启繁体/混合模式/模糊音/五笔
                " 'qq.shuangpin.[abc/ms/nature/plusplus/purple/flypy]'
            let g:vimim_mycloud = 0
        " }}}

        " fcitx
            " for set small delay
            " set timeoutlen=600
            " Screen: maptimeout, Tmux: escape-time options.
    " }}}

    " [ speak ] {{{
        " VimSpeak {{{ call Microsoft Windows AGENT and speaks (range) selected text.
            " [range]VimSpeak
        " }}}

        " VimSpeak function {{{
            function! VimSpeak() range
                " Concatenate input string.
                let curline = a:firstline
                let strline = ''
                while curline <= a:lastline
                    let tmpline = getline(curline)
                    if tmpline=~ '\m^\a' && strline =~ '\m\a$'
                        let strline = strline .' '. tmpline
                    else
                        let strline = strline . tmpline
                    endif
                    let curline = curline + 1
                endwhile
                " TODO call libcall("VimSpeak.dll", "Speak", strline)
            endfunction

            command! -nargs=0 -range VimSpeak <line1>,<line2>call VimSpeak()
        " }}}
    " }}}

    " [ encrypt ] {{{
        " Edit gpg encrypted files {{{
        " Transparent editing of gpg encrypted files.
        augroup encrypted
            au!
            " First make sure nothing is written to ~/.viminfo while editing
            " an encrypted file.
            autocmd BufReadPre,FileReadPre      *.gpg set viminfo=
            " We don't want a swap file, as it writes unencrypted data to disk
            autocmd BufReadPre,FileReadPre      *.gpg set noswapfile
            " Switch to binary mode to read the encrypted file
            autocmd BufReadPre,FileReadPre      *.gpg set bin
            autocmd BufReadPre,FileReadPre      *.gpg let ch_save = &ch|set ch=2
            autocmd BufReadPre,FileReadPre      *.gpg let shsave=&sh
            autocmd BufReadPre,FileReadPre      *.gpg let &sh='sh'
            autocmd BufReadPre,FileReadPre      *.gpg let ch_save = &ch|set ch=2
            autocmd BufReadPost,FileReadPost    *.gpg '[,']!gpg --decrypt --default-recipient-self 2> /dev/null
            autocmd BufReadPost,FileReadPost    *.gpg let &sh=shsave
            " Switch to normal mode for editing
            autocmd BufReadPost,FileReadPost    *.gpg set nobin
            autocmd BufReadPost,FileReadPost    *.gpg let &ch = ch_save|unlet ch_save
            autocmd BufReadPost,FileReadPost    *.gpg execute ":doautocmd BufReadPost " . expand("%:r")
            " Convert all text to encrypted text before writing
            autocmd BufWritePre,FileWritePre    *.gpg set bin
            autocmd BufWritePre,FileWritePre    *.gpg let shsave=&sh
            autocmd BufWritePre,FileWritePre    *.gpg let &sh='sh'
            autocmd BufWritePre,FileWritePre    *.gpg '[,']!gpg --encrypt --default-recipient-self 2>/dev/null
            autocmd BufWritePre,FileWritePre    *.gpg let &sh=shsave
            " Undo the encryption so we are back in the normal text, directly
            " after the file has been written.
            autocmd BufWritePost,FileWritePost  *.gpg silent u
            autocmd BufWritePost,FileWritePost  *.gpg set nobin
        augroup END
        " }}}

        " Bundle 'git://gitorious.org/vim-gnupg/vim-gnupg.git' {{{
            " :GPGEditRecipients || :GPGViewRecipients
            " :GPGEditOptions || :GPGViewOptions
            " This script implements transparent editing of gpg encrypted files.
            " The filename must have a “.gpg”, “.pgp” or “.asc” suffix.
            " let g:GPGExecutable
            let g:GPGUseAgent = 1
            let g:GPGPreferSymmetric = 0
            let g:GPGPreferArmor = 0
            let g:GPGPreferSign = 0
            " let g:GPGDefaultRecipients
            let g:GPGUsePipes = 0
            " let g:GPGHomedir =
        " }}}

        " TGpg {{{
            " :TGpgEncrypt || encrypting files with GPG. symmetric encryption(default)
            let g:tgpg_gpg_cmd = '/usr/bin/gpg'
            let g:tgpg_gpg_md5_check = 'md5sum'. g:tgpg_gpg_cmd " calculate md5 checksum
            let g:tgpg_gpg_md5_sum = '' " The known md5 checksum of pgp binary.
            let g:tgpg_options = {'verbosefile': '', 'verbose': 0} " during read/write
            let g:tgpg_registers = '"-/_*+' " reset these registers after leaving buffer
            let g:tgpgCachePW = 2 " cache password.
            let g:tgpgBackup = 1 " when writing, make backups.
            let g:tgpgMode = 'symmetric' " symmetric (default), encrypt, clearsign.
            let g:tgpgModes = ['encrypt', 'clearsign', 'symmetric']
            " ----- gpg options -----
            let g:tgpgOptions = '-q --no-secmem-warning'
            let g:tgpgTempSuffix = '.~tGpg~' " the suffix for backups and temporary files.
            let g:tgpgCmdRecipient = '-r "%s"' " RECIPIENTS: How to pass recipients.
            let g:tgpgSepRecipient = ';|/&' " separators user use when naming multiple recipients.
            let g:tgpgCmdPassphrase = '--passphrase "%s"' " PASSPHRASE: pass passphrase.
            let g:tgpgShellQuote = '&'.&shellxquote " more characters should be quoted.
            let g:tgpgInputsecret = 'inputsecret' " A function to input secrets.
        " }}}

        " openssl.vim {{{ Edit OpenSSL encrypted files and turn Vim into a Password Safe!
        " }}}
    " }}}

    " [ ledger / accounting ] {{{
        " ledger {{{
            au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger
        " }}}
    " }}}

    " [ helper ] {{{
    " bestfriend : how long did you edit a file with Vim ?
        " :Bestfriend[s]
    " }}}
" }}}

" vim: foldmethod=marker
