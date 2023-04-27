---@module keymap
---@author Rohit Nimkar
---@license The GPLv3 License (GPLv3)
--File: lua/csrohit/keymap.lua

--[[
The GPLv3 License (GPLv3)

Copyright (c) 2023 Rohit Nimkar

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- mapping for normal mode
function Nmap(lhs, rhs, opts)
	Map("n", lhs, rhs, opts)
end

-- mapping for visual mode
function Vmap(lhs, rhs, opts)
	Map("v", lhs, rhs, opts)
end

-- set leader key
vim.g.mapleader = " "
vim.g.localmapleader = " "

-- remove highlighted search results
Nmap("<leader>nh", ":nohlsearch<CR>", { desc = "[NH] Disable search highlights" })
Nmap("<leader>e", ":NvimTreeToggle<CR>", { desc = "[E] Toggle file manager" })

-- navigating between buffers
Nmap("<TAB>", ":bn<CR>", { desc = "Next buffer" })
Nmap("<S-TAB>", ":bp<CR>", { desc = "Previous buffer" })
Nmap("<leader>bd", ":bd<CR>", { desc = "Close current buffer" })

-- navigating between window splits
Nmap("<C-h>", "<C-\\><C-N><C-w>h", { desc = "Left pane" })
Nmap("<C-j>", "<C-\\><C-N><C-w>j", { desc = "Bottom pane" })
Nmap("<C-k>", "<C-\\><C-N><C-w>k", { desc = "Top pane" })
Nmap("<C-l>", "<C-\\><C-N><C-w>l", { desc = "Right pane" })

-- toggle current split window maximize
Nmap("<leader>tm", ":MaximizerToggle<CR>", { desc = "[TM] Toggle maximize current buffer" })

-- indentation
Vmap("<", "<gv")
Vmap(">", ">gv")

Nmap("<A-k>", ":m -2<CR>", { desc = "Move line up" })
Nmap("<A-j>", ":m +1<CR>", { desc = "Move line down" })

-- restart lsp server (not on youtube nvim video)
Nmap("<leader>rs", ":LspRestart<CR>", { desc = "[R] Restart LSP server" }) -- mapping to restart lsp if necessary
-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
Nmap("gh", "<cmd>Lspsaga lsp_finder<CR>", { desc = "LspSaga finder" })

-- Code action
Map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "LspSaga Code Action" })

-- Rename all occurrences of the hovered word for the entire file
Nmap("gr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
Nmap("gr", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
Nmap("gd", "<cmd>Lspsaga peek_definition<CR>")

-- Go to definition
Nmap("<leader>gd", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
Nmap("gt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Go to type definition
Nmap("<leader>gt", "<cmd>Lspsaga goto_type_definition<CR>")

-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
Nmap("<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show cursor diagnostics
-- Like show_line_diagnostics, it supports passing the ++unfocus argument
Nmap("<leader>dc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Show buffer diagnostics
Nmap("<leader>db", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
Nmap("[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
Nmap("]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
Nmap("[D", function()
	require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
Nmap("]D", function()
	require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
Nmap("<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
Nmap("K", "<cmd>Lspsaga hover_doc<CR>")

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
-- Nmap("K", "<cmd>Lspsaga hover_doc ++keep<CR>")

-- Call hierarchy
Nmap("<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
Nmap("<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
Map({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")

--terminal
Nmap("<C-`>", ":vsplit term://zsh<CR>", { desc = "Open terminal" })
Map("t", "<ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
Nmap("<leader>ng", "<cmd>Neogen<CR>", { desc = "Exit terminal mode" })
