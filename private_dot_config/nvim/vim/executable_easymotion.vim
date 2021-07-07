" EasyMotion configuration
" ----------------------------------------------------------
" Pre-default easy motion binding
" map <Leader> <Plug>(easymotion-prefix)

" Disable shade when search
let g:EasyMotion_do_shade = 0

" Default bindings
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" 2 char search
map F <Plug>(easymotion-bd-f2)
nmap F <Plug>(easymotion-overwin-f2)

" Before the matching search
map t <Plug>(easymotion-bd-t)

" 1 char search
map f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to begnning of word
" map  <Leader>w <Plug>(easymotion-bd-w)
" map <Leader>W <Plug>(easymotion-bd-W)

" Move to end of word
" map <Leader>e <Plug>(easymotion-bd-e)
" map <Leader>E <Plug>(easymotion-bd-E)

" Mapping to do multi char search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 0

" JK motions: Line motions
" map <Leader>l <Plug>(easymotion-lineforward)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" ----------------------------------------------------------
