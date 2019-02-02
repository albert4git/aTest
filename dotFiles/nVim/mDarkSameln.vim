function! s:doSomething()
  " stuff
endfunction
 
command DoSomething :call <SID>doSomething()
nmap k :DoSomething

    A trailing ! on function enables redefinition.
    The s: in the function definition and the <SID> in the command declaration are a thin but tenable form of namespace management. They’ll expand to a unique name at read time so that similarly named functions in other files are not clobbered.
    function could be replaced equivalently with fu, fun, func, etc. This follows for all Vim commands. As long as a token can uniquely complete into a keyword, it is valid.

As in many other languages, statements can be wrapped using a \ character. Unlike in those languages, in Vim Script it must appear at the beginning of the succeeding line:

if some_exceedingly_long_expression ||
   \ a_second_expression
  echo 'Success'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


I've made a matcher for CtrlP written in Python and C (part in C is actually
the matcher from Command-T). You can use it as an example: ctrlp-cmatcher.

Basic guidelines: you will need a basic knowledge of Python C API (check the
API reference). Also it's quite hard to debug: any flaws in C part will crash
Vim and it's hard to understand whats going on in debugger. Also watch out for
the leaks. I've written most of the C code separately, checked it in Valgrind
for leaks and only then added serialization and deserialization with Python
    bindings.

Another outstanding example is a YouCompleteMe plugin. It's written in Python
and C++ with Boost, so the Python bindings and actual coding is much easier,
but, obviously, requires Boost. It's very good written, check it if you wish
to write something complicated.
