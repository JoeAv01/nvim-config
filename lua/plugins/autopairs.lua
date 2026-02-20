-- 括号补全
return {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- 进入插入模式时才加载 (极快启动)
    dependencies = { "hrsh7th/nvim-cmp" }, -- 需要和 cmp 联动
    config = function()
        -- 1. 基础配置
        require("nvim-autopairs").setup({
            check_ts = true, -- 开启 Treesitter 支持
            ts_config = {
                lua = { "string" }, -- 在 lua 的字符串里不自动配对
                javascript = { "template_string" }, -- 在 JS 模板字符串里不配对
                java = false, -- 在 java 中不使用 treesitter 检查
            },
            disable_filetype = { "TelescopePrompt", "vim" }, -- 在这些文件里禁用
            fast_wrap = {
                map = "<M-e>", -- Alt + e 快速包裹现有代码
                chars = { "{", "[", "(", '"', "'" },
                pattern = [=[[%'%"%)%>%]%)%}%,]]=],
                end_key = "$",
                keys = "qwertyuiopzxcvbnm",
                check_comma = true,
                highlight = "Search",
                highlight_grey = "Comment"
            },
        })
  
        -- 2. 与 nvim-cmp 集成 (关键步骤！)          
        -- 如果之前配置了 cmp，这里可以让补全函数时自动加括号
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}      
