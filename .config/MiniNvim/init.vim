" profile start profile.log
" profile func *
" profile file *
let g:config_files = [
      \ 'core/globals.vim',
      \ 'core/options.vim',
      \ 'core/autocommands.vim',
      \ 'core/utils.vim',
      \ 'core/plugins.vim',
      \ 'core/mappings.vim',
      \ 'core/themes.vim',
      \ 'core/commands.vim',
      \ 'core/vscode.vim',
      \ ]

" Get current nvimrc folder (safe for symlinks)
let g:nvimrc = fnamemodify(resolve(expand('<sfile>:p')), ':h')

for s:fname in g:config_files
  execute printf('source %s/%s', expand('<sfile>:p:h'), s:fname)
endfor
