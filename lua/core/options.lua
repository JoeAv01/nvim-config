local opt = vim.opt

-- 行号
opt.relativenumber = true -- 相对行号
opt.number = true         -- 显示当前行号

-- 缩进
opt.tabstop = 4           -- Tab 键宽度
opt.shiftwidth = 4        -- 自动缩进宽度
opt.expandtab = true      -- 将 Tab 转换为空格
opt.autoindent = true     -- 自动缩进

-- 其他
opt.wrap = false          -- 不自动换行
opt.ignorecase = true     -- 搜索忽略大小写
opt.smartcase = true      -- 如果包含大写字母则区分大小写
opt.cursorline = true     -- 高亮当前行
opt.termguicolors = true  -- 开启真彩色支持
opt.signcolumn = "yes"    -- 始终显示左侧图标列
vim.opt.mouse = "a"       -- 启用鼠标
opt.clipboard:append("unnamedplus") -- 使用系统剪贴板 (WSL需要安装 xclip 或类似工具，或者配置 win32yank)
opt.splitright = true     -- 垂直新窗口在右边
opt.splitbelow = true     -- 水平新窗口在下边

-- 专门针对 WSL 的剪贴板配置
-- 只要你在 WSL 里，用 y (yank) 复制的内容，就能直接在 Windows 里 Ctrl+V 粘贴
if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
        name = "win32yank-wsl",
        copy = {
            ["+"] = "win32yank.exe -i --crlf",
            ["*"] = "win32yank.exe -i --crlf",
        },
        paste = {
            ["+"] = "win32yank.exe -o --lf",
            ["*"] = "win32yank.exe -o --lf",
        },
        cache_enabled = 0,
    }
end
