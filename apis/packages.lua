-- v0.1

local packageOrigin = "https://raw.githubusercontent.com/clolniraed1214/computercraft-pkgs/"
local branch = "experimental"
local packageList = "/packageList.lua"

local function getFileURI(filePath)
    return packageOrigin .. branch .. filePath
end

function getPackageList()
    local urlCheck, err = http.checkURL(getFileURI(packageList))
    
    if urlCheck == true then
        local respHandle = http.get(getFileURI(packageList))
        local packages = textutils.unserialize(respHandle.readAll())
        
        return packages
    else
        term.setTextColor(colors.red)
        print("Error connecting to update server.")
        print(err)
    end
    
end

function getPackageInfo(pkgName)
    return getPackageList()[pkgName]
end

function updatePackage(pkgName, path)
    local files = getPackageInfo(pkgName).files
    
    for i = 1,#files,1 do
        local respHandle = http.get(getFileURI(files[i].origin))
        if respHandle == nil then
            print("Error with package installation.")
            print("HTTP Error on remote file " .. files[i].origin)
            return
        end
        local fileHandle = fs.open(path .. files[i].dest, "w")
        
        fileHandle.write(data)
        
        fileHandle.close()
    end
end