                " s: Windows and buffers(High priority)
                " The prefix key.
                nnoremap    [Window]   <Nop>
                nmap    s [Window]
                nnoremap <silent> [Window]p  :<C-u>vsplit<CR>:wincmd w<CR>
                nnoremap <silent> [Window]o  :<C-u>only<CR>

                " Pushing
                "nnoremap <leader>Go :Start! git push origin<cr>
                "nnoremap <leader>Gu :Start! git push upstream<cr>
                " HTML tag closing
                "inoremap <C-_> <space><bs><esc>:call InsertCloseTag()<cr>a
                "?noremap <leader>a =ip
                "?noremap cp yap<S-}>p
                "nnoremap g; g;zz
                "nnoremap g, g,zz
                "nnoremap <left>  :cprev<cr>zvzz
                "nnoremap <right> :cnext<cr>zvzz
                "nnoremap <up>    :lprev<cr>zvzz
                "nnoremap <down>  :lnext<cr>zvzz

        " e: Change basic commands
        " The prefix key.
        nnoremap [Alt]   <Nop>
        nmap    S  [Alt]
        "Test[Alt]
        nnoremap <silent> [Alt]w :w<cr>
        nnoremap <silent> [Alt]s :<C-u>update<CR>
        "Test[Alt]
        nnoremap <silent> <m-w> :w<cr>
        nnoremap <silent> <m-s> :<C-u>update<CR>
        "Test[Alt]
        nnoremap <silent> <A-w> :w<cr>
        nnoremap <silent> <A-s> :<C-u>update<CR>
        "-Indent-paste------------------------------------------
        nnoremap <silent> [Alt]p o<Esc>pm``[=`]``^
        nnoremap <silent> [Alt]P O<Esc>Pm``[=`]``^
        " Useless command.
        " nnoremap M  m
        " Smart <C-f>, <C-b>.
        noremap <expr> <C-f> max([winheight(0) - 2, 1])
        \ . "\<C-d>" . (line('w$') >= line('$') ? "L" : "M")
        noremap <expr> <C-b> max([winheight(0) - 2, 1])
        \ . "\<C-u>" . (line('w0') <= 1 ? "H" : "M")

        " silent! digr -. 8230 "U+2026=…    HORIZONTAL ELLIPSIS
        " silent! digr !, 8816 "U+2270=≰    NEITHER LESS-THAN NOR EQUAL TO
        " silent! digr !. 8817 "U+2271=≱    NEITHER GREATER-THAN NOR EQUAL TO
        " silent! digr xs 8339 "U+2093=ₓ    SUBSCRIPT X
        " a>, i], etc...
        " <angle>
        onoremap aa  a>
        xnoremap aa  a>
        onoremap ia  i>
        xnoremap ia  i>

        " [rectangle]
        onoremap ar  a]
        xnoremap ar  a]
        onoremap ir  i]
        xnoremap ir  i]
        " Use ag for Search
        if executable('ag')
                let g:unite_source_grep_command = 'ag'
                let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
                let g:unite_source_grep_recursive_opt = ''
        endif
        call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
                                \ 'ignore_pattern', join([
                                \ '\.git/',
                                \ ], '\|'))
        let g:unite_enable_start_insert = 1
        let g:unite_split_rule = "botright"
        let g:unite_force_overwrite_statusline = 0
        let g:unite_winheight = 10
        let g:unite_source_history_yank_enable = 1
        call unite#filters#matcher_default#use(['matcher_fuzzy'])
        call unite#filters#sorter_default#use(['sorter_rank'])
        call unite#custom#source('file_rec/async','sorters','sorter_rank')
        autocmd FileType unite call s:unite_settings()
        function! s:unite_settings()
                let b:SuperTabDisabled=1
                imap <buffer> <C-j>   <Plug>(unite_select_next_line)
                imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
                imap <silent><buffer><expr> <C-x> unite#do_action('split')
                imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
                imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

                nmap <buffer> <ESC> <Plug>(unite_exit)
        endfunction

"---------------------------------------------------------------------------------
if has("autocmd")
        " Kill visual bell! kill!
        augroup GUI
                au!
                au GUIEnter * set t_vb=
        augroup END

        augroup LastPositionJump
                au!
                au BufReadPost *
                                        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
                                        \ |   exe "normal! g`\""
                                        \ | endif
        augroup END
endif

"---------------------------------------------------------------------------------
"---------------------------------------------------------------------------------
if ! exists('g:TagHighlightSettings')
        let g:TagHighlightSettings = {}
endif

let g:TagHighlightSettings['ForcedPythonVariant'] = 'if_pyth'
let g:TagHighlightSettings['CtagsExecutable'] = 'etags'

let g:TagHighlightSettings['TagFileName'] = 'tags'
nmap <leader>re :UpdateTypesFile<CR>

"---------------------------------------------------------------------------------
"cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
"map <leader>e  :e %%

"-------------------------------------------------------------------------------
" nnoremap <C-a> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
"-------------------------------------------------------------------------------
" nnoremap <silent> R :GitGrep <cword><CR>
"----------------------------------------------------------------------------------

"---------------------------------------------------------------------------------
"#one#
vnoremap <F5>  i(
vnoremap <S-F5>  a(
"#two#
vnoremap <F6> ipk$
vnoremap <S-F6> ip
vnoremap <C-F6> ap
"#three#
vnoremap <F7> i{k$
vnoremap <S-F7> i{
vnoremap <C-F7> a{k$
"#vier#
inoremap <C-q> ()<esc>i
inoremap <C-w> {<esc>o}<esc>O
"---------------------------------------------------------------------------------
map  <A-!>  1gt
map  <A-@>  2gt
map  <A-#>  3gt
map  <A-$>  4gt
map  <A-%>  5gt
map  <A-^>  6gt
map  <A-&>  7gt
map  <A-*>  8gt

"nnoremap K *N:grep! "\b<c-r><c-w>\b"<cr>:cw<cr>
"bind \ (backward slash) to grep shortcut
"nnoremap \ :Ag<SPACE>

nnoremap <leader>l :lgrep -R <cword> .<cr>
nmap <Leader>m [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

"-???- XXX YankRing stuff
        let g:yankring_history_dir = '$HOME/.vim/tmp'

"XXX ??? ToDo Insert line under cursor (builtin in vim 8.0.1787)
        cnoremap        <C-R><C-L>      <C-R>=getline(".")<CR>

"Alt-Backspace  deletes word backwards
        cnoremap        <A-BS>          <C-W>

"Do not lose -complete all- (gvim-only)
        cnoremap        <C-S-A>         <C-A>

" Define operator-pending mappings to quickly apply commands to function names
"XXX and/or parameter lists in the current line
        onoremap inf :<c-u>normal! 0f(hviw<cr>
        onoremap anf :<c-u>normal! 0f(hvaw<cr>
        onoremap in( :<c-u>normal! 0f(vi(<cr>
        onoremap an( :<c-u>normal! 0f(va(<cr>

"-Next--TAG---
        onoremap int :<c-u>normal! 0f<vit<cr>
        onoremap ant :<c-u>normal! 0f<vat<cr>

" Function argument selection (change "around argument", change "inside argument")
        onoremap ia :<c-u>execute "normal! ?[,(]\rwv/[),]\rh"<cr>
        vnoremap M :<c-u>execute "normal! ?[,(]\rwv/[),]\rh"<cr>

"1. vnew - collect words lines
map <C-F2> "zyiw<C-w>wo<Esc>"zp<C-w>W
map <S-F2> "zY<C-w>wo<Esc>"zp<C-w>W


" Agutomatically clean / delete whitespace, trailing dos returns
autocmd BufRead * silent! %s/[\r \t]\+\$//

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        silent! %s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfun
"#==>
if has("autocmd")
        autocmd BufWritePre *.vim,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


-AAA12-[unite-completion]--------------------------------------------------------------{{{
unite.vim Ultimate interface to unite all sources
  - :Unite [{options}] {source's'}
      - {source's'}
          - parameters of source
              - e.g. file:foo:bar -- here ['foo', 'bar'] is parameters
              - e.g. file:foo\:bar -- use \ to escape
              - e.g. file:foo::bar -- ['foo', '', 'bar']
  - press 'I' to search after prompt '>'
      - *word,
      - **/foo (directory recursively)
      - foo bar (AND)
      - foo|bar (OR)
      - foo !bar (negative)
  - :UniteResume, :UniteBookmarkAdd
let g:unite_no_default_keymappings = 1 " don't map default key mappings
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
let g:unite_quick_match_table = {}
let g:unite_data_directory = expand('~/.unite')
-12-Unite-}}}

if neobundle#tap('unite')
  " enable yank history
  let g:unite_source_history_yank_enable         = 1
  let g:unite_source_history_yank_save_clipboard = 1
  let g:unite_source_mark_marks = "abcdefghijklmnopqrstuvwxyz"
        \ . "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.'`^<>[]{}()\""
  let g:yankring_replace_n_pkey                  = 'gp'
  let g:yankring_replace_n_nkey                  = 'gn'
  let g:unite_marked_icon                        = '✓'
  " use ag in unite grep source
  if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
          \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
          \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
  endif
  " change prompt and start NOT in insert mode
  call unite#custom#profile('default', 'context',
        \ { 'prompt': '➤ ',
        \   'start_insert' : '0'})
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  nnoremap [unite]   <nop>
  nmap     <leader>f [unite]
  nnoremap <silent>  [unite]a :<c-u>Unite -toggle -buffer-name=files
        \ file_rec/async<cr><c-u>
  nnoremap <silent>  [unite]b :<c-u>Unite -toggle -buffer-name=file
        \ file<cr>
  nnoremap <silent>  [unite]c :<c-u>Unite -toggle -buffer-name=command\ history
        \ history/command history/search<cr>
  nnoremap <silent>  [unite]d :<c-u>Unite -toggle -buffer-name=mru\ directory
        \ neomru/directory<cr><c-u>
  nnoremap <silent>  [unite]f :<c-u>Unite -toggle -buffer-name=buffer
        \ buffer<cr><c-u>
  nnoremap <silent>  [unite]g :<c-u>Unite -toggle -buffer-name=grep
        \ grep:<cr>
  nnoremap <silent>  [unite]h :<c-u>Unite -toggle -buffer-name=yank\ history
        \ history/yank register<cr>
  nnoremap <silent>  [unite]l :<c-u>Unite -toggle -buffer-name=line
        \ line<cr>
  nnoremap <silent>  [unite]m :<c-u>Unite -toggle -buffer-name=mark
        \ mark<cr>
  nnoremap <silent>  [unite]o :<c-u>Unite -toggle -buffer-name=outline
        \ outline<cr>
  nnoremap <silent>  [unite]p :<c-u>Unite -toggle -buffer-name=help
        \ help<cr>
  nnoremap <silent>  [unite]k :<c-u>Unite -quick-match -buffer-name=quick\ match
        \ -no-split buffer<cr>
  nnoremap <silent>  [unite]r :<c-u>Unite -toggle -buffer-name=register
        \ register<cr>
  nnoremap <silent>  [unite]s :<c-u>Unite -toggle -buffer-name=session
        \ session<cr>
  nnoremap <silent>  [unite]t :<c-u>Unite -toggle -buffer-name=tag
        \ tag<cr>
  nnoremap <silent>  [unite]u :<c-u>Unite -toggle -buffer-name=mru\ file
        \ neomru/file<cr>



"?" "-AAA13-CtrlP---------------------------------------------------------------------------{{{

let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 20
let g:ctrlp_extensions = ['tag']

nnoremap ; :CtrlPBuffer<CR>
let g:ctrlp_map = '<leader>,'
nnoremap <leader>. :CtrlPTag<cr>

let g:ctrlp_prompt_mappings = {
      \ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
      \ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
      \ 'PrtHistory(-1)':       ['<c-n>'],
      \ 'PrtHistory(1)':        ['<c-p>'],
      \ 'ToggleFocus()':        ['<c-tab>'],
      \ }

let my_ctrlp_ffind_command = "ffind --semi-restricted --dir %s --type e -B -f"
let g:ctrlp_user_command = my_ctrlp_ffind_command

"-13-CtrlP-}}}


        " Create missing directory on save                              {{{2
        augroup MkDirOnSave
                au!
                au BufWritePre * call mkdirondemand#doit()
        augroup END
