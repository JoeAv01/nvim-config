-- 设置主键位为 Space (空格)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true } -- 通用选项：不递归映射，静默执行

----------------------------------------------------------------------
--                             通用基础                             --
----------------------------------------------------------------------

-- 1. 快速退出插入模式
-- keymap.set("i", "jk", "<ESC>", { desc = "退出插入模式" })    不用这个是因为我交换了Capslock和ESC

-- 2. 保存与退出 (最常用)
keymap.set("n", "<leader>w", ":w<CR>", { desc = "保存文件" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "退出当前窗口" })
keymap.set("n", "<leader>Q", ":qa!<CR>", { desc = "强制退出所有" })

-- 3. 取消高亮 (搜索后按一下清静)
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "取消搜索高亮" })

-- 4. 更好的移动 (可视化模式下移动选中文本)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "向下移动一行" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "向上移动一行" })

-- 5. 窗口操作 (无需按 Ctrl-w)
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "垂直拆分窗口" }) -- Split Vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "水平拆分窗口" }) -- Split Horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "使窗口等宽等高" }) -- Split Equal
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "关闭当前分屏" }) -- Split Close

-- 6. 窗口导航 (Alt + hjkl, 需要终端支持 Alt 键发送)
-- 如果不行，可以用 <C-h/j/k/l>
keymap.set("n", "<C-h>", "<C-w>h", { desc = "焦点左移" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "焦点右移" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "焦点下移" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "焦点上移" })

-- 7.全选并复制到系统剪贴板
keymap.set("n", "<leader>y", "ggVG\"+y", { desc = "全选并复制到系统剪贴板" })

----------------------------------------------------------------------
--                             插件相关                             --
----------------------------------------------------------------------

-- 1. 文件树 (Nvim-tree)
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "打开/关闭文件树" })

-- 2. 模糊查找 (Telescope)
-- 使用函数包装，延迟加载，防止启动报错
keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { desc = "查找文件 (Find Files)" })
keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { desc = "全局搜索 (Grep)" })
keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { desc = "查找缓冲区 (Buffers)" })
keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, { desc = "查找帮助 (Help)" })
keymap.set('n', '<leader>fr', function() require('telescope.builtin').oldfiles() end, { desc = "查找最近文件 (Recent)" })

-- 3. 代码格式化 (LSP Format)
keymap.set("n", "<leader>cf", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "格式化代码" })

-- 4. 重命名符号 (方便)
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "重命名变量" })
