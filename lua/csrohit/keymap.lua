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
nmap('<leader>nh',':nohlsearch<CR>', { desc = '[NH] Disable search highlights'}) 
nmap('<leader>e', ':NvimTreeToggle<CR>', { desc = '[E] Toggle file manager' })

-- navigating between buffers
nmap('<TAB>', ':bn<CR>', { desc = 'Next buffer' })
nmap('S-TAB', ':bp<CR>', { desc = 'Previous buffer' })

-- navigating between window splits
nmap('<C-h>', '<C-w>h', { desc = 'Left pane' })
nmap('<C-j>', '<C-w>j', { desc = 'Bottom pane' })
nmap('<C-k>', '<C-w>k', { desc = 'Top pane' })
nmap('<C-l>', '<C-w>l', { desc = 'Right pane' })

-- toggle current split window maximize
nmap('<leader>tm', ':MaximizerToggle<CR>', { desc = '[TM] Toggle maximize current buffer' })

-- indentation
vmap('<', '<gv')
vmap('>', '>gv')

-- restart lsp server (not on youtube nvim video)
nmap("<leader>rs", ":LspRestart<CR>", { desc = '[R] Restart LSP server' }) -- mapping to restart lsp if necessary
