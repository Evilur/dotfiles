return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    branch = 'master',
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                'bash',
                'c',
                'cmake',
                'cpp',
                'c_sharp',
                'css',
                'desktop',
                'diff',
                'dockerfile',
                'gitattributes',
                'gitcommit',
                'git_config',
                'gitignore',
                'git_rebase',
                'go',
                'html',
                'java',
                'javadoc',
                'javascript',
                'jsdoc',
                'json',
                'make',
                'python',
                'qmljs',
                'ssh_config',
                'tmux',
                'typescript',
                'xml',
                'xresources',
                'yaml'
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true
            }
        }
    end
}
