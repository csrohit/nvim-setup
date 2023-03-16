--File: lua/csrohit/plugins/lspsaga.lua

return {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
        local saga = require('lspsaga')
        saga.setup({})

    end,
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        --Please make sure you install markdown and markdown_inline parser
        { "nvim-treesitter/nvim-treesitter" }
    }
}
