With Makefiles, you could use some very generic things:

JAVAFILES=$(wildcard *.java)

mytarget: $(JAVAFILES)
    javac $^

On the other hand, you would probably fine doing

:compiler javac
:se makeprg=javac\ **/*.java
:make
:copen
#==================================================================
If you run linux(use bash), here is my setup: to compile and run the class with your main file just include this in your vimrc file

nnoremap <leader>ac :cd %:p:h <CR> :! javac %:t<CR> :! java %:t:r<CR>

#==============================================================
if you don't use any package in your java class, then

//compile
:!javac %

//run
:!java -cp %:p:h %:t:r

map F5 in the .vimrc file to automate the build

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c'
exec "!gcc % -o %<"
exec "!time ./%<"
elseif &filetype == 'cpp'
exec "!g++ % -o %<"
exec "!time ./%<"
elseif &filetype == 'java'
exec "!javac %"
exec "!time java -cp %:p:h %:t:r"
elseif &filetype == 'sh'
exec "!time bash %"
elseif &filetype == 'python'
exec "!time python2.7 %"
elseif &filetype == 'html'
exec "!firefox % &"
elseif &filetype == 'go'
exec "!go build %<"
exec "!time go run %"
elseif &filetype == 'mkd'
exec "!~/.vim/markdown.pl % > %.html &"
exec "!firefox %.html &"
endif
endfunc

