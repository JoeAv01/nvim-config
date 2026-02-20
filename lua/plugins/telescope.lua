-- 模糊查找
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { 
    "nvim-lua/plenary.nvim", 
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } -- 提升搜索速度
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- 上移
            ["<C-j>"] = actions.move_selection_next,     -- 下移
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    -- 快捷键设置
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- 找文件
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})  -- 全局搜索文字
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})    -- 找打开的缓冲区
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})  -- 找帮助文档
  end,
}
