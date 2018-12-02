
"----------------------------------------------------------------------------------
"----------------------------------------------------------------------------------
    :compiler rubyunit
    :make test/models/user_test.rb


If no `b:dispatch` is found, it falls back to `:Make`.

`:Dispatch` makes a great map:

    nnoremap <F9> :Dispatch<CR>

### Focusing

Use `:FocusDispatch` (or just `:Focus`) to temporarily, globally override the
default dispatch:

    :Focus rake spec:models

Now every bare call to `:Dispatch` will call `:Dispatch rake spec:models`.
You'll be getting a lot of mileage out of that `:Dispatch` map.

Use `:Focus!` to reset back to the default.



"----------------------------------------------------------------------------------
When calling `:Neomake` manually (or automatically through
`neomake#configure#automake` (see above)) it will populate the window's
location list with any issues that get reported by the maker(s).

You can then navigate them using the built-in methods like `:lwindow` /
`:lopen` (to view the list) and `:lprev` / `:lnext` to go back and forth.

You can configure Neomake to open the list automatically:

```vim
let g:neomake_open_list = 2
```

Please refer to [`:help neomake.txt`] for more details on configuration.


Set `let g:neomake_logfile = '/tmp/neomake.log'` (dynamically or in your vimrc)
to  enable debug logging to the given file.
From Neomake's source tree you can then run `make tail_log`, which will color
the output and pipe it into `less`, which folds long lines by default and will
follow the output (like `tail -f`).
You can use Ctrl-C to interrupt for scrolling etc, and then F to follow again.

### Running tests

#### Run all tests against your local Neovim and Vim

    make test

#### Run a specific test file

    make tests/integration.vader

#### Run some specific tests for Vim

    make testvim VADER_ARGS=tests/integration.vader
