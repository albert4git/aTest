        "----------------------------------------------
        match Todo / TST /
        2match Error / ERR /
        3match Title / Albert /
        syn match DoubleSpace " "
        "----------------------------------------------

        if has("digraphs")
                digraph -- 8212               " em dash
                digraph `` 8220               " left double quotation mark
                digraph '' 8221               " right double quotation mark
                digraph ,, 8222               " double low-9 quotation mark
        endif

        "Airline
                let g:ctags_statusline=1
                let generate_tags=1
                set noshowmode
                set showcmd      " Show partial commands in status line and
                "----------------------------------------
                let g:airline#extensions#tabline#enabled = 2
                let g:airline#extensions#tabline#fnamemod = ':t'
                let g:airline#extensions#tabline#buffer_min_count = 1
                let g:airline_section_c = '%{strftime("%D - %H:%M")}'
                "------------------------------------------

        function! LightlineFilename()
                let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
                let modified = &modified ? ' +M' : ''
                return filename . modified
        endfunction

                hi statusline ctermbg=Cyan ctermfg=Black  cterm=bold
                hi StatusLineNC  ctermbg=5 ctermfg=0 cterm=NONE
        "--------------------------------------------------------------
                "for less intrusive signs
                "highlight SignColumn ctermbg=255 guibg=#ffffd7
                "hi clear SignColumn
                "hi SignColumn ctermbg =4
        "--------------------------------------------------------------
                if exists("*gitgutter#highlight#define_highlights")
                        " let vim-gitgutter know we changed the SignColumn colors!
                        call gitgutter#highlight#define_highlights()
                endif
        "number column aka gutter on the left
        "highlight LineNr ctermfg=1 ctermbg=6
        highlight LineNr ctermfg=5

        "cursor column
        "highlight CursorColumn ctermbg=2
        "highlight CursorLine ctermbg=1 cterm=bold
        "highlight CursorLineNr ctermbg=5 cterm=bold

        "easier on the eyes
        highlight Folded ctermbg=0

        "set fillchars=vert:│,fold:-
        highlight VertSplit cterm=reverse ctermbg=150



        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        color solarized             " Load a colorscheme

        set tabpagemax=15               " Only show 15 tabs
        set showmode                    " Display the current mode

        set cursorline                  " Highlight current line

        set colorcolumn=1,8,16,24,100,120
        highlight clear ColorColumn
        "highlight ColorColumn term=reverse ctermbg=1 guibg=DarkGray
        highlight ColorColumn ctermbg=DarkGray

        highlight clear SignColumn      " SignColumn should match background
        highlight clear LineNr          " Current line number row will have same background color in relative mode
        "highlight clear CursorLineNr    " Remove highlight color from current line number

        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode

        "?" if has('statusline')
        "?"         set laststatus=2
        "?"         " Broken down into easily includeable segments
        "?"         set statusline=%<%f\                     " Filename
        "?"         set statusline+=%w%h%m%r                 " Options
        "?"         set statusline+=%{fugitive#statusline()} " Git Hotness
        "?"         set statusline+=\ [%{&ff}/%Y]            " Filetype
        "?"         set statusline+=\ [%{getcwd()}]          " Current dir
        "?"         set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
        "?" endif

        "suppress intro message because the above makes it look bad
                set shortmess+=I
                highlight ErrorMsg              guifg=red guibg=white

        "fold column aka gutter on the left
                highlight FoldColumn ctermbg=5 ctermfg=0 guibg=#ffffd7

        "easier on the eyes
                highlight Folded ctermbg=6 guibg=#ffffaf

        "cursor column
                highlight CursorColumn ctermbg=7 guibg=#ffffd7

        "avoid invisible color combination (red on red)
                highlight DiffText ctermbg=1

        " gutter on the right of the text
                highlight ColorColumn ctermbg=5

        hi Search ctermbg=yellow
        "-------------------------------------------------------------------------------
        "number column aka gutter on the left
        highlight LineNr ctermfg=1 ctermbg=5
        "highlight LineNr ctermfg=5
        "highlight CursorColumn ctermbg=2
        "highlight CursorLine ctermbg=1 cterm=bold
        "highlight CursorLineNr ctermbg=5 cterm=bold

        "easier on the eyes
        highlight Folded ctermbg=0

        "set fillchars=vert:│,fold:-
        highlight VertSplit cterm=reverse ctermbg=150
