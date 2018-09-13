set nocompatible        " Must be first line

function! MyCompile()
    let choice = confirm(Compile method , \&make\\n\&g++ \%.cpp )
    if choice == 1
        exec :make
    elseif choice == 2
        exec !g++ \%.cpp
    else
    endif
endfunction
