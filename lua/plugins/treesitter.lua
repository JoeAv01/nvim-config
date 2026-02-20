-- 语法高亮
return {
    "nvim-treesitter/nvim-treesitter",
    -- 使用 GitCode 镜像,因为GitHub克隆始终有问题
    url = "https://gitcode.com/gh_mirrors/nv/nvim-treesitter.git", 
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "vim", "python", "bash", "markdown", "javascript", "html", "css", "json", "yaml" },
            sync_install = false, 
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },

        })
    end,
}
