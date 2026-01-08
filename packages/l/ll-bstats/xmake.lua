package("ll-bstats")
    set_license("MIT")
    set_homepage("https://github.com/IceBlcokMC/ll-bstats")

    -- <Version, CommitHash>
    add_urls("https://github.com/IceBlcokMC/ll-bstats.git")
    add_versions("0.1.0", "76b1a55caf625922d60818424a3467c5c9c7ef80")

    add_deps("cpr[ssl=y] 1.12.0")

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)