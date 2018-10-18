
" Python doctests -- I got used to one color, then upgraded the Python
" syntax script and it changed it
highlight link Test Special





" ^Z = undo
" (works only in gvim, haven't used this in ages)
imap            <C-Z>           <C-O>u

" Function keys                                                 {{{2

" <F1> = help (default)
"-" Disable F1 -- it gets in the way of F2 on my ThinkPad
""map             <F1>            <Nop>
""imap            <F1>            <Nop>


" <F2> = save
" usually I want :wall, to save all buffers -- but if there's a scratch buffer
" that cannot be saved for silly reasons (like it hasn't been named), then at
" least please save the current buffer, or I'll be sad.
map             <F2>            :update<bar>wall<CR>
imap            <F2>            <C-O><F2>

" <F3> = turn off search highlighting
map             <F3>            :nohlsearch<bar>call ResetStatusLineColor()<CR>
imap            <F3>            <C-O><F3>

" <S-F3> = turn off location list
map             <S-F3>          :lclose<CR>
imap            <S-F3>          <C-O><S-F3>

" <C-F3> = turn off quickfix
map             <C-F3>          :cclose<CR>
imap            <C-F3>          <C-O><C-F3>

" <F4> = next error/grep match
"" depends on plugin/quickloclist.vim
map             <F4>            :FirstOrNextInList<CR>
imap            <F4>            <C-O><F4>
" <S-F4> = previous error/grep match
map             <S-F4>          :PrevInList<CR>
imap            <S-F4>          <C-O><S-F4>
" <C-F4> = current error/grep match
map             <C-F4>          :CurInList<CR>
imap            <C-F4>          <C-O><C-F4>

""" <F5> = close location list (overriden by ImportName in .py files)
""map             <F5>            :lclose<CR>
""imap            <F5>            <C-O><F5>

" <F6> = cycle through buffers
map             <F6>            :bn<CR>
imap            <F6>            <C-O><F6>
" <S-F6> = cycle through buffers backwards
map             <S-F6>          :bN<CR>
imap            <S-F6>          <C-O><S-F6>
" <C-F6> = toggle .c/.h (see above) or code/test (see below)

" <F7> = jump to tag/filename+linenumber in the clipboard
map             <F7>            :ClipboardTest<CR>
imap            <F7>            <C-O><F7>

" <F8> = highlight identifier under cursor
" (some file-type dependent autocommands redefine it)
map             <F8>            :let @/='\<'.expand('<cword>').'\>'<bar>set hls<CR>
imap            <F8>            <C-O><F8>
vnoremap        <F8>
      \ y:let @/='\V'.substitute(escape(@@,"/\\"),"\n","\\\\n","ge")<bar>set hls<CR>

" <F9> = make (often overwritten by filetype plugins)
map             <F9>    :Make<CR>
imap            <F9>    <C-O><F9>
" <S-F9> = toggle quickfix window
map             <S-F9>  :call asyncrun#quickfix_toggle(8)<bar>call mg#statusline_update()<CR>
imap            <S-F9>  <C-O><S-F9>


" <F11> = toggle 'paste'
set pastetoggle=<F11>

" <F12> = show the Unicode name of the character under cursor
" I used to have my own :UnicodeName for this, but tpope/vim-characterize is
" better
map             <F12>           <Plug>(characterize)
" <S-F12> = show highlight group under cursor
map             <S-F12>         :ShowHighlightGroup<CR>
" <C-F12> = show syntax stack under cursor
map             <C-F12>         :ShowSyntaxStack<CR>


" An 'all string' text object w/o surrounding whitespace        {{{2
omap            a'              2i'
omap            a"              2i"
vmap            a'              2i'
vmap            a"              2i"

" Diffget/diffput in visual mode                                {{{2
vmap            \do             :diffget<CR>
vmap            \dp             :diffput<CR>


if has("digraphs")
  digraph -- 8212               " em dash
  digraph `` 8220               " left double quotation mark
  digraph '' 8221               " right double quotation mark
  digraph ,, 8222               " double low-9 quotation mark
endif

" diffoff used to set wrap as a side effect                     {{{2
command! Diffoff                        diffoff | setlocal nowrap

" See :help DiffOrig                                            {{{2
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis \ | wincmd p | diffthis

" Maybe these mappings should be moved into FT_C() ?
map             ,h              :call ToggleHeader()<CR>
map             <C-F6>          ,h
imap            <C-F6>          <C-O><C-F6>

" List all functions in a file                                  {{{2
" functions defined inHOME/.vim/plugin/funcs.vim

" Maybe these mappings should be moved into FT_C() ?
map             ,l              :call ListAllFunctions(1)<CR>
map             ,j              :<C-U>call JumpToFunction(0)<CR>





" where's that non-ascii character?                             {{{2
command! FindNonAscii                   normal /[^\x00-\x7f]<cr>
command! FindControlChars               normal /[\x00-\x08\x0a-\x1f\x7f]<cr>

" where's the next untranslated message in a .po file?          {{{2
command! FindUntranslated               /msgstr ""\ze\n\n

" convert \uXXXX to actual characters                           {{{2
command! -range=% ExpandUnicode         <line1>,<line2>s/\\u\([0-9a-fA-F]\{4}\)/\=nr2char(str2nr(submatch(1), 16))/gc




if has("user_commands")
" like :Explore, only never split windows                       {{{2
" workaround for https://github.com/vim/vim/issues/1506
command! E exec "e" curdir#get()

" how many occurrences of the current search pattern?           {{{2
command! -range=% CountMatches          <line1>,<line2>s///n

" die, trailing whitespace! die!                                {{{2
command! -range=% NukeTrailingWhitespace <line1>,<line2>s/\s\+$//

" where's that non-ascii character?                             {{{2
command! FindNonAscii                   normal /[^\x00-\x7f]<cr>
command! FindControlChars               normal /[\x00-\x08\x0a-\x1f\x7f]<cr>

" where's the next untranslated message in a .po file?          {{{2
command! FindUntranslated               /msgstr ""\ze\n\n

" convert \uXXXX to actual characters                           {{{2
command! -range=% ExpandUnicode         <line1>,<line2>s/\\u\([0-9a-fA-F]\{4}\)/\=nr2char(str2nr(submatch(1), 16))/gc



  " Programming: C                                              {{{3
  " Show [current_function] in the status line for C files
  Plug 'mgedmin/chelper.vim'

" Manual pages (:Man foo)                                       {{{2
if v:version >= 600
  runtime ftplugin/man.vim
endif


" py-test-runner.vim                                            {{{2
map             ,t              :CopyTestUnderCursor<cr>














if has("eval")
  " don't override ^J/^K -- I don't mind ^J, but ^K is digraphs
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
  " <c-tab> doesn't work in gnome-terminal
  let g:UltiSnipsListSnippets="<C-R><tab>"
endif


" Sometimes pytest prepends an 'E' marker at the beginning of a traceback line
set errorformat+=
      \E\ %#File\ \"%f\"\\,\ line\ %l%.%#


set clipboard&
set clipboard-=autoselect       " unnamed + autoselect = can't use Vp to replace
set clipboard^=unnamed          " interoperate with the X clipboard

if v:version >= 700
  set diffopt+=vertical         " split diffs vertically
  set spelllang=en,lt           " spell-check two languages at once
endif


" Persistent undo (vim 7.3+)                                    {{{2
if has("persistent_undo")
  set undofile                  " enable persistent undo
  let &undodir=&backupdir . "/.vimundo" " but don't clutterPWD
  call s:Mkdir(&undodir)
endif




" Behaviour                                                     {{{2
set wildmenu                    " nice tab-completion on the command line
set wildmode=longest,full       " nicer tab-completion on the command line
set hidden                      " side effect: undo list is not lost on C-^
set browsedir=buffer            " :browse e starts in %:h, not inPWD
set autoread                    " automatically reload files changed on disk
set history=1000                " remember more lines of cmdline history
set switchbuf=useopen           " quickfix reuses open windows
set iskeyword-=/                " Ctrl-W in command-line stops at /
set splitright                  " put new splits on the right please
set nrformats-=octal            " Ctrl-A/X on YYYY-0M-0D

set numberwidth=6               " I want it constant width everywhere
set title                       " set xterm title even in Wayland (where autodetect fails)

" I want gvim to look the same as vim in gnome-terminal
set guifont=Ubuntu\ Mono\ 13

" Silence                                                       {{{2
set noerrorbells                " don't beep!
set visualbell                  " don't beep!
set t_vb=                       " don't beep! (but also see t_vb= below)
if exists("&belloff")
  set belloff=all               " don't beep!
endif

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

        " exjumplist | a Vim plugin to provide extra commands for |jumplist|
            nmap <C-M-i>  <Plug>(exjumplist-go-last)
            nmap <C-M-o>  <Plug>(exjumplist-go-first)
            nmap <M-)>  <Plug>(exjumplist-next-buffer)
            nmap <M-(>  <Plug>(exjumplist-previous-buffer)


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

            let g:commentChar = {
                        \ 'vim': '"',
                        \ 'c': '//',
                        \ 'cpp': '//',
                        \ 'sh': '#',
                        \ 'python': '#'
                        \ }
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

                imap <expr> <C-Tab> UltiSnips_ListSnippets() ?
                            \ UltiSnips_ExpandSnippet()
                            \ : pumvisible() ? "\<C-n>" : "\<Tab>"
                inoremap <expr> <C-j> UltiSnips_JumpForwards()
                inoremap <expr> <C-k> UltiSnips_JumpBackwards()
                " }}}


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



            let plugins = [
                        \ 'neocomplcache-clang',
                        \ 'gocode',
                        \ ]

    " [ updating vimrc file on the fly ] {{{
    if has("autocmd")
        augroup SourceVimrc
            au!
            autocmd bufwritepost .vimrc sourceMYVIMRC
        augroup END
    endif
    nnoremap <Leader>ev :splitMYVIMRC<CR>
    nnoremap <Leader>tv :tabeditMYVIMRC<CR>
    nnoremap <Leader>sv :sourceMYVIMRC<CR>
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
            " 'grep -n', 'grep -n* /dev/null'
            set grepprg=grep\ -n\*\ /dev/null
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




    " [ current line ] {{{
    set cursorline
    " plugin: ~/.vim/plugin/CursorLineCurrentWindow.vim
    " }}}


















        set ruler              " show the cursor position all the time in status line.
        set showmode           " show insert, visual, replace mode on last line.
        "
        "
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
        " [ digraph ] {{{
        " entering of graphs
        "   - :digraphs -> show up currently defined digraphs.
        "   - in command line mode with {char1} <BS> {char2}
        "       (without space, those press are continuously)
        "   - in command line mode with CTRL-K {char1} {char2} -- when digraph option is set.
        "   - in command line mode, :digraphs {char1}{char2} {number}...
        " set digraph
        " }}}
        "
        " function! StatusLineSet()
        "     if &l:modified
        "         setlocal statusline=✖
        "     else
        "         setlocal statusline=✔
        "     endif
        " endfunction
        " set statusline=%!StatusLineSet()


        " [ title ] {{{
        ifTERM == "screen-256color"
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

    " [ encrypt ] {{{
    " :X to encrypt.
    " :set key=  to reset the 'key' option to an empty value.
    set cryptmethod=blowfish " zip, blowfish.
    " }}}


    " [ filetype ] {{{
    " ~/.vim/ftplugin/ " source first, then load system files.
    " ~/.vim/after/ftplugin/ " source later, after load system files.
    filetype plugin indent on " combine three into one.
    " }}}










" [[ gVim ]] {{{
" :help gui.txt :help gui_x11.txt
    "MYGVIMRC
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



    " [ completion ] {{{
        " unite.vim {{{ Ultimate interface to unite all sources
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




        " qtmplsel {{{ select a template on creating a new file.
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
    " }}

"" " Define "Ag" command
"" command -nargs=+ -complete=file -bar Ag silent! grep! <args> | cwindow | redraw!
""
"" " Allow quick additions to the spelling dict
"" nnoremap <leader>g :spellgood <c-r><c-w>
""
"" " bind \ (backward slash) to grep shortcut
"" nnoremap \ :Ag<SPACE>
""
"" iab lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit
"" iab llorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi
"" iab lllorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi.  Integer hendrerit lacus sagittis erat fermentum tincidunt.  Cras vel dui neque.  In sagittis commodo luctus.  Mauris non metus dolor, ut suscipit dui.  Aliquam mauris lacus, laoreet et consequat quis, bibendum id ipsum.  Donec gravida, diam id imperdiet cursus, nunc nisl bibendum sapien, eget tempor neque elit in tortor
" Creating folds for tags in HTML
" nnoremap <leader>ft Vatzf



