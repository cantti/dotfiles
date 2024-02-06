-- leader space
vim.g.mapleader = " "

-- telescope.nvim
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>") -- vscode like
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<C-f>", ":Telescope live_grep<CR>") -- vscode lile
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")

-- clipboard
vim.keymap.set({ "n", "v" }, "\\", '"_')
vim.keymap.set("v", "p", "P")

-- nav between buffers
vim.keymap.set("n", "gt", ":bnext<CR>")
vim.keymap.set("n", "gT", ":bprev<CR>")

-- Ctrl+/ to comment
vim.keymap.set({ "n", "v" }, "<C-_>", "<Plug>NERDCommenterToggle")
vim.keymap.set("i", "<C-_>", "<Esc><Plug>NERDCommenterTogglei")

-- Ctrl + A to select all
vim.keymap.set("n", "<C-a>", "ggVG")

-- Indentation
vim.keymap.set("n", "<leader>t4", ":set shiftwidth=4 tabstop=4<CR>")
vim.keymap.set("n", "<leader>t2", ":set shiftwidth=2 tabstop=2<CR>")

-- shift tab to de-indent
vim.keymap.set("i", "<S-Tab>", "<C-d>")
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")
vim.keymap.set("n", "<Tab>", ">>")
vim.keymap.set("n", "<S-Tab>", "<<")

-- remap ^ and $
vim.keymap.set({ "n", "v", "o" }, "H", "^")
vim.keymap.set({ "n", "v", "o" }, "L", "$")

-- netrw
vim.keymap.set("n", "<leader>e", ":Ex<cr>")

-- formatter
vim.keymap.set("n", "<leader>fm", ":Format<cr>")

-- lsp
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder)
vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder)
vim.keymap.set("n", "<leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end)
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end)

-- trouble
vim.keymap.set("n", "<leader>xx", function()
  require("trouble").toggle()
end)
vim.keymap.set("n", "<leader>xw", function()
  require("trouble").toggle("workspace_diagnostics")
end)
vim.keymap.set("n", "<leader>xd", function()
  require("trouble").toggle("document_diagnostics")
end)
vim.keymap.set("n", "<leader>xq", function()
  require("trouble").toggle("quickfix")
end)
vim.keymap.set("n", "<leader>xl", function()
  require("trouble").toggle("loclist")
end)
vim.keymap.set("n", "gr", function()
  require("trouble").toggle("lsp_references")
end)
