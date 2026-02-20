-- tokyonight 主题
return {
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- 确保最先加载
    config = function()
      -- 加载主题
      vim.cmd([[colorscheme tokyonight]])
    end,
  }
}
