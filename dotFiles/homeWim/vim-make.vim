"-------------------------------------------------------------------------------
"compiler javac
"set makeprg =javac\ hello2W.java
"-------------------------------------------------------------------------------
"set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\*;else\ some_custom_command;fi
"-------------------------------------------------------------------------------
autocmd FileType c set makeprg=gcc\ -O2\ -g\ -Wall\ -Wextra\ -o'%<'\ '%'\ -lm
"--------------------------------------------------------------------------------
    let g:quickrun_known_file_types = {
            \"cpp": ["!g++ %", "./a.out"],
            \"c": ["!gcc %", "./a.out"],
            \"php": ["!php %"],
            \"vim": ["source %"],
            \"py": ["!python %"],
        \}
"-------------------------------------------------------------------------------
autocmd filetype c nnoremap <C-c> :w <bar> !gcc -std=c99 -lm % -o %:p:h/%:t:r.out && ./%:r.out<CR>
autocmd filetype java nnoremap <C-c> :w <bar> !javac % && java -enableassertions %:p <CR>
autocmd filetype python nnoremap <C-c> :w <bar> !python % <CR>
autocmd filetype perl nnoremap <C-c> :w <bar> !perl % <CR>
autocmd filetype go nnoremap <C-c> :w <bar> !go build % && ./%:p <CR>
"--------------------------------------------------------------------------------
"set makeprg='$HOME/.vim/cmake_makeprg.sh'
"   echo syntastic#util#system('echo "$PATH"')
"--------------------------------------------------------------------------------
