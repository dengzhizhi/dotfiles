scriptencoding utf-8

" Plugin specification and lua stuff
lua require('lua-init')

"""""""""""""""""""""""""UltiSnips settings"""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use YouCompleteMe
let g:UltiSnipsExpandTrigger=',l'

" Do not look for SnipMate snippets
let g:UltiSnipsEnableSnipMate = 0

" Shortcut to jump forward and backward in tabstop positions
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Configuration for custom snippets directory, see
" https://jdhao.github.io/2019/04/17/neovim_snippet_s1/ for details.
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'my_snippets']

"""""""""""""""""""""""""" semshi settings """""""""""""""""""""""""""""""
" Do not highlight for all occurrences of variable under cursor
let g:semshi#mark_selected_nodes=0

" Do not show error sign since linting plugin is specialized for that
let g:semshi#error_sign=v:false

"""""""""""""""""""""""""" vlime settings """"""""""""""""""""""""""""""""
command! -nargs=0 StartVlime call jobstart(printf("sbcl --load %s/vlime/lisp/start-vlime.lisp", g:package_home))

"""""""""""""""""""""""""""""LeaderF settings"""""""""""""""""""""{{
" Cache file for faster file search, use <F5> to refresh
let g:Lf_UseCache = 1

" Gtags
" let $GTAGSLABEL = 'pygments'
" set tags=./.tags;,.tags,./tags;,tags

" let g:Lf_GtagsAutoGenerate = 0
" let g:Lf_GtagsGutentags = 1
" let g:Lf_CacheDirectory = expand('~')
" let g:Lf_GtagsSkipUnreadable = 1
" let g:Lf_Gtagslabel='pygments'
" call utils#Cabbrev('lfgtag', 'Leaderf gtags --update')

" Refresh each time we call leaderf
let g:Lf_UseMemoryCache = 0

" Open a new window in the current tab (I don't need this because I am using bufferline)
" let g:Lf_JumpToExistingWindow = 0

" Ignore certain files and directories when searching files
let g:Lf_WildIgnore = {
  \ 'dir': ['.git', '__pycache__', '.DS_Store'],
  \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
  \ '*.gif', '*.svg', '*.ico', '*.db', '*.tgz', '*.tar.gz', '*.gz',
  \ '*.zip', '*.bin', '*.pptx', '*.xlsx', '*.docx', '*.pdf', '*.tmp',
  \ '*.wmv', '*.mkv', '*.mp4', '*.rmvb', '*.ttf', '*.ttc', '*.otf',
  \ '*.mp3', '*.aac', '*.orig', '*.min.js', '*-combined.js']
  \}

" Default Rg config
let g:Lf_RgConfig = [
      \"--max-columns=500",
      \"--glob=!tags",
      \"--glob=!tags.*",
      \"--glob=!*.min.js",
      \"--glob=!.git/"
      \]

" Store the last rg search pattern to register r
let g:Lf_RgStorePattern = "r"

" No default limit for search result to allow all files are show in
" LeaderfFile
let g:Lf_MaxCount=200000

" Do not show fancy icons for Linux server.
if g:is_linux
  let g:Lf_ShowDevIcons = 0
endif

" Only fuzzy-search files names
let g:Lf_DefaultMode = 'Regex'

let g:Lf_MruFileExclude = ['*.so']
let g:Lf_MruMaxFiles = 9999

" Do not use version control tool to list files under a directory since
" submodules are not searched by default.
let g:Lf_UseVersionControlTool = 0

" Use rg as the default search tool
let g:Lf_DefaultExternalTool = "rg"

" show dot files
let g:Lf_ShowHidden = 1

" preview in popup
let g:Lf_PreviewInPopup = 1

" Disable default mapping
"let g:Lf_ShortcutF = ''
"let g:Lf_ShortcutB = ''

" set up working directory as current pwd so that I can fine tune search
" scope
let g:Lf_WorkingDirectoryMode = 'c'

" Change keybinding in LeaderF prompt mode, use ctrl-n and ctrl-p to navigate items.
let g:Lf_CommandMap = {'<C-J>': ['<C-N>'], '<C-K>': ['<C-P>']}

let g:Lf_PreviewCode = 0
let g:Lf_PreviewResult = {
        \ 'File': 0,
        \ 'Buffer': 0,
        \ 'Mru': 0,
        \ 'Tag': 0,
        \ 'BufTag': 0,
        \ 'Function': 0,
        \ 'Line': 0,
        \ 'Colorscheme': 0,
        \ 'Rg': 0,
        \ 'Gtags': 0
        \}

let g:Lf_NormalMap = {
      \ "_": [
      \   ["P", "<CMD>let g:Lf_PreviewCode = 1 - g:Lf_PreviewCode<CR>"],
      \   ["v", ":norm! v"],
      \ ]
      \}

let g:Lf_FolderAcceptSelectionCmd = 'Dirbuf'

" Space key combinations
nnoremap <space>pf<space> :LeaderfFile<CR>
xnoremap <space>pf<space> :<c-u><c-r>=printf("Leaderf file --regexMode --hidden --input %s", leaderf#Rg#visual())<cr><cr>
nnoremap <space>efj<space> :<c-u><c-r>=printf("Leaderf! rg --regexMode --hidden -F -e %s", expand("<cword>"))<cr><cr>
xnoremap <space>efj<space> :<c-u><c-r>=printf("Leaderf! rg --regexMode --hidden -F -e %s", leaderf#Rg#visual())<cr><cr>
nnoremap <space>efjj<space> :<c-u><c-r>=printf("Leaderf! rg --regexMode --hidden -F -e %s -g \"!*test*\"", expand("<cword>"))<cr><cr>
xnoremap <space>efjj<space> :<c-u><c-r>=printf("Leaderf! rg --regexMode --hidden -F -e %s -g \"!*test*\"", leaderf#Rg#visual())<cr><cr>
nnoremap <space>efh<space> :<c-u><c-r>=printf("Leaderf! rg --regexMode --hidden --stayOpen -e \"%s\"", escape(expand("<cword>"), "\""))<cr><left><c-f>0f"l
xnoremap <space>efh<space> :<c-u><c-r>=printf("Leaderf! rg --regexMode --hidden --stayOpen -e %s", leaderf#Rg#visual())<cr><left><c-f>0f"l

nnoremap <space>efk<space> :<c-u><c-r>=printf("Leaderf rg --regexMode --hidden --stayOpen -e \"\"")<cr><left>
xnoremap <space>efk<space> :<c-u><c-r>=printf("Leaderf! rg --regexMode --hidden --stayOpen -e %s", leaderf#Rg#visual())<cr><left><c-f>0f"l

nnoremap <space>efjk<space> :<c-u>Leaderf! rg --recall<cr>
nmap <space>efkj<space> <space>efjk<space>

nnoremap <space>efl<space> :<c-u>Leaderf! buffer<cr>:setl nowrap<cr>
nnoremap <space>efu<space> :<c-u><c-r>=printf("Leaderf! line --stayOpen --regexMode --input %s", expand("<cword>"))<cr><cr>
xnoremap <space>efu<space> :<c-u><c-r>=printf("Leaderf! line --stayOpen --regexMode --input %s", leaderf#Rg#visual())<cr><cr>
nnoremap <space>efi<space> :<c-u>Leaderf line --regexMode --input<space>''<left>
xnoremap <space>efi<space> :<c-u><c-r>=printf("Leaderf line --stayOpen --regexMode --input \"%s\" ", leaderf#Rg#visual())<cr>
"nnoremap <space>efo<space> :<c-u>TagbarToggle<cr>

nnoremap <space>ef;<space> :<c-u>Leaderf cmdHistory --fuzzy<cr>
nnoremap <space>ef/<space> :<c-u>Leaderf searchHistory --fuzzy<cr>

nnoremap <space>efui<space> :<c-u>Leaderf! line --recall<cr>
nmap <space>efiu<space> <space>efui<space>

nnoremap <space>efo<space> :<c-u>Leaderf! mru<cr>:setl nowrap<cr>
nnoremap <space>fr<space>  :<c-u>Leaderf! mru<cr>:setl nowrap<cr>

nnoremap <space>fdfj<space>  :<c-u>LeaderfFunction!<cr>
nnoremap <space>fdfk<space>  :<c-u>LeaderfFunctionCword!<cr>
xnoremap <space>fdfk<space>  :<c-u><c-r>=printf("LeaderfFunction! %s", leaderf#Rg#visual())<cr><cr>

" nmap <space>efN<space> <Plug>LeaderfGtagsGrep
" xmap <space>efN<space> <Plug>LeaderfGtagsGrep
" nmap <space>efn<space> <Plug>LeaderfGtagsReference
" xmap <space>efn<space> <Plug>LeaderfGtagsReference
" nmap <space>efm<space> <Plug>LeaderfGtagsDefinition
" xmap <space>efm<space> <Plug>LeaderfGtagsDefinition
" nmap <space>efM<space> <Plug>LeaderfGtagsSymbol
" xmap <space>efM<space> <Plug>LeaderfGtagsSymbol
"}}

""""""""""""""""""""""""""""open-browser.vim settings"""""""""""""""""""
if g:is_win || g:is_mac
  " Disable netrw's gx mapping.
  let g:netrw_nogx = 1

  " Use another mapping for the open URL method
  nmap <space>ob<space> <Plug>(openbrowser-smart-search)
  xmap <space>ob<space> <Plug>(openbrowser-smart-search)
endif

""""""""""""""""""""""""""" vista settings """"""""""""""""""""""""""""""""""
let g:vista#renderer#icons = {
      \ 'member': '',
      \ }

" Do not echo message on command line
let g:vista_echo_cursor = 0
" Stay in current window when vista window is opened
let g:vista_stay_on_open = 0

" nnoremap <silent> <Space>t :<C-U>Vista!!<CR>

""""""""""""""""""""""""vim-mundo settings"""""""""""""""""""""""
let g:mundo_verbose_graph = 0
let g:mundo_width = 80

""""""""""""""""""""""""""""better-escape.vim settings"""""""""""""""""""""""""
let g:better_escape_interval = 200

""""""""""""""""""""""""""""vim-xkbswitch settings"""""""""""""""""""""""""
let g:XkbSwitchEnabled = 1

"""""""""""""""""""""""""""""" neoformat settings """""""""""""""""""""""
let g:neoformat_enabled_python = ['black', 'yapf']
let g:neoformat_cpp_clangformat = {
      \ 'exe': 'clang-format',
      \ 'args': ['--style="{IndentWidth: 4}"']
      \ }
let g:neoformat_c_clangformat = {
      \ 'exe': 'clang-format',
      \ 'args': ['--style="{IndentWidth: 4}"']
      \ }

let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

"""""""""""""""""""""""""vim-signify settings""""""""""""""""""""""""""""""
" The VCS to use
let g:signify_vcs_list = [ 'git' ]

" Change the sign for certain operations
let g:signify_sign_change = '~'

"""""""""""""""""""""""""vim-fugitive settings""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gd :Gdiffsplit<CR>
nnoremap <silent> <leader>gpl :Git pull<CR>
" Note that to use bar literally, we need backslash it, see also `:h :bar`.
nnoremap <silent> <leader>gpu :15split \| term git push<CR>

"""""""""""""""""""""""""plasticboy/vim-markdown settings"""""""""""""""""""
" Disable header folding
let g:vim_markdown_folding_disabled = 1

" Whether to use conceal feature in markdown
let g:vim_markdown_conceal = 0

" Disable math tex conceal and syntax highlight
let g:tex_conceal = ''
let g:vim_markdown_math = 0

" Support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" Let the TOC window autofit so that it doesn't take too much space
let g:vim_markdown_toc_autofit = 1

let g:vim_markdown_fenced_languages = ['csharp=cs', "js=javascript"]

"""""""""""""""""""""""""markdown-preview settings"""""""""""""""""""
" Only setting this for suitable platforms
if g:is_win || g:is_mac
  " Do not close the preview tab when switching to other buffers
  let g:mkdp_auto_close = 0

  " Shortcuts to start and stop markdown previewing
  nnoremap <silent> <M-m> :<C-U>MarkdownPreview<CR>
  nnoremap <silent> <M-S-m> :<C-U>MarkdownPreviewStop<CR>
endif

""""""""""""""""""""""""vim-grammarous settings""""""""""""""""""""""""""""""
" if g:is_mac
"   let g:grammarous#languagetool_cmd = 'languagetool'
"   let g:grammarous#disabled_rules = {
"       \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES', 'ARROWS', 'SENTENCE_WHITESPACE',
"       \        'WORD_CONTAINS_UNDERSCORE', 'COMMA_PARENTHESIS_WHITESPACE',
"       \        'EN_UNPAIRED_BRACKETS', 'UPPERCASE_SENTENCE_START',
"       \        'ENGLISH_WORD_REPEAT_BEGINNING_RULE', 'DASH_RULE', 'PLUS_MINUS',
"       \        'PUNCTUATION_PARAGRAPH_END', 'MULTIPLICATION_SIGN', 'PRP_CHECKOUT',
"       \        'CAN_CHECKOUT', 'SOME_OF_THE', 'DOUBLE_PUNCTUATION', 'HELL',
"       \        'CURRENCY', 'POSSESSIVE_APOSTROPHE', 'ENGLISH_WORD_REPEAT_RULE',
"       \        'NON_STANDARD_WORD', 'AU', 'DATE_NEW_YEAR'],
"       \ }

"   augroup grammarous_map
"     autocmd!
"     autocmd FileType markdown nmap <buffer> <leader>x <Plug>(grammarous-close-info-window)
"     autocmd FileType markdown nmap <buffer> <c-j> <Plug>(grammarous-move-to-next-error)
"     autocmd FileType markdown nmap <buffer> <c-k> <Plug>(grammarous-move-to-previous-error)
"   augroup END
" endif

""""""""""""""""""""""""unicode.vim settings""""""""""""""""""""""""""""""
nmap ga <Plug>(UnicodeGA)

""""""""""""""""""""""""""""vimtex settings"""""""""""""""""""""""""""""
if ( g:is_win || g:is_mac ) && executable('latex')
  " Hacks for inverse serach to work semi-automatically,
  " see https://jdhao.github.io/2021/02/20/inverse_search_setup_neovim_vimtex/.
  function! s:write_server_name() abort
    let nvim_server_file = (has('win32') ? $TEMP : '/tmp') . '/vimtexserver.txt'
    call writefile([v:servername], nvim_server_file)
  endfunction

  augroup vimtex_common
    autocmd!
    autocmd FileType tex call s:write_server_name()
    autocmd FileType tex nmap <buffer> <F9> <plug>(vimtex-compile)
  augroup END

  let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : 'build',
        \ }

  " TOC settings
  let g:vimtex_toc_config = {
        \ 'name' : 'TOC',
        \ 'layers' : ['content', 'todo', 'include'],
        \ 'resize' : 1,
        \ 'split_width' : 30,
        \ 'todo_sorted' : 0,
        \ 'show_help' : 1,
        \ 'show_numbers' : 1,
        \ 'mode' : 2,
        \ }

  " Viewer settings for different platforms
  if g:is_win
    let g:vimtex_view_general_viewer = 'SumatraPDF'
    let g:vimtex_view_general_options_latexmk = '-reuse-instance'
    let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
  endif

  if g:is_mac
    " let g:vimtex_view_method = "skim"
    let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
    let g:vimtex_view_general_options = '-r @line @pdf @tex'

    augroup vimtex_mac
      autocmd!
      autocmd User VimtexEventCompileSuccess call UpdateSkim()
    augroup END

    " The following code is adapted from https://gist.github.com/skulumani/7ea00478c63193a832a6d3f2e661a536.
    function! UpdateSkim() abort
      let l:out = b:vimtex.out()
      let l:src_file_path = expand('%:p')
      let l:cmd = [g:vimtex_view_general_viewer, '-r']

      if !empty(system('pgrep Skim'))
        call extend(l:cmd, ['-g'])
      endif

      call jobstart(l:cmd + [line('.'), l:out, l:src_file_path])
    endfunction
  endif
endif

""""""""""""""""""""""""""""vim-startify settings""""""""""""""""""""""""""""
" Do not change working directory when opening files.
let g:startify_change_to_dir = 0
let g:startify_fortune_use_unicode = 1

""""""""""""""""""""""""""""vim-matchup settings"""""""""""""""""""""""""""""
" Improve performance
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_timeout = 100
let g:matchup_matchparen_insert_timeout = 30

" Enhanced matching with matchup plugin
let g:matchup_override_vimtex = 1

" Whether to enable matching inside comment or string
let g:matchup_delim_noskips = 0

" Show offscreen match pair in popup window
let g:matchup_matchparen_offscreen = {'method': 'popup'}

"""""""""""""""""""""""""" asyncrun.vim settings """"""""""""""""""""""""""
" Automatically open quickfix window of 6 line tall after asyncrun starts
let g:asyncrun_open = 6
if g:is_win
  " Command output encoding for Windows
  let g:asyncrun_encs = 'gbk'
endif

""""""""""""""""""""""""""""""nvim-gdb settings""""""""""""""""""""""""""""""
nnoremap <leader>dp :<C-U>GdbStartPDB python -m pdb %<CR>

"""""""""""""""""""""""""""""" Git """"""""""""""""""""""""""""""
let g:fugitive_summary_format = "%as-[%an]: %s"
nnoremap <space>dsj<space> :Git log -n 20 --pretty=format:"%h\|\|%as-[%an]: %s" -- %<cr>
nnoremap <space>dsjj<space> :Git log --pretty=format:"%h\|\|%as-[%an]: %s" -- %<cr>
nnoremap <space>dsjf<space> :!fork log -- %<cr>
nnoremap <space>dsjs<space> :!smerge log %<cr>
nnoremap <space>dsn<space> :!fork commit<cr>
nnoremap <space>dsl<space> :Gclog -- %<cr>
xnoremap <space>dsl<space> :Gclog<cr>
nnoremap <space>dskl<space> :Gclog -n 20 -- %<cr>
xnoremap <space>dskl<space> :Gclog -n 20<cr>
nmap <space>dslk<space> <space>dskl<space>
xmap <space>dslk<space> <space>dskl<space>
nnoremap <space>dsk<space> 0"ayiw:hide<cr>:rightbelow Gvdiff <c-r>a<cr>
" Use Wilfred/difftastic to do structural diff
nnoremap <space>dskk<space> 0"ayiw:hide<cr>:2TermExec cmd="cd '<c-r>=expand('%:p:h')<cr>' && clear && git difftool -t difft -y <c-r>a -- <c-r>=expand('%:p')<cr> <bar> delta" go_back=0 direction=float size=95<cr>
nnoremap <space>dskkk<space> 0"ayiw:hide<cr>:2TermExec cmd="cd '<c-r>=expand('%:p:h')<cr>' && clear && git difftool -t unifydifft -y <c-r>a..HEAD -- <c-r>=expand('%:p')<cr> <bar> delta" go_back=0 direction=float size=95<cr>

nnoremap <space>dssd<space> 0"ayiw:hide<cr>:<c-r>=printf("AsyncRun -silent git difftool -t smerge -y %s -- %s", getreg("a"), expand("%:p"))<cr><cr>
nnoremap <space>dssm<space> :<c-u>AsyncRun -silent smerge <c-r>=expand("%:p:h")<cr><cr>
nnoremap <space>dssj<space> :<c-u>AsyncRun -silent -cwd=<c-r>=expand("%:p:h")<cr> smerge log <c-r>=expand("%:p")<cr><cr>
nnoremap <space>dssb<space> :<c-u>AsyncRun -silent -cwd=<c-r>=expand("%:p:h")<cr> smerge blame <c-r>=expand("%:p")<cr><cr>

nnoremap <space>dstm<space> 0"ayiw:hide<cr>:<c-r>=printf("AsyncRun -silent git difftool -t meld -y %s -- %s", getreg("a"), expand("%:p"))<cr><cr>
nnoremap <space>dstk<space> 0"ayiw:hide<cr>:<c-r>=printf("AsyncRun -silent git difftool -t kdiff3 -y %s -- %s", getreg("a"), expand("%:p"))<cr><cr>

nnoremap <space>dsu<space> :Git blame<cr>
" Find changes of keyword under cursor in history
nnoremap <space>dsi<space> :<c-u><c-r>=printf("Git log --follow -p -S %s -- %s <bar> setl fdm=syntax", string(expand('<cWORD>')), expand('%:p'))<cr><c-f>0f'l
xnoremap <space>dsi<space> "py:<c-u><c-r>=printf("Git log --follow -p -S %s -- %s <bar> setl fdm=syntax", string(@p), expand('%:p'))<cr><c-f>0f'l
"}}}
