

Files [PATH] 	Files (similar to :FZF)
GFiles [OPTS] 	Git files (git ls-files)
GFiles? 	Git files (git status)
Buffers 	Open buffers
Colors 	Color schemes
Ag [PATTERN] 	ag search result (ALT-A to select all, ALT-D to deselect all)
Rg [PATTERN] 	rg search result (ALT-A to select all, ALT-D to deselect all)
Lines [QUERY] 	Lines in loaded buffers
BLines [QUERY] 	Lines in the current buffer
Tags [QUERY] 	Tags in the project (ctags -R)
BTags [QUERY] 	Tags in the current buffer
Marks 	Marks
Windows 	Windows
Locate PATTERN 	locate command output
History 	v:oldfiles and open buffers
History: 	Command history
History/ 	Search history
Snippets 	Snippets (UltiSnips)
Commits 	Git commits (requires fugitive.vim)
BCommits 	Git commits for the current buffer
Commands 	Commands
Maps 	Normal mode mappings
Helptags 	Help tags 1
Filetypes 	File types

    Most commands support CTRL-T / CTRL-X / CTRL-V key bindings to open in a
        new tab, a new split, or in a new vertical split Bang-versions of the

    commands (e.g. Ag!) will open fzf in fullscreen You can set
    g:fzf_command_prefix = 'Fzf' and you have FzfFiles, etc.


"=================================================================================================
brew install fzf
brew cask install xquartz
brew install wordnet
"=================================================================================================

"=================================================================================================

But you could just write a function which gets you the file list sorted by
date (Note this is all untested):

let l:filelist = split(system(find . -type f -printf '%T@ %p\n' | 
                              \ sort -k 1 -n | sed 's/^[^ ]* //'), 'n')

There are some other commands, depending on your enviroment which can be used.
But here the first problems arise. That command listes all your files in your
directory. To respect your gitignore or whatever more work is needed. Also
this is a lot slower than fzf!

Once you have the list, you can just use fzf again:

call fzf#run({'source': l:filelist, 'sink': 'e', 'down': '40%'})

So i think this could maybe work fine for small projects, but if you have a bigger project it is way to slow, also if you use something like rails which rebuilds your assets quite often, you will have to filter the result.
"=================================================================================================

You can specify the command to obtain the input of fzf by using the fzf#run()
function. In your case, this can look something like this:

call fzf#run({'source': 'find ~/project/ ~/libs/include -type f', 
             \ 'sink':  'edit'})

and if you want, you can add a command like this

command! FZFLib call fzf#run({'source': 'find ~/project/ ~/libs/include -type f', 'sink':  'edit'})



        "==========================================================================================
        let g:fuzzyfunc = &omnifunc

        function! FuzzyCompleteFunc(findstart, base)
                let Func = function(get(g:, 'fuzzyfunc', &omnifunc))
                let results = Func(a:findstart, a:base)

                if a:findstart
                        return results
                endif

                if type(results) == type({}) && has_key(results, 'words')
                        let l:words = []
                        for result in results.words
                                call add(words, result.word . ' ' . result.menu)
                        endfor
                elseif len(results)
                        let l:words = results
                endif

                if len(l:words)
                        let result = fzf#run({ 'source': l:words, 'down': '~40%', 'options': printf('--query "%s" +s', a:base) })

                        if empty(result)
                                return [ a:base ]
                        endif

                        return [ split(result[0])[0] ]
                else
                        return [ a:base ]
                endif
        endfunction


        setlocal completefunc=FuzzyCompleteFunc
        setlocal completeopt=menu
        imap <C-f> :call FuzzyCompleteFunc()<cr>

        " set completefunc=FuzzyCompleteFunc
        " set completeopt=menu
        " function! TabComplete()
        "         let col = col('.') - 1

        "         if !col || getline('.')[col - 1] !~# '\k'
        "                 call feedkeys("\<tab>", 'n')
        "                 return
        "         endif

        "         call feedkeys("\<c-x>\<c-j>")
        " endfunction
        " inoremap <silent> <tab> <c-o>:call TabComplete()<cr>


So, thanks to previous awesome impletentation of FuzzyCompleteFunc all we need to do is adjust g:fuzzyfunc:

let g:fuzzyfunc = 'completor#completefunc'

completor#completefunc is internal completion function of completor.vim that is returning results in same format as omnifunc, but they are context sensitive (as I wrote earlier).


        :set runtimepath
            runtimepath=~/.config/nvim,/etc/xdg/nvim,~/.local/share/nvim/site,...,
            ,~/g/path/to/your/plugin-git-repo

        " Put this in your plugin section:
        " Fuzzy selection
        Plug 'junegunn/fzf'
        " IDE-like autocompletion without
        Plug 'roxma/nvim-completion-manager'

        " Put this outside of the plugin section
        " <leader>lf to fuzzy find the symbols in the current document
        autocmd FileType javascript nnoremap <buffer>
                    \ <leader>lf :call LanguageClient_textDocument_documentSymbol()<cr>


        let g:LanguageClient_serverCommands.python = ['pyls']
        " Map renaming in python
        autocmd FileType python nnoremap <buffer>
                    \ <leader>lr :call LanguageClient_textDocument_rename()<cr>
