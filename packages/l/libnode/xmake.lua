package("libnode")
    libnode_versions = {
        ["24.13.0"] = {
            ["win"] = "0599e607ffb89cf5389420e899f683f3e33d7881873d2cad8cd87cd033276a33",
            ["linux"] = "3737ad2986d5e532b70421040f9af4bc0515172645c8843b623502e61381767d"
        }
    }

    add_urls("https://github.com/IceBlcokMC/libnode/releases/download/v$(version)/libnode-win-x64-sdk.zip")
    add_urls("https://github.com/IceBlcokMC/libnode/releases/download/v$(version)/libnode-linux-x64-sdk.zip")

    add_includedirs("include/")
    add_includedirs("include/v8/")
    add_includedirs("include/uv/")

    on_source(function (package)
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
            printf("add version: " .. k .. " hash: " .. v[plat])
            package:add("versions", k, v[plat])
        end
    end)

    on_install(function (package)
        os.cp("*", package:installdir())
    end)
