if exists('g:vscode')
  " nnoremap u <cmd>call VSCodeNotify('undo')<cr>

  function! s:manageEditorSize(...)
    let count = a:1
    let to = a:2
    for i in range(1, count ? count : 1)
      call VSCodeNotify(to ==# 'increase' ? 'workbench.action.increaseViewSize' : 'workbench.action.decreaseViewSize')
    endfor
  endfunction

  " Keep undo/redo lists in sync with VSCode
  nmap <silent> u <Cmd>call VSCodeNotify('undo')<CR>
  nmap <silent> <C-r> <Cmd>call VSCodeNotify('redo')<CR>

  " Sample keybindings. Note these override default keybindings mentioned above.
  nnoremap <TAB>> <Cmd>call <SID>manageEditorSize(v:count, 'increase')<CR>
  xnoremap <TAB>> <Cmd>call <SID>manageEditorSize(v:count, 'increase')<CR>
  nnoremap <TAB>+ <Cmd>call <SID>manageEditorSize(v:count, 'increase')<CR>
  xnoremap <TAB>+ <Cmd>call <SID>manageEditorSize(v:count, 'increase')<CR>
  nnoremap <TAB>< <Cmd>call <SID>manageEditorSize(v:count, 'decrease')<CR>
  xnoremap <TAB>< <Cmd>call <SID>manageEditorSize(v:count, 'decrease')<CR>
  nnoremap <TAB>- <Cmd>call <SID>manageEditorSize(v:count, 'decrease')<CR>
  xnoremap <TAB>- <Cmd>call <SID>manageEditorSize(v:count, 'decrease')<CR>

  nnoremap <TAB>m <cmd>call VSCodeNotify('workbench.action.maximizeEditorHideSidebar') \| call VSCodeNotify('workbench.action.closePanel')<cr>
  nnoremap <TAB>o <cmd>call VSCodeNotify('workbench.action.maximizeEditorHideSidebar') \| call VSCodeNotify('workbench.action.closePanel')<cr>
  nnoremap <TAB>v <cmd>call VSCodeNotify('workbench.action.splitEditorRight')<cr>
  nnoremap <TAB>s <cmd>call VSCodeNotify('workbench.action.splitEditorDown')<cr>
  nnoremap <TAB>H <cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupLeft')<cr>
  nnoremap <TAB>J <cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupDown')<cr>
  nnoremap <TAB>K <cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupUp')<cr>
  nnoremap <TAB>L <cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupRight')<cr>
  nnoremap <TAB>h <cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<cr>
  nnoremap <TAB>j <cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<cr>
  nnoremap <TAB>k <cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<cr>
  nnoremap <TAB>l <cmd>call VSCodeNotify('workbench.action.focusRightGroup')<cr>

  nnoremap <c-o> <cmd>call VSCodeNotify('workbench.action.navigateBack')<cr>
  nnoremap <TAB>i <cmd>call VSCodeNotify('workbench.action.navigateForward')<cr>

  nnoremap <TAB>f <cmd>call VSCodeNotify('workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup')<cr>

  nnoremap ,tk <cmd>call VSCodeNotify('workbench.action.openGlobalKeybindings')<cr>
  nnoremap ,tp <cmd>call VSCodeNotify('workbench.view.extensions')<cr>
  nnoremap gf <cmd>call VSCodeNotify('seito-openfile.openFileFromText')<cr>

  nnoremap ;q <cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>
  nnoremap ;Q <cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>
  nnoremap ;s <cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>
  nnoremap ;f <cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>
  xnoremap ;s <cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>
  xnoremap ;f <cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>
  nnoremap ;wr <cmd>call VSCodeNotify('workbench.action.closeEditorsToTheRight')<cr>
  nnoremap ;wp <cmd>call VSCodeNotify('workbench.action.pinEditor')<cr>
  nnoremap ;M <cmd>call VSCodeNotify('workbench.action.files.setActiveEditorWriteableInSession')<cr>

  nnoremap <space>si<space> <cmd>call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')<cr>
  nnoremap <space>so<space> <cmd>call VSCodeNotify('workbench.view.explorer')<cr>
  nnoremap <space>*<space> <cmd>call VSCodeNotify('references-view.findReferences')<cr>

  " Marks
  nnoremap <space>fsk<space> <cmd>call VSCodeNotify('editor.action.marker.prev')<cr>
  nnoremap <space>fsj<space> <cmd>call VSCodeNotify('editor.action.marker.next')<cr>

  " Search in files
  nnoremap <space>efj<space> <cmd>call VSCodeNotify('editor.action.smartSelect.grow') \| call VSCodeNotify('workbench.action.findInFiles')<cr>
  xnoremap <space>efj<space> <cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>
  nnoremap <space>efk<space> <cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>
  xnoremap <space>efk<space> <cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>
  xnoremap <space>efjk<space> <cmd>call VSCodeNotify('workbench.view.search')<cr>
  xnoremap <space>efkj<space> <cmd>call VSCodeNotify('workbench.view.search')<cr>
  nnoremap <space>efo<space> <cmd>call VSCodeNotify('workbench.action.openRecent')<cr>
  nnoremap <space>efl<space> <cmd>call VSCodeNotify('workbench.action.showAllEditors')<cr>

  " Search reference
  nnoremap <space>fdfj<space> <cmd>call VSCodeNotify('editor.action.peekDefinition')<cr>
  nnoremap <space>fdfk<space> <cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<cr>
  nnoremap <space>fdfi<space> <cmd>call VSCodeNotify('references-view.findReferences')<cr>
  nnoremap <space>fdfu<space> <cmd>call VSCodeNotify('editor.action.peekTypeDefinition')<cr>
  nnoremap <space>fdfl<space> <cmd>call VSCodeNotify('editor.action.peekDeclaration')<cr>
  nnoremap <space>k<space> <cmd>call VSCodeNotify('editor.action.showHover')<cr>

  " Doom-like
  nnoremap <space>fr<space> <cmd>call VSCodeNotify('workbench.action.quickOpenRecent')<cr>
  nnoremap <space>pp<space> <cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>
  nnoremap <space>g<space> <cmd>call VSCodeNotify('editor.action.showContextMenu')<cr>

  nnoremap ZW <cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<cr>
  nnoremap ZQ <cmd>call VSCodeNotify('workbench.action.closeWindow')<cr>

  nnoremap <space>pf<space> <cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>

  nnoremap ,c <cmd>call VSCodeNotify('workbench.action.openSettingsJson')<cr>
  
  nnoremap <leader>ta <cmd>call VSCodeNotify('workbench.action.tasks.runTask')<cr>


  nnoremap <space>jp<space> <cmd>call VSCodeNotify('copy-json-path.copy')<cr>

  nnoremap <space>w<space> <cmd>call VSCodeNotify('editor.action.toggleWordWrap')<cr>

  nnoremap <leader>m <cmd>call VSCodeNotify('editor.action.toggleMinimap')<cr>

  nnoremap <space>vin<space> <cmd>call VSCodeNotify('command-runner.run', {'command': 'open_in_kitty_nvim'})<cr>
  nnoremap <space>subl<space> <cmd>call VSCodeNotify('command-runner.run', {'command': 'open_in_sublime'})<cr>

  nnoremap ,tt :<c-r>=printf("!code '%s'", '/Users/zdeng/.config/nvim/ticket.vim')<cr><cr>
  nnoremap ,tk :<c-r>=printf("!code '%s'", '/Users/zdeng/.config/nvim/core/vscode.vim')<cr><cr>
  nnoremap ,tp :<c-r>=printf("!code '%s'", '/Users/zdeng/.config/nvim/lua/plugins.lua')<cr><cr>
  nnoremap ,tm <cmd>call VSCodeNotify('workbench.action.openDefaultKeybindingsFile')<cr>

  nnoremap <space>uid<space> <cmd>call VSCodeNotify('randomeverything.guid')<cr>
  nnoremap ,em <cmd>call VSCodeNotify('emoji.insert')<cr>

  nnoremap <space>fefo<space> <cmd>call VSCodeNotify('outline.focus')<cr>

  nnoremap <space>dsj<space> <cmd>call VSCodeNotify('git.viewFileHistory')<cr>
  " Need https://marketplace.visualstudio.com/items?itemName=W77.git-blame-w77
  nnoremap <space>dsk<space> <cmd>call VSCodeNotify('gitBlameW77.toggleBlameDecoration')<cr>

endif
