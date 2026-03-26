-- 语法高亮
return {
    "nvim-treesitter/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter.git",
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
