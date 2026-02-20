-- 0. 屏蔽 nvim-lspconfig 的特定版本警告
local old_notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("nvim%-lspconfig support for Nvim 0.10 or older is deprecated") then
        return
    end
    old_notify(msg, ...)
end

-- 1. 加载核心配置
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- 2. 安装 Lazy.nvim 插件管理器
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 3. 加载插件
-- 这里告诉 lazy.nvim 自动导入 lua/plugins 目录下的所有模块
require("lazy").setup("plugins")
