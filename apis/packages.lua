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
        local fileHandle = fs.open(path .. files[i].dest, "w")
        local respCode = respHandle.getResponseCode()
        if respCode < 200 or respCode > 299 then
            print("Error with package installation.")
            print("HTTP Error Code " .. respCode .. " on file " .. files[i].name)
            return
        end
        
        fileHandle.write(data)
        
        fileHandle.close()
    end
end