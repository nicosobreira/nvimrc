local utils = require("utils")

local M = {
	opts = {
		file_name = { ".nvimrc", ".nvim.lua", ".nvim-local" },
	},
}

---@param user_opts table
local function setOpts(user_opts)
	user_opts = user_opts or {}
	if type(user_opts.file_name) == "string" then
		utils.insertElem(M.opts.file_name, user_opts.file_name)
	elseif type(user_opts.file_name) == "table" then
		utils.insertTable(M.opts.file_name, user_opts.file_name)
	end
end

local function sourceFiles()
	local path = vim.fn.getcwd() .. "/"
	for _, name in pairs(M.opts.file_name) do
		local file = path .. name

		if utils.fileExist(file) then
			vim.cmd("luafile " .. file)
		end
	end
end

function M.setup(opts)
	setOpts(opts)
	sourceFiles()
end

return M
