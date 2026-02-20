-- Git
return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup({
            -- 1. 自定义图标 (看起来更现代)
            signs = {
                add          = { text = '│' },
                change       = { text = '│' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            
            -- 2. 设置快捷键 (这是灵魂所在)
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
                end

                -- 导航 (跳到修改处)
                map("n", "]h", gs.next_hunk, "Next Hunk (下一个修改点)")
                map("n", "[h", gs.prev_hunk, "Prev Hunk (上一个修改点)")

                -- 常用操作 (Leader + h 开头表示 Git 相关)
                map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk (暂存当前块)")
                map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk (重置当前块)")
                map("v", "<leader>hs", function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, "Stage Hunk (Visual)")
                map("v", "<leader>hr", function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end, "Reset Hunk (Visual)")
                
                map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer (暂存整个文件)")
                map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk (撤销暂存)")
                map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer (重置整个文件)")
                
                map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk (预览修改)")
                
                map("n", "<leader>hb", function() gs.blame_line{full=true} end, "Blame Line (查看详细 Blame)")
                map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle Blame (开关行内 Blame)")
                
                map("n", "<leader>hd", gs.diffthis, "Diff This (与暂存区对比)")
                map("n", "<leader>hD", function() gs.diffthis("~") end, "Diff This ~ (与上一次提交对比)")
                
                -- 文本对象 (方便操作，例如 'yh' 复制一个改动块)
                map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', "Select Hunk")
            end
        })
    end,
}
