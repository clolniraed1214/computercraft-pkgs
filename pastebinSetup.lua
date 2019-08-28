local pkgInstallURL = "https://raw.githubusercontent.com/clolniraed1214/computercraft-pkgs/experimental/apis/packages.lua"
local installerTempLoc = "/temp/packages.lua"

local function downloadFile(url, dest)
    local respHandle = http.get(url)
    if respHandle == nil then
        return false
    end
    
    local fileHandle = fs.open(dest, "w")
    fileHandle.write(respHandle.readAll())
    return true
end

print("Downloading package installer...")
sleep(1)
if downloadFile(pkgInstallURL, "/temp/packages.lua") == false then
    error("Failed to download package installer.")
end

print("Loading package installer...")
sleep(1)
if os.loadAPI(installerTempLoc) == false then
    fs.delete("/temp")
    error("Package installer is corrupted or damaged.")
end

print("Installing Package Manager...")
sleep(1)
local status, err = pcall(packages.updatePackage("pakman", "/"))
if status == false then
    error("Error installing package manager: " .. err)
end

print("Cleaning up...")

sleep(1)
fs.delete("/temp")
print("Done!")
sleep(2)
