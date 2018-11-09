

By default it creates the following mapping:


By default it creates the following mapping:
    gb
To change it, modify the `g:pastedtext_select_key` variable. For example:
    let g:pastedtext_select_key = 'p'
That said, you can use it as if it were any other vim text object. Here are a couple of examples:
- `vgb` Select last pasted text.
- `=gb` Re-indent last pasted text.
- `dgb` Delete last pasted text.
- `gcgb` Comment last pasted text (requires [vim-commentary](https://github.com/tpope/vim-commentary) plugin.) 
" Instead of <leader>n, use <leader>x.
nmap <leader>x <Plug>(LoupeClearHighlight)
"-----------------------------------------------------------------------------

nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------
:Ack [options] {pattern} [{directories}]
The quickfix results window is augmented with these convenience mappings:
    ?    a quick summary of these keys, repeat to close
    o    to open (same as Enter)
    O    to open and close the quickfix window
    go   to preview file, open but maintain focus on ack.vim results
    t    to open in new tab
    T    to open in new tab without moving to it
    h    to open in horizontal split
    H    to open in horizontal split, keeping focus on the results
    v    to open in vertical split
    gv   to open in vertical split, keeping focus on the results
    q    to close the quickfix window
"-----------------------------------------------------------------------------

### Gotchas

To search for a pattern that contains whitespace, you need to enclose the
pattern in single quotes. For example: 
:Ack 'foo bar'

Some characters have special meaning, and need to be escaped in your search
pattern. For instance, `#`. You need to escape it with 

:Ack '\\\#define foo'

"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------
" :Ack '\\\#define foo'
" #### :Far {pattern} {replace-with} {file-mask} [params]
" Find the text to replace.
" #### :Farp [params]
" Same as `Far`, but allows to enter {pattern}, {replace-with} and {file-mask}
" one after the other.
" #### :Fardo [params]
" Runs the replacement task.
" #### :Refar [params]
" Change `Far`/`Farp` params.
" #### :Farundo [params]
" Undo last (or all) replacement(s).
" #### :F {pattern} {file-mask} [params]
"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------

The resources can also be set with arguments to Vim:
argument		meaning	~
*-gui*
-display {display}	Run vim on {display}		*-display*
-iconic		Start vim iconified		*-iconic*
-background {color}	Use {color} for the background	*-background*
-bg {color}		idem				*-bg*
-foreground {color}	Use {color} for normal text	*-foreground*
-fg {color}		idem				*-fg*
-ul {color}		idem				*-ul*
-font {font}		Use {font} for normal text	*-font*
-fn {font}		idem				*-fn*
-boldfont {font}	Use {font} for bold text	*-boldfont*
-italicfont {font}	Use {font} for italic text	*-italicfont*
-menufont {font}	Use {font} for menu items	*-menufont*
-menufontset {fontset} Use {fontset} for menu items	*-menufontset*
-mf {font}		idem				*-mf*
-geometry {geom}	Use {geom} for initial geometry	*-geometry*
-geom {geom}		idem, see |-geometry-example|	*-geom*
-borderwidth {width}	Use a border width of {width}	*-borderwidth*
-bw {width}		idem				*-bw*
*-scrollbarwidth*
-scrollbarwidth {width}	Use a scrollbar width of {width}
-sw {width}		idem				*-sw*
-menuheight {height}	Use a menu bar height of {height} *-menuheight*
-mh {height}		idem				*-mh*
NOTE: On Motif the value is ignored, the menu height
is computed to fit the menus.
-reverse		Use reverse video		*-reverse*
-rv			idem				*-rv*
+reverse		Don't use reverse video		*-+reverse*
+rv			idem				*-+rv*
-xrm {resource}	Set the specified resource	*-xrm*
