Vim�UnDo� S1���N`�YY��T3&o�B9����T�   y                                  a]�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             a]�     �                   �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                      *           V        a]�$     �      +   t   )       if using_vim   M        " A bunch of things that are set by default in neovim, but not in vim               " no vi-compatible           set nocompatible       <        " allow plugins by file type (required for plugins!)           filetype plugin on           filetype indent on                " always show status bar           set ls=2               " incremental search           set incsearch   $        " highlighted search results           set hlsearch               " syntax highlight on           syntax on       N        " better backup, swap and undos storage for vim (nvim has nice ones by           " default)   L        set directory=~/.vim/dirs/tmp     " directory to place swap files in   =        set backup                        " make backup files   E        set backupdir=~/.vim/dirs/backups " where to put backup files   ^        set undofile                      " persistent undos - undo after you re-open the file   %        set undodir=~/.vim/dirs/undos   )        set viminfo+=n~/.vim/dirs/viminfo   7        " create needed directories if they don't exist   #        if !isdirectory(&backupdir)   '            call mkdir(&backupdir, "p")           endif   #        if !isdirectory(&directory)   '            call mkdir(&directory, "p")           endif   !        if !isdirectory(&undodir)   %            call mkdir(&undodir, "p")           endif       end    5�_�                            ����                                                                                                                                                                                                                                                                                                                                      *           V        a]�&    �                  5�_�                            ����                                                                                                                                                                                                                                                                                                                                      )           V        a]�{     �         s    �         s    5�_�                           ����                                                                                                                                                                                                                                                                                                                                      *           V        a]�     �         t    5�_�                            ����                                                                                                                                                                                                                                                                                                                                      +           V        a]�     �          u      if using_vim5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                      .           V        a]�     �                N" ============================================================================5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                      -           V        a]�     �         w    �         w    5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                      .           V        a]�     �                 5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                      -           V        a]�     �                  5�_�                            ����                                                                                                                                                                                                                                                                                                                                      ,           V        a]�     �         v       5�_�                            ����                                                                                                                                                                                                                                                                                                                                      ,           V        a]�     �      -   v   *   if using_vim       I    " A bunch of things that are set by default in neovim, but not in vim           " no vi-compatible       set nocompatible       8    " allow plugins by file type (required for plugins!)       filetype plugin on       filetype indent on           " always show status bar       set ls=2           " incremental search       set incsearch        " highlighted search results       set hlsearch           " syntax highlight on       syntax on       J    " better backup, swap and undos storage for vim (nvim has nice ones by       " default)   H    set directory=~/.vim/dirs/tmp     " directory to place swap files in   9    set backup                        " make backup files   A    set backupdir=~/.vim/dirs/backups " where to put backup files   Z    set undofile                      " persistent undos - undo after you re-open the file   !    set undodir=~/.vim/dirs/undos   %    set viminfo+=n~/.vim/dirs/viminfo   3    " create needed directories if they don't exist       if !isdirectory(&backupdir)   #        call mkdir(&backupdir, "p")   	    endif       if !isdirectory(&directory)   #        call mkdir(&directory, "p")   	    endif       if !isdirectory(&undodir)   !        call mkdir(&undodir, "p")   	    endif   end    5�_�                           ����                                                                                                                                                                                                                                                                                                                                      ,           V        a]�     �         v    5�_�                           ����                                                                                                                                                                                                                                                                                                                                      -           V        a]�     �         w    5�_�                           ����                                                                                                                                                                                                                                                                                                                                      .           V        a]�     �         x    5�_�                             ����                                                                                                                                                                                                                                                                                                                                      /           V        a]�    �         y       5�_�                            ����                                                                                                                                                                                                                                                                                                                                      (           V        a]�~     �               5��