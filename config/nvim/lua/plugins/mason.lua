return {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
        { 'mason-org/mason.nvim', opts = {} },
    },
    opts = {
        automatic_enable = true,
        ensure_installed = {
            'bashls',
            'clangd',
            'cmake',
            'cssls',
            'docker_compose_language_service',
            'dockerls',
            'eslint',
            'html',
            'jdtls',
            'jsonls',
            'lemminx',
            'lua_ls',
            'marksman',
            'pyright',
            'ts_ls',
            'yamlls',
        }
    }
}
