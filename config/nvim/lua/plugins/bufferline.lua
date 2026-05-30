return {
    'akinsho/bufferline.nvim',
    lazy = false,
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local bufferline = require('bufferline')
        local c = {
            mantle  = '#1e2030',
            grey_15 = '#3d4262',
            text    = '#f4f2fd',
            red     = '#ff4064'
        }
        bufferline.setup {
            options = {
                hover = { enabled = false },
                style_preset = 'minimal',
                separator_style = 'thin',
                left_mouse_command = nil,
                right_mouse_command = nil,
                middle_mouse_command = nil,
                buffer_close_icon = '',
                close_icon = '',
                modified_icon = '●',
                close_command = 'Bdelete %d',
            },
            highlights = {
                fill = {
                    fg = c.text,
                    bg = c.mantle
                },
                background = {
                    fg = c.text,
                    bg = c.mantle
                },
                tab = {
                    fg = c.text,
                    bg = c.mantle
                },
                tab_selected = {
                    fg = c.text,
                    bg = c.mantle
                },
                tab_separator = {
                    fg = c.text,
                    bg = c.mantle
                },
                tab_separator_selected = {
                    fg = c.text,
                    bg = c.mantle
                },
                tab_close = {
                    fg = c.text,
                    bg = c.mantle
                },
                close_button = {
                    fg = c.text,
                    bg = c.mantle
                },
                close_button_visible = {
                    fg = c.text,
                    bg = c.mantle
                },
                close_button_selected = {
                    fg = c.text,
                    bg = c.mantle
                },
                buffer_visible = {
                    fg = c.text,
                    bg = c.mantle
                },
                buffer_selected = {
                    fg = c.text,
                    bg = c.mantle,
                    underline = true,
                    sp = c.red,
                    bold = true,
                    italic = true,
                },
                numbers = {
                    fg = c.text,
                    bg = c.mantle
                },
                numbers_visible = {
                    fg = c.text,
                    bg = c.mantle
                },
                numbers_selected = {
                    fg = c.text,
                    bg = c.mantle
                },
                diagnostic = {
                    fg = c.text,
                    bg = c.mantle
                },
                diagnostic_visible = {
                    fg = c.text,
                    bg = c.mantle
                },
                diagnostic_selected = {
                    fg = c.text,
                    bg = c.mantle
                },
                hint = {
                    fg = c.text,
                    bg = c.mantle
                },
                hint_visible = {
                    fg = c.text,
                    bg = c.mantle
                },
                hint_selected = {
                    fg = c.text,
                    bg = c.mantle
                },
                hint_diagnostic = {
                    fg = c.text,
                    bg = c.mantle
                },
                hint_diagnostic_visible = {
                    fg = c.text,
                    bg = c.mantle
                },
                hint_diagnostic_selected = {
                    fg = c.text,
                    bg = c.mantle
                },
                info = {
                    fg = c.text,
                    bg = c.mantle
                },
                info_visible = {
                    fg = c.text,
                    bg = c.mantle
                },
                info_selected = {
                    fg = c.text,
                    bg = c.mantle
                },
                info_diagnostic = {
                    fg = c.text,
                    bg = c.mantle
                },
                info_diagnostic_visible = {
                    fg = c.text,
                    bg = c.mantle
                },
                info_diagnostic_selected = {
                    fg = c.text,
                    bg = c.mantle
                },
                warning = {
                    fg = c.text,
                    bg = c.mantle
                },
                warning_visible = {
                    fg = c.text,
                    bg = c.mantle
                },
                warning_selected = {
                    fg = c.text,
                    bg = c.mantle
                },
                warning_diagnostic = {
                    fg = c.text,
                    bg = c.mantle
                },
                warning_diagnostic_visible = {
                    fg = c.text,
                    bg = c.mantle
                },
                warning_diagnostic_selected = {
                    fg = c.text,
                    bg = c.mantle
                },
                error = {
                    fg = c.text,
                    bg = c.mantle
                },
                error_visible = {
                    fg = c.text,
                    bg = c.mantle
                },
                error_selected = {
                    fg = c.text,
                    bg = c.mantle
                },
                error_diagnostic = {
                    fg = c.text,
                    bg = c.mantle
                },
                error_diagnostic_visible = {
                    fg = c.text,
                    bg = c.mantle
                },
                error_diagnostic_selected = {
                    fg = c.text,
                    bg = c.mantle
                },
                modified = {
                    fg = c.text,
                    bg = c.mantle
                },
                modified_visible = {
                    fg = c.text,
                    bg = c.mantle
                },
                modified_selected = {
                    fg = c.text,
                    bg = c.mantle
                },
                duplicate_selected = {
                    fg = c.text,
                    bg = c.mantle
                },
                duplicate_visible = {
                    fg = c.text,
                    bg = c.mantle
                },
                duplicate = {
                    fg = c.text,
                    bg = c.mantle
                },
                separator_selected = {
                    fg = c.mantle,
                    bg = c.mantle
                },
                separator_visible = {
                    fg = c.mantle,
                    bg = c.mantle
                },
                separator = {
                    fg = c.mantle,
                    bg = c.mantle
                },
                indicator_visible = {
                    fg = c.mantle,
                    bg = c.mantle
                },
                indicator_selected = {
                    fg = c.mantle,
                    bg = c.mantle
                },
                pick_selected = {
                    fg = c.mantle,
                    bg = c.mantle
                },
                pick_visible = {
                    fg = c.mantle,
                    bg = c.mantle
                },
                pick = {
                    fg = c.mantle,
                    bg = c.mantle
                },
                offset_separator = {
                    fg = c.mantle,
                    bg = c.mantle
                },
                trunc_marker = {
                    fg = c.mantle,
                    bg = c.mantle
                }
            }
        }
    end
}
