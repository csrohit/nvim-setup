--File: lua/csrohit/plugins/git-signs.lua
return {
    'lewis6991/gitsigns.nvim',
    config = function()
        -- add configuration after loading
        local gs = require('gitsigns')
        gs.setup {
            signs = {
                add          = { text = '+' },
                change       = { text = '~' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                interval = 1000,
                follow_files = true
            },
            attach_to_untracked = true,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000, -- Disable if file is longer than this (in lines)
            preview_config = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
            yadm = {
                enable = false
            },
        }
        Map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
        Map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')

        Nmap('<leader>hS', gs.stage_buffer)
        Nmap('<leader>ha', gs.stage_hunk)
        Nmap('<leader>hu', gs.undo_stage_hunk)
        Nmap('<leader>hR', gs.reset_buffer)
        Nmap('<leader>hp', gs.preview_hunk)
        Nmap('<leader>hb', function() gs.blame_line{full=true} end)
        Nmap('<leader>tb', gs.toggle_current_line_blame)
        Nmap('<leader>hd', gs.diffthis)
        Nmap('<leader>hD', function() gs.diffthis('~') end)
        Nmap('<leader>td', gs.toggle_deleted)

        -- Text object
        Map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}
