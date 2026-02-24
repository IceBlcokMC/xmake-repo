package("v8kit")
    set_homepage("https://github.com/engsr6982/v8kit")

    -- <Version, CommitHash>
    add_urls("https://github.com/engsr6982/v8kit.git")

    add_deps("libnode 24.13.0")

    on_install(function (package)
        local libnode = package:dep("libnode")
        local dir = libnode:installdir()
        local v8_dir = dir.."/include/v8"
        import("package.tools.xmake").install(package, { v8_include_dir = v8_dir })
    end)