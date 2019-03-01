Tutorials
Async run gcc to compile current file

:AsyncRun gcc % -o %<
:AsyncRun g++ -O3 "%" -o "%<" -lpthread 

This command will run gcc in the background and output to the quickfix window in realtime. Macro '%' stands for filename and '%<' represents filename without extension.
Async run make

:AsyncRun make
:AsyncRun make -f makefile

Grep key word

:AsyncRun! grep -R word . 
:AsyncRun! grep -R <cword> . 

when ! is included, auto-scroll in quickfix will be disabled. <cword> represents current word under cursor.
Compile go project

:AsyncRun go build "%:p:h"

Macro '%:p:h' stands for current file dir.
Lookup man page

:AsyncRun! man -S 3:2:1 <cword>

Git push

:AsyncRun git push origin master

Setup <F7> to compile file

:noremap <F7> :AsyncRun gcc "%" -o "%<" <cr> 

File name may contain spaces, therefore, it's safe to quote them.
Run a python script

:AsyncRun -raw python %

New option -raw will display the raw output (without matching to errorformat), you need the latest AsyncRun (after 1.3.13) to use this option. Remember to put let $PYTHONUNBUFFERED=1 in your .vimrc to disable python stdout buffering, see here.
Manual

There are two vim commands: :AsyncRun and :AsyncStop to control async jobs.
AsyncRun - Run shell command

:AsyncRun[!] [options] {cmd} ...

run shell command in background and output to quickfix. when ! is included, auto-scroll in quickfix will be disabled. Parameters are splited by space, if a parameter contains space, it should be quoted or escaped as backslash + space (unix only).

Parameters accept macros start with '%', '#' or '<' :

%:p     - File name of current buffer with full path
%:t     - File name of current buffer without path
%:p:h   - File path of current buffer without file name
%:e     - File extension of current buffer
%:t:r   - File name of current buffer without path and extension
%       - File name relativize to current directory
%:h:.   - File path relativize to current directory
<cwd>   - Current directory
<cword> - Current word under cursor
<cfile> - Current file name under cursor
<root>  - Project root directory

Environment variables are set before executing:

$VIM_FILEPATH  - File name of current buffer with full path
$VIM_FILENAME  - File name of current buffer without path
$VIM_FILEDIR   - Full path of current buffer without the file name
$VIM_FILEEXT   - File extension of current buffer
$VIM_FILENOEXT - File name of current buffer without path and extension
$VIM_PATHNOEXT - Current file name with full path but without extension
$VIM_CWD       - Current directory
$VIM_RELDIR    - File path relativize to current directory
$VIM_RELNAME   - File name relativize to current directory 
$VIM_ROOT      - Project root directory
$VIM_CWORD     - Current word under cursor
$VIM_CFILE     - Current filename under cursor
$VIM_GUI       - Is running under gui ?
$VIM_VERSION   - Value of v:version
$VIM_COLUMNS   - How many columns in vim's screen
$VIM_LINES     - How many lines in vim's screen
$VIM_SVRNAME   - Value of v:servername for +clientserver usage 

These environment variables wrapped by $(...) (eg. $(VIM_FILENAME)) will also be expanded in the parameters. Macro $(VIM_ROOT) and <root> (new in version 1.3.12) indicate the Project Root of the current file.

There can be some options before your [cmd]:

-mode=0/1/2 - start mode: 0(async, default), 1(:make), 2(:!)
-cwd=?      - initial directory, (use current directory if unset)
-save=0/1/2 - non-zero to save current(1) or all(2) modified buffer(s) before executing.
-program=?  - set to `make` to use `&makeprg`, `grep` to use `&grepprg` 
-post=?     - vimscript to exec after this job finished, spaces **must** be escaped to '\ '
-auto=?     - event name to trigger "QuickFixCmdPre/QuickFixCmdPost [name]" autocmd
-raw=1      - use raw output (output will not match with the errorformat) 
-strip      - remove the heading / tailing messages (command and [Finished in ...]).

All options must start with a minus and position before [cmd]. Since no shell command string starts with a minus. So they can be distinguished from shell command easily without any ambiguity.

Don't worry if you do have a shell command starting with '-', Just put a placeholder @ before your command to tell asyncrun explicitly: "stop parsing options now, the following string is all my command".
AsyncStop - Stop the running job

:AsyncStop[!]

stop the running job, when "!" is included, job will be stopped by signal KILL
Settings:

    g:asyncrun_exit - script will be executed after finished
    g:asyncrun_bell - non-zero to ring a bell after finished
    g:asyncrun_mode - 0:async(require vim 7.4.1829) 1:sync 2:shell
    g:asyncrun_encs - set shell encoding if it's different from &encoding, see encoding
    g:asyncrun_trim - non-zero to trim the empty lines in the quickfix window.
    g:asyncrun_auto - event name to trigger QuickFixCmdPre/QuickFixCmdPost, see FAQ
    g:asyncrun_open - above zero to open quickfix window at given height after command starts
    g:asyncrun_save - non-zero to save current(1) or all(2) modified buffer(s) before executing
    g:asyncrun_timer - how many messages should be inserted into quickfix every 100ms interval.
    g:asyncrun_wrapper - enable to setup a command prefix.
    g:asyncrun_stdin - non-zero to enable stdin (useful for cmake on windows).

For more information of above options, please visit option details.
Variables:

    g:asyncrun_code - exit code
    g:asyncrun_status - 'running', 'success' or 'failure'

Autocmd:

autocmd User AsyncRunPre   - triggered before executing
autocmd User AsyncRunStart - triggered after starting successfully
autocmd User AsyncRunStop  - triggered when job finished

Note, AsyncRunPre is always likely to be invoked, but AsyncRunStart and AsyncRunStop will only be invoked if the job starts successfully.

When previous job is still running or vim job slot is full, AsyncRun may fail. In this circumstance, AsyncRunPre will be invoked but AsyncRunStart and AsyncRunStop will have no chance to trigger.
Project Root

Vim is lack of project management, as files usually belong to projects, you can do nothing to the project if you don't have any information about where the project locates. Inspired by CtrlP, this feature (new in version 1.3.12) is very useful when you've something to do with the whole project.

Macro <root> or $(VIM_ROOT) in the command line or in the -cwd option will be expanded as the Project Root Directory of the current file:

:AsyncRun make
:AsyncRun -cwd=<root> make

The first make will run in the vim's current directory (which :pwd returns), while the second one will run in the project root directory of current file. This feature is very useful when you have something (make / grep) to do with the whole project.

The project root is the nearest ancestor directory of the current file which contains one of these directories or files: .svn, .git, .hg, .root or .project. If none of the parent directories contains these root markers, the directory of the current file is used as the project root. The root markers can also be configurated, see Project Root.
Quickfix window

AsyncRun displays its output in quickfix window, so if you don't use :copen {height} to open quickfix window, you won't see any output. For convenience there is an option g:asyncrun_open for you:

:let g:asyncrun_open = 8

Setting g:asyncrun_open to 8 will open quickfix window automatically at 8 lines height after command starts.
Range support

AsyncRun can take a range of lines in the current buffer as command's stdin after version 1.3.27. You can try:

:%AsyncRun cat

the whole buffer will be the input of command cat. you will see the content of your current buffer will be output to the quickfix window.

:10,20AsyncRun python

text between line 10-20 will be taken as the stdin of python. code in that range will be executed by python and the output will display in the quickfix window.

:'<,'>AsyncRun -raw perl

The visual selection (line-wise) will be taken as stdin.
Requirements:

Vim 7.4.1829 is minimal version to support async mode. If you are use older versions, g:asyncrun_mode will fall back from 0/async to 1/sync. NeoVim 0.1.4 or later is also supported.

Recommend to use Vim 8.0 or later.
