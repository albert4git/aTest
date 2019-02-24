        "----------------------------------------------------------------------------------
        Plug 'adriaanzon/vim-textobj-matchit'
        "`am` and `im` :if-ifend , for-endfore ..
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
        " Plug 'bps/vim-textobj-python'
        "         let g:textobj_python_no_default_key_mappings = 1
        "         call textobj#user#map('python', {
        "                                 \   'class': {
        "                                 \     'select-a': '<buffer>ac',
        "                                 \     'select-i': '<buffer>ic',
        "                                 \     'move-n': '<buffer>]pc',
        "                                 \     'move-p': '<buffer>[pc',
        "                                 \   },
        "                                 \   'function': {
        "                                 \     'select-a': '<buffer>af',
        "                                 \     'select-i': '<buffer>if',
        "                                 \     'move-n': '<buffer>]pf',
        "                                 \     'move-p': '<buffer>[pf',
        "                                 \   }
        "                                 \ })

        "--------------------------------------------------------------------
        "--------------------------------------------------------------------
        " It provides the following objects:
        " - `af`: a function
        " - `if`: inner function
        " - `ac`: a class
        " - `ic`: inner class
        " It also provides a few motions in normal and operator-pending mode:
        " - `[pf` / `]pf`: move to next/previous function
        " - `[pc` / `]pc`: move to next/previous class
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
 
        "-AAA3----------------------------------------------------------------------------------------------{{{
        "" Plug 'tpope/vim-surround'
        Plug 'machakann/vim-sandwich'
                " sd,sr, sa{motion/textobject}{addition}(normal and visual mode)
                " let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
                " Sandwiched text could be resolved into two parts, {surrounding} and {surrounded text}.
                " sa add surroundings: mapped to the key sequence sa
                " sd Delete surroundings: mapped to the key sequence sd
                " sr Replace surroundings: mapped to the key sequence sr
                " ib Search and select a sandwiched text automatically: mapped to the key sequence ib and ab
                " is Search and select a sandwiched text with query: mapped to the key sequence is and as
                " da" will delete a quoted sympy.pprint(string.) 
                "(<b>'Sbandawitch'</b>) 
                nmap s <Nop>
                xmap s <Nop>
        "-------------------------------------------------------------
                let g:textobj_sandwich_no_default_key_mappings = 1
                omap ia <Plug>(textobj-sandwich-auto-i)
                xmap ia <Plug>(textobj-sandwich-auto-i)
                omap aa <Plug>(textobj-sandwich-auto-a)
                xmap aa <Plug>(textobj-sandwich-auto-a)
        "--------------------------------------------------------------
        "---[ {(hello) ( noch ) ('Mal') ("tomos") } tormos]
        "---------------SYMPY-SANDWICH---------------------------------
                vmap sb "zdi sympy.pprint(<c-r>z)<esc>
                vmap sn "zdi print(<c-r>z)<esc> 
                "-wrap <b></b> around selected text
                "vmap sb "zdi<b><c-r>z</b><esc>
                "-wrap <?=   ?> around visually selected text
                "vmap st "zdi<?= <c-r>z ?><esc> 
        Plug 'jiangmiao/auto-pairs'
                "   <M-o> : neline with indentation
                "   <M-a> : jump to of line
                "   <M-n> : jump to next pairs
                "   <M-e> : jump to end of pairs.
                "   Ctrl-V ) : insert ) without trigger the plugin.
                let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
                let g:AutoPairsShortcutToggle = '<M-p>'
                let g:AutoPairsShortcutFastWrap = '<M-e>'
                let g:AutoPairsShortcutJump = '<M-n>'
                let g:AutoPairsShortcutBackInsert = '<M-b>'
                let g:AutoPairsShortcuts = 1
                let g:AutoPairsMapBS = 1
                let g:AutoPairsMapCR = 0 " insert a new indented line if cursor in pairs.
                " error in vimwiki <CR> Enter. but use upper inoremap can solve.
                let g:AutoPairsMapSpace = 0
                " error in abbreviations <space> auto expand.
                let g:AutoPairsCenterLine = 1
                let g:AutoPairsFlyMode = 1
                let g:AutoPairsMapCR=0
                let g:AutoPairsMapCh=1
                let g:AutoPairsDelete = '<M-5>'
        "-nnn--------------------------------------------------------}}}

        "-AAA3----------------------------------------------------------------------------------------------{{{
        Plug 'AndrewRadev/switch.vim'
        let g:switch_mapping = "-"
        let g:switch_custom_definitions =
                                \ [
                                \ ['true', 'false'], ['True', 'False'], ['TRUE', 'FALSE'],
                                \ ['yes', 'no'], ['Yes', 'No'], ['YES', 'NO'],
                                \ ['on', 'off'], ['On', 'Off'], ['ON', 'OFF'],
                                \ ['up', 'down'], ['Up', 'Down'] ,['UP', 'DOWN'],
                                \ ['set', 'unset'],
                                \ ['is', 'isnot'] ,
                                \ ['==', '!='] , ['<', '>'], ['<=', '>='], ['=~', '!~'],
                                \ ['enable', 'disable'], ['Enable', 'Disable'],
                                \ ['enabled', 'disabled'], ['Enabled', 'Disabled'],
                                \ ['maximum', 'minimum'], ['Maximum', 'Minimum'],
                                \ ['maximal', 'minimal'], ['Maximal', 'Minimal'],
                                \ ['upper', 'lower'], ['Upper', 'Lower'],
                                \ ['top', 'bottom'], ['Top', 'Bottom'],
                                \ ['above', 'below'], ['Above', 'Below'],
                                \ ['forward', 'backward'], ['Forward', 'Backward'],
                                \ ['right', 'middle', 'left'], ['Right', 'Middle', 'Left'],
                                \ ['next', 'previous'], ['Next', 'Previous'],
                                \ ['first', 'last'], ['First', 'Last'],
                                \ ['before', 'after'], ['Before', 'After'],
                                \ ['more', 'less'], ['More', 'Less'],
                                \ ['fast', 'slow'], ['Fast', 'Slow'],
                                \ ['green', 'yellow', 'red'],
                                \ ['one', 'two', 'three']
                                \ ]
                "--------------------------------------------------------------------------
                let b:switch_custom_definitions = [
                                        \   {
                                        \     '\<[a-z0-9]\+_\k\+\>': {
                                        \       '_\(.\)': '\U\1'
                                        \     },
                                        \     '\<[a-z0-9]\+[A-Z]\k\+\>': {
                                        \       '\([A-Z]\)': '_\l\1'
                                        \     },
                                        \   }
                                        \ ]
        "-nnn--------------------------------------------------------}}}
