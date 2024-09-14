scriptencoding utf-8

" Plugin specification and lua stuff
lua require('lua-init')

"""""""""""""""""""""""""""""LeaderF settings"""""""""""""""""""""{{
" Cache file for faster file search, use <F5> to refresh
let g:Lf_UseCache = 1

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
      \"--glob=!tags",
      \"--glob=!tags.*",
      \"--glob=!*.min.js"
      \]

" Store the last rg search pattern to register r
let g:Lf_RgStorePattern = "r"

" No default limit for search result to allow all files are show in
" LeaderfFile
let g:Lf_MaxCount=0

" Do not show fancy icons for Linux server.
if g:is_linux
  let g:Lf_ShowDevIcons = 0
endif

" Only fuzzy-search files names
let g:Lf_DefaultMode = 'Regex'

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

let g:Lf_PreviewCode = 1

" let g:Lf_NormalMap = {
"       \ "_": [["P", "<CMD>let g:Lf_PreviewCode = 1 - g:Lf_PreviewCode<CR>"]]
"       \}

let g:Lf_FolderAcceptSelectionCmd = 'Dirbuf'

" Space key combinations
nnoremap <space>pf<space> :LeaderfFile<CR>
xnoremap <space>pf<space> :<c-u><c-r>=printf("Leaderf file --regexMode --input %s", leaderf#Rg#visual())<cr><cr>
nnoremap <space>efj<space> :<c-u><c-r>=printf("Leaderf! rg --regexMode -F -e %s", expand("<cword>"))<cr><cr>
xnoremap <space>efj<space> :<c-u><c-r>=printf("Leaderf! rg --regexMode -F -e %s", leaderf#Rg#visual())<cr><cr>
nnoremap <space>efjj<space> :<c-u><c-r>=printf("Leaderf! rg --regexMode -F -e %s -g \"!*test*\"", expand("<cword>"))<cr><cr>
xnoremap <space>efjj<space> :<c-u><c-r>=printf("Leaderf! rg --regexMode -F -e %s -g \"!*test*\"", leaderf#Rg#visual())<cr><cr>
nnoremap <space>efh<space> :<c-u><c-r>=printf("Leaderf! rg --regexMode --stayOpen -e \"%s\"", escape(expand("<cword>"), "\""))<cr><left><c-f>0f"l
xnoremap <space>efh<space> :<c-u><c-r>=printf("Leaderf! rg --regexMode --stayOpen -e %s", leaderf#Rg#visual())<cr><left><c-f>0f"l

nnoremap <space>efk<space> :<c-u><c-r>=printf("Leaderf rg --regexMode --stayOpen -e \"\"")<cr><left>
xnoremap <space>efk<space> :<c-u><c-r>=printf("Leaderf! rg --regexMode --stayOpen -e %s", leaderf#Rg#visual())<cr><left><c-f>0f"l

nnoremap <space>efjk<space> :<c-u>Leaderf! rg --recall<cr>
nmap <space>efkj<space> <space>efjk<space>

nnoremap <space>efl<space> :<c-u>Leaderf! buffer<cr>:setl nowrap<cr>
nnoremap <space>efu<space> :<c-u><c-r>=printf("Leaderf line --stayOpen --regexMode --input %s", expand("<cword>"))<cr><cr>
xnoremap <space>efu<space> :<c-u><c-r>=printf("Leaderf line --stayOpen --regexMode --input %s", leaderf#Rg#visual())<cr><cr>
nnoremap <space>efi<space> :<c-u>Leaderf line --regexMode --input<space>''<left>
xnoremap <space>efi<space> :<c-u><c-r>=printf("Leaderf line --stayOpen --regexMode --input \"%s\" ", leaderf#Rg#visual())<cr>
"nnoremap <space>efo<space> :<c-u>TagbarToggle<cr>

nnoremap <space>ef;<space> :<c-u>Leaderf cmdHistory --fuzzy<cr>
nnoremap <space>ef/<space> :<c-u>Leaderf searchHistory --fuzzy<cr>

nnoremap <space>efui<space> :<c-u>Leaderf! line --recall<cr>
nmap <space>efiu<space> <space>efui<space>

nnoremap <space>efo<space> :<c-u>Leaderf! mru<cr>:setl nowrap<cr>
nnoremap <space>fr<space>  :<c-u>Leaderf! mru<cr>:setl nowrap<cr>
"}}

"""""""""""""""""""""""""" asyncrun.vim settings """"""""""""""""""""""""""
" Automatically open quickfix window of 6 line tall after asyncrun starts
let g:asyncrun_open = 6
if g:is_win
  " Command output encoding for Windows
  let g:asyncrun_encs = 'gbk'
endif

