" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
    if using_neovim
        call plug#begin("~/.config/nvim/plugged")
    else
        call plug#begin("~/.vim/plugged")
    endif

" Now the actual plugins:

" Override configs by directory
    Plug 'arielrossanigo/dir-configs-override.vim'
" Code commenter
    Plug 'scrooloose/nerdcommenter'
" Better file browser
    Plug 'scrooloose/nerdtree'
" Class/module browser
    Plug 'majutsushi/tagbar'
" Search results counter
    Plug 'vim-scripts/IndexedSearch'
" A couple of nice colorschemes
    Plug 'chriskempson/base16-vim'
" Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
" Code and files fuzzy finder
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
" Pending tasks list
    Plug 'fisadev/FixedTaskList.vim'
" Async autocompletion

        "Plug 'Shougo/deoplete.nvim', {'do': ':autocmd VimEnter * UpdateRemotePlugins'}
    "else
        "Plug 'Shougo/deoplete.nvim'
    "endif

    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
" Python autocompletion
    "Plug 'deoplete-plugins/deoplete-jedi'
" Completion from other opened files
    Plug 'Shougo/context_filetype.vim'
" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
    Plug 'davidhalter/jedi-vim'
" Automatically close parenthesis, etc
    Plug 'Townk/vim-autoclose'
" Surround
    Plug 'tpope/vim-surround'
" Indent text object
    Plug 'michaeljsmith/vim-indent-object'
" Indentation based movements
    Plug 'jeetsukumaran/vim-indentwise'
" Better language packs
    Plug 'sheerun/vim-polyglot'
" Ack code search (requires ack installed in the system)
    Plug 'mileszs/ack.vim'
" Paint css colors with the real color
    Plug 'lilydjwg/colorizer'
" Window chooser
    Plug 't9md/vim-choosewin'
" Automatically sort python imports
"    Plug 'fisadev/vim-isort'
" Highlight matching html tags
    Plug 'valloric/MatchTagAlways'
" Generate html in a simple way
    Plug 'mattn/emmet-vim'
" Git integration
    Plug 'tpope/vim-fugitive'
" Git/mercurial/others diff icons on the side of the file lines
    Plug 'mhinz/vim-signify'
" Yank history navigation
    Plug 'vim-scripts/YankRing.vim'
" Linters
    Plug 'neomake/neomake'
" Nice icons in the file explorer and file type status line.
    Plug 'ryanoasis/vim-devicons'


" Workaround for snippets?
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'



    if using_vim
        " Consoles as buffers (neovim has its own consoles as buffers)
        Plug 'rosenfeld/conque-term'
        " XML/HTML tags navigation (neovim has its own)
        Plug 'vim-scripts/matchit.zip'
    endif

" Code searcher. If you enable it, you should also configure g:hound_base_url 
" and g:hound_port, pointing to your hound instance
" Plug 'mattn/webapi-vim'
" Plug 'jfo/hound.vim'

" Tell vim-plug we finished declaring plugins, so it can load them
    call plug#end()

" ============================================================================
" Install plugins the first time vim runs

    if vim_plug_just_installed
        echo "Installing Bundles, please ignore key map error messages"
        :PlugInstall
    endif

