"----------------------------------------------------------------------------------
" Multiple Repeats
"----------------------------------------------------------------------------------

Macros are well known. Hit qa to record keystrokes to register a, hit q when you’re finished, hit @a to play the macro in register a and @@ to repeat the last macro.
But have you ever heard of :g//? I hadn’t. From the documentation:

To repeat a non-Ex command, you can use the ":normal" command:
  :g/pat/normal {commands}

How is this useful? You could emulate grep -v by deleting lines that match foo:

:g/foo/normal dd

Or you could append all lines matching foo to register a:

:g/foo/normal "Ay

Or you could change foo to bar only on comment lines that begin with a #:

:g/^\s*#/s/foo/bar/g

"----------------------------------------------------------------------------------

To select tags, execute |:Unite| with argument of tag
	:Unite tag
To select files including tags, execute |:Unite| with argument of tag/file
	:Unite tag/file
To select include tags generated like |tagbar| or |ctrlp|, execute
|:Unite| with argument of tag/include.
Note: |neoinclude| is needed.
	:Unite tag/include
Also, you can filter result using parameter.
	:Unite tag:text
<
Other filters: >

        :Unite tag:%            " Current-buffer
        :Unite tag:/pattern     " Filter with pattern

<
This plugin does not block vim because tags' information is aggregated
asynchronously.

        "------------------------------------------------------------------------------------------
        function! s:initialize_ref_viewer()
                nmap <buffer><CR> <Plug>(ref-keyword)
                nmap <buffer>th  <Plug>(ref-back)
                nmap <buffer>tl  <Plug>(ref-forward)
                " nmap <buffer> q<C-w>c
                nmap <buffer>q :q!<CR>
                setlocal nonumber
        endfunction
        autocmd FileType ref call s:initialize_ref_viewer()

"------------------------------------
" memolist.vim
"------------------------------------
""{{{
let g:memolist_path = "$HOME/.vim/memolist"
let g:memolist_memo_suffix = "mkd"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_memo_date = "epoch"
let g:memolist_memo_date = "%D %T"
let g:memolist_prompt_tags = 1
let g:memolist_prompt_categories = 1
let g:memolist_qfixgrep = 0
let g:memolist_vimfiler = 1
let g:memolist_template_dir_path = "$HOME/.vim/memolist"

" mapping
map <Space>mn  :MemoNew<CR>
map <Space>ml  :MemoList<CR>
map <Space>mg  :MemoGrep<CR>
"}}}




"------------------------------------
" matchit.zip
"------------------------------------
"{{{
" % での移動出来るタグを増やす
let
 b:match_words = 
'<div.*>:</div>,<ul.*>:</ul>,<li.*>:</li>,<head.*>:</head>,<a.*>:</a>,<p.*>:</p>,<form.*>:</form>,<span.*>:</span>,<iflame.*>:</iflame>:<if>:<endif>,<while>:<endwhile>,<foreach>:<endforeach>'

let b:match_ignorecase = 1
" let b:match_debug = ?
" let b:match_skip
"}}}


"------------------------------------
" smartword.vim
"------------------------------------
"{{{
map W  <Plug>(smartword-w)
map B  <Plug>(smartword-b)
map E  <Plug>(smartword-e)
"}}}
