return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup({
            disable_in_macro = false,
            disable_in_visualblock = false,
            disable_in_replace_mode = true,
            enable_afterquote = true,
            enable_check_bracket_line = true,
            enable_bracket_in_quote = true,
            break_undo = true,
            check_ts = true,
            map_cr = true,
            map_bs = true,
            map_c_h = true,
            map_c_w = true,
        })
    end
}
