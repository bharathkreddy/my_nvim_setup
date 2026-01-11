return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "Issafalcon/neotest-dotnet", -- C# / .NET
    "nvim-neotest/neotest-python", -- Python
  },
  keys = {
    { "<leader>tt", function() require("neotest").run.run() end, desc = "Run Nearest Test" },
    { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File Tests" },
    { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Test Summary" },
    { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Test Output" },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-dotnet"),
        require("neotest-python"),
      },
    })
  end,
}
