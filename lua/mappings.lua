require "nvchad.mappings"

local map = vim.keymap.set

map("n", "<C-J>", ":m .+1<CR>==")
map("n", "<C-K>", ":m .-2<CR>==")
map("v", "<C-J>", ":m '>+1<CR>gv=gv")
map("v", "<K>", ":m '<-2<CR>gv=gv")

--visual whitespace
-- map("n", "<leader>w", '<cmd> lua require("visual-whitespace").toggle() <CR>', { desc = "Toggle visual whitespace" })

--Taiwind
map("n", "<leader>tf", "<cmd>TailwindFoldToggle<CR>", { desc = "Toggle taiwind fold" })

--Telescope
map("n", "<leader>o", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" })

--LSP
map("n", "<leader>p", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "LSP Go to definition" })

--Gitsigns
map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Gitsigns current line blame" })

--Multi Select
map("n", "<leader>s", "<Plug>(VM-Select-All)<Tab>", { desc = "Select All" })
map("n", "<leader>mr", "<Plug>(VM-Start-Regex-Search)", { desc = "Start Regex Search" })
map("n", "<leader>mp", "<Plug>(VM-Add-Cursor-At-Pos)", { desc = "Add Cursor At Pos" })
map("n", "<leader>mo", "<Plug>(VM-Toggle-Mappings)", { desc = "Toggle Mapping" })

--Showkeys
map("n", "<leader>tt", "<cmd>ShowkeysToggle<CR>", { desc = "Showkeys Toggle" })

--Quarto
map("n", "<leader>qp", "<cmd>QuartoPreview<CR>", { desc = "QuartoPreview" })
