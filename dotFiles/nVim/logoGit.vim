        Plug 'lambdalisue/suda.vim'
        Plug 'lambdalisue/gina.vim'
        Plug 'lambdalisue/vim-gita'
        Plug 'motemen/git-vim'
        Plug 'c9s/hypergit.vim'
                " <leader>G    toggle hypergit menu
                " <leader>ci   commit current file changes
                " <leader>ca   commit all changes
                " <leader>ga   add file to git repository
                " <leader>gb   branch manager buffer
                " <leader>gs   status manager buffer
                " <leader>gh   stash manager buffer
                " :GitCommit
                " :GitCommitAll
                " :GitCommitAmend
                " :GitStatus
                " :GitStash
                " :GitPush
                " :GitPull


        "----------------------------------------------------------------------------------
                " vnoremap <leader>H :Gbrowse<cr>
                " nnoremap <leader>H V:Gbrowse<cr>
                " vnoremap <leader>u :Gbrowse @upstream<cr>
                " nnoremap <leader>u V:Gbrowse @upstream<cr>
                " Usage:
                "   - :Git[!] [args]
                "   - :Gstatus
                "   - :Gcommit [args]
                "   - :Gedit/:Gsplit/:Gvsplit/:Gtabedit/:Gpedit [revision]
                "   - :Gwrite/:Gwq {path}
                "   - :Gmove {destination}
                "   - :Gremove
                "   - :{range}Gread [revision]/[args]
                "   - :Gdiff/:Gsdiff/:Gvdiff [revision]
                "   - :Ggrep/:Glgrep [args] -- :grep/:lgrep with git-grep as 'grepprg'
                "   - :Glog [args] -- load all previous revisions of current file into quickfix
                "   - :[range]Gblame {flags}
                "   - :[range]Gbrowse {revision}
                " auto open quickfix window for :Ggrep.
                " nnoremap <leader>gs :Gstatus<CR>
                " nnoremap <leader>gc :Gcommit -v -q<CR>
                " nnoremap <leader>ga :Gcommit --amend<CR>
                " nnoremap <leader>gt :Gcommit -v -q %<CR>
                " nnoremap <leader>gd :Gdiff<CR>
                " nnoremap <leader>ge :Gedit<CR>
                " nnoremap <leader>gr :Gread<CR>
                " nnoremap <leader>gw :Gwrite<CR><CR>
                " nnoremap <leader>gl :silent! Glog<CR>
                " nnoremap <leader>gp :Ggrep<Space>
                " nnoremap <leader>gm :Gmove<Space>
                " nnoremap <leader>gb :Git branch<Space>
                " nnoremap <leader>go :Git checkout<Space>
                " nnoremap <leader>gps :Dispatch! git push<CR>
                " nnoremap <leader>gpl :Dispatch! git pull<CR>
                " With that configuration, my workflow is:
                " <leader>gl to view history
                " ]q and [q to move between versions (unimpaired.vim)
                " <leader>gd to open diff
                " :q to end diff
        "---------------------------------------------------------------------------------- 
