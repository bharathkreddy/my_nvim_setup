return {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    opts = {
        bind = true,
        hint_enable = true,
        hint_prefix = "🔹 ",
        handler_opts = {
            border = "rounded",
        },
        floating_window = true,
        floating_window_above_cur_line = true,
        fix_pos = false,
        auto_close_after = nil,
        toggle_key = "<M-k>",         -- Toggle signature help
        select_signature_key = "<M-n>", -- Cycle through overloads
    },
}
