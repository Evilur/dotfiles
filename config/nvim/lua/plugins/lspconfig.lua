return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'mason-org/mason.nvim',
        'mason-org/mason-lspconfig.nvim',
        'hrsh7th/nvim-cmp'
    },
    config = function()
        vim.lsp.config('omnisharp_mono', {
            cmd = { 'mono',
                    '/home/evilur/.local/share/nvim/mason/packages/omnisharp-mono/omnisharp/OmniSharp.exe',
                    '--languageserver', '--hostPID', tostring(pid) },
        })
    end
}
