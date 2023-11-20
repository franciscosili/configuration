" ============================================================================
" Vim settings


" random settings ----- DO NOT CHANGE
    if using_vim

        " A bunch of things that are set by default in neovim, but not in vim

        " no vi-compatible
        set nocompatible

        " allow plugins by file type (required for plugins!)
        filetype plugin on
        filetype indent on

        " always show status bar
        set ls=2

        " incremental search
        set incsearch
        " highlighted search results
        set hlsearch

        " syntax highlight on
        syntax on

        " better backup, swap and undos storage for vim (nvim has nice ones by
        " default)
        set directory=~/.vim/dirs/tmp     " directory to place swap files in
        set backup                        " make backup files
        set backupdir=~/.vim/dirs/backups " where to put backup files
        set undofile                      " persistent undos - undo after you re-open the file
        set undodir=~/.vim/dirs/undos
        set viminfo+=n~/.vim/dirs/viminfo
        " create needed directories if they don't exist
        if !isdirectory(&backupdir)
            call mkdir(&backupdir, "p")
        endif
        if !isdirectory(&directory)
            call mkdir(&directory, "p")
        endif
        if !isdirectory(&undodir)
            call mkdir(&undodir, "p")
        endif
    end

" tabs and spaces handling
    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4

" show line numbers
    set nu

" remove ugly vertical lines on window division
    set fillchars+=vert:\ 

" use 256 colors when possible
    if has('gui_running') || using_neovim || (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256')
        if !has('gui_running')
            let &t_Co = 256
        endif
        let base16colorspace=256  " Access colors present in 256 colorspace
        colorscheme base16-tomorrow-night-eighties
        " colorscheme vim-monokai-tasty
    else
        let base16colorspace=256  " Access colors present in 256 colorspace
        colorscheme base16-tomorrow-night-eighties
        " colorscheme delek
    endif


" -Fold code with indentation
   " some usecases:
   "    za: Toggle code folding at the current line.
   "    zo: open fold.
   "    zc: close fold.
   "    zR: open all folds.
   "    zM: close all folds.
   set foldmethod=indent
   set nofoldenable        "so all files open unfolded"

" No bell sounds
    set noerrorbells
    set vb t_vb=

" Search down into subfolders,
" supports tab-completion,
" just use :find
    set path+=**

" needed so deoplete can auto select the first suggestion
    set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" disabled by default because preview makes the window flicker
    set completeopt-=preview

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
    set wildmode=list:longest

" save as sudo
    ca w!! w !sudo tee "%"

" when scrolling, keep cursor 3 lines away from screen border
    set scrolloff=3

" clear empty spaces at the end of lines on save of python files
    autocmd BufWritePre *.py :%s/\s\+$//e

" fix problems with uncommon shells (fish, xonsh) and plugins running commands
" (neomake, ...)
    set shell=/bin/bash 

" Ability to add python breakpoints
" (I use ipdb, but you can change it to whatever tool you use for debugging)
    au FileType python map <silent> <leader>b Oimport ipdb; ipdb.set_trace()<esc>

