-- ===== 2026-10-23 =====
-- Use space as the global and local leader key.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("autocmds")
require("keymaps")
require("my_commands")
require("bootstrap_lazy")
require("lsp")
require("theme").load()
