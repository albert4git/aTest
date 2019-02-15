
        Plug 'lepture/vim-jinja'
        Plug 'tylerhunt/vim-spark'
        "Plug 'sjl/vim-sparkup'
        Plug 'vim-scripts/Emmet.vim'
        let g:user_emmet_settings = {
                                \  'indentation' : '  ',
                                \  'perl' : {
                                \    'aliases' : {
                                \      'req' : 'require '
                                \    },
                                \    'snippets' : {
                                \      'use' : "use strict\nuse warnings\n\n",
                                \      'warn' : "warn \"|\";",
                                \    }
                                \  }
                                \}
        let g:user_emmet_expandabbr_key = '<c-\>'
        let g:use_emmet_complete_tag = 1
