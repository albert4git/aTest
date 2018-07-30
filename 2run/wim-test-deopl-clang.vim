g:deoplete#sources#clang#std
	
Required 	No
Type 	dict
C Default 	c11
C++ Default 	c++1z
Objective-C Default 	c11
Objective-C++ Default 	c++1z
Example 	{'c': 'c11', 'cpp': 'c++1z', 'objc': 'c11', 'objcpp': 'c++1z'}

The standard version for each of the C family languages. By default, use the lastest version supported by clang.
g:deoplete#sources#clang#flags
	
Required 	No
Type 	list
C Default 	['-x', 'c']
C++ Default 	['-x', 'c++']
Objective-C Default 	['-x', 'objective-c']
Objective-C++ Default 	['-x', 'objective-c++']
Example 	["-fblocks",]

C(XX)FLAGS for generating completions. Setting value other than default. Does not need -x c or similar.

If you want to know the default clang build flags your of your installation you can try

# C
echo | clang -v -E -x c -
# C++
echo | clang -v -E -x c++ -
# Objective-C
echo | clang -v -E -x objective-c -
# Objective-C++
echo | clang -v -E -x objective-c++ -

For example, on macOS the settings would correspond to:

let g:deoplete#sources#clang#flags = [
      \ "-cc1",
      \ "-triple", "x86_64-apple-macosx10.11.0",
      \ "-isysroot", "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk",
      .
      .
      .
      \ "-fmax-type-align=16",
      \ ]
