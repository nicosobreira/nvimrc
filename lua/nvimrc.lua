local utils = require("utils")

local Print = vim.print

local M = {
	opts = {
		file_name = { ".nvimrc", ".nvim.lua", ".nvim-local" },
	},
}

local function getFullOpts(opts)
	for key, opt in pairs(opts) do
		if type(opt) ~= "table" then
			M.opts[key] = opt
		elseif type(opt) == "table" then
			M.opts[key] = vim.list_extend(M.opts[key], opt)
		end
	end
end

local function sourceFiles()
	local path = vim.fn.getcwd() .. "/"
	Print(M.opts.file_name)
	for _, file in pairs(M.opts.file_name) do
		local full_file = path .. file

		if utils.fileExist(full_file) then
			vim.cmd("luafile " .. full_file)
		end
	end
end

function M.setup(args)
	getFullOpts(args.opts)
	vim.schedule(sourceFiles)
end

return M
