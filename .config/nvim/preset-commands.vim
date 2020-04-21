" ### Fonts ### {{{
" The quick brown fox jumps over the lazy dog
" 0123456789 +-*/ !@#$%^&*()[]{}<>?
let g:guifontname = 'DroidSansMono\ Nerd\ Font\ Mono'  | call FunChangeFontSize()
let g:guifontname = 'IBM\ Plex\ Mono'                  | call FunChangeFontSize()
let g:guifontname = 'Sarasa\ Mono\ SC\ Nerd'           | call FunChangeFontSize()
let g:guifontname = 'Hack\ Nerd\ Font\ Mono'           | call FunChangeFontSize()
let g:guifontname = 'CaskaydiaCove\ Nerd\ Font'        | call FunChangeFontSize()
let g:guifontname = 'BlexMono\ Nerd\ Font\ Mono'       | call FunChangeFontSize()
let g:guifontname = 'DejaVuSansMono\ Nerd\ Font\ Mono' | call FunChangeFontSize()
"}}}
" ### Color themes ### {{{
" ==== Built-in themes ==== {{{
colo blue       | set bg=dark
colo darkblue   | set bg=dark
colo delek      | set bg=light
colo desert     | set bg=dark
colo elflord    | set bg=dark
colo evening    | set bg=dark
colo industry   | set bg=dark
colo koehler    | set bg=dark
colo lunaperche | set bg=dark
colo lunaperche | set bg=light
colo morning    | set bg=light
colo murphy     | set bg=dark
colo pablo      | set bg=dark
colo ron        | set bg=dark
colo shine      | set bg=light
colo slate      | set bg=dark
colo torte      | set bg=dark
colo zellner    | set bg=light
"}}}
" ==== Uncategorised ==== {{{
colo doom-one   | set bg=dark
colo doom-one   | set bg=light
colo edge       | set bg=dark
colo edge       | set bg=light
colo everforest | set bg=dark
colo everforest | set bg=light
colo habamax    | set bg=dark
colo kanagawa   | set bg=dark
colo kanagawa   | set bg=light
colo nord       | set bg=dark
colo onedark    | set bg=dark
colo peachpuff  | set bg=light
colo sonokai    | set bg=dark
colo bluloco    | set bg=dark
colo bluloco    | set bg=light
"}}}
" ==== Tokyonight ==== {{{
colo tokyonight       | set bg=dark
colo tokyonight       | set bg=light
colo tokyonight-day   | set bg=dark
colo tokyonight-day   | set bg=light
colo tokyonight-moon  | set bg=dark
colo tokyonight-moon  | set bg=light
colo tokyonight-night | set bg=dark
colo tokyonight-night | set bg=light
colo tokyonight-storm | set bg=dark
colo tokyonight-storm | set bg=light
"}}}
" ==== Fox ==== {{{
colo carbonfox | set bg=dark
colo duskfox   | set bg=dark
colo nightfox  | set bg=dark
colo nordfox   | set bg=dark
colo terafox   | set bg=dark
colo dawnfox   | set bg=light
colo dayfox    | set bg=light
"}}}
" ==== Gruvbox ===={{{
colo gruvbox-material | set bg=dark
colo gruvbox-material | set bg=light
colo gruvbox8         | set bg=dark
colo gruvbox8         | set bg=light
colo gruvbox8_hard    | set bg=dark
colo gruvbox8_hard    | set bg=light
colo gruvbox8_soft    | set bg=dark
colo gruvbox8_soft    | set bg=light
"}}}

" ==== Catppuccin ===={{{
colo catppuccin           | set bg=dark
colo catppuccin-latte     | set bg=light
colo catppuccin-frappe    | set bg=dark
colo catppuccin-macchiato | set bg=dark
colo catppuccin-mocha     | set bg=dark
"}}}
"}}}
" ### Hop ### {{{

hi HopNextKey cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff
hi HopNextKey1 cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff
hi HopNextKey2 cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff

"}}}
" ### Diff ### {{{
DiffContext 3
DiffContext 5
DiffContext 10
DiffToggleWhiteSpace
DiffSwitchAlgorithm
"}}}
" ### LSP Config ### {{{
ConjurePythonStop
"}}}
" ### LeaderF ### {{{
let g:Lf_PreviewCode=1    "Preview code in leaderf
"}}}
" ### tcd ### {{{
tcd ~/.config/nvim/
tcd ~/.local/share/nvim/plugged/vim-dict/dict/
tcd ~/dev
tcd ~/dev/zhizhi/workjournal/
tcd ~/.config/nvim/

exec 'tcd ' . $VIMRUNTIME . '/doc/'
exec 'tcd ' . stdpath('data') . '/site/pack/packer/'

" React源码解释
tcd /Users/zdeng/dev/zhizhi/github/awesome-frontend-source-interpretation/
tcd /Users/zdeng/dev/zhizhi/github/react-interpretation/

"}}}


" MODELLINE {{{
" vim: set ts=2 sts=-1 sw=0 et tw=70 ft=vim fdm=marker:
" }}}
