local settingTable = {
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					path = {
						"?.lua",
						"?/init.lua",
						vim.fn.expand("~/.luarocks/share/lua/5.4/?.lua"),
						vim.fn.expand("~/.luarocks/share/lua/5.4/?/init.lua"),
						"/usr/share/5.4/?.lua",
						"/usr/share/lua/5.4/?/init.lua",
					},
				},
				workspace = {
					library = {
						vim.fn.expand("~/.luarocks/share/lua/5.4"),
						"/usr/share/lua/5.4",
					},
				},
				hint = { enable = true },
				telemetry = {
					enable = false,
				},
			},
		},
	},
	ts_ls = {
		javascript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
			},
		},
		typescript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
			},
		},
	},
	ccls = {
		init_options = {
			cache = {
				directory = "/tmp/ccls",
			},
			clang = {
				extraArgs = { "-Wunused", "-Wunused-parameter", "-Wall" },
				excludeArgs = {},
			},
		},
		single_file_support = true,
	},
	yamlls = {
		settings = {
			redhat = {
				telemetry = {
					enable = false,
				},
			},
			yaml = {
				format = {
					enable = true,
				},
			},
		},
	},
	gopls = {},
	rust_analyzer = {},
	bashls = {},
	pyright = {},
}

local function newLspConfig()
	vim.lsp.enable({
		"ccls",
		"pyright",
		"rust_analyzer",
		"bashls",
		"lua_ls",
		"ts_ls",
		"gopls",
		"yamlls",
	})

	vim.lsp.config("*", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
	})

	-- configs
	-- requires `ccls`
	vim.lsp.config("ccls", settingTable.ccls)
	-- requires `lua-language-server`
	vim.lsp.config("lua_ls", settingTable.lua_ls)

	-- requires `typescript-language-server`
	vim.lsp.config("ts_ls", settingTable.ts_ls)

	vim.lsp.config("yamlls", settingTable.yamlls)
	vim.diagnostic.config()
end

local function oldLspConfig()
	-- Set up lspconfig.
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	local on_attach = function(client, bufnr)
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true)
		end
	end
	-------------------------------------------------
	-- LSP setups
	local lspconfig = require("lspconfig")
	for k, v in pairs(settingTable) do
		v[on_attach] = on_attach
		v[capabilities] = capabilities
		lspconfig[k].setup = v
	end
end

return function()
	if vim.fn.has("nvim-0.11") then
		newLspConfig()
	else
		oldLspConfig()
	end
	vim.diagnostic.config({
		virtual_text = true,
		underline = true,
		float = {
			border = "rounded",
			source = true,
		},
	})
end
