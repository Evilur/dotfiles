return {
    'Civitasv/cmake-tools.nvim',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('cmake-tools').setup {
            cmake_command = 'cmake',
            cmake_build_directory = 'build',
            cmake_build_type = 'Debug',
            cmake_generate_options = {},
            cmake_build_options = {},
            cmake_console_size = 10,
            cmake_console_position = 'belowright'
        }
    end,
}
