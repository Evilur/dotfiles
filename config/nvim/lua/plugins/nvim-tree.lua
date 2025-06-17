return {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("nvim-tree").setup({
            view = { width = 25 },
            filters = {
                custom = { "^.git$" }
            }
        })
    end
}
