vim.keymap.set("n", "<leader>m", "", { desc = "myConfig", silent = true })
vim.keymap.set("n", "<leader>ml", "", { desc = "Light Switch", silent = true })
vim.keymap.set("n", "<leader>ml1", ":lua runCommand()<CR>", { desc = "Lifx Neon", silent = true })

function runCommand()
	local handle = io.popen("bash ~/coding/wifiControl/lightSwitch.sh 2>&1")
	if handle == nil then
		vim.api.nvim_echo({ { "Error: io.open resulted in nil, please check\nAborting.", "Errormsg" } }, false, {})
	else
		local result = handle:read("*a")
		handle:close()
		vim.api.nvim_echo({ { result, "Errormsg" } }, false, {})
	end
end
