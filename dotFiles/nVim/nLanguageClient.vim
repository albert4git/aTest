
call plug#begin()
" LanguageClient plugin
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Minimal LSP configuration for JavaScript
let g:LanguageClient_serverCommands = {}
if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  " Use LanguageServer for omnifunc completion
  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
else
  echo "javascript-typescript-stdio not installed!\n"
  :cq
endif



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
