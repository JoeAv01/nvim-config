-- 键位提示
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function() -- 注意：新版通常不需要显式调用 setup，但为了保险起见保留
    local wk = require("which-key")
    wk.setup({
      -- 这里放你的插件自身配置，比如窗口样式等
      -- 注意：新版 options 结构也有微调，尽量保持默认
    })
    
    -- 新版注册映射的方式：使用 wk.add()
    wk.add({
      -- 1. 普通模式下的映射组 (Group)
      { "<leader>b", group = "Buffer (缓冲区)" },
      { "<leader>c", group = "Code (代码操作)" },
      { "<leader>f", group = "File/Find (文件/查找)" },
      { "<leader>g", group = "Git (版本控制)" },
      { "<leader>h", group = "Git Signs (Git操作)" },
      { "<leader>l", group = "LSP (语言服务)" },
      { "<leader>s", group = "Search (搜索)" },
      { "<leader>t", group = "Test/Terminal (测试/终端)" },
      { "<leader>w", group = "Window (窗口操作)" },
      
      -- 2. 甚至可以直接在这里定义具体的键位 (虽然通常建议在 keymaps.lua 里写)
      -- { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
   
      -- 3. 定义跳转前缀
      { "g", group = "Goto (跳转)" },
    })
  end,
}
