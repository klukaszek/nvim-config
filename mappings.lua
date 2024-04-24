-- Move selected line up or down and in between braces
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Dont move cursor when appending bottom line to current line
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor centered when doing half page movements
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center searched terms
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete entire token that cursor is above in insert mode
vim.keymap.set('i', '<C-w>', 'X<Esc>bce', { noremap = true, silent = true })

-- When using d to delete, we do not copy what was deleted
vim.keymap.set('n', '<leader>d', "\"_d", { desc = "Delete don't copy" })
vim.keymap.set('v', '<leader>d', "\"_d", { desc = "Delete don't copy" })

-- When pasting over something, we do not copy the string that is deleted
vim.keymap.set('x', '<leader>p', "\"_dP", { desc = "Paste over and don't copy" })

-- Find and replace current line = :s/find/replace
-- Find and replace all = :%s/find/replace

-- Better nav
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace all occurences of current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace all occurences of token" })

vim.keymap.set("v", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace all occurences of token" })



-- Grant executable permissions to current file
vim.keymap.set("n", "<leader>rr", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Grant exec permissions" })
