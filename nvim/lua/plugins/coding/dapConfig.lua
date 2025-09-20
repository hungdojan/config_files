local function pythonSetup(dap)
    local venv_path = os.getenv("VIRTUAL_ENV")
    local cmd = (venv_path == nil or venv_path == '') and "/usr/bin/python" or venv_path .. "/bin/python"
    dap.adapters.python = {
        type = "executable",
        command = cmd,
        args = { "-m", "debugpy.adapter" },
        options = {
            source_filetype = 'python'
        }
    }
end
return function()
    local dap, dapui = require("dap"), require("dapui")
    pythonSetup(dap)
    dapui.setup()

    vim.keymap.set("n", "<leader>wo", dapui.open, { desc = "Open dap UI" })
    vim.keymap.set("n", "<leader>wq", dapui.close, { desc = "Close dap UI" })
    vim.keymap.set("n", "<leader>wW", dapui.toggle, { desc = "Toggle dap UI" })
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continue" })
    vim.keymap.set("n", "<F6>", dap.step_into, { desc = "Step into" })
    vim.keymap.set("n", "<leader>wh", dap.continue, { desc = "Continue" })
    vim.keymap.set("n", "<leader>wj", dap.step_into, { desc = "Step into" })
    vim.keymap.set("n", "<leader>wk", dap.step_over, { desc = "Step over" })
    vim.keymap.set("n", "<leader>wl", dap.step_out, { desc = "Step out" })
    vim.keymap.set("n", "<leader>wB", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
end
