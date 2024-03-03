-- telescope.nvim
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files)
vim.keymap.set("n", "<leader>fg", telescope.live_grep)
vim.keymap.set("n", "<leader>fb", telescope.buffers)
vim.keymap.set("n", "<leader>fh", telescope.help_tags)
vim.keymap.set("n", "<leader>fd", telescope.diagnostics)
vim.keymap.set("n", "<C-p>", telescope.find_files) -- vscode like
vim.keymap.set("n", "<C-f>", telescope.live_grep) -- vscode lile

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
vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder)
vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder)
vim.keymap.set("n", "<leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end)
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", telescope.lsp_definitions)
vim.keymap.set("n", "gr", telescope.lsp_references)
vim.keymap.set("n", "gi", telescope.lsp_implementations)
