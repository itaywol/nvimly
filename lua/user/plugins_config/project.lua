local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
    return
end

project.setup({
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml", "go.mod" },
})
