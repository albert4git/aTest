"-"-"-"-"-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-NeoVimMix65FZF-NV-Unite"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"
" File: start1ninit19.vim
" Author: red
" Last Modified: 11 Feb 2019
"======================================================================================================================

        "--------------------------------------------------------------------------
        autocmd! filetype python setlocal formatoptions-=t " But disable autowrapping as it is super annoying
        "--------------------------------------------------------------------------
        " PEP8 compliance (set 1 tab = 4 chars explicitly, even if set earlier, as it is important)
        autocmd! filetype python setlocal textwidth=149
        autocmd! filetype python match ErrorMsg '\%>120v.\+'

        " function! s:UsingPython3()
        "         if has('python3')
        "                 return 1
        "         endif
        "         return 0
        " endfunction

        " let s:using_python3 = s:UsingPython3()
        " let s:python_until_eof = s:using_python3 ? "python3 << EOF" : "python << EOF"
        " let s:python_command = s:using_python3 ? "py3 " : "py "

"-AAA15-Plug2Start---------------------------------------------------------------------------------------------{{{
call plug#begin('~/.config/nvim/plugged/')
        Plug 'tyru/capture.vim'
        Plug 'thinca/vim-quickrun'
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
        "----------------------------------------------------------------------------------- 
        "----------------------------------------------------------------------------------- 
        "----------------------------------------------------------------------------------- 
        "----------------------------------------------------------------------------------
        Plug 'tpope/vim-sleuth'         " indet reight ?
        "----------------------------------------------------------------------------------
        Plug 'junegunn/gv.vim'
                " o or <cr> on a commit to display the content of it
                " o or <cr> on commits to display the diff in the range
                " O opens a new tab instead
                " gb for :Gbrowse
                " ]] and [[ to move between commits
                " . to start command-line with :Git [CURSOR] SHA à la fugitive
                " q to close
        "--------------------------------------------------------------------------------- 
        Plug 'airblade/vim-gitgutter'
                nmap ]c <Plug>GitGutterNextHunk
                nmap [c <Plug>GitGutterPrevHunk
        "------------------------------------------------------
                nmap hp <Plug>GitGutterPreviewHunk
                nmap hs <Plug>GitGutterStageHunk
                nmap hu <Plug>GitGutterUndoHunk
        "---------------------------------------------------------------------------------- 
        Plug 'int3/vim-extradite'
                ":Extradite | :Extradite! -- vertical.
                let g:extradite_width = 60
                let g:extradite_showhash = 1 "show abbre commit hashes.
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
        "---NoAutoClose-YCM----------------------------------------------------------------
call plug#end()
"-5plug2Stop-}}}

"-AAA3-Tag8------------------------------------------------------------------------------------------------{{{
        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
                let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
        set tags+=tags,./tags,../tags,../../tags,../../../tags,../../../../tags,~/.nvimtags


"-AAA3-Spell------------------------------------------------------------------------------------------------{{{
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
"-3--}}}





"-AAA3-Tag8------------------------------------------------------------------------------------------------{{{
        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
                let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
        set tags+=tags,./tags,../tags,../../tags,../../../tags,../../../../tags,~/.nvimtags

        "------------------------------------------------------------------------------
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
"-3--}}}







