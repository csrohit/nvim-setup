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

