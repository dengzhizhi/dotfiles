" TT-06 Transform monolith js dependencies to plantuml links
let @n = '0wva"yj}kP}gkf"ls --> }gkf>llf''hdgvI V}gk:norm f>f''cs''"gkvip='

" Show fetched result for copied fetch command
" `Copy as fetch` in browser Network tab, copy the command in vim and run this
" macro when cursor is in the `fetch` keyword
let @n = 'I(async () => console.log(await (await f(%a).text()))()jkhh%'

" Rename PDFSam splited file to flip starting page numbers
let @n = '0Wv,eyA pBvt_��5df_��5lvt_��5,x'


" AWS Practice Test in Udemy handling
command! FormatAWSPT let @n=':sil! %s#\v\c^Question \d+\zs((in)?correct|skipped)##:sil! %s#\v\cYour (answer|selection) is (in)?correct\n\n##:sil! %s#\v\c^Correct (answer|selection)\n\n##:sil! %s/\v^\zeQuestion \d+/# :sil! %s/\v\c^\ze(Overall explanation|Domain|References?:)/## :sil! %s/\v\c^\ze(in)?correct options?:/###  ' | norm! @n
command! FormatAWSOpts let @n='jjV/^## Overall explanationkk:s#^\ze\w#- [ ] /^# Question /?0zt' | norm! @n
" command! GoCorrectAnswer let @n='?# QuestionzmzO/## /### zmzv0jj' | norm! @n
command! GoCorrectAnswer let @n='?# Question<CR>zmzO/## <CR>/### <CR>zmzv0jj' | norm! @n

