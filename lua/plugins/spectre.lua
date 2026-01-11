return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>sr", function() require("spectre").toggle() end, desc = "Search & Replace" },
    { "<leader>sw", function() require("spectre").open_visual({ select_word = true }) end, desc = "Search Current Word" },
  },
}
