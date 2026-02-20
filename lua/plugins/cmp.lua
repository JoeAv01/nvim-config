-- 代码补全
return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- 进入插入模式才加载
    dependencies = {
        "hrsh7th/cmp-buffer",           -- 当前文件内容补全
        "hrsh7th/cmp-path",             -- 文件路径补全
        "L3MON4D3/LuaSnip",             -- 代码片段引擎
        "saadparwaiz1/cmp_luasnip",     -- 关联 snippets
        "rafamadriz/friendly-snippets", -- 常用代码片段库 (VSCode风格)
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- 加载 VSCode 风格的代码片段
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            snippet = { -- 必填，告诉 cmp 如何展开代码片段
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- 上一个建议
                ["<C-j>"] = cmp.mapping.select_next_item(), -- 下一个建议
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(), -- 手动触发补全
                ["<C-e>"] = cmp.mapping.abort(),        -- 关闭补全
                ["<CR>"] = cmp.mapping.confirm({ select = false }), -- 回车确认 (设为 false 防止误触)
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- LSP 来源优先 (智能提示)
                { name = "luasnip" },  -- 代码片段
                { name = "buffer" },   -- 当前文件单词
                { name = "path" },     -- 文件路径
            }),
        })
    end,
}
