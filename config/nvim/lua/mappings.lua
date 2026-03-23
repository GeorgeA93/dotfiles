local map = vim.keymap.set

-- save
map("n", "<leader>w", ":w!<CR>", { desc = "Fast save" })

-- buffers
map("n", "<leader>bd", ":bd<CR>", { desc = "Close buffer" })
map("n", "<leader>ba", ":%bd<CR>", { desc = "Close all buffers" })
map("n", "<C-M>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<C-P>", ":bprev<CR>", { desc = "Prev buffer" })

-- scroll viewport faster
map("n", "<C-e>", "3<C-e>")
map("n", "<C-y>", "3<C-y>")

-- copy whole file
map("n", "<leader>ya", ":%y<CR>", { desc = "Yank whole file" })

-- resize panes
map("n", "<C-w>j", ":res +5<CR>")
map("n", "<C-w>k", ":res -5<CR>")
map("n", "<C-w>l", ":vertical resize +5<CR>")
map("n", "<C-w>h", ":vertical resize -5<CR>")

-- get off my lawn
map("n", "<Left>", ':echoe "Use H!"<CR>')
map("n", "<Right>", ':echoe "Use l!"<CR>')
map("n", "<Up>", ':echoe "Use k!"<CR>')
map("n", "<Down>", ':echoe "Use j!"<CR>')

-- upcase word
map("n", "<leader>u", "gUiw", { desc = "Uppercase word" })

-- telescope
map("n", "<leader>p", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", ";", "<cmd>Telescope buffers<CR>", { desc = "List buffers" })
map("n", "<leader>a", "<cmd>Telescope grep_string<CR>", { desc = "Grep word under cursor" })
map("n", "<leader>g", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })

-- file explorer
map("n", "<leader>f", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })
map("n", "<leader>v", "<cmd>NvimTreeFindFile<CR>", { desc = "Find file in tree" })

-- C# file settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 0
    vim.bo.expandtab = true
  end,
})

-- spelling
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "gitcommit", "text" },
  callback = function()
    vim.opt_local.spell = true
  end,
})
