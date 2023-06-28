" Show fetched result for copied fetch command
" `Copy as fetch` in browser Network tab, copy the command in vim and run this
" macro when cursor is in the `fetch` keyword
let @n = 'I(async () => console.log(await (await f(%a).text()))()jkhh%'
