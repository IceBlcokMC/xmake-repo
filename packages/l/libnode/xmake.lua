package("libnode")
    add_versions("22.18.0", "a527dfa0d8cb423334b23637c8dda79793d2e2671b92364f7c341cf0bffd0999")

    add_includedirs("include/")
    add_includedirs("include/v8/")
    add_includedirs("include/uv/")

    on_load(function (package)
        local plat = ""
        if package:is_plat("windows") then
            plat = "win"
        elseif package:is_plat("linux") then
            plat = "linux"
        end
        if plat == "" then
            print("Unsupported platform")
            return
        end

        local url = "https://github.com/IceBlcokMC/libnode/releases/download/v"..package:version_str() .."/libnode-"..plat.."-x64-sdk.zip"

        package:add("urls", url)
    end)

    on_install(function (package)
        os.cp("*", package:installdir())
    end)
