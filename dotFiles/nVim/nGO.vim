First you need to install a language server. An example of installing one might be:

$ go get github.com/sourcegraph/go-langserver/langserver/cmd/langserver-go

A more complete set of language servers can be found here:
https://github.com/Microsoft/language-server-protocol/wiki/Protocol-Implementations

You will need to put this somewhere that is sourced on startup.

let g:langserver_executables = {
      \ 'go': {
        \ 'name': 'sourcegraph/langserver-go',
        \ 'cmd': ['langserver-go', '-trace', '-logfile', expand('~/Desktop/langserver-go.log')],
        \ },
      \ }

To start the language server, run the command:

:LSPStart

After starting the language server, you should be able to run commands like:

:LSPGoto
:LSPHover
