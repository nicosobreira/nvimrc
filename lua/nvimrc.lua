io = require("io")

local fn = vim.fn
local cmd = vim.cmd

local M = {}

M.config = {
	config_files = { ".nvimrc", ".nvim.lua", ".nvim-local" },
}

---@return boolean
---@param name string
local function fileExist(name)
	if fn.filereadable(name) then
		return true
	end
	return false
end

function M.setup()
	local path = fn.getcwd() .. "/"
	for _, file in ipairs(M.config.config_files()) do
		if fileExist(path .. "/" .. file) then
			cmd("luafile " .. file)
		end
	end
end

return M
