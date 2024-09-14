if exists('g:vscode')
  nnoremap u <cmd>call VSCodeNotify('undo')<cr>

  nnoremap <TAB>m <cmd>call VSCodeNotify('workbench.action.maximizeEditor') \| call VSCodeNotify('workbench.action.closePanel')<cr>
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

  nnoremap ,tk <cmd>call VSCodeNotify('workbench.action.openGlobalKeybindings')<cr>
  nnoremap ,tp <cmd>call VSCodeNotify('workbench.view.extensions')<cr>

  nnoremap ;q <cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>
  nnoremap ;s <cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>
  nnoremap ;f <cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>

  nnoremap <space>si<space> <cmd>call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')<cr>
  nnoremap <space>*<space> <cmd>call VSCodeNotify('references-view.findReferences')<cr>

  " Marks
  nnoremap <space>fsj<space> <cmd>call VSCodeNotify('editor.action.marker.prev')<cr>
  nnoremap <space>fsk<space> <cmd>call VSCodeNotify('editor.action.marker.next')<cr>

  " Search in files
  nnoremap <space>efj<space> <cmd>call VSCodeNotify('editor.action.smartSelect.grow') \| call VSCodeNotifyVisual('workbench.action.findInFiles', 1)<cr>
  xnoremap <space>efj<space> <cmd>call VSCodeNotifyVisual('workbench.action.findInFiles', 1)<cr>
  nnoremap <space>efk<space> <cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>
  xnoremap <space>efk<space> <cmd>call VSCodeNotifyVisual('workbench.action.findInFiles', 1)<cr>
  xnoremap <space>efjk<space> <cmd>call VSCodeNotify('workbench.view.search')<cr>
  xnoremap <space>efkj<space> <cmd>call VSCodeNotify('workbench.view.search')<cr>

  " Search reference
  nnoremap <space>fdfj<space> <cmd>call VSCodeNotify('editor.action.peekDefinition')<cr>
  nnoremap <space>fdfk<space> <cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<cr>
  nnoremap <space>fdfi<space> <cmd>call VSCodeNotify('references-view.findReferences')<cr>
  nnoremap <space>fdj<space> <cmd>call VSCodeNotify('editor.action.peekTypeDefinition')<cr>
  nnoremap <space>fdk<space> <cmd>call VSCodeNotify('editor.action.peekDeclaration')<cr>
  nnoremap <space>k<space> <cmd>call VSCodeNotify('editor.action.showHover')<cr>

  " Doom-like
  nnoremap <space>fr<space> <cmd>call VSCodeNotify('workbench.action.quickOpenRecent')<cr>
  nnoremap <space>pp<space> <cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>
  nnoremap <space>g<space> <cmd>call VSCodeNotify('editor.action.showContextMenu')<cr>

  nnoremap ZW <cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<cr>
  nnoremap ZQ <cmd>call VSCodeNotify('workbench.action.closeWindow')<cr>

  nnoremap <space>pf<space> <cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>

  nnoremap ,c <cmd>call VSCodeNotify('workbench.action.openSettingsJson')<cr>

  nnoremap <space>efl<space> <cmd>call VSCodeNotify('workbench.action.showAllEditors')<cr>

  nnoremap <space>jp<space> <cmd>call VSCodeNotify('copy-json-path.copy')<cr>

  nnoremap <space>w<space> <cmd>call VSCodeNotify('editor.action.toggleWordWrap')<cr>

  nnoremap <leader>m <cmd>call VSCodeNotify('editor.action.toggleMinimap')<cr>

  nnoremap ,tt :<c-r>=printf("!code '%s'", '/Users/zdeng/.config/nvim/ticket.vim')<cr><cr>
  nnoremap ,tk :<c-r>=printf("!code '%s'", '/Users/zdeng/.config/MiniNvim/core/vscode.vim')<cr><cr>
  nnoremap ,tp :<c-r>=printf("!code '%s'", '/Users/zdeng/.config/MiniNvim/lua/plugins.lua')<cr><cr>

endif
