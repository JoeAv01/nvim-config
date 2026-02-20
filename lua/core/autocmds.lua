-- 创建一个通用的自动命令组 ID
local my_augroup = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

-- 1. 文件类型检测后自动设置选项 (Markdown/Text 开启换行)
vim.api.nvim_create_autocmd("FileType", {
  group = my_augroup,
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

-- 2. 高亮复制的内容
-- 使用独立的组，避免干扰，且这里不需要重新定义 augroup 变量
local yank_group = vim.api.nvim_create_augroup('HighlightYank', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- 3. 进入缓冲区时自动跳转到上次编辑位置
vim.api.nvim_create_autocmd("BufReadPost", {
  group = my_augroup, 
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
