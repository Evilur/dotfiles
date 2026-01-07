local template_dir = '~/.config/nvim/templates/'
local templates = {
    h = 'header.h',
    cpp = 'source.cpp'
}

local author = 'Evilur'
local email = 'the.evilur@gmail.com'

vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
    callback = function()
        -- If the file is not empty, exit the function --
        if vim.fn.line('$') ~= 1 or vim.fn.getline(1) ~= '' then
            return
        end

        -- Get the template (if exists) --
        local template = templates[vim.fn.expand('%:e')]
        if not template then return end

        -- Read the template to the current buffer --
        vim.cmd('0r ' .. template_dir .. vim.fn.expand(template))

        -- Replace placeholders --
        local replace = function(substr, replacable)
            vim.cmd('%s/' .. substr .. '/' .. replacable .. '/ge')
        end
        replace('{{author}}', author)
        replace('{{email}}', email)

        -- Replace file name placeholders --
        local function to_camel_case(str)
            str = str:gsub('[^%w]+', ' ')
            str = str:gsub('(%a)(%w*)', function(first, rest)
                return first:upper() .. rest:lower()
            end)
            str = str:gsub('%s+', '')
            return str
        end
        local filename = vim.fn.expand("%:t:r")
        replace('{{filename}}', filename)
        replace('{{filename_camel_case}}', to_camel_case(filename))

        -- Go to the {{cursor}} marker and remove it --
        vim.fn.search('{{sursor}}')
        replace('{{cursor}}', '')
    end,
})
