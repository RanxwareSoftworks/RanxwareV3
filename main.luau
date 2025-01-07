local isfile = isfile or function(file)
	local s,r = pcall(function()
		return readfile(file)	
	end)
	return suc and res ~= nil and res ~= ""
end

local Directory = "https://github.com/RanxwareSoftworks/RanxwareV3/raw/refs/heads/main/"
local FolderName = "RanxwareV3"
local ConfigFolderName = "Configs"
local ConfigExt = ".ranx"
local RanxwareSettings = "RanxwareSettings"

-- resetting Ranxware
if shared.resetRanxware and isfolder(FolderName) then
	delfolder(FolderName)
end

if not isfolder(FolderName) then
	makefolder(FolderName)
end

if not isfolder(`{FolderName}/{ConfigFolderName}`) then
	makefolder(`{FolderName}/{ConfigFolderName}`)
end

if not isfile(`{FolderName}/{RanxwareSettings}{ConfigExt}`) then
	writefile(`{FolderName}/{RanxwareSettings}{ConfigExt}`, "{}")
end

-- main loaders
local function loadScript(file)
	if not string.find(file, ".luau") then file = `{file}.luau` end
	loadstring(game:HttpGet(`{Directory}{file}`))()
end

loadScript("utils/env.luau")
loadScript("util/sgame-directory.luau")
