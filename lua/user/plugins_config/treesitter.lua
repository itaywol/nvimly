local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
    return
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "rust", "go", "javascript", "typescript", "vim", "vimdoc" }, -- put the language you want in this array
    -- ensure_installed = "all", -- one of "all" or a list of languages
    ignore_install = { "" },                                                                                                                  -- List of parsers to ignore installing
    sync_install = false,                                                                                                                     -- install languages synchronously (only applied to `ensure_installed`)
    auto_install = true,

   highlight = {
        enable = true,                      -- false will disable the whole extension
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end

            local langsToDisable = { "css" }
            for _, langToDisable in ipairs(langsToDisable) do
                if lang == langToDisable then
                    return true
                end
            end
        end,

        additional_vim_regex_highlighting = false,
    },
    autopairs = {
        enable = true,
    },
    indent = { enable = true, disable = { "python", "css" } },

    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },

}
