"########## Diff Option ##########{{{
set diffopt+=context:20
let g:diff_algorithms = [
      \ "myers",
      \ "minimal",
      \ "patience",
      \ "histogram",
      \ ]
let g:diff_algorithm = "patience"

func! DiffSwitchAlgorithm()
  let l:total_diff_algos = len(g:diff_algorithms)
  let l:i = 0
  while l:i < l:total_diff_algos && g:diff_algorithms[l:i] !=# g:diff_algorithm
    let l:i += 1
  endwhile
  if l:i < l:total_diff_algos
    let g:diff_algorithm = g:diff_algorithms[(l:i + 1) % l:total_diff_algos]
  else
    let g:diff_algorithm = "patience"
  endif
  for l:algo in g:diff_algorithms
    exec "set diffopt-=algorithm:" . l:algo
  endfor
  exec "set diffopt+=algorithm:" . g:diff_algorithm
  echo "Diff algorithm switched to " . g:diff_algorithm
  windo diffupdate
endfunc

func! DiffUpdateContext(contextLines)
  let l:opt = substitute(&diffopt, '\v(^\|,)context:\d+', '', 'g') . ",context:" . a:contextLines
  exec "set diffopt=" . l:opt
  windo diffupdate
endfunc

func! DiffToggleWhiteSpace()
  if stridx(&diffopt, "iwhite") >= 0
    set diffopt-=iwhite
    echo "Whitespaces NOT ignored in diff"
  else
    set diffopt+=iwhite
    echo "Whitespaces ignored in diff"
  endif
  windo diffupdate
endfunc

command! DiffSwitchAlgorithm call DiffSwitchAlgorithm()
command! DiffToggleWhiteSpace call DiffToggleWhiteSpace()
command! -nargs=1 DiffContext call DiffUpdateContext(<f-args>)

set diffopt+=internal,algorithm:patience
"set diffopt+=internal,algorithm:histogram

" }}}
"########## hledger integration ##########{{{
command! LedgerOpen :e $LEDGER_FILE
nnoremap <Leader><Leader>lo :LedgerOpen<CR>
noremap <Leader><Leader>ll :LedgerAlign<CR>
nnoremap <Leader><Leader>lu o; UUID: <ESC>:r !uuidgen<CR>kJgu$:s/-//g<CR>_

function! s:FnOpenLedgerBuffer()
    if (bufexists('ledger.result'))
        let lrwin = bufwinnr('ledger.result')
        if (lrwin == -1)
            execute "vert belowright sb " . bufnr('ledger.result')
        else
            execute lrwin . 'wincmd w'
        endif
    else
        execute "rightb vnew ledger.result"
        setlocal bt=nofile bh=wipe nobl noswf
    endif
    normal! ggdG
    set syntax=ledger
endfunction

function! FnListLedgerAccounts()
    call s:FnOpenLedgerBuffer()
    0read !hledger accounts -I
    normal! Gdd
    exec "g/\\v^[^:]+$/normal! O------------------------------"
    exec "%s/^/    /"
    exec "%normal! A    "
    normal! gg
endfunction
command! LedgerAccounts call FnListLedgerAccounts()
nnoremap <Leader><Leader>la :LedgerAccounts<CR>

function! FnListLedgerTemplates()
    call s:FnOpenLedgerBuffer()
    0read !hledger p 'tag:Template-' -I
    normal! gg
endfunction
command! LedgerTemplates call FnListLedgerTemplates()
nnoremap <Leader><Leader>lt :LedgerTemplates<CR>

function! FnHLedgerRun(action)
    call s:FnOpenLedgerBuffer()
    execute "0read !hledger ".a:action
    exec "normal! ggOcommand > hlegder ".a:action
    normal! o--------------------
    normal! gg
endfunction
command! -nargs=1 HLedger call FnHLedgerRun(<f-args>)
nnoremap <Leader><Leader>lr :HLedger -V

nnoremap <Leader><Leader>ld :r !date +"\%Y/\%m/\%d"<CR>kJA !
" }}}
"########## Popup Buffers ##########{{{
func! ScratchBuffer(...)
  let l:key = a:0 > 0 ? a:1 : 'scratch'
  let l:direction = a:0 > 1 ? a:2 : 's'
  let l:link_to_file = a:0 > 2 ? a:3 : 0

  if (bufexists(l:key))
    let l:lrwin = bufwinnr(l:key)
    if l:lrwin == -1
      if a:direction ==? "v"
        exec "rightbelow vert sb " . bufnr(l:key)
      else
        exec "rightbelow sb " . bufnr(l:key)
      endif
    else
      exec l:lrwin . "wincmd w"
    endif
  else
    if l:direction ==? "v"
      exec "rightbelow vert new " . l:key
    else
      exec "rightbelow new " . l:key
    endif
    if !l:link_to_file
      setlocal bt=nofile
    endif
    setlocal bh=wipe nobl noswf nospell nonu
  endif
  setl modifiable
endfunc


"}}}
"########## sdcv ##########{{{

let g:sdcv_data_dir = "~/dev/zhizhi/stardict"

func! SdcvFoldOpen()
  foldopen
  if !(getline(".") =~ '^-->')
    call search('^-->', 'b')
    -1
  endif
endfunc

func! SdcvLookUp(word)
  norm! ggdG
  let l:sdcv_cmd = "sdcv -0 -n"
  if g:sdcv_data_dir != ''
    let l:sdcv_cmd = l:sdcv_cmd . " -2 " . g:sdcv_data_dir
  endif
  exec "norm! :0r !" . l:sdcv_cmd . " \"" . a:word . "\"\<cr>gg"

  " Remove wav file names
  silent! %s/\S\+\.wav//g

  " Reformat çæ´¥ç°ä»£è±æ±åè§£è¯å¸
  silent! %s/ \* /\r    * /g
  silent! %s/  \d\d\? /\r\r\0/g

  call SdcvFoldDefinition()
  nnoremap zo :call SdcvFoldOpen()<cr>
  setl nomodifiable

  norm! gg
  call search("^-->")
  call SdcvFoldOpen()
endfunc

func! SdcvFoldDefinition()
  if !exists("b:is_sdcv_definition")
    return
  endif
  setl fdm=manual
  silent! norm! zEgg
  let l:title = search("^-->")
  while l:title > 0
    call search("^-->")
    let l:next_title = search("^-->")
    if l:next_title > 0
      exec l:title . "," . (l:next_title - 1) . "fold"
      let l:title = l:next_title
      call cursor(l:title, 1)
    else
      exec l:title . ",$" . "fold"
      let l:title = 0
    endif
  endwhile
  call cursor(1, 1)
endfunc

func! SdcvNextBook()
  if getline('.') =~ '^-->'
    exec line('.') + 1
  endif
  if getline('.') =~ '^-->'
    exec line('.') + 1
  endif
  let l:next_title = search('^-->', 'n')
  if l:next_title > 0
    norm! zm
    exec l:next_title
    call SdcvFoldOpen()
  endif
endfunc

func! SdcvPrevBook()
  if !(getline('.') =~ '^-->')
    call search('^-->', 'b')
  endif
  if getline('.') =~ '^-->'
    exec line('.') - 1
  endif
  if getline('.') =~ '^-->'
    exec line('.') - 1
  endif
  let l:next_title = search('^-->', 'b')
  if l:next_title > 1
    norm! zm
    exec max([l:next_title - 1, 1])
    call SdcvFoldOpen()
  endif
endfunc

func! SdcvDefinitionBufferInit(word)
  let b:is_sdcv_definition = 1
  setlocal bt=nofile bh=wipe nobl noswf nospell nonu
  " Key Mappings
  nnoremap <buffer> <silent> q :bwipeout<cr>

  " Highlights
  if !exists("b:current_syntax")
    let b:current_syntax = "stardict"

    syntax match stardictKeyword "\v\c<%(UK|US|countable|uncountable|BrE|NAmE|AmE|nouns?|verbs?|adverbs?|adjectives?|%(in)?transitive|adv|n|alt|vb|prep|%(in)?formal|plural|see also)>"
    syntax match stardictResult "\v^[A-Z].*"
    syntax match stardictWord "\v^\@.*"
    syntax match stardictWord2 "\v^--\>\zs.*"
    syntax match stardictWordType "\v^\*.*"
    syntax match stardictWordMeaning "\v^[0-9].*"
    syntax match stardictWordExample "\v^(    \-\s.*\:|\!.*|    \-\s.*)"
    syntax match stardictDictName "\v^\@[^/]*\:[^/]*"
    syntax match stardictPronounce "\v^\/.{0,30}\/"
    syntax match stardictBracket "\v\(.{0,10}\)"
    syntax match stardictSquareBracket "\v\[.{0,10}\]"
    syntax match stardictNumber "\v<\d{0,2}>"

    highlight link stardictResult Special
    highlight link stardictWord Todo
    highlight link stardictWord2 Todo
    highlight link stardictWordType Statement
    highlight link stardictWordMeaning Identifier
    highlight link stardictWordExample Type
    highlight link stardictDictName Underlined
    highlight link stardictPronounce Statement
    highlight link stardictBracket Statement
    highlight link stardictSquareBracket Statement
    highlight link stardictNumber PreProc
    highlight link stardictKeyword Identifier
  endif

  exec 'syntax match SdcvLookupWord /\c\V\<' . a:word . '/'
  highlight default link SdcvLookupWord Underlined
endfunc

func! Say(word) abort
  call system("say \"". a:word . "\"")
endfunc

nnoremap <silent> ,dd viw"ay:call ScratchBuffer('word.definition', 's'):call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")
vnoremap <silent> ,dd "ay:call ScratchBuffer('word.definition', 's'):call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")
nnoremap <silent> ,dD viw"ay:rightbelow new:call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")
vnoremap <silent> ,dD "ay:rightbelow new:call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")

nnoremap <silent> ,dv viw"ay:call ScratchBuffer('word.definition', 'v'):call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")
vnoremap <silent> ,dv "ay:call ScratchBuffer('word.definition', 'v'):call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")
nnoremap <silent> ,dV viw"ay:rightbelow vert new:call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")
vnoremap <silent> ,dV "ay:rightbelow vert new:call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")

nnoremap <silent> ,dt viw"ay:tabnew:call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")
vnoremap <silent> ,dt "ay:tabnew:call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")

nnoremap <silent> ,dr mpviw"ay:call Say("a")`p
vnoremap <silent> ,dr mp"ay:call Say("a")`p

nnoremap <silent> ,dR  :e ~/dev/zhizhi/vim-recite/wordmemo_daniel_daily.vim<CR>:call search("^\"=== End Words ===")<CR>zz
nnoremap <silent> ,dG  :e ~/dev/zhizhi/vim-recite/wordmemo_daniel_game.vim<CR>:call search("^\"=== End Words ===")<CR>zz

nnoremap <silent> ,df :call SdcvFoldDefinition()<CR>
nnoremap <silent> ,dn :call SdcvNextBook()<CR>
nnoremap <silent> ,dp :call SdcvPrevBook()<CR>

command! Recite tabnew ~/dev/zhizhi/vim-recite/
"}}}
"########## Others ##########{{{
command! Capitalize :s/\C\<[a-z]\+/\L\u\0/g|:nohl

" cd project root
command! CDR cd %:h | cd `git rev-parse --show-toplevel`
command! TCDR tcd %:h | tcd `git rev-parse --show-toplevel`
" cd module root
func! FindModuleRoot()
  let p = findfile("package.json", escape(expand('%:p:h'), ' ') . ";")
  if p == ''
    let p = findfile("pom.xml", escape(expand('%:p:h'), ' ') . ";")
  endif
  return fnameescape(fnamemodify(p, ':h'))
endfunc
command! CDM cd %:h | echo execute('cd ' . FindModuleRoot())
command! TCDM tcd %:h | echo execute('tcd ' . FindModuleRoot())
" cd current folder
command! CDF cd %:h
command! TCDF tcd %:h

""" Auto commit message when executing `git commit`
command! TACommitMessage norm! :5t.df/oggddf-;lgUl:s/-/ /gElr-0:nohlI[Ea]ll

""" Auto insert TODO comment with branch ticket number
command! TATodo exec "norm! a TODO :r !git name-rev --name-only HEADkJdf/2f-Da " | startinsert!

""" Format JSON String
command! TAFmtJson norm! :%!jq -S:setl ft=json fdm=syntax:syn onggzMzo

""" Wrap the selected comment with `=`, use in visual mode with <CTRL-U>
command! TACommentBox norm! `<`>``yyP_Wv$r=$5a=yy``p

""" PDF book
function! PDFBookStartFn(paperPerPart, startPage)
    let l:endPage = a:startPage - 1 + a:paperPerPart * 4 - 6
    exec 'norm! A "'.a:startPage.',1,1,1,1,1,'.a:startPage.'-'.l:endPage.'"'
endfunction

function! PDFBookNextFn(paperPerPart)
  norm! yypf"f-l
  let l:previousPage = str2nr(expand("<cword>"))
  exec 'norm! ci"' . (l:previousPage + 1) . '-' . (l:previousPage + 4 * a:paperPerPart)
endfunction

function! PDFBookEndFn(paperPerPart, notePapers)
  norm! yypf"f-l
  let l:previousPage = str2nr(expand("<cword>"))
  let l:offset = 2 * a:notePapers + 6
  exec 'norm! ci"' . (l:previousPage + 1) . '-' . (l:previousPage + 4 * a:paperPerPart - l:offset)
  if (a:notePapers > 0)
    exec 'norm! ' . (a:notePapers * 2) . 'a,2'
  endif
  norm! 6a,1
  call PDFBookNextBookFn(a:paperPerPart)
endfunction

function! PDFBookNextBookFn(paperPerPart)
    norm! vipygPO
    norm! jvipkojdf"f-l
    let l:previousPage = str2nr(expand("<cword>"))
    exec "norm! dd{j0f\"f-T,vt-c" . (l:previousPage + 1) . "\<esc>f-lce" . (l:previousPage + (4 * a:paperPerPart) - 6)
endfunction

function! PDFBookFinalFn(papersPerPart, lastPage, notePapers)
    norm! yyp0f"f-l"
    let l:previousPage = str2nr(expand("<cword>"))
    let l:expectedLast = l:previousPage + (4 * a:papersPerPart) - 6 - (2 * a:notePapers)
    if (a:lastPage >= l:previousPage && a:lastPage <= l:expectedLast)
        let l:offset = l:expectedLast - a:lastPage
        let l:actualNotePages = l:offset + a:notePapers * 2
        exec 'norm! ci"' . (l:previousPage + 1) . '-' . a:lastPage
        if (l:actualNotePages > 0)
            exec 'norm! ' . l:actualNotePages . 'a,2'
        endif
        norm! 6a,1
    else
        echoerr 'last page' . a:lastPage . ' out of range ('. l:previousPage . ', ' . l:expectedLast . ']'
        delete
    endif
endfunction

command! -nargs=* PDFBookStart :call PDFBookStartFn(<f-args>)
command! -nargs=* PDFBookNext :call PDFBookNextFn(<f-args>)
command! -nargs=* PDFBookEnd :call PDFBookEndFn(<f-args>)
command! -nargs=* PDFBookNextBook :call PDFBookNextBookFn(<f-args>)
command! -nargs=* PDFBookFinal :call PDFBookFinalFn(<f-args>)

""" Convert ps -ef output to Kill -9
command! -range Kill9 <line1>,<line2>:norm! 0vEckill -9ElD0

""" Insert current date at the beginning of a line
command! -range Date <line1>,<line2>:norm! I=strftime('%Y-%m-%d')

""" Break url parameter
command! BreakUrlParam s/[?&]/\r\0/g | nohl
"}}}
"########## Project Bookmarks #########{{{
let g:project_bookmark = {
      \'notes': '~/dev/zhizhi/workjournal/',
      \'vimrc': '~/.config/MiniNvim/',
      \'oldvimrc': '~/.config/nvim_/',
      \'vimhelp': $VIMRUNTIME . '/doc/',
      \'vimplug': stdpath('data') . '/lazy/',
      \'kitty': '~/.config/kitty'
      \}
func! s:go_bookmark(bookmark, tab_only)
  if has_key(g:project_bookmark, a:bookmark)
    let cd_cmd = a:tab_only ? 'tcd' : 'cd'
    exec cd_cmd . ' ' . get(g:project_bookmark, a:bookmark)
    echo cd_cmd . ' ' . get(g:project_bookmark, a:bookmark)
  else
    echo "Undefined bookmark: " . a:bookmark
  endif
endfunc
func! s:go_bookmark_completion(A, L, P)
  return filter(keys(g:project_bookmark), 'v:val =~ "^'. a:A .'"')
endfunc
command! -nargs=* -complete=customlist,s:go_bookmark_completion Go call s:go_bookmark(<f-args>, 0)
command! -nargs=* TabGo call s:go_bookmark(<f-args>, 1)
command! -nargs=* TabGoNew tabnew | call s:go_bookmark(<f-args>, 1) | NeoTreeShow
call utils#Cabbrev('go', 'Go')
call utils#Cabbrev('gg', 'Go')
call utils#Cabbrev('tg', 'TabGo')
call utils#Cabbrev('tgn', 'TabGoNew')
"}}}
"########## Current JIRA Ticket Notes ##########{{{
let g:ticket="JDAG-1087"
source ~/.config/nvim/ticket.vim
let g:project_temp_folder='/Users/zdeng/dev/zhizhi/workjournal/obsidian/JiraTicketNotes'
func! s:ensureTicketNotesFolder()
  let l:temp_folder = g:project_temp_folder. '/' . g:ticket
  if empty(glob(l:temp_folder))
    call system('mkdir -p ' . l:temp_folder)
  endif
  return l:temp_folder
endfunc
func! s:SetCurrentTicket(...)
  if a:0 == 0
    let g:ticket = input("Ticket #:")
  else
    let g:ticket = a:1
    echo "Current Project ticket set to " . g:ticket
  endif
endfunc
func! s:TicketNotesListFolder()
  let l:temp_folder = s:ensureTicketNotesFolder()
  exec 'Dirbuf ' . l:temp_folder
endfunc
func! s:TicketNoteEdit(...)
  let l:temp_folder = s:ensureTicketNotesFolder()
  if a:0 == 0
    let l:note_name = input("Note name:")
  else
    let l:i = 0
    " Find out if any file in the parameter list is already existed
    while l:i < len(a:000) && empty(glob(l:temp_folder . '/' . a:000[l:i]))
      let l:i = l:i + 1
    endwhile
    if l:i < len(a:000)
      let l:note_name = a:000[l:i]
    else
      let l:note_name = a:1
    endif
  endif
  if exists('g:vscode')
    exec ("AsyncRun -silent code '" . l:temp_folder . '/' . l:note_name . "'")
  else
    exec 'edit ' . l:temp_folder . '/' . l:note_name
  endif
endfunc
func! s:TicketNoteSave(...)
  let l:temp_folder = g:project_temp_folder. '/' . g:ticket
  if a:0 == 0
    let l:note_name = input("Note name:")
  else
    let l:note_name = a:1
  endif
  exec 'saveas ' . l:temp_folder . '/' . l:note_name
endfunc

" Save and load bookmarks, need `MattesGroeger/vim-bookmarks` to work
func! s:TicketBookmarkSave(...)
  let l:temp_folder = g:project_temp_folder. '/' . g:ticket
  if a:0 == 0
    let l:note_name = input("Note name (default: bookmarks): ")
  else
    let l:note_name = a:1
  endif
  if (l:note_name == "")
    let l:note_name = "bookmarks"
  endif
  exec 'BookmarkSave ' . l:temp_folder . '/' . l:note_name
endfunc

func! s:TicketBookmarkLoad(...)
  let l:temp_folder = g:project_temp_folder. '/' . g:ticket
  if a:0 == 0
    let l:note_name = input("Note name (default: bookmarks): ")
  else
    let l:note_name = a:1
  endif
  if (l:note_name == "")
    let l:note_name = "bookmarks"
  endif
  exec 'BookmarkLoad ' . l:temp_folder . '/' . l:note_name
endfunc

command! -nargs=* TicketSetCurrent call s:SetCurrentTicket(<f-args>)
command! TicketNotesListFolder call s:TicketNotesListFolder()
command! -nargs=* TicketNoteEdit call s:TicketNoteEdit(<f-args>)
command! -nargs=* TicketNoteSave call s:TicketNoteSave(<f-args>)
command! -nargs=* TicketBookmarkLoad call s:TicketBookmarkLoad(<f-args>)
command! -nargs=* TicketBookmarkSave call s:TicketBookmarkSave(<f-args>)
nnoremap <silent> <space>tn<space> :TicketNoteEdit notes.md notes.org<cr>
nnoremap <silent> <space>tf<space> :TicketNotesListFolder<cr>

command! Todo exec "norm! :\<C-U>\<C-R>=printf(\"Leaderf! rg -F -e '%s'\", \"TODO \" . g:ticket)\<CR>\<CR>"
command! TBookmark exec "norm! :\<C-U>\<C-R>=printf(\"Leaderf! rg -F -e '%s'\", \"BOOKMARK \" . g:ticket)\<CR>\<CR>"
command! NoteTitle s/let g:ticket="\([^"]\+\)"\s\+"/title:: \1 /
" command! ObsidianNote let @p = 'vf"dExWxD0OpO---tags:  - jiraticket0jiJira: 0jvEykeWhPF:a 0jiObsidianLink: obsidian://open?vault=obsidian&file=JiraTicketNotes&kb%2FAVPkbkbkbA0g_a Da%2Fnotes---kkkf:wvg_y0jjo# Title Here## Links- (ItkbkbTicket) (Branch)(PR)(FF)kbkbkbkbüU\ ' | norm @p
" command! ObsidianNote let @p = '0df"ExldwxyyPElDOki---tags:  - jiraticketObsidianLink: obsidian://open?vault=obsidian&file=JiraTicketNotes%2FJgJA%2Fnotes---jI# o## Links(Ticket)(Branch)(PR)(FF)(FD){jjjjjjI- ' | norm @p
command! ObsidianNote let @p = '0df"ExldwxyyPElDOki---tags:  - jiraticketObsidianLink: obsidian://open?vault=obsidian&file=JiraTicketNotes%2FJgJA%2Fnotes---jI# o## Links(Ticket) 🎫(Branch) 🔀(PR) 💪(FF) 🚩(FD) 🚚{jjjjjjI- ' | norm @p

nmap ,td aTODO <c-r>=g:ticket<cr><space>$<esc>gcc_f$s
imap ,td  TODO <c-r>=g:ticket<cr><space>$<esc>gcc_f$s
nmap ,tm aBOOKMARK <c-r>=g:ticket<cr><space>$<esc>gcc_f$s
imap ,tm  BOOKMARK <c-r>=g:ticket<cr><space>$<esc>gcc_f$s
nnoremap <space>gl<space> <c-w>gF

"}}}
"########## IDE integration ##########{{{

"func! s:getBookmarkUnderCursor(text, pos)
"  "Find the start location
"  let p = a:pos
"  while p >= 0 && a:text[p] =~ '\f'
"    let p = p - 1
"  endwhile
"  let p = p + 1
"  "Match file name and position
"  let l:m = matchlist(a:text, '\v(\f+)%([#:](\d+))?%(:(\d+))?', p)
"  if len(l:m) > 0
"    return [l:m[1], l:m[2], l:m[3]]
"  endif
"  return []
"endfunc
"func! s:OpenFileLinkInIdea(text, pos, ide)
"  let l:location = s:getBookmarkUnderCursor(a:text, a:pos)
"  if l:location[0] != ''
"    if l:location[1] != ''
"      if l:location[2] != ''
"        let l:command = a:ide . " --column " . str2nr(l:location[2]) . " " . l:location[0] . ":" . str2nr(l:location[1])
"        echo l:command
"        exec "AsyncRun -silent " . l:command
"      else
"        let l:command = a:ide . " " . l:location[0] . ":" . str2nr(l:location[1])
"        echo l:command
"        exec "AsyncRun -silent " . l:command
"      endif
"    else
"      let l:command = a:ide . " " . l:location[0]
"      echo l:command
"      exec "AsyncRun -silent " . l:command
"    endif
"  else
"    echo "Not a valid file path"
"  endif
"endfunc
" command! OpenFileLinkInIdea call s:OpenFileLinkInIdea(getline("."), col("."), "idea")
" command! OpenFileLinkInWebStorm call s:OpenFileLinkInIdea(getline("."), col("."), "webstorm")
" command! OpenFileLinkInPycharm call s:OpenFileLinkInIdea(getline("."), col("."), "pycharm")
" Open a file link under cursor in idea
" nnoremap <space>idle<space> :OpenFileLinkInIdea<cr>
" Open a file link under cursor in webstorm
" nnoremap <space>idlw<space> :OpenFileLinkInWebStorm<cr>
" Open a file link under cursor in webstorm
" nnoremap <space>idlp<space> :OpenFileLinkInPycharm<cr>

" Open a file link under cursor in vscode
nnoremap <silent> <space>idcc<space> :.w !ed.clj -e vscode --stdin --cursor <c-r>=col(".")<cr><cr>

" Open a file link under cursor in webstorm
nnoremap <silent> <space>idww<space> :.w !ed.clj -e webstorm --stdin --cursor <c-r>=col(".")<cr><cr>

" Open a file link under cursor in idea
nnoremap <silent> <space>idee<space> :.w !ed.clj -e idea --stdin --cursor <c-r>=col(".")<cr><cr>

" Open a file link under cursor in pycharm
nnoremap <silent> <space>idpp<space> :.w !ed.clj -e pycharm --stdin --cursor <c-r>=col(".")<cr><cr>

" Open a file link under cursor in sublime
nnoremap <silent> <space>idss<space> :.w !ed.clj -e sublime --stdin --cursor <c-r>=col(".")<cr><cr>

" Open the current file in idea
"nnoremap <space>ide<space> :<c-r>=printf("AsyncRun -silent idea --line %d --column %d '%s'", line("."), col(".") - 1, expand("%:p"))<cr><cr>
nnoremap <space>ide<space> :<c-r>=printf("AsyncRun -silent ed.clj -e idea -f '%s' -l %d -c %d", expand("%:p"), line("."), col("."))<cr><cr>
" Open the current file in webstorm
"nnoremap <space>idw<space> :<c-r>=printf("AsyncRun -silent webstorm --line %d --column %d '%s'", line("."), col(".") - 1, expand("%:p"))<cr><cr>
nnoremap <space>idw<space> :<c-r>=printf("AsyncRun -silent ed.clj -e webstorm -f '%s' -l %d -c %d", expand("%:p"), line("."), col("."))<cr><cr>
" Open the current file in pycharm
"nnoremap <space>idp<space> :<c-r>=printf("AsyncRun -silent pycharm --line %d --column %d '%s'", line("."), col(".") - 1, expand("%:p"))<cr><cr>
nnoremap <space>idp<space> :<c-r>=printf("AsyncRun -silent ed.clj -e pycharm -f '%s' -l %d -c %d", expand("%:p"), line("."), col("."))<cr><cr>
" Open the current file in vscode
" nnoremap <space>idc<space> :<c-r>=printf("AsyncRun -silent code --goto '%s:%d:%d'", expand("%:p"), line("."), col("."))<cr><cr>
nnoremap <space>idc<space> :<c-r>=printf("AsyncRun -silent ed.clj -e vscode -f '%s' -l %d -c %d", expand("%:p"), line("."), col("."))<cr><cr>

" Open the current file in sublime
nnoremap <space>ids<space> :<c-r>=printf("AsyncRun -silent ed.clj -e sublime -f '%s' -l %d -c %d", expand("%:p"), line("."), col("."))<cr><cr>

" Open the current file in vimR
nnoremap <space>vimr<space> :<c-r>=printf("AsyncRun -silent ed.clj -e vimr -f '%s' -l %d -c %d", expand("%:p"), line("."), col("."))<cr><cr>

" Open the current file in kitty-vim
nnoremap <space>vin<space> :<c-r>=printf("AsyncRun -silent ed.clj -f '%s' -l %d -c %d", expand("%:p"), line("."), col("."))<cr><cr>

" command! OpenInVSCode exe "silent !code --goto '" . expand("%") . ":" . line(".") . ":" . col(".") . "'" | redraw!
" nnoremap <space>idc<space> :OpenInVSCode<cr>

nnoremap <space>epp<space> :e <c-r>*<cr>

"}}}
"########## Merge ##########{{{
let s:mergeSources = {
      \  'L':      4,
      \  'LOCAL':  4,
      \  'B':      3,
      \  'BASE':   3,
      \  'R':      2,
      \  'REMOTE': 2,
      \  'M':      1,
      \  'MERGE':  1,
      \}

func! commands#createMergeTab(...)
  " Map source name to buffer number
  if a:0 > 0
    let l:sources = []
    for item in a:000
      if has_key(s:mergeSources, toupper(item))
        call add(l:sources, get(s:mergeSources, toupper(item)))
      else
        echo 'Unrecognized source: ' . item
        return
      endif
    endfor
  else
    let l:sources = [4, 1, 2]
  endif

  let l:mergeBufIndex = max([index(l:sources, 1), 0]) + 1

  tabnew
  let i = 0
  while i < len(l:sources) - 1
    exec 'buf ' . l:sources[i]
    rightbelow vsp
    let i = i + 1
  endwhile
  exec 'buf ' . l:sources[i]
  windo diffthis
  exec l:mergeBufIndex . 'wincmd w'
endfunc

" Open a new tab with the specified version to compare, e.g.
" :MergeTab L B  - Open a new tab to compare Local and Base version
" :MergeTab R M  - Open a new tab to compare Remote and Merged version
command! -nargs=* MergeTab call commands#createMergeTab(<f-args>)
"}}}
"########## BufferOnly ##########{{{
" This command close all buffers and reopen the last one
" Commented out because I need a smarter solution to keep some
" specific buffers like the NeoTree
" command! BufCurOnly execute '%bdelete|edit#|bdelete#'

" Steal from https://github.com/vim-scripts/BufOnly.vim/blob/master/plugin/BufOnly.vim
" Only close listed buffers so it'll keep nonlisted buffers like
" NeoTree
function! BufOnly(buffer, bang)
	if a:buffer == ''
		" No buffer provided, use the current buffer.
		let buffer = bufnr('%')
	elseif (a:buffer + 0) > 0
		" A buffer number was provided.
		let buffer = bufnr(a:buffer + 0)
	else
		" A buffer name was provided.
		let buffer = bufnr(a:buffer)
	endif

	if buffer == -1
		echohl ErrorMsg
		echomsg "No matching buffer for" a:buffer
		echohl None
		return
	endif

	let last_buffer = bufnr('$')

	let delete_count = 0
	let n = 1
	while n <= last_buffer
		if n != buffer && buflisted(n)
			if a:bang == '' && getbufvar(n, '&modified')
				echohl ErrorMsg
				echomsg 'No write since last change for buffer'
							\ n '(add ! to override)'
				echohl None
			else
				silent exe 'bdel' . a:bang . ' ' . n
				if ! buflisted(n)
					let delete_count = delete_count+1
				endif
			endif
		endif
		let n = n+1
	endwhile

	if delete_count == 1
		echomsg delete_count "buffer deleted"
	elseif delete_count > 1
		echomsg delete_count "buffers deleted"
	endif

endfunction

command! -nargs=? -complete=buffer -bang BufCurOnly :call BufOnly('<args>', '<bang>')
"}}}

"########## Hide All ##########{{{
let s:hidden_all = 0
function! ToggleHideAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

command! ToggleHideAll call ToggleHideAll()
"}}}

"########## Cabbrevs ##########{{{
call utils#Cabbrev('h', 'tab help')
call utils#Cabbrev('tn', 'tabnew')

" new maximised buffer, work together with Bufferline
call utils#Cabbrev('nb', 'new \| wincmd o')
" new split buffer
call utils#Cabbrev('nsb', 'botright new')
call utils#Cabbrev('nvb', 'botright vnew')
" new temporary buffer
call utils#Cabbrev('ntb', 'botright new \| setl bt=nofile bh=delete noswf \| put!=''## Temporary ##'' \| norm o')
" new scratch buffer
call utils#Cabbrev('nsc', 'botright new \| setl bt=nofile bh=hide noswf \| put!=''## Scratch ##'' \| norm o')

call utils#Cabbrev('cdf',  'CDF')
call utils#Cabbrev('tcdf', 'TCDF')
call utils#Cabbrev('cdm',  'CDM')
call utils#Cabbrev('tcdm', 'TCDM')
call utils#Cabbrev('cdr',  'CDR')
call utils#Cabbrev('tcdr', 'TCDR')
call utils#Cabbrev('mru',  'MRU')

call utils#Cabbrev('ntree', 'Neotree')
call utils#Cabbrev('shdo', 'Shdo')
" call utils#Cabbrev('flog', 'Flog')

call utils#Cabbrev('ts',  'Telescope')
call utils#Cabbrev('tsk', 'Telescope keymaps')
call utils#Cabbrev('tsj', 'Telescope jumplist')
call utils#Cabbrev('tss', 'Telescope lsp_document_symbols')
call utils#Cabbrev('tsc', 'Telescope command_palette')
call utils#Cabbrev('tsf', 'Telescope smart_open')
call utils#Cabbrev('tsm', 'Telescope marks')
call utils#Cabbrev('tb',  'Telescope buffers')

call utils#Cabbrev('rof', 'LeaderfMru')
call utils#Cabbrev('pf',  'LeaderfFile')
call utils#Cabbrev('rg',  'Leaderf rg --regexMode --stayOpen -e ""')

call utils#Cabbrev('bl', 'BufferLineGoToBuffer')

call utils#Cabbrev('git',  'Git')
call utils#Cabbrev('blame',  'Git blame')
" Show git status using diffview plugin
call utils#Cabbrev('dvo', 'DiffviewOpen')
" Show git history for current file using diffview plugin
call utils#Cabbrev('dvf', 'DiffviewFileHistory')

" Clear all bookmarks
call utils#Cabbrev('dmk', 'delm A-Z a-z')

" Show tree view for the opened buffers using el-iot/buffer-tree-explorer
call utils#Cabbrev('tree', 'Tree')

" Search for a keyword using voldikss/vim-browser-search
call utils#Cabbrev('bs', 'BrowserSearch')

" fold by syntax
call utils#Cabbrev('fds', 'set fdm=syntax \| norm zMzv')

" Preview markdown with Glow
call utils#Cabbrev('gl', 'Glow')

" List and manage current buffer's folder with dirbuf plugin
call utils#Cabbrev('ls', 'Dirbuf %')

" Fix issues when switching colortheme
call utils#Cabbrev('dark', 'set background=dark')

"}}}

" MODELLINE {{{
" vim: set ts=2 sts=-1 sw=0 et tw=70 ft=vim fdm=marker:
" }}}
