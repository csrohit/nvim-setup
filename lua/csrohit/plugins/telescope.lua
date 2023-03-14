--File: lua/csrohit/plugins/telescope.lua

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {
        'nvim-lua/plenary.nvim',
         {
             'nvim-telescope/telescope-fzf-native.nvim',
             build = 'make',
             cond = function ()
                return vim.fn.executable 'make' == 1
             end
         }
    },
    opts= {
        extensions = {
            fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        }
    },
    config = function()
        pcall(require('telescope').load_extension, 'fzf')

        local builtin = require('telescope.builtin')
        -- See `:help telescope.builtin`
        nmap('<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
        nmap('<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
        nmap('<leader>ff', builtin.find_files, {})
        nmap('<leader>fg', builtin.live_grep, {})
        nmap('<leader>fb', builtin.buffers, {})
        nmap('<leader>fd', builtin.diagnostics, {})
        nmap('<leader>fw', builtin.grep_string, {})
        nmap('<leader>fh', builtin.help_tags, {})

        -- telescope git commands (not on youtube nvim video)
        nmap("<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
        nmap("<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
        nmap("<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
        nmap("<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

        nmap('<leader>/', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })

    end

}
