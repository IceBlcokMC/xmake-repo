package("perm_core")
    set_license("LGPL-3.0")
    set_homepage("https://github.com/IceBlcokMC/PermCore")

    -- <Version, CommitHash>
    add_urls("https://github.com/IceBlcokMC/PermCore.git")

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)