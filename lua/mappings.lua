require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

--Telescope
map("n", "<leader>o", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" })

--LSP
map("n", "<leader>p", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "LSP Go to definition" })

--Gitsigns
map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Gitsigns current line blame" })
