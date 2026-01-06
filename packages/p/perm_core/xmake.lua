add_repositories("miracleforest-repo https://github.com/MiracleForest/xmake-repo.git")

package("perm_core")
    set_license("LGPL-3.0")
    set_homepage("https://github.com/IceBlcokMC/PermCore")

    add_defines("FMT_HEADER_ONLY=1") -- fix ODR
    add_deps("ilistenattentively 0.10.0") -- fix LNK2019

    -- <Version, CommitHash>
    add_urls("https://github.com/IceBlcokMC/PermCore.git")

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)