package("scriptx")
    add_urls("https://github.com/IceBlcokMC/ScriptX.git")

    add_configs("backend", {default = "V8", values = {"V8", "QuickJs", "Lua"}})

    add_includedirs(
        "include/src/include/"
    )

    on_install(function (package)
        local configs = {
            backend = package:config("backend"),
        }
        import("package.tools.xmake").install(package, configs)
    end)

    on_load(function (package)
        local backend = package:config("backend")

        local deps = {
            V8 = "nodejs v22.12.0",
        }

        print("Using ScriptX config: backend=" .. backend)

        package:add("defines", "SCRIPTX_BACKEND=" .. backend)
        package:add("defines", "SCRIPTX_BACKEND_TRAIT_PREFIX=../backend/" .. backend .. "/trait/Trait")
        package:add("deps", deps[backend])
    end)