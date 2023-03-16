--File: lua/csrohit/keymap.lua

function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- mapping for normal mode
function Nmap(lhs, rhs, opts)
    Map('n', lhs, rhs, opts)
end

-- mapping for visual mode
function Vmap(lhs, rhs, opts)
    Map('v', lhs, rhs, opts)
end

-- set leader key
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

-- remove highlighted search results
Nmap('<leader>nh',':nohlsearch<CR>', { desc = '[NH] Disable search highlights'})
Nmap('<leader>e', ':NvimTreeToggle<CR>', { desc = '[E] Toggle file manager' })

-- navigating between buffers
Nmap('<TAB>', ':bn<CR>', { desc = 'Next buffer' })
Nmap('S-TAB', ':bp<CR>', { desc = 'Previous buffer' })

-- navigating between window splits
Nmap('<C-h>', '<C-w>h', { desc = 'Left pane' })
Nmap('<C-j>', '<C-w>j', { desc = 'Bottom pane' })
Nmap('<C-k>', '<C-w>k', { desc = 'Top pane' })
Nmap('<C-l>', '<C-w>l', { desc = 'Right pane' })

-- toggle current split window maximize
Nmap('<leader>tm', ':MaximizerToggle<CR>', { desc = '[TM] Toggle maximize current buffer' })

-- indentation
Vmap('<', '<gv')
Vmap('>', '>gv')

-- restart lsp server (not on youtube nvim video)
Nmap("<leader>rs", ":LspRestart<CR>", { desc = '[R] Restart LSP server' }) -- mapping to restart lsp if necessary
