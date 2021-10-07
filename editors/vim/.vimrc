" Fisa-vim-config, a config for both Vim and NeoVim
" http://vim.fisadev.com
" version: 12.0.1

" To use fancy symbols wherever possible, change this setting from 0 to 1
" and use a font from https://github.com/ryanoasis/nerd-fonts in your terminal 
" (if you aren't using one of those fonts, you will see funny characters here. 
" Turst me, they look nice when using one of those fonts).

    filetype plugin on

    let fancy_symbols_enabled = 0

    set encoding=utf-8
    let using_neovim = has('nvim')
    let using_vim = !using_neovim

" IMPORTANT: some things in the config are vim or neovim specific. It's easy 
" to spot, they are inside `if using_vim` or `if using_neovim` blocks.






" ============================================================================
" Vim-plug initialization
" Avoid modifying this section, unless you are very sure of what you are doing

    let vim_plug_just_installed = 0
    if using_neovim
        let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
    else
        let vim_plug_path = expand('~/.vim/autoload/plug.vim')
    endif
    if !filereadable(vim_plug_path)
        echo "Installing Vim-plug..."
        echo ""
        if using_neovim
            silent !mkdir -p ~/.config/nvim/autoload
            silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        else
            silent !mkdir -p ~/.vim/autoload
            silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        endif
        let vim_plug_just_installed = 1
    endif

" manually load vim-plug the first time
    if vim_plug_just_installed
        :execute 'source '.fnameescape(vim_plug_path)
    endif


    " ================   plugins file  ================ 
    source ~/.vim/config/plugins.vim



" ============================================================================
" Vim settings and mappings
" You can edit them as you wish
 
    " ================  settings file  ================ 
    source ~/.vim/config/settings.vim


" ============================================================================
" ----> Mappings

    " ================  mappings file  ================ 
    source ~/.vim/config/mappings.vim


" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

    " ================  mappings file  ================ 
    source ~/.vim/config/plugins_settings.vim


" ============================================================================
" Custom configuration 
" Edit them as you wish.

    " ================   custom configuration file  ================ 
    source ~/.vim/config/custom_config.vim
