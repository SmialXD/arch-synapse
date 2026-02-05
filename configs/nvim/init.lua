require("config.lazy")
require("config.keymaps")
require("config.lsp")
require("lazy").setup("plugins")
require'colorizer'.setup()
require("neopywal").setup({
    use_wallust = true,
})
vim.opt.relativenumber = true
vim.opt.foldenable = false
vim.opt.scroll = 9 
vim.opt.number = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.termguicolors = true
