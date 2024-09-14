local M = require('gen')
M.setup({
    model = vim.g.ai_model or "mistral-nemo:12b-instruct-2407-q8_0",
    display_mode = "split",
    show_model = true,
    show_prompt = true,
    no_auto_close = true,
})

require('gen').prompts['Chat_Block'] = {
  prompt = "$text",
}

require('gen').prompts['Summarize'] = {
  prompt = "Please summarize the main points of the following text (Do not include any comments or feedback or suggestion about the writing style or improvement. My goal is to understand the core message of this text):\n$text",
}

require('gen').prompts['Enhance_Wording'] = {
  prompt = "Modify the following text to use better wording, just output the final text without additional quotes around it:\n$text",
  replace = false,
}

require('gen').prompts['Tranlate'] = {
  prompt = "Please translate the following text into $register_l, answer in $register_l, just output the final text without additional quotes around it:\n\n$text",
}

require('gen').prompts['ExplainTerm'] = {
  prompt = "Please translate \"$register_a\" into $register_l and explain its meaning in the follow text. Write your answer in $register_l:\n\n$register_b",
}

require('gen').prompts['AlternativeTerm'] = {
  prompt = "Please use an alternative word for \"$register_a\" in the follow text, provide at least 3, up to 5, suggestions for me to choose from. Output <The End> at the end of your answer:\n\n$register_b",
}

vim.keymap.set({ 'n', 'v' }, ',jj', ':Gen Chat<CR>')
vim.keymap.set({ 'n' }, ',jk', 'vip:Gen Chat_Block<CR>')
vim.keymap.set({ 'v' }, ',jk', ':Gen Chat_Block<CR>')
vim.keymap.set({ 'n', 'v' }, '<space>sfj<space>', ':Gen<CR>')

vim.keymap.set({ 'v' }, '<space>sfo<space>', ':Gen Generate<CR>')
vim.keymap.set({ 'n' }, '<space>sfo<space>', 'vip:Gen Generate<CR>')

vim.keymap.set({ 'v' }, '<space>sfc<space>', ':Gen Change<CR>')
vim.keymap.set({ 'n' }, '<space>sfc<space>', 'vip:Gen Change<CR>')

vim.keymap.set({ 'v' }, '<space>sfk<space>', ':Gen Enhance_Wording<CR>')
vim.keymap.set({ 'n' }, '<space>sfk<space>', 'vip:Gen Enhance_Wording<CR>')

vim.keymap.set({ 'v' }, '<space>sfi<space>', ':Gen Enhance_Grammar_Spelling<CR>')
vim.keymap.set({ 'n' }, '<space>sfi<space>', 'vip:Gen Enhance_Grammar_Spelling<CR>')

vim.keymap.set({ 'v' }, '<space>sfh<space>', ':Gen Ask<CR>')
vim.keymap.set({ 'n' }, '<space>sfh<space>', 'vip:Gen Ask<CR>')

vim.keymap.set({ 'v' }, '<space>sfo<space>', ':Gen Make_Concise<CR>')
vim.keymap.set({ 'n' }, '<space>sfo<space>', 'vip:Gen Make_Concise<CR>')

vim.keymap.set({ 'v' }, '<space>sfu<space>', ':Gen Review_Code<CR>')
vim.keymap.set({ 'n' }, '<space>sfu<space>', ':Gen Review_Code<CR>')

vim.keymap.set({ 'v' }, '<space>sfl<space>', ':Gen Make_Concise<CR>')
vim.keymap.set({ 'n' }, '<space>sfl<space>', 'vip:Gen Make_Concise<CR>')

vim.keymap.set({ 'v' }, '<space>sfn<space>', ':Gen Make_')
vim.keymap.set({ 'n' }, '<space>sfn<space>', 'vip:Gen Make_')

vim.keymap.set({ 'n' }, '<space>sfm<space>', ':lua require("gen").select_model()<CR>')

vim.keymap.set({ 'n' }, ',da', 'mpviw"pyvis:Gen Ask<CR>What is "<C-R>p"<CR>zR<C-W>p`p<C-W>p')
vim.keymap.set({ 'v' }, ',da', 'mp"pyvis:Gen Ask<CR>What is "<C-R>p"<CR>zR<C-W>p`p<C-W>p')

-- vim.keymap.set({ 'n' }, ',dc', 'mpviw"pyvis:Gen Ask<CR>Translate "<C-R>p" into Chinese and explain its meaning in the text. Use Chinese in the conversation<CR>zR<C-W>p`p<C-W>p')
-- vim.keymap.set({ 'v' }, ',dc', 'mp"pyvis:Gen Ask<CR>Translate "<C-R>p" into Chinese and explain its meaning in the text. Use Chinese in the conversation<CR>zR<C-W>p`p<C-W>p')

vim.keymap.set({ 'n' }, ',dc', 'mp"ayiw"byis:Gen ExplainTerm<CR>zR<C-W>p`p<C-W>p')
vim.keymap.set({ 'v' }, ',dc', 'mp"ay"byis:Gen ExplainTerm<CR>zR<C-W>p`p<C-W>p')

vim.keymap.set({ 'n' }, '<space>sfp<space>', 'mp"ayiw"byis:Gen AlternativeTerm<CR>zR<C-W>p`p<C-W>p')
vim.keymap.set({ 'v' }, '<space>sfp<space>', 'mp"ay"byis:Gen AlternativeTerm<CR>zR<C-W>p`p<C-W>p')
