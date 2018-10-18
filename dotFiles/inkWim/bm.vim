| Action                                          | Shortcut    | Command                      |
|-------------------------------------------------|-------------|------------------------------|
| Add/remove bookmark at current line             | `mm`        | `:BookmarkToggle`            |
| Add/edit/remove annotation at current line      | `mi`        | `:BookmarkAnnotate <TEXT>`   |
| Jump to next bookmark in buffer                 | `mn`        | `:BookmarkNext`              |
| Jump to previous bookmark in buffer             | `mp`        | `:BookmarkPrev`              |
| Show all bookmarks (toggle)                     | `ma`        | `:BookmarkShowAll`           |
| Clear bookmarks in current buffer only          | `mc`        | `:BookmarkClear`             |
| Clear bookmarks in all buffers                  | `mx`        | `:BookmarkClearAll`          |
| Move up bookmark at current line                | `[count]mkk`| `:BookmarkMoveUp [<COUNT>]`  |
| Move down bookmark at current line              | `[count]mjj`| `:BookmarkMoveDown [<COUNT>]`|
| Move bookmark at current line to another line   | `[count]mg` | `:BookmarkMoveToLine <LINE>` |
| Save all bookmarks to a file                    |             | `:BookmarkSave <FILE_PATH>`  |
| Load bookmarks from a file                      |             | `:BookmarkLoad <FILE_PATH>`  |

```viml
nmap <Leader><Leader> <Plug>BookmarkToggle
nmap <Leader>i <Plug>BookmarkAnnotate
nmap <Leader>a <Plug>BookmarkShowAll
nmap <Leader>j <Plug>BookmarkNext
nmap <Leader>k <Plug>BookmarkPrev
nmap <Leader>c <Plug>BookmarkClear
nmap <Leader>x <Plug>BookmarkClearAll
nmap <Leader>kk <Plug>BookmarkMoveUp
nmap <Leader>jj <Plug>BookmarkMoveDown
nmap <Leader>g <Plug>BookmarkMoveToLine

highlight BookmarkSign ctermbg=whatever ctermfg=whatever
highlight BookmarkAnnotationSign ctermbg=whatever ctermfg=whatever
highlight BookmarkLine ctermbg=whatever ctermfg=whatever
highlight BookmarkAnnotationLine ctermbg=whatever ctermfg=whatever
| Option                                         | Default                  | Description                                             |
|------------------------------------------------|--------------------------|---------------------------------------------------------|
| `let g:bookmark_sign = '>>'`                   | ⚑                        | Sets bookmark icon for sign column                      |
| `let g:bookmark_annotation_sign = '##'`        | ☰                        | Sets bookmark annotation icon for sign column           |
| `let g:bookmark_save_per_working_dir = 1`      | 0                        | Save bookmarks per working dir, the folder you opened vim from |
| `let g:bookmark_auto_save = 0`                 | 1                        | Enables/disables automatic saving for bookmarks         |
| `let g:bookmark_manage_per_buffer = 1`         | 0                        | Save bookmarks when leaving a buffer, load when entering one |
| `let g:bookmark_auto_save_file = '/bookmarks'` | $HOME .'/.vim-bookmarks' | Sets file for auto saving (ignored when `bookmark_save_per_working_dir` is enabled) |
| `let g:bookmark_auto_close = 1`                | 0                        | Automatically close bookmarks split when jumping to a bookmark |
| `let g:bookmark_highlight_lines = 1`           | 0                        | Enables/disables line highlighting                      |
| `let g:bookmark_show_warning = 0`              | 1                        | Enables/disables warning when clearing all bookmarks    |
| `let g:bookmark_show_toggle_warning = 0`       | 1                        | Enables/disables warning when toggling to clear a bookmark with annotation   |
| `let g:bookmark_center = 1`                    | 0                        | Enables/disables line centering when jumping to bookmark|
| `let g:bookmark_no_default_key_mappings = 1`                    | 0                        | Prevent any default key mapping from being created|
| `let g:bookmark_location_list = 1`             | 0                        | Use the location list to show all bookmarks             |
| `let g:bookmark_disable_ctrlp = 1`             | 0                        | Disable ctrlp interface when  show all bookmarks             |
```vimlV
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
```
```viml
" Finds the Git super-project directory.
function! g:BMWorkDirFileLocation()
    let filename = 'bookmarks'
    let location = ''
    if isdirectory('.git')
        " Current work dir is git's work tree
        let location = getcwd().'/.git'
    else
        " Look upwards (at parents) for a directory named '.git'
        let location = finddir('.git', '.;')
    endif
    if len(location) > 0
        return location.'/'.filename
    else
        return getcwd().'/.'.filename
    endif
endfunction
" Finds the Git super-project directory based on the file passed as an argument.
function! g:BMBufferFileLocation(file)
    let filename = 'vim-bookmarks'
    let location = ''
    if isdirectory(fnamemodify(a:file, ":p:h").'/.git')
        " Current work dir is git's work tree
        let location = fnamemodify(a:file, ":p:h").'/.git'
    else
        " Look upwards (at parents) for a directory named '.git'
        let location = finddir('.git', fnamemodify(a:file, ":p:h").'/.;')
    endif
    if len(location) > 0
        return simplify(location.'/.'.filename)
    else
        return simplify(fnamemodify(a:file, ":p:h").'/.'.filename)
    endif
endfunction
```

### Silent saving and loading

Call functions BookmarkSave, BookmarkLoad and BookmarkClearAll with the last argument set to 0 to perform these operations silently. You may use this to manage your bookmark list transparently from within your custom script.

```viml
call unite#custom#profile('source/vim_bookmarks', 'context', {
	\   'winheight': 13,
	\   'direction': 'botright',
	\   'start_insert': 0,
	\   'keep_focus': 1,
	\   'no_quit': 1,
	\ })
```

With the Unite interface, when you select bookmarks, you can perform the following actions:

* Open the selected bookmarks in various ways (open to the right, open above, open in new tab, etc.)
* Yank the informations of selected bookmarks (path and line number, the line content, annotation, etc.)
* Highlight the lines of the selected bookmarks
* Replace the contents of selected bookmarks with [vim-qfreplace](https://github.com/thinca/vim-qfreplace) interface
* Delete the selected bookmarks
* And more...
let g:bookmark_no_default_key_mappings = 1
function! BookmarkMapKeys()
    nmap mm :BookmarkToggle<CR>
    nmap mi :BookmarkAnnotate<CR>
    nmap mn :BookmarkNext<CR>
    nmap mp :BookmarkPrev<CR>
    nmap ma :BookmarkShowAll<CR>
    nmap mc :BookmarkClear<CR>
    nmap mx :BookmarkClearAll<CR>
    nmap mkk :BookmarkMoveUp
    nmap mjj :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
    unmap mm
    unmap mi
    unmap mn
    unmap mp
    unmap ma
    unmap mc
    unmap mx
    unmap mkk
    unmap mjj
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()

highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
