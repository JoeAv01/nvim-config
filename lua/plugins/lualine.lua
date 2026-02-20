-- 状态栏
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- 需要安装 Nerd Fonts 字体
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight", 
      },
    })
  end,
}
