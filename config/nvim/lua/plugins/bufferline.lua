return {
    'akinsho/bufferline.nvim',
    lazy = false,
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        -- Get the colors --
        local mantle = {
            attribute = 'bg',
            highlight = 'Pmenu'
        }
        local crust = {
            attribute = 'bg',
            highlight = 'PmenuThumb'
        }

        -- Apply the config --
        local bufferline = require('bufferline')
        bufferline.setup {
            options = {
                hover = { enabled = true },
                style_preset = {
                    bufferline.style_preset.no_italic,
                    bufferline.style_preset.no_bold,
                },
                separator_style = 'thin',
                left_mouse_command = nil,
                right_mouse_command = nil,
                middle_mouse_command = nil,
                buffer_close_icon = '',
                close_icon = '',
                modified_icon = '●',
                close_command = 'Bdelete %d',
            }
        }
    end
}
