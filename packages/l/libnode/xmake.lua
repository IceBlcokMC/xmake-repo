package("libnode")
    libnode_versions = {
        ["24.13.0"] = {
            ["win"] = "0599e607ffb89cf5389420e899f683f3e33d7881873d2cad8cd87cd033276a33",
            ["linux"] = "3737ad2986d5e532b70421040f9af4bc0515172645c8843b623502e61381767d"
        }
    }

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

        -- 遍历版本表添加对应平台版本
        for k, v in pairs(libnode_versions) do
            package:add("versions", k, v[plat])
        end

        local url = "https://github.com/IceBlcokMC/libnode/releases/download/v"..package:version_str() .."/libnode-"..plat.."-x64-sdk.zip"
        package:add("urls", url)
    end)

    on_install(function (package)
        os.cp("*", package:installdir())
    end)
