package("perm_core")
    set_license("LGPL-3.0")
    set_homepage("https://github.com/IceBlcokMC/PermCore")

    add_defines("FMT_HEADER_ONLY=1") -- fix ODR

    -- <Version, CommitHash>
    add_urls("https://github.com/IceBlcokMC/PermCore.git")

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)