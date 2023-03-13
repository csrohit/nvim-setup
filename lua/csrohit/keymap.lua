--File: lua/csrohit/keymap.lua

function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- mapping for normal mode
function nmap(lhs, rhs, opts)
    Map('n', lhs, rhs, opts)
end

-- mapping for visual mode
function vmap(lhs, rhs, opts)
    Map('v', lhs, rhs, opts)
end

-- set leader key
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

-- remove highlighted search results
nmap('<leader>nh',':nohlsearch<CR>')
nmap('<leader>e', ':NvimTreeToggle<CR>')

-- navigating between buffers
nmap('<TAB>', ':bn<CR>', {desc = 'Switch buffers'})
nmap('S-TAB', ':bp<CR>')

-- navigating between window splits
nmap('<C-h>', '<C-w>h', { desc = 'Left pane' })
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

-- toggle current split window maximize
nmap('<leader>sm', ':MaximizerToggle<CR>')

-- indentation
vmap('<', '<gv')
vmap('>', '>gv')

-- Telescope
local builtin = require('telescope.builtin')
nmap('<leader>ff', builtin.find_files, {})
nmap('<leader>fg', builtin.live_grep, {})
nmap('<leader>fb', builtin.buffers, {})
nmap('<leader>fh', builtin.help_tags, {})

-- telescope git commands (not on youtube nvim video)
nmap("<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
nmap("<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
nmap("<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
nmap("<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
nmap("<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
