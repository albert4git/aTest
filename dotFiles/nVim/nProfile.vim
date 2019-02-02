


You can use built-in profiling support: after launching vim do

:profile start profile.log
:profile func *
:profile file *
" At this point do slow actions
:profile pause
:noautocmd qall!

(unlike quitting noautocmd is not really required, it just makes vim quit faster).

Note: you won’t get information about functions there were deleted before vim quit.
"--------------------------------------------------------------------------------- 
found another very helpful vim buildin method to show the exactly timing messages while loading your .vimrc.

vim --startuptime timeCost.txt timeCost.txt

Please run:

:help --startuptime
"--------------------------------------------------------------------------------- 
 have found it helpful to print all Vim activity to a file by starting Vim with the -V option:
vim -V12log

This provides the maximum verbosity (level 12) and outputs it to the file log.
You can then perform some Vim actions which you know to be slow, and then see
which functions/mappings are being called internally.

"--------------------------------------------------------------------------------- 
https://github.com/hyiltiz/vim-plugins-profile
"------------------------------------------------------------- 

This is NOT a vim plugin! This is simply a profiler for your vim plugins that are installed through various plugin managers such as vim-plug.

Download the .zip here and then simply run the bash script:

bash ./vim-plugins-profile.sh

# Alternatively use Ruby powers! Less dependency, graph with ASCII art
ruby ./vim-plugins-profile.rb

# Or python if you are from the other camp.
python vim-profiler.py 
python vim-profiler.py -p # plot a bar chart

# To use an alternative executable such as neovim, pass it as the first argument.
ruby ./vim-plugins-profile.rb nvim

Then open the profile.png file for the result! It is that simple.
Dependency

Nothing. Well, at least Bash or Ruby or Python, but most systems already comes with all those pre-installed already.

If not (e.g. in M$ Windows systems), then you will need to install several tools before you can run this.

    Bash (Cygwin, or Git for Windows will also work)
    Ruby 2.3 (other version might as well just work. If not, you can repurt an Issue then I'll fix it)

To produce the eye-candy graphs, you can use either R or Python.

For R, the script prompts whether it should install the R:ggplot2 package if you already have R. Here are the list of dependencies for it:

    R
    R:ggplot2 (the ggplot2 package for R)

For Python, you can use either python2 or python3. If you have matplotlib (optional) installed, then you can even generate the bar plot. Implementation for people from the python camp is merged from @bchretien. It also supports a custom command to run in the exec mode. Feel free to hack your way!
TODO

    Maybe optionally use gnuplot or matplotlib instead of R:ggplot2 if any of the other two are installed already.
"--------------------------------------------------------------------------------- 
"--------------------------------------------------------------------------------- 

Вы можете использовать собственный механи
зм профилирования vim:

vim --cmd 'profile start profile.log' \
    --cmd 'profile func *' \
    --cmd 'profile file *' \
    -c 'profdel func *' \
    -c 'profdel file *' \
    -c 'qa!'
"--------------------------------------------------------------------------------- 
" Open profile.log file in vim first
let timings=[]                      
g/^SCRIPT/call add(timings, [getline('.')[len('SCRIPT  '):], matchstr(getline(line('.')+1), '^Sourced \zs\d\+')]+map(getline(line('.')+2, line('.')+3), 'matchstr(v:val, ''\d\+\.\d\+$'')'))
enew                            
call setline('.', ['count total (s)   self (s)  script']+map(copy(timings), 'printf("%5u %9s   %8s  %s", v:val[1], v:val[2], v:val[3], v:val[0])'))

Он будет несортирован, но вы всегда можете использовать встроенную команду :sort, если количество скриптов слишком велико.
"--------------------------------------------------------------------------------- 
vim -V 2>&1 | perl -MTime::HiRes=time -ne 'print time, ": ", $_' | tee vilog
"--------------------------------------------------------------------------------- 
vim -V 2>&1 | perl -ne 'print time, ": ", $_' | tee vilog
"--------------------------------------------------------------------------------- 
vim -V 2>&1 | perl -MTime::HiRes=time -ne '$a = time unless defined $a; print time - $a, ": ", $_' | tee vilog
"--------------------------------------------------------------------------------- 
"--------------------------------------------------------------------------------- 
"--------------------------------------------------------------------------------- 
