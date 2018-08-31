



n  `<CR>       & <SNR>115_:.Dispatch<CR>
n  `]          * :<C-U>call signature#mark#Goto("next", "spot", "alpha")<CR>
n  `[          * :<C-U>call signature#mark#Goto("prev", "spot", "alpha")<CR>
n  `!          & <SNR>115_:.Dispatch!
n  `?          & <SNR>115_:.FocusDispatch<CR>
n  `<Space>    & <SNR>115_:.Dispatch<Space>
   <C-_>a        <Plug>TComment_<C-_>a
   <C-_>b        <Plug>TComment_<C-_>b
   <C-_>ca       <Plug>TComment_<C-_>ca
   <C-_>cc       <Plug>TComment_<C-_>cc
   <C-=>         <C-W>=
   <C-F3>        :cclose<CR>
   <C-F4>        :CurInList<CR>
   <C-F8>        :copen<CR>
   <C-F9>        :lopen<CR>
   <C-_>i        <Plug>TComment_<C-_>i
   <C-K>         <C-W>k<C-W>_
   <C-L>         <C-W>l<C-W>
   <C-_>n        <Plug>TComment_<C-_>n
   <C-_>p        <Plug>TComment_<C-_>p
   <C-_>r        <Plug>TComment_<C-_>r
   <C-_><Space>   <Plug>TComment_<C-_><Space>
   <C-_>s        <Plug>TComment_<C-_>s
   <F10>         :call OnlineDoc8()<CR>
   <F2>        *@<Esc>:help <C-R><C-W><CR>
   <F4>          :FirstOrNextInList<CR>
   <F9>          :Make<CR>
n  <C-A>       * :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
n  <C-Down>    * :m .+1<CR>==
n  <C-E>       * :e#<CR>
n  <CR>        * o<Esc>
n  <C-]>       * :silent! call JumpToTag()<CR>
n  <C-\>       * :Unite line<CR>
n  <C-Up>      * :m .-2<CR>==
n  <C-U>         :Unite file buffer bookmark file_mru <CR>
n  <C-W>m        <Plug>(zoom-toggle)
n  <C-W>u      * :call undoquit#UndoQuitWindow()<CR>
n  <Esc><Esc>  * :<C-U>set nopaste<CR>:nohlsearch<CR>
n  <F12>       * :TagbarToggle<CR>
n  <F2>        * :call Marvim_search()<CR>
n  <F3>        * :call Marvim_macro_store()<CR>
   <NL>          <C-W>j<C-W>_
n  <M-Down>    * :resize -3<CR>
n  <M-Left>    * :vertical resize -3<CR>
n  <M-Right>   * :vertical resize +3<CR>
n  <M-Up>      * :resize +3<CR>
no <C-_>1        <Plug>TComment_<C-_>1
no <C-_>2        <Plug>TComment_<C-_>2
no <C-_>3        <Plug>TComment_<C-_>3
no <C-_>4        <Plug>TComment_<C-_>4
no <C-_>5        <Plug>TComment_<C-_>5
no <C-_>6        <Plug>TComment_<C-_>6
no <C-_>7        <Plug>TComment_<C-_>7
no <C-_>8        <Plug>TComment_<C-_>8
no <C-_>9        <Plug>TComment_<C-_>9
no <C-_><C-_>    <Plug>TComment_<C-_><C-_>
no <C-F6>        ,h
no <Plug>TComment_<C-_>1 * :call tcomment#SetOption("count", 1)<CR>
no <Plug>TComment_<C-_>2 * :call tcomment#SetOption("count", 2)<CR>
no <Plug>TComment_<C-_>3 * :call tcomment#SetOption("count", 3)<CR>
no <Plug>TComment_<C-_>4 * :call tcomment#SetOption("count", 4)<CR>
no <Plug>TComment_<C-_>5 * :call tcomment#SetOption("count", 5)<CR>
no <Plug>TComment_<C-_>6 * :call tcomment#SetOption("count", 6)<CR>
no <Plug>TComment_<C-_>7 * :call tcomment#SetOption("count", 7)<CR>
no <Plug>TComment_<C-_>8 * :call tcomment#SetOption("count", 8)<CR>
no <Plug>TComment_<C-_>9 * :call tcomment#SetOption("count", 9)<CR>
no <Plug>TComment_<C-_><C-_> * :TComment<CR>
nos<Plug>TComment_<Space>__ * :TComment<CR>
nos<Space>__     <Plug>TComment_ __
nox<C-H>         <C-W>h<C-W>
n  <Plug>AgAction * :set hlsearch<CR>:<C-U>set opfunc=<SNR>64_Ag<CR>g@
n  <Plug>AgActionWord * :set hlsearch<CR>:<C-U>set opfunc=<SNR>64_Ag<CR>g@iw
n  <Plug>AngularGfJump * :<C-U>exe <SNR>106_FindFileBasedOnAngularServiceUnderCursor('open')<CR>
n  <Plug>AngularGfSplit * :<C-U>exe <SNR>106_FindFileBasedOnAngularServiceUnderCursor('split')<CR>
n  <Plug>AngularGfTabjump * :<C-U>exe <SNR>106_FindFileBasedOnAngularServiceUnderCursor('tabedit')<CR>
n  <Plug>BookmarkAnnotate * :BookmarkAnnotate<CR>
n  <Plug>BookmarkClearAll * :BookmarkClearAll<CR>
n  <Plug>BookmarkClear * :BookmarkClear<CR>
n  <Plug>BookmarkMoveDown * :<C-U>BookmarkMoveDown v:count<CR>
n  <Plug>BookmarkMoveToLine * :<C-U>BookmarkMoveToLine v:count<CR>
n  <Plug>BookmarkMoveUp * :<C-U>BookmarkMoveUp v:count<CR>
n  <Plug>BookmarkNext * :BookmarkNext<CR>
n  <Plug>BookmarkPrev * :BookmarkPrev<CR>
n  <Plug>BookmarkShowAll * :BookmarkShowAll<CR>
n  <Plug>BookmarkToggle * :BookmarkToggle<CR>
n  <Plug>ChangeCommentary * c:<C-U>call <SNR>93_textobject(1)<CR>
n  <Plug>Coerce * :<C-U>call <SNR>95_coerce(nr2char(getchar()))<CR>
n  <Plug>(CommandTBuffer) * :CommandTBuffer<CR>
n  <Plug>(CommandTCommand) * :CommandTCommand<CR>
n  <Plug>(CommandT) * :CommandT<CR>
n  <Plug>(CommandTHelp) * :CommandTHelp<CR>
n  <Plug>(CommandTHistory) * :CommandTHistory<CR>
n  <Plug>(CommandTJump) * :CommandTJump<CR>
n  <Plug>(CommandTLine) * :CommandTLine<CR>
n  <Plug>(CommandTMRU) * :CommandTMRU<CR>
n  <Plug>(CommandTSearch) * :CommandTSearch<CR>
n  <Plug>(CommandTTag) * :CommandTTag<CR>
n  <Plug>CommentaryLine * <SNR>93_go() . '_'
n  <Plug>Commentary * <SNR>93_go()
n  <Plug>CommentaryUndo   :echoerr "Change your <Plug>CommentaryUndo map to <Plug>Commentary<Plug>Commentary"<CR>
n  <Plug>CSurround * :<C-U>call <SNR>96_changesurround(1)<CR>
n  <Plug>Csurround * :<C-U>call <SNR>96_changesurround()<CR>
n  <Plug>Dsurround * :<C-U>call <SNR>96_dosurround(<SNR>96_inputtarget())<CR>
n  <Plug>(fzf-maps-n) * :<C-U>call fzf#vim#maps('n', 0)<CR>
n  <Plug>GitGutterNextHunk * &diff ? ']c' : ":\<C-U>execute v:count1 . 'GitGutterNextHunk'\<CR>"
n  <Plug>GitGutterPrevHunk * &diff ? '[c' : ":\<C-U>execute v:count1 . 'GitGutterPrevHunk'\<CR>"
n  <Plug>GitGutterPreviewHunk * :GitGutterPreviewHunk<CR>
n  <Plug>GitGutterStageHunk * :GitGutterStageHunk<CR>
n  <Plug>GitGutterUndoHunk * :GitGutterUndoHunk<CR>
n  <Plug>(LoupeClearHighlight) * :nohlsearch| call loupe#private#clear_highlight()<CR>
n  <Plug>(LoupeGOctothorpe) * g#zvzz:call loupe#hlmatch()<CR>
n  <Plug>(LoupeGStar) * g*zvzz:call loupe#hlmatch()<CR>
n  <Plug>(Loupen) * nzvzz:call loupe#hlmatch()<CR>
n  <Plug>(LoupeN) * Nzvzz:call loupe#hlmatch()<CR>
n  <Plug>(LoupeOctothorpe) * #zvzz:call loupe#hlmatch()<CR>
n  <Plug>(LoupeStar) * *zvzz:call loupe#hlmatch()<CR>
n  <Plug>NetrwBrowseX * :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())<CR>
n  <Plug>(quickrun) * :<C-U>QuickRun -mode n<CR>
n  <Plug>(quickrun-op) * :<C-U>set operatorfunc=quickrun#operator<CR>g@
n  <Plug>ReplaceWithRegisterExpressionSpecial * :<C-U>let g:ReplaceWithRegister_expr = getreg('=')|execute 'normal!' v:count1 . '.'<CR>
n  <Plug>ReplaceWithRegisterLine * :<C-U>call setline('.', getline('.'))|execute 'silent! call repeat#setreg("\<Plug>ReplaceWithRegisterLine", v:register)'|call ReplaceWithRegister#SetRegister()|if ReplaceWithRegister#IsExprReg()|    let g:ReplaceWithRegister_expr = getreg('=')|endif|execute 'normal! V' . v:count1 . "_\<Esc>"|call ReplaceWithRegister#Operator('visual', "\<Plug>ReplaceWithRegisterLine")<CR>
n  <Plug>ReplaceWithRegisterOperator * ReplaceWithRegister#OperatorExpression()
n  <Plug>ReplaceWithRegisterVisual * :<C-U>call setline('.', getline('.'))|execute 'silent! call repeat#setreg("\<Plug>ReplaceWithRegisterVisual", v:register)'|call ReplaceWithRegister#SetRegister()|if ReplaceWithRegister#IsExprReg()|    let g:ReplaceWithRegister_expr = getreg('=')|endif|execute 'normal!' ReplaceWithRegister#VisualMode()|call ReplaceWithRegister#Operator('visual', "\<Plug>ReplaceWithRegisterVisual")<CR>
n  <Plug>(scratch-insert-clear) * :call scratch#insert(1)<CR>
n  <Plug>(scratch-insert-reuse) * :call scratch#insert(0)<CR>
n  <Plug>SurroundRepeat * .
n  <Plug>TComment_Commentb * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_Commentb<CR>g@
n  <Plug>TComment_Commentc * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_Commentc<CR>g@$
n  <Plug>TComment_Comment * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_Comment<CR>g@
n  <Plug>TComment_Commentl * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_Commentl<CR>g@$
n  <Plug>TComment_gc1c * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc1c<CR>g@
n  <Plug>TComment_gc2c * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc2c<CR>g@
n  <Plug>TComment_gc3c * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc3c<CR>g@
n  <Plug>TComment_gc4c * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc4c<CR>g@
n  <Plug>TComment_gc5c * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc5c<CR>g@
n  <Plug>TComment_gc6c * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc6c<CR>g@
n  <Plug>TComment_gc7c * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc7c<CR>g@
n  <Plug>TComment_gc8c * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc8c<CR>g@
n  <Plug>TComment_gc9c * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc9c<CR>g@
n  <Plug>TComment_gcb * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gcb<CR>g@
n  <Plug>TComment_gcc * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gcc<CR>g@$
n  <Plug>TComment_gc * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc<CR>g@
n  <Plug>TComment_gC * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gC<CR>g@
n  <Plug>TComment_Uncommentb * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_Uncommentb<CR>g@
n  <Plug>TComment_Uncommentc * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_Uncommentc<CR>g@$
n  <Plug>TComment_Uncomment * :<C-U>call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_Uncomment<CR>g@
n  <Plug>(vimfiler_create) * :<C-U>VimFilerCreate<CR>
n  <Plug>(vimfiler_simple) * :<C-U>VimFilerSimple<CR>
n  <Plug>(vimfiler_split_create) * :<C-U>VimFilerSplit<CR>
n  <Plug>(vimfiler_split_switch) * :<C-U><SNR>112_call_vimfiler({ 'split' : 1 }, '')<CR>
n  <Plug>(vimfiler_switch) * :<C-U>VimFiler<CR>
n  <Plug>(vimshell_create) * :<C-U>VimShellCreate<CR>
n  <Plug>(vimshell_split_create) * :<C-U>call <SNR>114_call_vimshell({'split' : 1, 'create' : 1}, '')<CR>
n  <Plug>(vimshell_split_switch) * :<C-U>call <SNR>114_call_vimshell({'split' : 1}, '')<CR>
n  <Plug>(vimshell_switch) * :<C-U>VimShell<CR>
n  <Plug>YSsurround * <SNR>96_opfunc2('setup').'_'
n  <Plug>Yssurround * '^'.v:count1.<SNR>96_opfunc('setup').'g_'
n  <Plug>YSurround * <SNR>96_opfunc2('setup')
n  <Plug>Ysurround * <SNR>96_opfunc('setup')
n  <Plug>(zoom-toggle) * :call zoom#toggle()<CR>
n  <SNR>115_:. & :<C-R>=getcmdline() =~ ',' ? "\0250" : ""<CR>
n  <SNR>209_:  * :<C-U><C-R>=v:count ? v:count : ''<CR>
n  <Space>b      <Plug>(CommandTBuffer)
n  <Space>;    * :<C-R>=getline(".")<CR>
n  <Space>cs   * :ThesaurusQueryReplaceCurrentWord<CR>
n  <Space>.    * :CtrlPTag<CR>
n  <Space>,    * :<C-U>CtrlP<CR>
n  <Space>c    * /\v^[<|=>]{7}([^=].+)?$<CR>
n  <Space>d    * :YcmShowDetailedDiagnostic<CR>
n  <Space>f    * :Unite -silent -no-split -start-insert -auto-preview line<CR>
n  <Space>gA   * :GitAdd <cfile><CR>
n  <Space>ga   * :GitAdd<CR>
n  <Space>gb   * :GitBlame<CR>
n  <Space>gc   * :GitCommit<CR>
n  <Space>gD   * :GitDiff --cached<CR>
n  <Space>gd   * :GitDiff<CR>
n  <Space>g    * :grep -R <cword> .<CR>
n  <Space>gl   * :GitLog<CR>
n  <Space>gp   * :GitPullRebase<CR>
n  <Space>gs   * :GitStatus<CR>
n  <Space>gw   * :GitGrepWord<CR>
n  <Space>hp    @<Plug>GitGutterPreviewHunk
n  <Space>hs     <Plug>GitGutterStageHunk
n  <Space>hu     <Plug>GitGutterUndoHunk
n  <Space>i    * :Unite -silent history/yank<CR>
n  <Space>j      <Plug>(CommandTJump)
n  <Space>l    * :lgrep -R <cword> .<CR>
n  <Space>m    * :Unite -silent file_mru<CR>
n  <Space>n      <Plug>(LoupeClearHighlight)
n  <Space>re     :UpdateTypesFile<CR>
n  <Space><Space> * :Ag <cword> .<CR>
n  <Space>tb     :cal trans#between(expand("<cword>"))<CR>
n  <Space>to     :cal trans#to(expand("<cword>"))<CR>
n  <Space>tt     :cal trans#smart(expand("<cword>"))<CR>
n  <Space>t    * :Unite -silent -vertical -winwidth=40 -direction=topleft -toggle outline<CR>
n  <Space>'    * :Unite file buffer bookmark file_mru history/yank<CR>
n  <Space>v    * :UniteWithCursorWord -silent -no-split -auto-preview line<CR>
n  <Space>z    * :%s#\<<C-R>=expand("<cword>")<CR>\>#
o  <F2>          "zyiw:exe "vertical h ".@z.""<CR>
o  <F3>          :Scratch<CR>
o  <Plug>Commentary * :<C-U>call <SNR>93_textobject(get(v:, 'operator', '') ==# 'c')<CR>
o  <Plug>(fzf-maps-o) * <C-C>:<C-U>call fzf#vim#maps('o', 0)<CR>
o  <Plug>GitGutterTextObjectInnerPending * :<C-U>call gitgutter#hunk#text_object(1)<CR>
o  <Plug>GitGutterTextObjectOuterPending * :<C-U>call gitgutter#hunk#text_object(0)<CR>
ov <C-\>         :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
   <Plug>AirlineSelectNextTab * :<C-U>call <SNR>198_jump_to_tab(v:count1)<CR>
   <Plug>AirlineSelectPrevTab * :<C-U>call <SNR>198_jump_to_tab(-v:count1)<CR>
   <Plug>AirlineSelectTab1 * :call <SNR>198_select_tab(0)<CR>
   <Plug>AirlineSelectTab2 * :call <SNR>198_select_tab(1)<CR>
   <Plug>AirlineSelectTab3 * :call <SNR>198_select_tab(2)<CR>
   <Plug>AirlineSelectTab4 * :call <SNR>198_select_tab(3)<CR>
   <Plug>AirlineSelectTab5 * :call <SNR>198_select_tab(4)<CR>
   <Plug>AirlineSelectTab6 * :call <SNR>198_select_tab(5)<CR>
   <Plug>AirlineSelectTab7 * :call <SNR>198_select_tab(6)<CR>
   <Plug>AirlineSelectTab8 * :call <SNR>198_select_tab(7)<CR>
   <Plug>AirlineSelectTab9 * :call <SNR>198_select_tab(8)<CR>
   <Plug>TComment_<C-_>a * :TCommentAs<Space>
   <Plug>TComment_<C-_>b * :TCommentBlock<CR>
   <Plug>TComment_<C-_>ca * :<C-U>call tcomment#SetOption("as", input("Comment as: ", &filetype, "customlist,tcomment#complete#Complete"))<CR>
   <Plug>TComment_<C-_>cc * :<C-U>call tcomment#SetOption("count", v:count1)<CR>
   <Plug>TComment_<C-_>i * v:TCommentInline mode=I#<CR>
   <Plug>TComment_<C-_>n * :TCommentAs <C-R>=&ft<CR><Space>
   <Plug>TComment_<C-_>p * m`vip:TComment<CR>``
   <Plug>TComment_<C-_>r * :TCommentRight<CR>
   <Plug>TComment_<C-_><Space> * :TComment<Space>
   <Plug>TComment_<C-_>s * :TCommentAs <C-R>=&ft<CR>_
   <Plug>TComment_ic * :<C-U>call tcomment#textobject#InlineComment()<CR>
   <Plug>TComment_<Space>_a * :TCommentAs<Space>
   <Plug>TComment_<Space>_b * :TCommentBlock<CR>
   <Plug>TComment_<Space>_n * :TCommentAs <C-R>=&ft<CR><Space>
   <Plug>TComment_<Space>_p * vip:TComment<CR>
   <Plug>TComment_<Space>_r * :TCommentRight<CR>
   <Plug>TComment_<Space>_<Space> * :TComment<Space>
   <Plug>TComment_<Space>_s * :TCommentAs <C-R>=&ft<CR>_
s  <BS>        * a<BS>
s  <C-B>         <Plug>(neosnippet_expand_or_jump)
s  <C-H>       * a<BS>
s  <CR>        * a<BS>
s  <C-R>       * <C-G>"_c<C-R>
s  <C-R><Tab>  * <Esc>:call UltiSnips#ListSnippets()<CR>
s  <Del>       * a<BS>
   <S-F10>       :execute "vimgrep /" . expand("<cword>") . "/j **" | cw<CR>
   <S-F3>        :lclose<CR>
   <S-F4>        :PrevInList<CR>
   <S-F8>        :cclose<CR>
   <S-F9>        :call asyncrun#quickfix_toggle(8)|call mg#statusline_update()<CR>
   <Space>_a     <Plug>TComment_ _a
   <Space>_b     <Plug>TComment_ _b
   <Space>cd     :cd %:p:h<CR>
   <Space>e      :e %%
   <Space>_n     <Plug>TComment_ _n
   <Space>_p     <Plug>TComment_ _p
   <Space>r      <Plug>(quickrun)
   <Space>_r     <Plug>TComment_ _r
   <Space>s      :call SignFixme()<CR>
   <Space>_<Space>   <Plug>TComment_ _<Space>
   <Space>_s     <Plug>TComment_ _s
s  <Plug>(neosnippet_expand) * neosnippet#mappings#expand_impl()
s  <Plug>(neosnippet_expand_or_jump) * neosnippet#mappings#expand_or_jump_impl()
s  <Plug>(neosnippet_jump) * neosnippet#mappings#jump_impl()
s  <Plug>(neosnippet_jump_or_expand) * neosnippet#mappings#jump_or_expand_impl()
s  <Plug>snipMateBack * <Esc>a<C-R>=snipMate#BackwardsSnippet()<CR>
s  <Plug>snipMateNextOrTrigger * <Esc>a<C-R>=snipMate#TriggerSnippet()<CR>
s  <S-Tab>       <Plug>snipMateBack
s  <Tab>       * <Esc>:call UltiSnips#ExpandSnippetOrJump()<CR>
v  <C-_>1        <Plug>TComment_<C-_>1
v  <C-_>2        <Plug>TComment_<C-_>2
v  <C-_>3        <Plug>TComment_<C-_>3
v  <C-_>4        <Plug>TComment_<C-_>4
v  <C-_>5        <Plug>TComment_<C-_>5
v  <C-_>6        <Plug>TComment_<C-_>6
v  <C-_>7        <Plug>TComment_<C-_>7
v  <C-_>8        <Plug>TComment_<C-_>8
v  <C-_>9        <Plug>TComment_<C-_>9
v  <C-_><C-_>    <Plug>TComment_<C-_><C-_>
v  <C-F6>      * ap
v  <C-F7>      * a{k$
v  <F2>        * :norm@q<CR>
v  <F3>        * y:call Marvim_template_store()<CR>
v  <F5>        * i(
v  <F6>        * ipk$
v  <F7>        * i{k$
v  <Plug>AgActionVisual * :<C-U>call <SNR>64_Ag(visualmode())<CR>
v  <Plug>NetrwBrowseXVis * :<C-U>call netrw#BrowseXVis()<CR>
v  <Plug>(quickrun) * :<C-U>QuickRun -mode v<CR>
v  <Plug>ReplaceWithRegisterVisual * :<C-U>call setline('.', getline('.'))|execute 'silent! call repeat#setreg("\<Plug>ReplaceWithRegisterVisual", v:register)'|call ReplaceWithRegister#SetRegister()|if ReplaceWithRegister#IsExprReg()|    let g:ReplaceWithRegister_expr = getreg('=')|endif|call ReplaceWithRegister#Operator('visual', "\<Plug>ReplaceWithRegisterVisual")<CR>
v  <Plug>TComment_<C-_>1 * :call tcomment#SetOption("count", 1)<CR>
v  <Plug>TComment_<C-_>2 * :call tcomment#SetOption("count", 2)<CR>
v  <Plug>TComment_<C-_>3 * :call tcomment#SetOption("count", 3)<CR>
v  <Plug>TComment_<C-_>4 * :call tcomment#SetOption("count", 4)<CR>
v  <Plug>TComment_<C-_>5 * :call tcomment#SetOption("count", 5)<CR>
v  <Plug>TComment_<C-_>6 * :call tcomment#SetOption("count", 6)<CR>
v  <Plug>TComment_<C-_>7 * :call tcomment#SetOption("count", 7)<CR>
v  <Plug>TComment_<C-_>8 * :call tcomment#SetOption("count", 8)<CR>
v  <Plug>TComment_<C-_>9 * :call tcomment#SetOption("count", 9)<CR>
v  <Plug>TComment_<C-_><C-_> * :TCommentMaybeInline<CR>
v  <Plug>VgSurround * :<C-U>call <SNR>96_opfunc(visualmode(),visualmode() ==# 'V' ? 0 : 1)<CR>
v  <Plug>VSurround * :<C-U>call <SNR>96_opfunc(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR>
v  <S-F5>      * a(
v  <S-F6>      * ip
v  <S-F7>      * i{
v  <Space>cs   * "ky:ThesaurusQueryReplace <C-R>k<CR>
v  <Space>tb     :cal trans#v_between()<CR>
v  <Space>to     :cal trans#v_to()<CR>
v  <Space>tt     :cal trans#v()<CR>
x  <C-B>         <Plug>(neosnippet_expand_target)
x  <           * <gv
x  <Plug>Commentary * <SNR>93_go()
x  <Plug>(fzf-maps-x) * :<C-U>call fzf#vim#maps('x', 0)<CR>
x  <Plug>GitGutterTextObjectInnerVisual * :<C-U>call gitgutter#hunk#text_object(1)<CR>
x  <Plug>GitGutterTextObjectOuterVisual * :<C-U>call gitgutter#hunk#text_object(0)<CR>
x  <Plug>(neosnippet_expand_target) * :<C-U>call neosnippet#mappings#_expand_target()<CR>
x  <Plug>(neosnippet_get_selected_text) * :call neosnippet#helpers#get_selected_text(visualmode(), 1)<CR>
x  <Plug>(neosnippet_register_oneshot_snippet) * :<C-U>call neosnippet#mappings#_register_oneshot_snippet()<CR>
x  <Plug>(scratch-selection-clear) * :<C-U>call scratch#selection(1)<CR>
x  <Plug>(scratch-selection-reuse) * :<C-U>call scratch#selection(0)<CR>
x  <Plug>snipMateVisual * :<C-U>call <SNR>122_grab_visual()<CR>gv"_c
x  <Plug>TComment_Comment * :<C-U>if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | '<,'>TCommentMaybeInline!<CR>
x  <Plug>TComment_gc * :TCommentMaybeInline<CR>
x  <Plug>TComment_<Space>_i * :TCommentInline<CR>
x  <Plug>TComment_<Space>__ * :TCommentMaybeInline<CR>
x  <Plug>TComment_Uncomment * :<C-U>if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | call tcomment#SetOption("mode_extra", "U") | '<,'>TCommentMaybeInline<CR>
x  <Space>_i     <Plug>TComment_ _i
x  <Space>__     <Plug>TComment_ __
x  <Tab>       * :call UltiSnips#SaveLastVisualSelection()<CR>gvs
x  >           * >gv
n  ,cs         * :ThesaurusQueryReplaceCurrentWord<CR>
nox,h            :call ToggleHeader()<CR>
x  ,cs         * "ky:ThesaurusQueryReplace <C-R>k<CR>
x  ,'          * <Esc>a'<Esc>gvo<Esc>i'<Esc>gvo<Esc>ll
x  ,"          * <Esc>a"<Esc>gvo<Esc>i"<Esc>gvo<Esc>ll
n  ;           * :CtrlPBuffer<CR>
n  ?           * loupe#private#prepare_highlight('?' . <SNR>92_MagicString())
x  ?           * loupe#private#prepare_highlight('?' . <SNR>92_MagicString())
nox/           * :call SearchCompleteStart()<CR>/
x  .           * :normal .<CR>
n  '<CR>       & <SNR>115_:.Start<CR>
n  ']          * :<C-U>call signature#mark#Goto("next", "line", "alpha")<CR>
n  '[          * :<C-U>call signature#mark#Goto("prev", "line", "alpha")<CR>
n  '?          & :<C-U>echo ":Start" get(b:,"start",&shell)<CR>
n  '!          & <SNR>115_:.Start!
n  '<Space>    & <SNR>115_:.Start<Space>
n  ["          *@:call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")<CR>
n  [c            <Plug>GitGutterPrevHunk
n  [=          * :<C-U>call signature#marker#Goto("prev", "any",  v:count)<CR>
n  [-          * :<C-U>call signature#marker#Goto("prev", "same", v:count)<CR>
n  ['          * :<C-U>call signature#mark#Goto("prev", "line", "pos")<CR>
n  [`          * :<C-U>call signature#mark#Goto("prev", "spot", "pos")<CR>
n  []          *@m':call search('^\s*endf*\%[unction]\>', "bW")<CR>
n  [[          *@m':call search('^\s*fu\%[nction]\>', "bW")<CR>
x  ["          *@:<C-U>exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")<CR>
x  []          *@m':<C-U>exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "bW")<CR>
x  [[          *@m':<C-U>exe "normal! gv"|call search('^\s*fu\%[nction]\>', "bW")<CR>
n  ]"          *@:call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")<CR>
n  ]c            <Plug>GitGutterNextHunk
n  ]=          * :<C-U>call signature#marker#Goto("next", "any",  v:count)<CR>
n  ]-          * :<C-U>call signature#marker#Goto("next", "same", v:count)<CR>
n  ]'          * :<C-U>call signature#mark#Goto("next", "line", "pos")<CR>
n  ]`          * :<C-U>call signature#mark#Goto("next", "spot", "pos")<CR>
n  ][          *@m':call search('^\s*endf*\%[unction]\>', "W")<CR>
n  ]]          *@m':call search('^\s*fu\%[nction]\>', "W")<CR>
x  ]"          *@:<C-U>exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")<CR>
x  ][          *@m':<C-U>exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "W")<CR>
x  ]]          *@m':<C-U>exe "normal! gv"|call search('^\s*fu\%[nction]\>', "W")<CR>
nox}           * }^
n  *           * *:call BlingHighight()<CR>
x  *           * :<C-U>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
n  \           * :Ag<Space>
n  \m          * :ShowMaps<CR>            " Map keys to call the function
n  #           * #:call BlingHighight()<CR>
x  #           * :<C-U>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
n  ê          * :bn<CR>
n  ë           * :bp<CR>
nox¡            1gt
nox£             3gt
nox¤            4gt
nox¥             5gt
nox¦             7gt
noxÀ             2gt
noxª            8gt
noxÞ            6gt
o  ac           @<Plug>GitGutterTextObjectOuterPending
o  an(         * :<C-U>normal! 0f(va(<CR>
o  anf         * :<C-U>normal! 0f(hvaw<CR>
o  ant         * :<C-U>normal! 0f<vat<CR>
x  ac           @<Plug>GitGutterTextObjectOuterVisual
n  cr            <Plug>Coerce
n  cs            <Plug>Csurround
n  cS            <Plug>CSurround
n  dm          * :<C-U>call signature#utils#Remove(v:count)<CR>
n  ds            <Plug>Dsurround
n  gag           <Plug>AgAction
n  g>b           <Plug>TComment_Commentb
n  g<b           <Plug>TComment_Uncommentb
n  gc1c          <Plug>TComment_gc1c
n  gc1           <Plug>TComment_gc1
n  gc2c          <Plug>TComment_gc2c
n  gc2           <Plug>TComment_gc2
n  gc3c          <Plug>TComment_gc3c
n  gc3           <Plug>TComment_gc3
n  gc4c          <Plug>TComment_gc4c
n  gc4           <Plug>TComment_gc4
n  gc5c          <Plug>TComment_gc5c
n  gc5           <Plug>TComment_gc5
n  gc6c          <Plug>TComment_gc6c
n  gc6           <Plug>TComment_gc6
n  gc7c          <Plug>TComment_gc7c
n  gc7           <Plug>TComment_gc7
n  gc8c          <Plug>TComment_gc8c
n  gc8           <Plug>TComment_gc8
n  gc9c          <Plug>TComment_gc9c
n  gc9           <Plug>TComment_gc9
n  gcb           <Plug>TComment_gcb
n  gcc           <Plug>TComment_gcc
n  g>c           <Plug>TComment_Commentc
n  gc            <Plug>TComment_gc
n  g<c           <Plug>TComment_Uncommentc
n  g`<CR>      & <SNR>115_:.Spawn<CR>
n  g'<CR>      & <SNR>115_:.Spawn<CR>
n  g`?         & :<C-U>echo ":Spawn" &shell<CR>
n  g'?         & :<C-U>echo ":Spawn" &shell<CR>
n  gcu           <Plug>Commentary<Plug>Commentary
n  gI          * `.
n  g#            <Plug>(LoupeGOctothorpe)
n  g*            <Plug>(LoupeGStar)
n  g>            <Plug>TComment_Comment
n  g<            <Plug>TComment_Uncomment
n  gp          * '`['.strpart(getregtype(), 0, 1).'`]'
n  gr            <Plug>ReplaceWithRegisterOperator
n  grr           <Plug>ReplaceWithRegisterLine
n  g`!         & <SNR>115_:.Spawn!
n  g'!         & <SNR>115_:.Spawn!
n  g`<Space>   & <SNR>115_:.Spawn<Space>
n  g'<Space>   & <SNR>115_:.Spawn<Space>
n  gS            <Plug>(scratch-insert-clear)
n  gs            <Plug>(scratch-insert-reuse)
n  gv          * `[v`]
n  gx            <Plug>NetrwBrowseX
n  gZzZz       * gs
noxgj          * j
noxgk          * k
o  gc            <Plug>Commentary
x  gag           <Plug>AgActionVisual
x  gc            <Plug>TComment_gc
x  g>            <Plug>TComment_Comment
x  g<            <Plug>TComment_Uncomment
x  gr            <Plug>ReplaceWithRegisterVisual
x  gs            <Plug>(scratch-selection-reuse)
x  gS            <Plug>VgSurround
x  gx            <Plug>NetrwBrowseXVis
n  H           * mzJ`z
o  ia          * :<C-U>execute "normal! ?[,(]\rwv/[),]\rh"<CR>
o  ic            <Plug>TComment_ic
o  in(         * :<C-U>normal! 0f(vi(<CR>
o  inf         * :<C-U>normal! 0f(hviw<CR>
o  int         * :<C-U>normal! 0f<vit<CR>
x  ia          * :<C-U>execute "normal! ?[,(]\rwv/[),]\rh"<CR>
x  ic            <Plug>TComment_ic
noxj           * gj
noxjj          * :w<CR>
n  J           * :bn<CR>
noxk           * gk
n  K           * :bp<CR>
n  ma            <Plug>BookmarkShowAll
n  m<BS>       * :<C-U>call signature#marker#Purge()<CR>
n  mc            <Plug>BookmarkClear
n  m<CR>       & <SNR>115_:.Make<CR>
n  m/          * :<C-U>call signature#mark#List(0, 0)<CR>
n  m-          * :<C-U>call signature#mark#Purge("line")<CR>
n  m.          * :<C-U>call signature#mark#ToggleAtLine()<CR>
n  m,          * :<C-U>call signature#mark#Toggle("next")<CR>
n  m           * :<C-U>call signature#utils#Input()<CR>
n  m?          & :<C-U>echo ":Dispatch" dispatch#make_focus(v:count > 1 ? 0 : v:count ? line(".") : -1)<CR>
n  mg            <Plug>BookmarkMoveToLine
n  mi            <Plug>BookmarkAnnotate
n  mjj           <Plug>BookmarkMoveDown
n  mkk           <Plug>BookmarkMoveUp
n  mm            <Plug>BookmarkToggle
n  mn            <Plug>BookmarkNext
n  mp            <Plug>BookmarkPrev
n  m!          & <SNR>115_:.Make!
n  m<Space>    & <SNR>115_:.Make<Space>
n  mx            <Plug>BookmarkClearAll
n  n           * n:call BlingHighight()<CR>
n  N           * N:call BlingHighight()<CR>
noxqq          * :q<CR>
n  R           * :GitGrep <cword><CR>
x  S             <Plug>VSurround
n  U           * :syntax sync fromstart<CR>:redraw!<CR>
n  vv          * <C-W>v
n  W           * gqip
x  W           * gq
n  y<C-G>      &@:<C-U>call setreg(v:register, fugitive#Object(@%))<CR>
n  ys            <Plug>Ysurround
n  yS            <Plug>YSurround
n  yss           <Plug>Yssurround
n  ySs           <Plug>YSsurround
n  ySS           <Plug>YSsurround
n  Y           * y$
n  z0          * :set foldlevel=0<CR>
n  z1          * :set foldlevel=1<CR>
n  z2          * :set foldlevel=2<CR>
n  z3          * :set foldlevel=3<CR>
n  z4          * :set foldlevel=4<CR>
n  z5          * :set foldlevel=5<CR>
n  z=          * :echo "use zz you idiot"<CR>
