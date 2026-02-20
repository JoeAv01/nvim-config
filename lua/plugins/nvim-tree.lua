-- 文件树
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- 禁用默认的 netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      view = { width = 30 },
      renderer = {
        icons = {
            glyphs = {
                folder = { arrow_closed = "➤", arrow_open = "▼" },
            },
        },
      },
      actions = {
        open_file = { quit_on_open = true }, -- 打开文件时自动关闭文件树
      },
    })

    -- 设置快捷键: Leader + e 打开/关闭文件树
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
  end,
}
