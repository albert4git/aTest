        "-AAA12-[unite-completion]--------------------------------------------------------------{{{
                " unite.vim Ultimate interface to unite all sources
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
                "   - :UniteResume, :UniteBookmarkAdd
                " let g:unite_no_default_keymappings = 1 " don't map default key mappings
                "let g:unite_update_time = 500 " update time interval of candidates
                "let g:unite_enable_start_insert = 1 " startup into insert mode
                "let g:unite_split_rule = "topleft"
                "let g:unite_enable_split_vertically = 0 " 1:split unite window vertically
                "let g:unite_winheight = 15
                "let g:unite_winwidth = 50
                "let g:unite_kind_openable_cd_command = "cd"
                "let g:unite_kind_openable_lcd_command = "lcd"
                "let g:unite_cursor_line_highlight = "PmenuSel"
                "let g:unite_abbr_highlight = "Normal"
                "let g:unite_enable_use_short_source_names = 0
                "let g:unite_quick_match_table = {}
                "let g:unite_data_directory = expand('~/.unite')
        "-12-Unite-}}}

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
