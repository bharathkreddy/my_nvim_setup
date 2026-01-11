return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"nvim-neotest/nvim-nio",
		{
			"mfussenegger/nvim-dap",
			dependencies = {
				"mfussenegger/nvim-dap-python", -- Python debugging
			},
			config = function()
				local dap, dapui = require("dap"), require("dapui")

				-- =============================================
				-- Python Debugger
				-- =============================================
				require("dap-python").setup("python3")

				-- =============================================
				-- C# / .NET Debugger
				-- =============================================
				dap.adapters.coreclr = {
					type = "executable",
					command = vim.fn.expand("~/.local/share/nvim/mason/bin/netcoredbg"),
					args = { "--interpreter=vscode" },
				}

				dap.configurations.cs = {
					{
						type = "coreclr",
						name = "Launch - Console App",
						request = "launch",
						program = function()
							-- Try to find the dll automatically
							local cwd = vim.fn.getcwd()
							local dll = vim.fn.glob(cwd .. "/bin/Debug/**/**.dll", false, true)
							if #dll > 0 then
								-- Filter out unwanted dlls
								for _, d in ipairs(dll) do
									if not string.match(d, "ref/") then
										return vim.fn.input("Path to dll: ", d, "file")
									end
								end
							end
							return vim.fn.input("Path to dll: ", cwd .. "/bin/Debug/", "file")
						end,
						cwd = "${workspaceFolder}",
					},
					{
						type = "coreclr",
						name = "Attach to Process",
						request = "attach",
						processId = require("dap.utils").pick_process,
					},
				}

				-- =============================================
				-- DAP UI Auto Open/Close
				-- =============================================
				dap.listeners.before.attach.dapui_config = function()
					dapui.open()
				end
				dap.listeners.before.launch.dapui_config = function()
					dapui.open()
				end
				dap.listeners.before.event_terminated.dapui_config = function()
					dapui.close()
				end
				dap.listeners.before.event_exited.dapui_config = function()
					dapui.close()
				end

				-- =============================================
				-- DAP Signs (Breakpoint icons)
				-- =============================================
				vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
				vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
				vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
				vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })
				vim.fn.sign_define("DapBreakpointRejected", { text = "●", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })
			end,
		},
	},
	config = function()
		require("dapui").setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.25 },
						{ id = "breakpoints", size = 0.25 },
						{ id = "stacks", size = 0.25 },
						{ id = "watches", size = 0.25 },
					},
					position = "left",
					size = 40,
				},
				{
					elements = {
						{ id = "repl", size = 0.5 },
						{ id = "console", size = 0.5 },
					},
					position = "bottom",
					size = 10,
				},
			},
		})
	end,
}
