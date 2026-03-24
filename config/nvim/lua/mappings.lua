local map = vim.keymap.set

-- save
map("n", "<leader>w", ":w!<CR>", { desc = "Fast save" })

-- buffers
map("n", "<leader>bd", "<cmd>Bdelete<CR>", { desc = "Close buffer (keep window)" })
map("n", "<leader>ba", "<cmd>bufdo Bdelete<CR>", { desc = "Close all buffers" })
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

-- fzf (same commands as vimrc)
map("n", "<leader>p", "<cmd>Files<CR>", { desc = "Find files" })
map("n", ";", "<cmd>Buffers<CR>", { desc = "List buffers" })
map("n", "<leader>a", ":Ag <C-r><C-w><CR>", { desc = "Grep word under cursor" })
map("n", "<leader>g", "<cmd>Rg<CR>", { desc = "Live grep" })

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

-- command-line path expansions (from vimrc)
map("c", "%%", "<C-R>=fnameescape(expand('%:h')).'/'<CR>", { desc = "Expand to current dir" })
map("c", "%f", "<C-R>=fnameescape(expand('%:t'))<CR>", { desc = "Expand to filename" })
map("c", "%a", "<C-R>=fnameescape(expand('%:p'))<CR>", { desc = "Expand to full path" })

-- alternate file (uses 'alt' command like vimrc)
map("n", "<leader>t", function()
  local alt = vim.fn.system("alt " .. vim.fn.expand "%")
  if alt ~= "" then
    vim.cmd("e " .. vim.fn.fnameescape(alt:gsub("\n", "")))
  else
    print("No alternate file for " .. vim.fn.expand "%")
  end
end, { desc = "Open alternate file" })

-- edit macro register
map("n", "<leader>em", function()
  local reg = vim.fn.input "Register to edit: "
  if reg ~= "" then
    vim.cmd('let @' .. reg .. "=input('Macro: ', @" .. reg .. ")")
  end
end, { desc = "Edit macro register" })

-- spelling
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "gitcommit", "text" },
  callback = function()
    vim.opt_local.spell = true
  end,
})
