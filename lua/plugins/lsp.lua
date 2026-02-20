-- LSP
return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        -- "williamboman/mason-lspconfig.nvim", -- <--- 彻底删掉这个坏家伙！
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        -- 1. 初始化 Mason (只负责下载工具，不做配置)
        require("mason").setup()

        -- 2. 直接手动配置 LSP (不依赖中间件)
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- 通用设置 (快捷键等)
        local on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, silent = true }
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)       -- 查看文档悬停
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        end

        -- 手动列出所有需要启动的服务器
        local servers = { "lua_ls", "pyright", "clangd", "bashls", "html", "cssls", "ts_ls" }
        
        for _, server in ipairs(servers) do
            local opts = {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            
            if server == "lua_ls" then
                opts.settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    }
                }
            end

            -- 尝试启动服务器
            -- 注意：如果没有安装某些服务器，lspconfig 不会报错，只是不起作用
            lspconfig[server].setup(opts)
        end
    end,
}
