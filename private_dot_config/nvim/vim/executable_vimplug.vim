" Plugin will be donloaded under the specified directory.
call plug#begin(stdpath('data') . '/plugged')

" Declare the list of plugins.
" ----------------------------------------------------------

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) }} 

" Plugin with special treatment
if !exists('g:started_by_firenvim')
  Plug 'mhinz/vim-startify'         " Change default vim startup
endif

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
" ----------------------------------------------------------
