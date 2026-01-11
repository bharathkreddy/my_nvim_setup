return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Git Diff View" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File Git History" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Repo Git History" },
  },
  opts = {},
}
