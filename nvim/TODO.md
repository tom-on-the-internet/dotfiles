:w TO
nnoremap <leader>y @q
vnoremap Y "+y

nnoremap <leader>s :call TrimWhitespace()<cr>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun



