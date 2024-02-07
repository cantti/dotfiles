return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "nord",
        section_separators = "",
        component_separators = "",
      },
      tabline = {
        lualine_c = { { "filename", path = 3, file_status = true } },
        lualine_z = { "tabs" },
      },
    },
  },
}
