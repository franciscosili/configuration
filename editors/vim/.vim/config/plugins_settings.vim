" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Tagbar -----------------------------

    " toggle tagbar display
    map <F4> :TagbarToggle<CR>
    " autofocus on tagbar open
    let g:tagbar_autofocus = 1

" NERDTree -----------------------------

    " toggle nerdtree display
    map <F3> :NERDTreeToggle<CR>
    " open nerdtree with the current file selected
    nmap ,t :NERDTreeFind<CR>
    " don;t show these file types
    let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

    " Enable folder icons
    let g:WebDevIconsUnicodeDecorateFolderNodes = 1
    let g:DevIconsEnableFoldersOpenClose = 1

    " Fix directory colors
    highlight! link NERDTreeFlags NERDTreeDir

    " Remove expandable arrow
    let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
    let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
    let NERDTreeDirArrowExpandable = "\u00a0"
    let NERDTreeDirArrowCollapsible = "\u00a0"
    let NERDTreeNodeDelimiter = "\x07"

    " Autorefresh on tree focus
    function! NERDTreeRefresh()
        if &filetype == "nerdtree"
            silent exe substitute(mapcheck("R"), "<CR>", "", "")
        endif
    endfunction

    autocmd BufEnter * call NERDTreeRefresh()

" Syntastic ------------------------------
    " show list of errors and warnings on the current file
    nmap <leader>e :Errors<CR>

    " check also when just opened the file
    let g:syntastic_check_on_open = 1

    " don't put icons on the sign column (it hides the vcs status icons of signify)
    let g:syntastic_enable_signs = 0
    " -Custom icons (enable them if you use a patched font, and enable the previous 
    " setting)
    "let g:syntastic_error_symbol = '✗'
    "let g:syntastic_warning_symbol = '⚠'
    "let g:syntastic_style_error_symbol = '✗'
    "let g:syntastic_style_warning_symbol = '⚠'



" NERDCommenter  ------------------------------

" remap toggle commenting
    map <silent> <leader>c <plug>NERDCommenterToggle



" Tasklist ------------------------------

    " show pending tasks list
    map <F2> :TaskList<CR>

" Neomake ------------------------------

    " Run linter on write
    autocmd! BufWritePost * Neomake

    " Check code as python3 by default
    let g:neomake_python_python_maker = neomake#makers#ft#python#python()
    let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
    let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
    let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'

    " Disable error messages inside the buffer, next to the problematic line
    let g:neomake_virtualtext_current_error = 0

" Fzf ------------------------------

    " file finder mapping
    nmap ,e :Files<CR>
    " tags (symbols) in current file finder mapping
    nmap ,g :BTag<CR>
    " the same, but with the word under the cursor pre filled
    nmap ,wg :execute ":BTag " . expand('<cword>')<CR>
    " tags (symbols) in all files finder mapping
    nmap ,G :Tags<CR>
    " the same, but with the word under the cursor pre filled
    nmap ,wG :execute ":Tags " . expand('<cword>')<CR>
    " general code finder in current file mapping
    nmap ,f :BLines<CR>
    " the same, but with the word under the cursor pre filled
    nmap ,wf :execute ":BLines " . expand('<cword>')<CR>
    " general code finder in all files mapping
    nmap ,F :Lines<CR>
    " the same, but with the word under the cursor pre filled
    nmap ,wF :execute ":Lines " . expand('<cword>')<CR>
    " commands finder mapping
    nmap ,c :Commands<CR>

" Deoplete -----------------------------

    " Use deoplete.
    "let g:deoplete#enable_at_startup = 1
    "call deoplete#custom#option({
    "\   'ignore_case': v:true,
    "\   'smart_case': v:true,
    "\})
    "" complete with words from any opened file
    let g:context_filetype#same_filetypes = {}
    let g:context_filetype#same_filetypes._ = '_'

" Jedi-vim ------------------------------

    " Disable autocompletion (using deoplete instead)
    let g:jedi#completions_enabled = 0

    " All these mappings work only for python code:
    " Go to definition
    let g:jedi#goto_command = ',d'
    " Find ocurrences
    let g:jedi#usages_command = ',o'
    " Find assignments
    let g:jedi#goto_assignments_command = ',a'
    " Go to definition in new tab
    nmap ,D :tab split<CR>:call jedi#goto()<CR>

" Ack.vim ------------------------------

    " mappings
    nmap ,r :Ack 
    nmap ,wr :execute ":Ack " . expand('<cword>')<CR>

" Window Chooser ------------------------------

    " mapping
    nmap  -  <Plug>(choosewin)
    " show big letters
    let g:choosewin_overlay_enable = 1

" Signify ------------------------------

    " this first setting decides in which order try to guess your current vcs
    " UPDATE it to reflect your preferences, it will speed up opening files
    let g:signify_vcs_list = ['git', 'hg']
    " mappings to jump to changed blocks
    nmap <leader>sn <plug>(signify-next-hunk)
    nmap <leader>sp <plug>(signify-prev-hunk)
    " nicer colors
        highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
    highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
    highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
    highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
    highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
    highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Autoclose ------------------------------

    " Fix to let ESC work as espected with Autoclose plugin
    " (without this, when showing an autocompletion window, ESC won't leave insert
    "  mode)
    let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" Yankring -------------------------------

    if using_neovim
        let g:yankring_history_dir = '~/.config/nvim/'
        " Fix for yankring and neovim problem when system has non-text things
        " copied in clipboard
        let g:yankring_clipboard_monitor = 0
    else
        let g:yankring_history_dir = '~/.vim/dirs/'
    endif

" Airline ------------------------------

    let g:airline_powerline_fonts = 0
    let g:airline_theme = 'bubblegum'
    let g:airline#extensions#whitespace#enabled = 0

" Fancy Symbols!!

    if fancy_symbols_enabled
        let g:webdevicons_enable = 1

        " custom airline symbols
        if !exists('g:airline_symbols')
           let g:airline_symbols = {}
        endif
        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = ''
        let g:airline_symbols.branch = '⭠'
        let g:airline_symbols.readonly = '⭤'
        let g:airline_symbols.linenr = '⭡'
    else
        let g:webdevicons_enable = 0
    endif

