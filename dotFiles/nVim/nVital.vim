What vital.vim provides
Module 	Description
Assertion 	assertion library
Async.Promise 	An asynchronous operation like ES6 Promise
Bitwise 	bitwise operators
ConcurrentProcess 	manages processes concurrently with vimproc
Data.Base64 	base64 utilities library
Data.BigNum 	multi precision integer library
Data.Closure 	Provide Closure object
Data.Collection 	Utilities both for list and dict
Data.Counter 	Counter library to support convenient tallies
Data.Dict 	dictionary utilities library
Data.Either 	either value library
Data.LazyList 	lazy list including file io
Data.List 	list utilities library
Data.List.Closure 	Data.List provider for Data.Closure
Data.Optional 	optional value library
Data.OrderedSet 	ordered collection library
Data.Set 	set and frozenset data structure ported from python
Data.String 	string utilities library
Data.String.Interpolation 	build string with ${}
Data.Tree 	tree utilities library
Database.SQLite 	sqlite utilities library
DateTime 	date and time library
Experimental.Functor 	Utilities for functor
Hash.MD5 	MD5 encoding
Interpreter.Brainf__k 	Brainf**k interpreter
Locale.Message 	very simple message localization library
Mapping 	Utilities for mapping
Math 	Mathematical functions
OptionParser 	Option parser library for Vim
Prelude 	crucial functions
Process 	Utilities for process
Random.Mt19937ar 	random number generator using mt19937ar
Random.Xor128 	random number generator using xor128
Random 	Random utility frontend library
Stream 	A streaming library
System.Cache 	An unified cache system
System.File 	filesystem utilities library
System.Filepath 	path string utilities library
System.Process 	A cross-platform process utilities
Text.CSV 	CSV library
Text.INI 	INI file library
Text.LTSV 	LTSV library
Text.Lexer 	lexer library
Text.Parser 	parser library
Text.TOML 	TOML library
Text.Table 	Character table library
Vim.BufferManager 	buffer manager
Vim.Buffer 	Vim's buffer related stuff in general
Vim.Compat 	Vim compatibility wrapper functions
Vim.Guard 	Guard options/variables
Vim.Message 	Vim message functions
Vim.Python 	+python/+python3 compatibility functions
Vim.ScriptLocal 	Get script-local things
Vim.Search 	Vim's [I like function
Vim.ViewTracer 	Trace window and tabpage
Vim.WindowLayout 	lays out windows declaratively
Web.HTML 	HTML parser written in pure Vim script
Web.HTTP 	simple HTTP client library
Web.JSON 	JSON parser written in pure Vim script
Web.URI 	URI manipulation library
Web.XML 	XML parser written in pure Vim script

... and you can also create your own vital modules. Please see External vital modules for more information.
Let's get started
Install modules for your own plugin

Use :Vitalize to install modules. Please see the help for more details.

:Vitalize --name=your_plugin_name $HOME/.vim/bundle/your_plugin_dir/

You can also install only specified modules; recommended for making your repository size small, assuming you are going to upload it to a remote repository

:Vitalize --name=your_plugin_name $HOME/.vim/bundle/your_plugin_dir/ Data.String Data.List

Use vital functions

Assuming your Vim plugin name is ujihisa. You can define your utility function set ujihisa#util just by

let s:V = vital#ujihisa#new()
function! ujihisa#util#system(...)
    return call(s:V.system, a:000, s:V)
endfunction

and then you can call functions by ujihisa#util#system(), without taking care of vital.vim itself. It's all hidden.

Vital has module system. The below is an example to import/load a module Data.OrderedSet and to call a function f() of the module.

" Recommended way
let s:V = vital#ujihisa#new()
let s:O = s:V.import('Data.OrderedSet')
call s:O.f()

or

" Recommended way only if you rarely use the module
let s:V = vital#ujihisa#new()
call s:V.load('Data.OrderedSet')
call s:V.Data.OrderedSet.f()

or

" Available, but we don't recommend this very much
let s:V = vital#ujihisa#new()
call s:V.import('Data.OrderedSet', s:)
call s:f()

We recommend you to use a capital letter for a Vital module dictionary to assign.
