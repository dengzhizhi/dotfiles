" let s:theme_setup_dict = {}
"
" function! s:theme_setup_dict.gruvbox8() dict abort
"   " Italic options should be put before colorscheme setting,
"   " see https://github.com/morhetz/gruvbox/wiki/Terminal-specific#1-italics-is-disabled
"   let g:gruvbox_italics=1
"   let g:gruvbox_italicize_strings=1
"   let g:gruvbox_filetype_hi_groups = 1
"   let g:gruvbox_plugin_hi_groups = 1
"   colorscheme gruvbox8_hard
" endfunction
"
" function! s:theme_setup_dict.edge() dict abort
"   let g:edge_enable_italic = 1
"   let g:edge_better_performance = 1
"   colorscheme edge
" endfunction
"
" function! s:theme_setup_dict.sonokai() dict abort
"   let g:sonokai_enable_italic = 1
"   let g:sonokai_better_performance = 1
"   colorscheme sonokai
" endfunction
"
" function! s:theme_setup_dict.gruvbox_material() dict abort
"   let g:gruvbox_material_enable_italic = 1
"   let g:gruvbox_material_better_performance = 1
"   colorscheme gruvbox-material
" endfunction
"
" function! s:theme_setup_dict.everforest() dict abort
"   let g:everforest_enable_italic = 1
"   let g:everforest_better_performance = 1
"   colorscheme everforest
" endfunction

" colorscheme tokyonight-storm
if exists('g:started_by_firenvim')
  set background=light
else
  set background=dark
endif

