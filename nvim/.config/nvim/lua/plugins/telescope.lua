return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            find_command = {
              "fd",
              "--type",
              "f",
              "--hidden",
              "--exclude",
              ".git",
              "--exclude",
              "node_modules",
            },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_ivy({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
}
