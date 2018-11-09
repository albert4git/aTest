VimTip	{{{1 32: Write your own vim function(scripts)
http://vim.sourceforge.net/tip_view.php?tip_id=

compare to C and shell(bash), herein is some vim specifics about vim-script:
1. A function name must be capitalized.
   hex2dec is invalid
   Hex2dec is valid
   while in c and shell(bash), both lowercase and uppercase is allowed.
2. how to reference the parameters
   fu! Hex2dec(var1, var2)
    let str=a:var1
    let str2=a:var2
   you must prefix the parameter name with "a:", and a:var1 itself is read-only
   in c, you reference the parameter directly and the parameter is writable.
3. how to implement variable parameter
   fu! Hex2dec(fixpara, ...)
     a:0 is the real number of the variable parameter when you invoke the function, with :Hex2dec("asdf", 4,5,6), a:0=3, and a:1=4 a:2=5 a:3=6
   you can combine "a:" and the number to get the value
   while i<a:0
     exe "let num=a:".i
     let i=i+1
   endwhile
   in c, the function get the real number by checking the additional parameter such as printf family, or by checking the special value such as NULL
4. where is the vim-library
  yes, vim has its own function-library, just like *.a in c
  :help functions
5. can I use += or ++ operator?
  Nop, += and ++ (and -=, -- and so on)operator gone away in vim.
6. How can I assign a value to a variables and fetch its value?
   let var_Name=value
   let var1=var2
   like it does in c, except you must use let keyword
7. Can I use any ex-mode command in a function?
  As I know, yes, just use it directly, as if every line you type appears in the familar : 
8. Can I call a function recurse?
  Yes, but use it carefully to avoid infinte call.
9. Can I call another function in a function?
  Course, like C does.
10. Must I compile the function?
   No, you needn't and you can't, just :so script_name, after this you can call the function freely.
11. Is it has integer and char or float data type?
   No, like perl, vim script justify the variable type depend upon the context
   :let a=1
   :let a=a."asdf"
   :echo a
   you'll get `1asdf'
   :let a=1
   :let a=a+2
   :echo a
   you'll get 3
   But it differs from perl.
12. Must I append a `;' in every statement?
   No, never do that.
   ; is required in C, and optional in shell for each statement in a alone line.
   But is forbidden in vim.
   if you want combine servals statement in one single line, use `|'.
   Take your mind that every statement appears in function should be valid in ex-mode(except for some special statement).

