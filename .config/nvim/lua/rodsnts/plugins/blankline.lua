return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",

  config = function()
    require("ibl").setup({
      indent = {
        char = { "│" },
        tab_char = "│"
      },
      scope = { show_start = false, show_end = false }
    })
  end
}
