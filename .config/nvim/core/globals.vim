"{ Global Variable
"{{ Custom variables
let g:is_win = (has('win32') || has('win64')) ? v:true : v:false
let g:is_linux = (has('unix') && !has('macunix')) ? v:true : v:false
let g:is_mac = has('macunix') ? v:true : v:false
let g:logging_level = 'info'
"}}

"{{ bypass an autocomplete issue, don't know detail about this global variable yet.
let g:_cmpu_current_snippets={}
""}}

"{{ Builtin variables
" Disable Python2 support
let g:loaded_python_provider = 0

" Disable perl provider
let g:loaded_perl_provider = 0

" Disable ruby provider
let g:loaded_ruby_provider = 0

" Disable node provider
let g:loaded_node_provider = 0

let g:did_install_default_menus = 1  " do not load menu

" Path to Python 3 interpreter (must be an absolute path), make startup
" faster. See https://neovim.io/doc/user/provider.html.
if g:is_win
  let g:python3_host_prog=substitute(exepath('python'), '.exe$', '', 'g')
elseif g:is_linux || g:is_mac
  let g:python3_host_prog=exepath('python3')
endif
if !exists('g:python3_host_prog')
  echoerr 'Python 3 executable not found! You must install Python 3 and set its PATH correctly!'
endif

" Custom mapping <leader> (see `:h mapleader` for more info)
let g:mapleader = '\'

" Enable highlighting for lua HERE doc inside vim script
let g:vimsyn_embed = 'l'

" Use English as main language
" language en_US.utf-8

" Enable folding in markdown
let g:markdown_folding = 1
"}}

"{{ Disable loading certain plugins
" Whether to load netrw by default, see
" https://github.com/bling/dotvim/issues/4
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
let g:netrw_liststyle = 3
if g:is_win
  let g:netrw_http_cmd = 'curl --ssl-no-revoke -Lo'
endif

" Do not load tohtml.vim
let g:loaded_2html_plugin = 1

" Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim (all these plugins are
" related to checking files inside compressed files)
let g:loaded_zipPlugin = 1
let loaded_gzip = 1
let g:loaded_tarPlugin = 1

let g:loaded_tutor_mode_plugin = 1  " do not load the tutor plugin

" Do not use builtin matchit.vim and matchparen.vim since we use vim-matchup
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
"}}
"}

"{ ########## Neovide ##########
if exists("g:neovide")
  let g:neovide_cursor_vfx_mode = "railgun"
  "let g:neovide_cursor_vfx_mode = "pixiedust"
  "let g:neovide_cursor_vfx_mode = "ripple"
  "let g:neovide_cursor_vfx_mode = "sonicboom"
  "let g:neovide_cursor_vfx_mode = "sonicboom"
  set guifont=RecMonoCasual\ Nerd\ Font\ Mono
  let g:neovide_cursor_animation_length=0.05
  let g:neovide_cursor_trail_size = 0.5
  let g:neovide_scroll_animation_length = 0
  let g:neovide_cursor_antialiasing = v:true
  let g:neovide_input_macos_alt_is_meta = v:false
endif
"}
