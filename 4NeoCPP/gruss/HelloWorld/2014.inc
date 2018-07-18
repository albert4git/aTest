A rule named default is defined. It is the first rule of the file so it is
called by default when the command make -f Makefile.simpler
is executed (the -f option defines the name of the file that contains rules).r
The target default depends on the bin/hello rule that may generate the executable file of the program HelloWorld.
The target bin/hello depends on both object files obj/hello.o and obj/main.o that are also defined as targets that depends
respectively on src/hello.cpp and inc/hello.hfiles and src/main.cpp and inc/hello.h files. So rules forms a chain of dependencies.
The program HelloWorld is created invoking the file Makefile.simple with the GNU Make program.
[~/workspace/C++/HelloWorld] > make -f Makefile.simple
g++ -I ./inc -c src/hello.cpp -o obj/hello.o
g++ -I ./inc -c src/main.cpp -o obj/main.o
g++ -o bin/hello obj/hello.o obj/main.o
Both targets clean and cleanall defines actions to clean up all files generated
by the GNU Make program.r
The .PHONY target is used to avoid conflict with a file of the same name. Dependencies of this target are rules that may be explicitly invoked.
[~/workspace/C++/HelloWorld] > make -f Makefile.simple cleanall
rm -f obj/*.o
rm -f bin/hello
Now let us write a more advanced Makefile that used some interesting features
provided by GNU Make.i See the GNU Make section that describes some features. Refer to the GNU Make manual for more explanations.
--------------------------------------------------------------
Dependencies of this target are rules that may be explicitly invoked 
Dependencies of this target are rules that may be explicitly invoked 
--------------------------------------------------------------
Useful options of g++
g++ [option] ...
The GNU project C and C++ compiler. g++ normally does preprocessing, compilation, assembly and linking. The overall options allow you to stop this process at an intermediate stage. For example, the -c option says not to run the linker. Then the output consists of object files outputed by the assembler. Other options are passed on to one stage of processing. Some options control the preprocessor and others the compiler itself. Yet other options control the assembler and linker.
--------------------------------------------------------------
The GNU make utility to maintain groups of programs. The purpose of the make utility is to determine automatically which pieces of a large program need to be recompiled, and issue the commands to recompile them.
--------------------------------------------------------------
Add the directory dir to the list of directories to be searched for header files. Directories named by -I are searched before the standard system include directories. If the directory dir is a standard system include directory, the option is ignored to ensure that the default search order for system directories and the special treatment of system headers are not defeated.
--------------------------------------------------------------
Compile or assemble the source files, but do not link. The linking stage simply is not done. The ultimate output is in the form of an object file for each source file.
--------------------------------------------------------------
Write output to file. This is the same as specifying file as the second non-option argument to cpp. g++ has a different interpretation of a second non-option argument, so you must use -o to specify the output file.
--------------------------------------------------------------
Generate position-independent code (PIC) suitable for use in a shared library, if supported for the target machine. Such code accesses all constant addresses through a global offset table (GOT).
So you may get an error message from the linker indicating that -fpic does not work; in that case, recompile with -fPIC instead.
--------------------------------------------------------------
Produce a shared object which can then be linked with other objects to form an executable. Not all systems support this option. For predictable results, you must also specify the same set of options that were used to generate code (-fpic, -fPIC, or model suboptions) when you specify this option.
--------------------------------------------------------------
Continue as much as possible after an error. While the target that failed, and those that depend on it, cannot be remade, the other dependencies of these targets can be processed all the same.
--------------------------------------------------------------
