return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      pickers = {
        find_files = {
          find_command = {
            "fd", "--type", "f", "--hidden", "--exclude", ".git", "--exclude", "node_modules"
          }
        }
      }
    }
  }  
}
