--File: lua/csrohit/plugins/telescope.lua

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'BurntSushi/ripgrep',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function ()
               return vim.fn.executable 'make' == 1
            end
        }
    },
    config = function()
        pcall(require('telescope').load_extension, 'fzf')
        -- See `:help telescope.builtin`
        nmap('<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
        nmap('<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
        nmap('<leader>/', function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })

    end

}
