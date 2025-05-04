--opening terminal with <leader>t in vertical mode
vim.keymap.set("n", "<leader>t", ":ToggleTerm size=40 direction=vertical<cr>", {noremap = true, silent = true})
--opening terminal with <leader>h in horizontal mode with size 20
vim.keymap.set("n", "<leader>h", ":ToggleTerm size=15 direction=horizontal<cr>", {noremap = true, silent = true})
--Exiting terminal mode and get back to normal with <leader>e
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })



