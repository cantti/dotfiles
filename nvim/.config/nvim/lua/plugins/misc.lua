return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = function()
      local highlight = {
        "CursorColumn",
        "Whitespace",
      }
      return {
        indent = { highlight = highlight, char = "" },
        whitespace = {
          highlight = highlight,
          remove_blankline_trail = false,
        },
        scope = { enabled = false },
      }
    end,
  },
  -- automatically highlighting other uses of the word under the cursor
  { "RRethy/vim-illuminate" },
}
