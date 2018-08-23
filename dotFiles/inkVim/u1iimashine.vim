let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <Nul> <C-Space>
inoremap <expr> <Up> pumvisible() ? "\" : "\<Up>"
inoremap <expr> <S-Tab> pumvisible() ? "\" : "\<S-Tab>"
inoremap <expr> <Down> pumvisible() ? "\" : "\<Down>"
inoremap <silent> <expr> <Plug>_ deoplete#mapping#_dummy_complete()
inoremap <silent> <Plug>(fzf-maps-i) :call fzf#vim#maps('i', 0)
inoremap <expr> <Plug>(fzf-complete-buffer-line) fzf#vim#complete#buffer_line()
inoremap <expr> <Plug>(fzf-complete-line) fzf#vim#complete#line()
inoremap <expr> <Plug>(fzf-complete-file-ag) fzf#vim#complete#path('ag -l -g ""')
inoremap <expr> <Plug>(fzf-complete-file) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -type f -print -o -type l -print | sed 's:^..::'")
inoremap <expr> <Plug>(fzf-complete-path) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -print | sed '1d;s:^..::'")
inoremap <expr> <Plug>(fzf-complete-word) fzf#vim#complete#word()
inoremap <silent> <expr> <Plug>(neosnippet_start_unite_snippet) unite#sources#neosnippet#start_complete()
inoremap <silent> <expr> <Plug>(neosnippet_jump) neosnippet#mappings#jump_impl()
inoremap <silent> <expr> <Plug>(neosnippet_expand) neosnippet#mappings#expand_impl()
inoremap <silent> <expr> <Plug>(neosnippet_jump_or_expand) neosnippet#mappings#jump_or_expand_impl()
inoremap <silent> <expr> <Plug>(neosnippet_expand_or_jump) neosnippet#mappings#expand_or_jump_impl()
inoremap <Plug>TComment_9 :call tcomment#SetOption("count", 9)
inoremap <Plug>TComment_8 :call tcomment#SetOption("count", 8)
inoremap <Plug>TComment_7 :call tcomment#SetOption("count", 7)
inoremap <Plug>TComment_6 :call tcomment#SetOption("count", 6)
inoremap <Plug>TComment_5 :call tcomment#SetOption("count", 5)
inoremap <Plug>TComment_4 :call tcomment#SetOption("count", 4)
inoremap <Plug>TComment_3 :call tcomment#SetOption("count", 3)
inoremap <Plug>TComment_2 :call tcomment#SetOption("count", 2)
inoremap <Plug>TComment_1 :call tcomment#SetOption("count", 1)
inoremap <Plug>TComment_s :TCommentAs =&ft_
inoremap <Plug>TComment_n :TCommentAs =&ft 
inoremap <Plug>TComment_a :TCommentAs 
inoremap <Plug>TComment_b :TCommentBlock mode=#
inoremap <Plug>TComment_i v:TCommentInline mode=#
inoremap <Plug>TComment_r :TCommentRight
inoremap <Plug>TComment_  :TComment 
inoremap <Plug>TComment_p :norm! m`vip:TComment``
inoremap <Plug>TComment_ :TComment
imap <C-F9> <C-F9>
imap <S-F9> <S-F7>
imap <C-F8> <C-F8>
imap <S-F8> <S-F8>
cnoremap <C-BS> 
cnoremap <M-BS> 
xmap  <Plug>(neosnippet_expand_target)
smap  <Plug>(neosnippet_expand_or_jump)
snoremap  a<BS>
nmap  h
xmap  h
omap  h
xnoremap <silent> 	 :call UltiSnips#SaveLastVisualSelection()gvs
snoremap <silent> 	 :call UltiSnips#ExpandSnippetOrJump()
nnoremap 	 w
map <NL> j_
map  k_
map  l
snoremap  a<BS>
nnoremap  o
nnoremap <silent>  :CtrlP
snoremap  "_c
snoremap <silent> 	 :call UltiSnips#ListSnippets()
nnoremap u :call undoquit#UndoQuitWindow()
nmap m <Plug>(zoom-toggle)
nnoremap <silent>  :set nopaste:nohlsearch
map  :vsp :exec("tag ".expand("<cword>"))
vmap 9 <Plug>TComment_9
nmap 9 <Plug>TComment_9
omap 9 <Plug>TComment_9
vmap 8 <Plug>TComment_8
nmap 8 <Plug>TComment_8
omap 8 <Plug>TComment_8
vmap 7 <Plug>TComment_7
nmap 7 <Plug>TComment_7
omap 7 <Plug>TComment_7
vmap 6 <Plug>TComment_6
nmap 6 <Plug>TComment_6
omap 6 <Plug>TComment_6
vmap 5 <Plug>TComment_5
nmap 5 <Plug>TComment_5
omap 5 <Plug>TComment_5
vmap 4 <Plug>TComment_4
nmap 4 <Plug>TComment_4
omap 4 <Plug>TComment_4
vmap 3 <Plug>TComment_3
nmap 3 <Plug>TComment_3
omap 3 <Plug>TComment_3
vmap 2 <Plug>TComment_2
nmap 2 <Plug>TComment_2
omap 2 <Plug>TComment_2
vmap 1 <Plug>TComment_1
nmap 1 <Plug>TComment_1
omap 1 <Plug>TComment_1
map ca <Plug>TComment_ca
map cc <Plug>TComment_cc
map s <Plug>TComment_s
map n <Plug>TComment_n
map a <Plug>TComment_a
map b <Plug>TComment_b
map i <Plug>TComment_i
map r <Plug>TComment_r
map   <Plug>TComment_ 
map p <Plug>TComment_p
vmap  <Plug>TComment_
nmap  <Plug>TComment_
omap  <Plug>TComment_
nnoremap  d :YcmShowDetailedDiagnostic
nnoremap  gb :GitBlame
nnoremap  gp :GitPullRebase
nnoremap  gc :GitCommit
nnoremap  gA :GitAdd <cfile>
nnoremap  ga :GitAdd
nnoremap  gl :GitLog
nnoremap  gs :GitStatus
nnoremap  gD :GitDiff --cached
nnoremap  gd :GitDiff
map  _s <Plug>TComment_ _s
map  _n <Plug>TComment_ _n
map  _a <Plug>TComment_ _a
map  _b <Plug>TComment_ _b
map  _r <Plug>TComment_ _r
xmap  _i <Plug>TComment_ _i
map  _  <Plug>TComment_ _ 
map  _p <Plug>TComment_ _p
xmap  __ <Plug>TComment_ __
nmap  __ <Plug>TComment_ __
smap  __ <Plug>TComment_ __
omap  __ <Plug>TComment_ __
map  r <Plug>(quickrun)
vnoremap <silent>  cs "ky:ThesaurusQueryReplace k
nnoremap <silent>  cs :ThesaurusQueryReplaceCurrentWord
vmap <silent>  tb :cal trans#v_between()
vmap <silent>  to :cal trans#v_to()
nmap <silent>  tb :cal trans#between(expand("<cword>"))
nmap <silent>  to :cal trans#to(expand("<cword>"))
vmap <silent>  tt :cal trans#v()
nmap <silent>  tt :cal trans#smart(expand("<cword>"))
nnoremap  z :%s#\<=expand("<cword>")\>#
nnoremap <silent>  c /\v^[<|=>]{7}([^=].+)?$
vnoremap  ' a'gvoi'gvoll
vnoremap  " a"gvoi"gvoll
nnoremap  " viWa"gvoi"gvo3l
nnoremap  ' viWa'gvoi'gvo3l
nmap  hu <Plug>GitGutterUndoHunk
nmap  hs <Plug>GitGutterStageHunk
map  cd :cd %:p:h
nmap  m [I:let nr = input("Which one: ")|exe "normal " . nr ."[\t"
nnoremap    :Ag <cword> .
nnoremap  l :lgrep -R <cword> .
nnoremap  g :grep -R <cword> .
nnoremap  D :diffoff!
xnoremap <silent> # :call VisualSelection('', '')?=@/
xnoremap <silent> * :call VisualSelection('', '')/=@/
xnoremap <silent> ,cs "ky:ThesaurusQueryReplace k
nnoremap <silent> ,cs :ThesaurusQueryReplaceCurrentWord
nnoremap <silent> <expr> ,d ":\".(&diff?"diffoff":"diffthis")."\"
xnoremap . :normal .
xnoremap < <gv
xnoremap > >gv
nnoremap J mzJ`z
nnoremap K :q
nnoremap M K
nmap <silent> N Nzz
xmap S <Plug>VSurround
nnoremap S i^mwgk:silent! s/\v +$//:noh`w
nnoremap U :syntax sync fromstart:redraw!
nnoremap W gqip
xnoremap W gq
nnoremap Y y$
nmap [c <Plug>GitGutterPrevHunk
xmap \dp :diffput
xmap \do :diffget
nmap ]c <Plug>GitGutterNextHunk
onoremap ant :normal! 0f<vat
onoremap an( :normal! 0f(va(
onoremap anf :normal! 0f(hvaw
nmap cS <Plug>CSurround
nmap cs <Plug>Csurround
nmap cr <Plug>Coerce
nmap ds <Plug>Dsurround
xmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
xmap g> <Plug>TComment_Comment
nmap <silent> g>b <Plug>TComment_Commentb
nmap <silent> g>c <Plug>TComment_Commentc
nmap <silent> g> <Plug>TComment_Comment
xmap g< <Plug>TComment_Uncomment
nmap <silent> g<b <Plug>TComment_Uncommentb
nmap <silent> g<c <Plug>TComment_Uncommentc
nmap <silent> g< <Plug>TComment_Uncomment
nmap <silent> gcb <Plug>TComment_gcb
nmap <silent> gc9c <Plug>TComment_gc9c
nmap <silent> gc9 <Plug>TComment_gc9
nmap <silent> gc8c <Plug>TComment_gc8c
nmap <silent> gc8 <Plug>TComment_gc8
nmap <silent> gc7c <Plug>TComment_gc7c
nmap <silent> gc7 <Plug>TComment_gc7
nmap <silent> gc6c <Plug>TComment_gc6c
nmap <silent> gc6 <Plug>TComment_gc6
nmap <silent> gc5c <Plug>TComment_gc5c
nmap <silent> gc5 <Plug>TComment_gc5
nmap <silent> gc4c <Plug>TComment_gc4c
nmap <silent> gc4 <Plug>TComment_gc4
nmap <silent> gc3c <Plug>TComment_gc3c
nmap <silent> gc3 <Plug>TComment_gc3
nmap <silent> gc2c <Plug>TComment_gc2c
nmap <silent> gc2 <Plug>TComment_gc2
nmap <silent> gc1c <Plug>TComment_gc1c
nmap <silent> gc1 <Plug>TComment_gc1
nmap gcu <Plug>Commentary<Plug>Commentary
nmap <silent> gcc <Plug>TComment_gcc
omap gc <Plug>Commentary
nmap <silent> gc <Plug>TComment_gc
xmap gc <Plug>TComment_gc
xmap gr <Plug>ReplaceWithRegisterVisual
nmap grr <Plug>ReplaceWithRegisterLine
nmap gr <Plug>ReplaceWithRegisterOperator
nmap gag <Plug>AgAction
xmap gag <Plug>AgActionVisual
nnoremap gZzZz gs
xmap gS <Plug>VgSurround
xmap gs <Plug>(scratch-selection-reuse)
nmap gS <Plug>(scratch-insert-clear)
nmap gs <Plug>(scratch-insert-reuse)
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
nnoremap gv `[v`]
nmap <silent> g# g#zz
nmap <silent> g* g*zz
nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'
nnoremap gk k
xnoremap gk k
onoremap gk k
nnoremap gj j
xnoremap gj j
onoremap gj j
omap ic <Plug>TComment_ic
xmap ic <Plug>TComment_ic
xnoremap ia :execute "normal! ?[,(]\rwv/[),]\rh"
onoremap ia :execute "normal! ?[,(]\rwv/[),]\rh"
onoremap int :normal! 0f<vit
onoremap in( :normal! 0f(vi(
onoremap inf :normal! 0f(hviw
nnoremap jj :w
xnoremap jj :w
onoremap jj :w
nnoremap j gj
xnoremap j gj
onoremap j gj
nnoremap k gk
xnoremap k gk
onoremap k gk
nmap mg <Plug>BookmarkMoveToLine
nmap mjj <Plug>BookmarkMoveDown
nmap mkk <Plug>BookmarkMoveUp
nmap mx <Plug>BookmarkClearAll
nmap mc <Plug>BookmarkClear
nmap mp <Plug>BookmarkPrev
nmap mn <Plug>BookmarkNext
nmap mi <Plug>BookmarkAnnotate
nmap mm <Plug>BookmarkToggle
nmap ma <Plug>BookmarkShowAll
nmap <silent> n nzz
nnoremap qq :q
xnoremap qq :q
onoremap qq :q
nnoremap vv ^vg_
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
nnoremap z= :echo "use zz you idiot"
nnoremap zz z=
nnoremap } }^
xnoremap } }^
onoremap } }^
nnoremap <SNR>150_: :=v:count ? v:count : ''
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
nnoremap <silent> <Plug>BookmarkMoveToLine :BookmarkMoveToLine v:count
nnoremap <silent> <Plug>BookmarkMoveDown :BookmarkMoveDown v:count
nnoremap <silent> <Plug>BookmarkMoveUp :BookmarkMoveUp v:count
nnoremap <silent> <Plug>BookmarkClearAll :BookmarkClearAll
nnoremap <silent> <Plug>BookmarkClear :BookmarkClear
nnoremap <silent> <Plug>BookmarkPrev :BookmarkPrev
nnoremap <silent> <Plug>BookmarkNext :BookmarkNext
nnoremap <silent> <Plug>BookmarkAnnotate :BookmarkAnnotate
nnoremap <silent> <Plug>BookmarkToggle :BookmarkToggle
nnoremap <silent> <Plug>BookmarkShowAll :BookmarkShowAll
onoremap <silent> <Plug>(fzf-maps-o) :call fzf#vim#maps('o', 0)
xnoremap <silent> <Plug>(fzf-maps-x) :call fzf#vim#maps('x', 0)
nnoremap <silent> <Plug>(fzf-maps-n) :call fzf#vim#maps('n', 0)
snoremap <Del> a<BS>
snoremap <BS> a<BS>
xnoremap <silent> <Plug>(neosnippet_register_oneshot_snippet) :call neosnippet#mappings#_register_oneshot_snippet()
xnoremap <silent> <Plug>(neosnippet_expand_target) :call neosnippet#mappings#_expand_target()
xnoremap <silent> <Plug>(neosnippet_get_selected_text) :call neosnippet#helpers#get_selected_text(visualmode(), 1)
snoremap <silent> <expr> <Plug>(neosnippet_jump) neosnippet#mappings#jump_impl()
snoremap <silent> <expr> <Plug>(neosnippet_expand) neosnippet#mappings#expand_impl()
snoremap <silent> <expr> <Plug>(neosnippet_jump_or_expand) neosnippet#mappings#jump_or_expand_impl()
snoremap <silent> <expr> <Plug>(neosnippet_expand_or_jump) neosnippet#mappings#expand_or_jump_impl()
nnoremap <silent> <Plug>(vimfiler_simple) :VimFilerSimple
nnoremap <silent> <Plug>(vimfiler_create) :VimFilerCreate
nnoremap <silent> <Plug>(vimfiler_switch) :VimFiler
nnoremap <silent> <Plug>(vimfiler_split_create) :VimFilerSplit
nnoremap <silent> <Plug>TComment_gc9c :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc9cg@
nnoremap <silent> <Plug>TComment_gc8c :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc8cg@
nnoremap <silent> <Plug>TComment_gc7c :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc7cg@
nnoremap <silent> <Plug>TComment_gc6c :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc6cg@
nnoremap <silent> <Plug>TComment_gc5c :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc5cg@
nnoremap <silent> <Plug>TComment_gc4c :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc4cg@
nnoremap <silent> <Plug>TComment_gc3c :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc3cg@
nnoremap <silent> <Plug>TComment_gc2c :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc2cg@
nnoremap <silent> <Plug>TComment_gc1c :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gc1cg@
vnoremap <Plug>TComment_9 :call tcomment#SetOption("count", 9)
nnoremap <Plug>TComment_9 :call tcomment#SetOption("count", 9)
onoremap <Plug>TComment_9 :call tcomment#SetOption("count", 9)
vnoremap <Plug>TComment_8 :call tcomment#SetOption("count", 8)
nnoremap <Plug>TComment_8 :call tcomment#SetOption("count", 8)
onoremap <Plug>TComment_8 :call tcomment#SetOption("count", 8)
vnoremap <Plug>TComment_7 :call tcomment#SetOption("count", 7)
nnoremap <Plug>TComment_7 :call tcomment#SetOption("count", 7)
onoremap <Plug>TComment_7 :call tcomment#SetOption("count", 7)
vnoremap <Plug>TComment_6 :call tcomment#SetOption("count", 6)
nnoremap <Plug>TComment_6 :call tcomment#SetOption("count", 6)
onoremap <Plug>TComment_6 :call tcomment#SetOption("count", 6)
vnoremap <Plug>TComment_5 :call tcomment#SetOption("count", 5)
nnoremap <Plug>TComment_5 :call tcomment#SetOption("count", 5)
onoremap <Plug>TComment_5 :call tcomment#SetOption("count", 5)
vnoremap <Plug>TComment_4 :call tcomment#SetOption("count", 4)
nnoremap <Plug>TComment_4 :call tcomment#SetOption("count", 4)
onoremap <Plug>TComment_4 :call tcomment#SetOption("count", 4)
vnoremap <Plug>TComment_3 :call tcomment#SetOption("count", 3)
nnoremap <Plug>TComment_3 :call tcomment#SetOption("count", 3)
onoremap <Plug>TComment_3 :call tcomment#SetOption("count", 3)
vnoremap <Plug>TComment_2 :call tcomment#SetOption("count", 2)
nnoremap <Plug>TComment_2 :call tcomment#SetOption("count", 2)
onoremap <Plug>TComment_2 :call tcomment#SetOption("count", 2)
vnoremap <Plug>TComment_1 :call tcomment#SetOption("count", 1)
nnoremap <Plug>TComment_1 :call tcomment#SetOption("count", 1)
onoremap <Plug>TComment_1 :call tcomment#SetOption("count", 1)
nnoremap <silent> <Plug>TComment_gC :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gCg@
nnoremap <silent> <Plug>TComment_gc :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gcg@
xnoremap <Plug>TComment_gc :TCommentMaybeInline
nnoremap <silent> <Plug>TComment_gcb :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gcbg@
nnoremap <silent> <Plug>TComment_gcc :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_gccg@$
noremap <Plug>TComment_ic :call tcomment#textobject#InlineComment()
xnoremap <silent> <Plug>TComment_Comment :if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | '<,'>TCommentMaybeInline!
nnoremap <silent> <Plug>TComment_Commentb :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_Commentbg@
nnoremap <silent> <Plug>TComment_Commentc :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_Commentcg@$
nnoremap <silent> <Plug>TComment_Commentl :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_Commentlg@$
nnoremap <silent> <Plug>TComment_Comment :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_Commentg@
xnoremap <silent> <Plug>TComment_Uncomment :if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | call tcomment#SetOption("mode_extra", "U") | '<,'>TCommentMaybeInline
nnoremap <silent> <Plug>TComment_Uncommentb :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_Uncommentbg@
nnoremap <silent> <Plug>TComment_Uncommentc :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_Uncommentcg@$
nnoremap <silent> <Plug>TComment_Uncomment :call tcomment#ResetOption() | if v:count > 0 | call tcomment#SetOption("count", v:count) | endif | let w:tcommentPos = getpos(".") |set opfunc=TCommentOpFunc_Uncommentg@
noremap <Plug>TComment_ _s :TCommentAs =&ft_
noremap <Plug>TComment_ _n :TCommentAs =&ft 
noremap <Plug>TComment_ _a :TCommentAs 
noremap <Plug>TComment_ _b :TCommentBlock
noremap <Plug>TComment_ _r :TCommentRight
xnoremap <Plug>TComment_ _i :TCommentInline
noremap <Plug>TComment_ _  :TComment 
noremap <Plug>TComment_ _p vip:TComment
xnoremap <Plug>TComment_ __ :TCommentMaybeInline
nnoremap <Plug>TComment_ __ :TComment
snoremap <Plug>TComment_ __ :TComment
onoremap <Plug>TComment_ __ :TComment
noremap <Plug>TComment_ca :call tcomment#SetOption("as", input("Comment as: ", &filetype, "customlist,tcomment#complete#Complete"))
noremap <Plug>TComment_cc :call tcomment#SetOption("count", v:count1)
noremap <Plug>TComment_s :TCommentAs =&ft_
noremap <Plug>TComment_n :TCommentAs =&ft 
noremap <Plug>TComment_a :TCommentAs 
noremap <Plug>TComment_b :TCommentBlock
noremap <Plug>TComment_i v:TCommentInline mode=I#
noremap <Plug>TComment_r :TCommentRight
noremap <Plug>TComment_  :TComment 
noremap <Plug>TComment_p m`vip:TComment``
vnoremap <Plug>TComment_ :TCommentMaybeInline
nnoremap <Plug>TComment_ :TComment
onoremap <Plug>TComment_ :TComment
nnoremap <silent> <Plug>SurroundRepeat .
nmap <silent> <Plug>CommentaryUndo :echoerr "Change your <Plug>CommentaryUndo map to <Plug>Commentary<Plug>Commentary"
nnoremap <silent> <Plug>ReplaceWithRegisterVisual :call setline('.', getline('.'))|execute 'silent! call repeat#setreg("\<Plug>ReplaceWithRegisterVisual", v:register)'|call ReplaceWithRegister#SetRegister()|if ReplaceWithRegister#IsExprReg()|    let g:ReplaceWithRegister_expr = getreg('=')|endif|execute 'normal!' ReplaceWithRegister#VisualMode()|call ReplaceWithRegister#Operator('visual', "\<Plug>ReplaceWithRegisterVisual")
vnoremap <silent> <Plug>ReplaceWithRegisterVisual :call setline('.', getline('.'))|execute 'silent! call repeat#setreg("\<Plug>ReplaceWithRegisterVisual", v:register)'|call ReplaceWithRegister#SetRegister()|if ReplaceWithRegister#IsExprReg()|    let g:ReplaceWithRegister_expr = getreg('=')|endif|call ReplaceWithRegister#Operator('visual', "\<Plug>ReplaceWithRegisterVisual")
nnoremap <silent> <Plug>ReplaceWithRegisterLine :call setline('.', getline('.'))|execute 'silent! call repeat#setreg("\<Plug>ReplaceWithRegisterLine", v:register)'|call ReplaceWithRegister#SetRegister()|if ReplaceWithRegister#IsExprReg()|    let g:ReplaceWithRegister_expr = getreg('=')|endif|execute 'normal! V' . v:count1 . "_\<Esc>"|call ReplaceWithRegister#Operator('visual', "\<Plug>ReplaceWithRegisterLine")
nnoremap <silent> <Plug>ReplaceWithRegisterExpressionSpecial :let g:ReplaceWithRegister_expr = getreg('=')|execute 'normal!' v:count1 . '.'
nnoremap <expr> <Plug>ReplaceWithRegisterOperator ReplaceWithRegister#OperatorExpression()
nnoremap <silent> <Plug>(zoom-toggle) :call zoom#toggle()
nnoremap <silent> <Plug>GitGutterPreviewHunk :GitGutterPreviewHunk
nnoremap <silent> <Plug>GitGutterUndoHunk :GitGutterUndoHunk
nnoremap <silent> <Plug>GitGutterStageHunk :GitGutterStageHunk
nnoremap <silent> <expr> <Plug>GitGutterPrevHunk &diff ? '[c' : ":\execute v:count1 . 'GitGutterPrevHunk'\"
nnoremap <silent> <expr> <Plug>GitGutterNextHunk &diff ? ']c' : ":\execute v:count1 . 'GitGutterNextHunk'\"
xnoremap <silent> <Plug>GitGutterTextObjectOuterVisual :call gitgutter#hunk#text_object(0)
xnoremap <silent> <Plug>GitGutterTextObjectInnerVisual :call gitgutter#hunk#text_object(1)
onoremap <silent> <Plug>GitGutterTextObjectOuterPending :call gitgutter#hunk#text_object(0)
onoremap <silent> <Plug>GitGutterTextObjectInnerPending :call gitgutter#hunk#text_object(1)
xnoremap <silent> <Plug>(scratch-selection-clear) :call scratch#selection(1)
xnoremap <silent> <Plug>(scratch-selection-reuse) :call scratch#selection(0)
nnoremap <silent> <Plug>(scratch-insert-clear) :call scratch#insert(1)
nnoremap <silent> <Plug>(scratch-insert-reuse) :call scratch#insert(0)
vnoremap <silent> <Plug>(quickrun) :QuickRun -mode v
nnoremap <silent> <Plug>(quickrun) :QuickRun -mode n
nnoremap <silent> <Plug>(quickrun-op) :set operatorfunc=quickrun#operatorg@
nnoremap <S-Tab> W
map <C-=> =
map <C-F9> :copen
map <C-F8> :lopen
nnoremap <F12> :TagbarToggle
vnoremap <S-F10> a<
vnoremap <F10> i<
map <S-F9> :cclose
vnoremap <F9> i[
map <S-F8> :lclose
vnoremap <F8> i{
vnoremap <S-F7> a(
vnoremap <F7> i(
nnoremap <C-Up> :m .-2==
nnoremap <C-Down> :m .+1==
map <S-F6> :execute "vimgrep /" . expand("<cword>") . "/j **" | cw
map <F6> :call OnlineDoc8()
map <F5> :call SignFixme()
map <S-F4> "zYwo"zpW
map <F4> "zyiwwo"zpW
map <S-F3> :ScratchPreview
map <F3> :Scratch
map <F2> "zyiw:exe "vertical h ".@z.""
nnoremap <S-F12> :UndotreeToggle
cnoremap  
imap  <Plug>(neosnippet_expand_or_jump)
inoremap <silent>  
cnoremap  <End>
inoremap  {}i
inoremap  
imap S <Plug>ISurround
imap s <Plug>Isurround
inoremap <expr> 	 pumvisible() ? "\" : "\	"
inoremap <silent>  
inoremap  
inoremap  
cnoremap  <Down>
inoremap <silent>  
cnoremap  <Up>
inoremap  ()i
inoremap <silent> 	 =UltiSnips#ListSnippets()
cnoremap  =getline(".")
inoremap  {o}O
imap  <Plug>(fzf-complete-line)
inoremap  []i
inoremap <silent>  
inoremap  
imap 9 <Plug>TComment_9
imap 8 <Plug>TComment_8
imap 7 <Plug>TComment_7
imap 6 <Plug>TComment_6
imap 5 <Plug>TComment_5
imap 4 <Plug>TComment_4
imap 3 <Plug>TComment_3
imap 2 <Plug>TComment_2
imap 1 <Plug>TComment_1
imap s <Plug>TComment_s
imap n <Plug>TComment_n
imap a <Plug>TComment_a
imap b <Plug>TComment_b
imap i <Plug>TComment_i
imap r <Plug>TComment_r
imap   <Plug>TComment_ 
imap p <Plug>TComment_p
imap  <Plug>TComment_
imap jj 
cmap w!! w !sudo tee % >/dev/null
iabbr ydate =strftime("%Y %b %d")
iabbr xdate =strftime("%d/%m/%y %H:%M:%S")
iabbr ccopy Copyright 2013 Alf , no rights reserved.
iabbr @@ alf@nomail.com
iabbr cmnt /**/<Up>
iabbr #d #define
iabbr #i #include
iabbr que question
iabbr supe superuser
iabbr str start
let &cpo=s:cpo_save
unlet s:cpo_save
set ambiwidth=double
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set cinoptions=N-s,g0,+2s,l-s,i2s
set clipboard=unnamed,unnamedplus
set cmdwinheight=10
set commentstring=#\ %s
set complete=.,w,b,t,i,u,k
set completefunc=youcompleteme#CompleteFunc
set completeopt=menuone
set cpoptions=aAceFsB
set dictionary=~/git/aTest/redVim/dikt/english-words.txt
set display=lastline,uhex
set expandtab
set fileencodings=utf-8,sjis
set fillchars=vert:|,fold:\ 
set foldclose=all
set formatoptions=mMjcrql
set guioptions=ce
set helplang=en
set hidden
set history=4024
set hlsearch
set ignorecase
set imsearch=0
set incsearch
set infercase
set nojoinspaces
set laststatus=2
set lazyredraw
set listchars=tab:>\ ,nbsp:_
set mouse=a
set nrformats=hex
set omnifunc=syntaxcomplete#Complete
set path=.,/usr/include,,,.,/usr/include,/usr/local/include
set previewheight=15
set printoptions=paper:a4
set pumheight=20
set report=0
set runtimepath=~/.vim,~/.vim/plugged/vim-colorschemes/,~/.vim/plugged/vimproc.vim/,~/.vim/plugged/neocomplete.vim/,~/.vim/plugged/trans.vim/,~/.vim/plugged/thesaurus_query.vim/,~/.vim/plugged/vim-quickrun/,~/.vim/plugged/scratch.vim/,~/.vim/plugged/syntastic/,~/.vim/plugged/vim-action-ag/,~/.vim/plugged/ag.vim/,~/.vim/plugged/vim-gitgutter/,~/.vim/plugged/tagbar/,~/.vim/plugged/vim-zoom/,~/.vim/plugged/ReplaceWithRegister/,~/.vim/plugged/vim-gutentags/,~/.vim/plugged/vim-commentary/,~/.vim/plugged/vim-fugitive/,~/.vim/plugged/vim-abolish/,~/.vim/plugged/vim-repeat/,~/.vim/plugged/vim-surround/,~/.vim/plugged/vim-ripgrep/,~/.vim/plugged/ctrlp.vim/,~/.vim/plugged/tcomment_vim/,~/.vim/plugged/vim-sleuth/,~/.vim/plugged/vim-eunuch/,~/.vim/plugged/vim-angular/,~/.vim/plugged/vim-go/,~/.vim/plugged/ack.vim/,~/.vim/plugged/git-vim/,~/.vim/plugged/vim-flake8/,~/.vim/plugged/Nvim-R/,~/.vim/plugged/undotree/,~/.vim/plugged/vimfiler.vim/,~/.vim/plugged/deoplete.nvim/,~/.vim/plugged/cpsm/,~/.vim/plugged/nvim-yarp/,~/.vim/plugged/vim-hug-neovim-rpc/,~/.vim/plugged/deoplete-clang/,~/.vim/plugged/neosnippet.vim/,~/.vim/plugged/neosnippet-snippets/,~/.vim/plugged/ultisnips/,~/.vim/plugged/vim-snippets/,~/.vim/plugged/unite.vim/,~/.vim/plugged/echodoc.vim/,~/.vim/plugged/fzf/,~/.vim/plugged/fzf.vim/,~/.vim/plugged/YouCompleteMe/,~/.vim/plugged/undoquit.vim/,~/.vim/plugged/vim-bookmarks/,~/.vim/plugged/awesome-vim-colorschemes/,~/.vim/plugged/gruvbox/,~/.vim/plugged/vim-airline/,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after,~/.vim/plugged/ultisnips/after,~/.vim/plugged/awesome-vim-colorschemes/after,~/.vim/plugged/vimproc/
set sessionoptions=blank,buffers,curdir,folds,options,tabpages,winsize,resize,winpos
set shiftround
set shiftwidth=4
set shortmess=filnxtToOIc
set showcmd
set noshowmode
set showtabline=2
set smartcase
set smartindent
set smarttab
set softtabstop=4
set splitbelow
set splitright
set statusline=%t\ %=\ %m%r%y%w\ %3l:%-2c
set suffixes=*.pdf
set noswapfile
set switchbuf=useopen
set tabline=%!airline#extensions#tabline#get()
set tabstop=4
set tags=tags,./tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags,../../../../../../tags,../../../../../../../tags,~/Documents/scala/tags,~/Documents/*/tags
set thesaurus=mthesaur.txt
set timeoutlen=500
set title
set titlelen=100
set titlestring=%f
set ttimeout
set ttimeoutlen=50
set undodir=~/.vim/undoDir/
set undofile
set undolevels=2000
set undoreload=20000
set updatetime=300
set viewoptions=options,cursor
set viminfo='10,\"100,:20,%,n~/.viminfo
set visualbell
set whichwrap=b,s,h,l,<,>,[,]
set wildignore=*.~,*.?~,*.o,*.sw?,*.bak,*.hi,*.pyc,*.out,*.lock
set winminheight=0
set winminwidth=3
set nowritebackup
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/git/aTest/dotFiles/inkVim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 vim-inkItchyMashine.vim
argglobal
silent! argdel *
$argadd vim-inkItchyMashine.vim
set lines=37 columns=135
edit vim-inkItchyMashine.vim
set splitbelow splitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
noremap! <buffer> <F1> :help 
nmap <buffer>  hp <Plug>GitGutterPreviewHunk
xnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
xnoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "bW")
nnoremap <buffer> <silent> [] m':call search('^\s*endf*\%[unction]\>', "bW")
xnoremap <buffer> <silent> [[ m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "bW")
nnoremap <buffer> <silent> [[ m':call search('^\s*fu\%[nction]\>', "bW")
xnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
xnoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "W")
nnoremap <buffer> <silent> ][ m':call search('^\s*endf*\%[unction]\>', "W")
xnoremap <buffer> <silent> ]] m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "W")
nnoremap <buffer> <silent> ]] m':call search('^\s*fu\%[nction]\>', "W")
xmap <buffer> ac <Plug>GitGutterTextObjectOuterVisual
omap <buffer> ac <Plug>GitGutterTextObjectOuterPending
noremap <buffer> <F1> :help 
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
set breakindent
setlocal breakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=N-s,g0,+2s,l-s,i2s
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=1,8,100,120
setlocal colorcolumn=1,8,100,120
setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",:\"
setlocal commentstring=\"%s
setlocal complete=.,w,b,t,i,u,k
set concealcursor=nvc
setlocal concealcursor=nvc
setlocal conceallevel=0
setlocal completefunc=youcompleteme#CompleteFunc
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'vim'
setlocal filetype=vim
endif
setlocal fixendofline
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=marker
setlocal foldminlines=7
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=mMjcrql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetVimIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,=end,=else,=cat,=fina,=END,0\\
setlocal infercase
setlocal iskeyword=@,48-57,_,192-255,#
setlocal keywordprg=:help
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
set list
setlocal list
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=syntaxcomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal signcolumn=auto
setlocal smartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(1)
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'vim'
setlocal syntax=vim
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=~/git/aTest/tags,tags,./tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags,../../../../../../tags,../../../../../../../tags,~/Documents/scala/tags,~/Documents/*/tags
setlocal termkey=
setlocal termsize=
setlocal textwidth=78
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
let s:l = 43 - ((6 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
43
normal! 018|
lcd ~/git/aTest/dotFiles/inkVim
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOIc
set winminheight=0 winminwidth=3
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
