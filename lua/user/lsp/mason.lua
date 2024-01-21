local servers = {
	"lua_ls",
	"html",
	"rust_analyzer",
	"gopls",
	"dockerls",
	"docker_compose_language_service",
	"clangd",
	"cssls",
	"grammarly",
	"helm_ls",
	"jsonls",
	"yamlls",
	"terraformls",
	"tsserver",
}

local dapServers = {
	"delve",
	"cppdbg",
	"node2",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

require("mason-nvim-dap").setup({
	ensure_installed = dapServers,
	automatic_installation = true,
})

local neodev_status, neodev = pcall(require, "neodev")
if not neodev_status then
	return
end

neodev.setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
