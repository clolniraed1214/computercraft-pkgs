-- v0.1

local packageOrigin = "https://raw.githubusercontent.com/clolniraed1214/computercraft-pkgs/"
local branch = "master"
local packageList = "/packageList.lua"

local function getFileURI(filePath)
    return packageOrigin .. branch .. filePath
end

function getPackageList()
    local urlCheck, err = http.checkURL(getFileURI(packageList))
    
    if urlCheck == true then
        local respHandle = http.get(getFileURI(packageList))
        local packages = textutils.unserialize(respHandle.readAll())
        
    else
        term.setTextColor(colors.red)
        print("Error connecting to update server.")
        print(err)
    end
    
end

function updatePackage(pkgName, path)
    
end