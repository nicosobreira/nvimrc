M = {}

---@param tbl table
---@return table
function M.insertElem(tbl, elem)
	tbl = tbl or {}
	elem = elem or nil
	table.insert(tbl, elem)
	return tbl
end

---@param tbl_a table
---@param tbl_b table
---@return table
function M.insertTable(tbl_a, tbl_b)
	tbl_a = tbl_a or {}
	tbl_b = tbl_b or {}
	for _, elem in pairs(tbl_b) do
		table.insert(tbl_a, elem)
	end
	return tbl_a
end

---@param name string
---@return boolean
function M.fileExist(name)
	if vim.fn.filereadable(name) == 1 then
		return true
	end
	return false
end

return M
