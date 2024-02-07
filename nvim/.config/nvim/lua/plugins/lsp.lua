-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
return {
  -- Collection of configurations for built-in LSP client
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({})
      lspconfig.lua_ls.setup({})

      -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local servers = { "tsserver", "lua_ls" }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
        })
      end
    end,
  },
}
