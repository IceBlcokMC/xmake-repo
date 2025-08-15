package("endstone")
    set_kind("library", {headeronly = true})
    set_homepage("https://github.com/EndstoneMC/endstone")
    set_description("Endstone - High-level Plugin API for Bedrock Dedicated Servers (BDS), in both Python and C++")
    set_license("Apache-2.0")

    add_urls("https://github.com/EndstoneMC/endstone.git")

    -- <version, commit>
    add_versions("0.10.4", "9a96f5d2ca2cab7aecf9d5fd5ff1d863accca9f0")

    on_install("windows", "linux", function (package)
        os.cp("include", package:installdir())
    end)
