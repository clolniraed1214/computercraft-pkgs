{
    startupManager = {
        name = "Startup Manager",
        version = "v0.5",
        description = "A system to manage startup apps, apis, aliases, and more...",
        dependancies = {},
        files = {
            dest = "startup.lua",
            origin = "/startupManager/startupManager.lua",
        },
        instructions = {},
    },
    
    pkgsApi = {
        name = "Package installer API",
        version = "v1.0",
        description = "An API used to install packages.",
        dependancies = {
            "startupManager",
        },
        files = {
            {
                dest = "apis/packages.lua",
                origin = "/apis/packages.lua",
            },
        },
        instructions = {
            {
                inst = "loadAPI",
                file = "apis/packages.lua",
            },
        },
    },
    
    buttonApi = {
        name = "Buttons API",
        version = "v1.0",
        description = "An API used to create clickable interfaces.",
        dependancies = {
            "startupManager",
        },
        files = {
            {
                dest = "apis/buttons.lua",
                origin = "/apis/buttons.lua",
            },
        },
        instructions = {
            {
                inst = "loadAPI",
                file = "apis/buttons.lua",
            },
        },
    },
    
    weather = {
        name = "Weather Manipulator",
        version = "v1.5",
        description = "A basic weather manipulator, for the server I play on.",
        dependancies = {
            "buttonApi",
        },
        files = {
            {
                dest = "weather.lua",
                origin = "/weather/weather.lua",
            },
        },
        instructions = {
            {
                inst = "appMain",
                file = "weather.lua",
            }
        },
    },
    
    pakman = {
        name = "Package Manager/Updater",
        version = "v0.1",
        description = "Basic Package Manager and Updater",
        dependancies = {
            "buttonApi",
            "pkgsApi",
        },
        files = {
            {
                dest = "pakman.lua",
                origin = "/pakman/pakman.lua",
            },
        },
        instructions = {
            {
                inst = "appMain",
                file = "pakman.lua",
            }
        },
    },
}