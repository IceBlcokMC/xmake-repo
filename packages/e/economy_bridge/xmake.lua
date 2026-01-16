package("economy_bridge")
    set_license("LGPL-3.0")
    set_homepage("https://github.com/IceBlcokMC/EconomyBridge")

    -- <Version, CommitHash>
    add_urls("https://github.com/IceBlcokMC/EconomyBridge.git")
    add_versions("0.1.0", "948d0d92ab91e70df8333f2c8fb907c2e6640f90")

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)