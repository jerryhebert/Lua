--[[
A few functions that add an interface for color editing.
]]

_libs = _libs or {}
_libs.colors = true
_libs.tablehelper = _libs.tablehelper or require 'tablehelper'
_libs.stringhelper = _libs.stringhelper or require 'stringhelper'
local json = require 'json'
_libs.json = _libs.json or (json ~= nil)
_libs.logger = _libs.logger or require 'logger'

local ffxidata = (ffxi and ffxi.data) or json.read('../libs/ffxidata.json')

-- Returns str colored as specified by newcolor. If oldcolor is omitted, the string will stay in newcolor.
function string.setcolor(str, newcolor, oldcolor)
	if type(newcolor) == 'string' then
		newcolor = ffxidata.chatcolors[newcolor]
		if newcolor == nil then
			warning('Color "'..newcolor..'" not found.')
			return str
		end
	end
	
	if oldcolor == nil then
		return string.char(31, newcolor)..str
	end
	return string.char(31, newcolor)..str..string.char(31, oldcolor)
end