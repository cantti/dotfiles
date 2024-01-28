return {
  { 
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = 'iceberg_dark',
        section_separators = '',
        component_separators = '',
      },
      tabline = {
        lualine_a = {'buffers'},
        lualine_z = {'tabs'}
      }
    }
  }
}