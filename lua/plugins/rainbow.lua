-- 彩虹括号
return {
  "HiPhish/rainbow-delimiters.nvim",
  -- 这个插件通常开箱即用，不需要特别的 config 函数
  -- 但如果你想自定义颜色，可以在这里加
  config = function()
    -- 这里不需要 require('rainbow-delimiters.setup')，因为它自动加载
    local rainbow_delimiters = require('rainbow-delimiters')
    
    vim.g.rainbow_delimiters = {
        strategy = {
            [''] = rainbow_delimiters.strategy['global'],
            vim = rainbow_delimiters.strategy['local'],
        },
        query = {
            [''] = 'rainbow-delimiters',
            lua = 'rainbow-blocks',
        },
        highlight = {
            'RainbowDelimiterRed',
            'RainbowDelimiterYellow',
            'RainbowDelimiterBlue',
            'RainbowDelimiterOrange',
            'RainbowDelimiterGreen',
            'RainbowDelimiterViolet',
            'RainbowDelimiterCyan',
        },
    }
  end,
}
