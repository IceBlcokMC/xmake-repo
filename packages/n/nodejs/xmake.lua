package("nodejs")
    add_urls("https://github.com/IceBlcokMC/node/releases/download/v$(version)/sdk.zip")

    add_versions("16.20.2", "b4fd8ca7236237c00e8c17288381d9336b64578f04e626f337472f95280278e6")
    add_versions("22.12.0", "c957c1374293364a25adbb05af4326f688b5abf7a87bbd681946df72187ea3a1")
    add_versions("23.5.0", "a236175ff33698039217d1d94b8e98427d92275197550a112f27e91106807cf4")

    add_configs("uv", {description = "Enable nodejs libuv", default = true, type = "boolean"})

    add_includedirs("include/")
    add_includedirs("include/v8/")

    -- add_includedirs("include/uv/")
    on_load(function (package)
        if package:config("uv") then
            package:add("includedirs", "include/uv/")
        end
    end)

    on_install(function (package)
        os.cp("*", package:installdir())
    end)
