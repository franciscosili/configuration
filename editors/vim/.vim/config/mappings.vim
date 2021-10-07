" ============================================================================
" ----> Mappings


" clear search results
    nnoremap <silent> // :noh<CR>

" -Hybrid line numbers on/off
    nnoremap<silent> <leader>nu :setlocal nu! rnu!<CR>
" -Spelling mistake
    "  -- spanish
    nnoremap<silent> <leader>es :set spell! spelllang=es<CR>
    "  -- english
    nnoremap<silent> <leader>en :set spell! spelllang=en_us<CR>
" -Mapping Paste Mode on/off
    "nnoremap <F5> :set paste <CR><ESC>
    nmap <F5> :set paste<CR><ESC>
    nmap <F5> :set nopaste<CR><ESC>
" -Make adjusing split sizes a bit more friendly
    noremap <silent> <C-Left> :vertical resize -3<CR>
    noremap <silent> <C-Right> :vertical resize +3<CR>
    noremap <silent> <C-Up> :resize +3<CR>
    noremap <silent> <C-Down> :resize -3<CR>

""" -Tab navigation mappings
    "map tn :tabn<CR>
    "map tp :tabp<CR>
    "map tm :tabm
    "map tt :tabnew
    "map ts :tab split<CR>
    "map <C-S-Right> :tabn<CR>
    "imap <C-S-Right> <ESC>:tabn<CR>
    "map <C-S-Left> :tabp<CR>
    "imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with shift+arrows
    map <S-Right> <c-w>l
    map <S-Left> <c-w>h
    map <S-Up> <c-w>k
    map <S-Down> <c-w>j
    "imap <M-Right> <ESC><c-w>l
    "imap <M-Left> <ESC><c-w>h
    "imap <M-Up> <ESC><c-w>k
    "imap <M-Down> <ESC><c-w>j


" Quickly insert an empty new line without entering insert mode
    nnoremap <silent> o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>

