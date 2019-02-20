        "----------------------------------------------------------------------------------
        Plug 'kana/vim-textobj-user'
        Plug 'gilligan/textobj-gitgutter'
                vmap ih <Plug>(textobj-gitgutter-i)
        "----------------------------------------------------------------------------------
        Plug 'kana/vim-textobj-diff'
        Plug 'reedes/vim-textobj-sentence'
        Plug 'kana/vim-textobj-function'
        Plug 'Julian/vim-textobj-brace'
        Plug 'glts/vim-textobj-indblock'
        Plug 'beloglazov/vim-textobj-quotes'
        "---gi-----------------------------------------------------------------------------
        Plug 'bps/vim-textobj-python'
        "---gi-----------------------------------------------------------------------------
        Plug 'terryma/vim-expand-region'
                 "-Default-settings. 
                 let g:expand_region_text_objects = {
                                         \ 'iw'  :0,
                                         \ 'iW'  :0,
                                         \ 'i"'  :0,
                                         \ 'i''' :1,
                                         \ 'ib'  :1,
                                         \ 'i)'  :1,
                                         \ 'iB'  :1, 
                                         \ 'i}'  :1, 
                                         \ 'i]'  :1,
                                         \ 'if'  :1,
                                         \ 'io'  :1,
                                         \ 'ip'  :1,
                                         \ 'ih'  :1
                                         \ }
        "----------------------------------------------------------------------------------

        "----------------------------------------------------------------------------------
        nmap <m-1> <esc>viq<left> 
                nmap <m-q> <esc>vaq<left> 
                        nmap <m-0> <esc>vab<left> 
                                nmap <m-3> <esc>viB 
                                        nmap <m-i> <esc>vio 
                                        nmap <m-9> <esc>vif 
                        nmap <m-8> <esc>vaf 
                nmap <m-7> <esc>vip 
        nmap <m-6> <esc>vih 
        "---------------------------------------------------------------------------------- 
 
