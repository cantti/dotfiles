-- telescope.nvim
local tl = require("telescope.builtin")
local function tlth(telescope_command)
  return function()
    telescope_command(require("telescope.themes").get_ivy())
  end
end
vim.keymap.set("n", "<leader>ff", tlth(tl.find_files))
vim.keymap.set("n", "<leader>fg", tlth(tl.live_grep))
vim.keymap.set("n", "<leader>fb", tlth(tl.buffers))
vim.keymap.set("n", "<leader>fh", tlth(tl.help_tags))
vim.keymap.set("n", "<leader>fd", tlth(tl.diagnostics))
vim.keymap.set("n", "<leader>ft", tlth(tl.treesitter))

-- clipboard
vim.keymap.set({ "n", "v" }, "\\", '"_')
vim.keymap.set("v", "p", "P")

-- nav between buffers
vim.keymap.set("n", "gt", ":bnext<CR>")
vim.keymap.set("n", "gT", ":bprev<CR>")

-- comment
vim.keymap.set({ "n", "v" }, "<leader>cc", "<plug>NERDCommenterComment")
vim.keymap.set({ "n", "v" }, "<leader>cu", "<plug>NERDCommenterUncomment")

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
vim.keymap.set("n", "gd", tlth(tl.lsp_definitions))
vim.keymap.set("n", "gr", tlth(tl.lsp_references))
vim.keymap.set("n", "gi", tlth(tl.lsp_implementations))
