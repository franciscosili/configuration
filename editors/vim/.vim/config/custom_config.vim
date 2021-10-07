" ============================================================================
" Custom configuration 
" Edit them as you wish.

    " Include user's custom nvim configurations
    if using_neovim
        let custom_configs_path = "~/.config/nvim/custom.vim"
    else
        let custom_configs_path = "~/.vim/custom.vim"
    endif
    if filereadable(expand(custom_configs_path))
      execute "source " . custom_configs_path
    endif

" Snippets engine
    " Snippets engine (UltiSnips) ------------------------------
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<c-b>"
        let g:UltiSnipsJumpBackwardTrigger="<c-z>"
        let g:UltiSnipsSnippetDirectories=["~/.vim/plugged/vim-snippets/UltiSnips"]


