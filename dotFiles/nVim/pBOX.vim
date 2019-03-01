"===============================================================================================================
"=============================================PP1===============================================================
"===============================================================================================================
if executable('ag')
        set grepprg=ag\ --nogroup\ --nocolor\ --column\ --ignore-dir\ node_modules\ --ignore-dir\ bower_components
        set grepformat=%f:%l:%c:%m
endif

function! TheSilverSearcher()
python3 << EOF

import vim
import json


def python_input(message='input'):
    vim.command('call inputsave()')
    vim.command("let user_input = input('" + message + ": ')")
    vim.command('call inputrestore()')
    return vim.eval('user_input')


def silver_search():
    search_args = python_input("Search For")
    if search_args:
        vim.command('silent grep! "{}"'.format(search_args))
        vim.command('redraw!')
        vim.command('redrawstatus!')
        vim.command('copen')


silver_search()


EOF
endfunction

command! SSSearch call TheSilverSearcher()
nnoremap <Leader>sp :SSSearch<CR>
"let g:unite_source_menu_menus.CustomKeyMaps.command_candidates += [['➤ Search <Leader>sp', 'echo "Use <Leader>sp to start the search prompt"']]

"===============================================================================================================
"=============================================PP2===============================================================
"===============================================================================================================
function! EEvalCurrLine()
python3 << EOL
import vim


def EvaluateCurrentLine(*args):
    cur_str = vim.current.line
    action, symb = None, None
    for i in args:
        if i in ["r", "p"]:
            action = i
        else:
            symb = i
            try:
                start = cur_str.rindex(symb) + len(symb)
            except:
                print("EvalExept")

                start = 0
                result = eval(cur_str[start:], globals())
                if action == "r":
                    vim.current.line = cur_str[:start] + str(result)
                else:
                    print(result)


EOL
endfunction

command! EEEValCL call EEvalCurrLine()

"===============================================================================================================
"=============================================PP3===============================================================
"===============================================================================================================

function! WrapWordWith()
python3 << endPython

import vim
from itertools import dropwhile

def python_input(message = 'input'):
    vim.command('call inputsave()')
    vim.command("let user_input = input('" + message + ": ')")
    vim.command('call inputrestore()')
    return vim.eval('user_input')

def wrap_with():
    the_chars = {"[": "]", "['": "']", '["': '"]', "(": ")", "('": "')", '("': '")', "": ")"}
    the_word = vim.eval('expand("<cword>")')
    current_line = vim.current.line
    wrap_name = python_input("Wrap with")
    cursor_pos = vim.current.window.cursor
    open_char_gen = dropwhile(lambda x: x not in ["[", "(", "'", '"'], wrap_name)
    open_char = "".join(open_char_gen)
    courtesy_opener = "" if open_char else "("
    vim.current.buffer[cursor_pos[0] - 1] = current_line.replace(the_word, "{}{}{}{}".format(wrap_name, courtesy_opener, the_word, the_chars[open_char]))

wrap_with()

endPython
endfunction

command! WrapWith call WrapWordWith()
nnoremap <Leader>ww :WrapWith<CR>
"let g:unite_source_menu_menus.CustomKeyMaps.command_candidates += [['➤ Wrap word under cursor with method <Leader>ww', 'normal <Leader>ww']]
"===============================================================================================================

function! KinoMax()
python3 << endPython

def find_max(nums):
    #pdb.set_trace()
    pdb.set_trace()

    max = nums[0]
    for x in nums:
        if x > max:
            max = x
    print(max)

find_max([2, 4, 9, 7, 19, 94, 5])
endPython
endfunction

command! studentMax call KinoMax()

"=============================================PP4===============================================================
"===============================================================================================================

function! MakeUnderscore()
python3 << endPython

import vim

def underscore_test_name():
    current_line = vim.current.line
    test_start = current_line.find("test")
    test_end = current_line.find("(")
    test_name = current_line[test_start:test_end]
    test_name_underscored = test_name.replace(" ", "_")
    cursor_pos = vim.current.window.cursor
    vim.current.buffer[cursor_pos[0] - 1] = current_line.replace(test_name, test_name_underscored)

underscore_test_name()

endPython
endfunction

command! UnderscoreTest call MakeUnderscore()
nnoremap <Leader>us :call MakeUnderscore()<CR>
"let g:unite_source_menu_menus.CustomKeyMaps.command_candidates += [['➤ Undersocre Python test name <Leader>us', 'normal <Leader>us']]
"===============================================================================================================
"=============================================PP5===============================================================
"===============================================================================================================
" DESCRIPTION:   Used in .todo files for todo lists turns [ ] into [√]
" EXAMPLE USAGE: Postion a cursor on a line with the following contents
"                [ ] Some todo task
"                <Leader>tc will modified the line to the following:
"===============================================================================================================

au BufNewFile,BufRead *.todo set filetype=todo
function! UpdateToDoList()
python3 << endPython

import vim

def check_row(buffer, row):
    buffer[row] = buffer[row].replace("[ ]", "[x]")

def uncheck_row(buffer, row):
    buffer[row] = buffer[row].replace("[x]", "[ ]")

def is_checked(buffer, row):
    return "x" in buffer[row]

def toggle_row(buffer, row):
    if is_checked(buffer, row):
        uncheck_row(buffer, row)
    else:
        check_row(buffer, row)

def indent_level(buffer, row):
    current_row = buffer[row]
    leading_spaces = len(current_row) - len(current_row.lstrip(' '))
    return leading_spaces / 2

def is_child(buffer, row):
    return indent_level(buffer, row) > 0

def has_children(buffer, row):
    return row + 1 < len(buffer) and indent_level(buffer, row) < indent_level(buffer, row + 1)

def get_rows_for_direction(buffer, the_range, current_indent):
    x = set()
    for n in the_range:
        if indent_level(buffer, n) >= current_indent:
            x.add(n)
        else:
            break
    return x

def get_all_current_level_and_below(buffer, row):
    current_indent = indent_level(buffer, row)
    rows_below = get_rows_for_direction(buffer, range(row, len(buffer)), current_indent)
    return rows_below | get_rows_for_direction(buffer, range(row, 0, -1), current_indent)

def check_parent(buffer, row):
    rows = get_all_current_level_and_below(buffer, row)
    check_row(buffer, min(rows) - 1)

def uncheck_parent(buffer, row):
    rows = get_all_current_level_and_below(buffer, row)
    uncheck_row(buffer, min(rows) - 1)

def set_status_of_parents(buffer, row):
    for current_row in range(0, len(buffer)):
        rows_belonging_to_parent = get_all_current_level_and_below(buffer, current_row)
        if all([is_checked(buffer, row) for row in rows_belonging_to_parent]):
            check_parent(buffer, current_row)
        elif current_row < len(buffer) and is_child(buffer, current_row):
            uncheck_parent(buffer, current_row)

def do_it():
    buffer = vim.current.buffer
    current_row = vim.current.window.cursor[0]
    if has_children(buffer, current_row - 1):
        print("Cannot toggle checkboxes with child tasks")
    else:
        toggle_row(buffer, current_row - 1)
        if is_child(buffer, current_row - 1):
            set_status_of_parents(buffer, current_row - 1)

do_it()

endPython
endfunction

nnoremap <Leader>c :call UpdateToDoList()<CR>

"===============================================================================================================
"=============================================PP7===============================================================
"===============================================================================================================

function! PyDateFunc()
python << endPython

import datetime

def what_time_is_it():
    print(datetime.datetime.now())

what_time_is_it()

endPython
endfunction

command! PPyDateFunc call PyDateFunc()

"===============================================================================================================
"=============================================PP8===============================================================
"===============================================================================================================

function! ExampleFunction(arg1, arg2)
python << endPython

import vim

def greeting():
    title = vim.eval("a:arg1")
    name = vim.eval("a:arg2")
    print("Hello,\n {}. {}".format(title, name))

greeting()

endPython
endfunction

command! ExFunction1 call ExampleFunction("Mr", "Jarrod Taylor")
command! ExFunction2 call ExampleFunction("Sir", "Jarrod Taylor")

"===============================================================================================================
"=============================================PP9===============================================================
"===============================================================================================================

function! WritePreserveMtime()
python << EEOOFF
import vim
import os.path
import os
fpath = vim.current.buffer.name
atime = os.path.getatime(fpath)
mtime = os.path.getmtime(fpath)
vim.command("w")
os.utime(fpath, (atime, mtime))
EEOOFF
endfunction

command! PWritePreserveMtime call WritePreserveMtime()



"===============================================================================================================
"=============================================PP10==============================================================
"===============================================================================================================
" DESCRIPTION:   Yank in visual mode will now do three things
"                1) Default yank behaviour
"                2) Yank selection to "p register
"                3) Yank selection to system clipboard
" EXAMPLE USAGE: Use `y` in visual mode as usual. If the default " register is
"                overwritten you can still access the selection in the p register
"                easily with the shortcut <Leader>p
"===============================================================================
function! EnhancedYank() range
    normal! ""gvy
    let selection = getreg('"')
    let @p = selection
    let @+ = selection
endfunction

function! EnhancedYankToRegister()
  normal! ""gvy
  let selection = getreg('"')
  call inputsave()
  let g:regToYank = input('Register to yank to: ')
  call inputrestore()
  exe "let @" . g:regToYank . " = '" . selection . "'"
endfunction

"===============================================================================
" Function Keymappings
"===============================================================================
xnoremap y :call EnhancedYank()<CR>
xnoremap <Leader>" :call EnhancedYankToRegister()<CR>
xnoremap <Leader>p "pp
nnoremap <Leader>p "pp

"===============================================================================
" Unite Keymap Menu Item(s)
"===============================================================================
"let g:unite_source_menu_menus.CustomKeyMaps.command_candidates += [['➤ Paste from the p buffer                                       <Leader>p', '"pp']]
"let g:unite_source_menu_menus.CustomKeyMaps.command_candidates += [['➤ [Visual Mode] Yank to named register                          <Leader>"', 'echo "User <Leader>"']]



"===============================================================================================================
"=============================================PP11==============================================================
"===============================================================================================================
" DESCRIPTION:   Customizations for how folded text is displayed
" EXAMPLE USAGE: This function requires no user interaction
"===============================================================================
function! CustomFoldText()
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif
    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage
endf
set foldtext=CustomFoldText()


"===============================================================================================================
"=============================================PP11==============================================================
"===============================================================================================================
" DESCRIPTION:   Removes trailing whitespace when a file is saved. Prints a
"                message when the function runs so it will not be a surprise
"===============================================================================
function! StripTrailingWhitespace()
  normal mZ
  let l:chars = col("$")
  %s/\s\+$//e
  if (line("'Z") != line(".")) || (l:chars != col("$"))
    echo "Trailing whitespace stripped\n"
  endif
  normal `Z
endfunction

autocmd BufWritePre * :call StripTrailingWhitespace()


"===============================================================================================================
"=============================================PP12==============================================================
"===============================================================================================================
" DESCRIPTION:   Navigate between tmux and vim buffer splits with the same
"                keys
" EXAMPLE USAGE: Split your buffer and/or terminal (with tmux) and use Ctrl
"                plus hjkl to navigate between splits
"===============================================================================
function! s:NavigateTermSplits(direction)
  let windowNumber = winnr()
  execute 'wincmd ' . a:direction
  if windowNumber == winnr()
    " We didn't move to a new vim split. Now try to move tmux splits
    silent call system('tmux select-pane -' . tr(a:direction, 'hjkl', 'LDUR'))
  endif
endfunction

"===============================================================================
" Function Keymappings
"===============================================================================
nnoremap <silent> <C-h> :call <SID>NavigateTermSplits('h')<CR>
nnoremap <silent> <C-j> :call <SID>NavigateTermSplits('j')<CR>
nnoremap <silent> <C-k> :call <SID>NavigateTermSplits('k')<CR>
nnoremap <silent> <C-l> :call <SID>NavigateTermSplits('l')<CR>

"===============================================================================
" Unite Keymap Menu Item(s)
"===============================================================================
"let g:unite_source_menu_menus.CustomKeyMaps.command_candidates += [['➤ Navigate between splits                                       Ctrl + hjkl', 'echo "Use Ctrl plus hjkl to navigate splits"']]


"===============================================================================================================
"=============================================PP13==============================================================
"===============================================================================================================
" DESCRIPTION:   If we are in a python file call jedi goto on the word under
"                the cursor if any other file type attempt to jump to the ctag
"                definition for the word under the cursor.
" EXAMPLE USAGE: Position cursor over a word and press <leader>gt
"===============================================================================
function! MyJumpTo()
    let filetype=&ft
    if filetype == "python"
        exe ":call jedi#goto_definitions()"
    else
        :exe "norm \<C-]>"
    endif
endfunction

"===============================================================================
" Function Keymappings
"===============================================================================
nnoremap <Leader>gt :call MyJumpTo()<CR>


"===============================================================================================================
"=============================================PP14==============================================================
"===============================================================================================================
" DESCRIPTION:   Nicely format long single line json strings
" EXAMPLE USAGE: Visually select an uglified json string and call this command
"                to pretty print it
"===============================================================================
function! FormatJSON()
    :'<,'>!python -m json.tool
endfunction
command! -range FormatJSON call FormatJSON()


"===============================================================================================================
"=============================================PP15==============================================================
"===============================================================================================================

function! KinoMax()
python3 << endPython

import vim
import pdb
import logging

def find_max(nums):
    max = nums[0]
    for x in nums:
        if x > max:
            max = x
    print(max)

find_max([2, 4, 9, 7, 19, 94, 5])
endPython
endfunction

command! StudentMax call KinoMax()


"=============================================PP16==============================================================
"===============================================================================================================

function! KinoSYMPY()
python3 << endPython
import math
import sympy
from sympy import *

x = Symbol('x')
y = Symbol('y')
sympy.pprint(((x + x * y) / x))
print('------------------------------------0---')
sympy.pprint(simplify((x + x * y) / x))
print('------------------------------------1---')
expr = x**3 + 4
sympy.pprint(expr)
print('------------------------------------2---')
d = Derivative(expr, x)
sympy.pprint(d)
print('------------------------------------3---')
r = d.doit()  # builds the derivative result (3*x**2)
sympy.pprint(r)
print('------------------------------------4---')
n1 = d.doit_numerically(5)  # 75.0000000000000
sympy.pprint(n1)

endPython
endfunction

command! StudentSYMPY call KinoSYMPY()


"===============================================================================================================
"=============================================PP17==============================================================
"===============================================================================================================

" function! GoMain()
" go << endGO
" package main
" import "fmt"
" func add(args ...int) int {
"         total := 0
"         for _, v := range args {
"         total += v
"         }
" return total
" }
" func main() {
"         fmt.Println(add(1,2,3))
" }
" endGO
" endfunction
" command! GGoMain call GoMain()


"===============================================================================================================
"=============================================PP18==============================================================
"===============================================================================================================

function! LuaMain()
lua << EOF

a = "Hello "
b = "World"
print("Concatenation of string a with b is ", a..b )
print("Length of b is ",#b )
print("Length of b is ",#"Test" )
a = 20
b = 10
c = 15
d = 5
e = (a + b) * c / d;-- ( 30 * 15 ) / 5
print("Value of (a + b) * c / d is :",e )
e = a + (b * c) / d; -- 20 + (150/5)
print("Value of a + (b * c) / d is :",e )

EOF
endfunction

command! LLuaMain call LuaMain()


"===============================================================================================================
"=============================================PP19==============================================================
"===============================================================================================================



"===============================================================================================================
"=============================================PP20==============================================================
"===============================================================================================================
