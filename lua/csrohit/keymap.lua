--File: lua/csrohit/keymap.lua

function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

function nmap(lhs, rhs, opts)
    Map('n', lhs, rhs, opts)
end

function vmap(lhs, rhs, opts)
    Map('v', lhs, rhs, opts)
end
-- set leader key
vim.g.mapleader = ' '

-- remove highlighted search results
nmap('<leader>nh',':nohlsearch<CR>')
nmap('<leader>e', ':NvimTreeToggle<CR>')


-- navigating between window splits
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

-- indentation
vmap('<', '<gv')
vmap('>', '>gv')

