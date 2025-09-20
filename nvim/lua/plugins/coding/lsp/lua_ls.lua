return {
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
}
