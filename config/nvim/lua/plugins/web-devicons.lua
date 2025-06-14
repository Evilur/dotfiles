return {
    'nvim-tree/nvim-web-devicons',
    lazy = false,
    config = function()
        local git = {
            icon = '',
            color = '#f44c27',
            name = 'Git'
        }

        require('nvim-web-devicons').setup {
            override = { };

            override_by_filename = {
                ['.gitignore'] = git,
                ['.gitattributes'] = git,
            };

            override_by_extension = { };
        }
    end
}
