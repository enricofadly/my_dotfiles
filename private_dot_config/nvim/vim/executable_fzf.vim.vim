" Fzf.vim integration
" ----------------------------------------------------------
" Keybinding for fzf.vim commands
let g:fzf_layout = { 'down': '40%' }

" Replace grep built in to ripgrep
" set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Ripgrep preview window
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)

" Fzf preview window
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Hide statusline for fzf
autocmd! FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Word completion with custom spec with popup layout option
" inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Mapping for fzf-vim
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Mapping for available fzf commands
nmap ,ff :Files<CR>
nmap ,fb :Buffers<CR>
nmap ,fc :Commands<CR>
nmap ,ft :Filetype<CR>
nmap ,fw :Windows<CR>
nmap ,hs :History/<CR>
nmap ,hf :History<CR>
nmap ,hc :History:<CR>
nmap ,ll :Lines<CR>
nmap ,lb :BLines<CR>
nmap ,mk :Marks<CR>
nmap ,mp :Maps<CR>
nmap ,rg :Rg<CR>
nmap ,gf :GFiles<CR>
nmap ,gs :GFiles?<CR>
nmap ,tp :Tags<CR>
nmap ,tb :BTags<CR>
" ----------------------------------------------------------
