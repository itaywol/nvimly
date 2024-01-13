local options = {
    cmdheight = 2,
    conceallevel = 0,
    mouse = "a",
    backup = false,
    clipboard = "unnamedplus",
    fileencoding = "utf-8",
    hlsearch = true,
    ignorecase = true,
    pumheight = 10,
    showmode = false,
    showtabline = 2,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    timeoutlen = 300,
    undofile = true,
    updatetime = 300,
    writebackup = false,
    expandtab = true,
    shiftwidth = 2,
    tabstop = 2,
    cursorline = true,
    number = true,
    relativenumber = true,
    numberwidth = 4,
    signcolumn = "yes",
    wrap = true,
    linebreak = true,
    scrolloff = 8,
    guifont = "MonoLisa Nerd Font",
    termguicolors = true,
}

for k,v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.shortmess:append "c"
vim.opt.iskeyword:append "-"
vim.opt.formatoptions:remove({ "c", "r", "o" })        -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")  -- separate vim plugins from neovim in case vim still in use

local globalOptions = {
    loaded_netrw = 1,
    loaded_netrwPlugin = 1,
}

for k,v in pairs(globalOptions) do
    vim.g[k] = v
end