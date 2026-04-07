package("ll-bstats")
    set_license("MIT")
    set_homepage("https://github.com/IceBlcokMC/ll-bstats")

    -- <Version, CommitHash>
    add_urls("https://github.com/IceBlcokMC/ll-bstats.git")
    add_versions("0.1.0", "76b1a55caf625922d60818424a3467c5c9c7ef80")
    add_versions("0.1.1", "b3e7d663d24d401ac24a9c5e2e448e94efb4d28e")
    add_versions("0.1.2", "339f0d17fbca57ff0b1e5573bc61700213a7916f")
    add_versions("0.2.0", "59d46ef6b4bb5a15d04509adafb6760fd54ac49a")
    add_versions("0.3.0", "ecb29493791ea7e6633f30e4aebab8b393eb28de")

    add_deps("cpr[ssl=y] 1.12.0")

    add_configs("target_type", {default = "server", values = {"server", "client"}})

    on_install(function (package)
        if package:config("target_type") == "server" then
            import("package.tools.xmake").install(package)
        else
            import("package.tools.xmake").install(package, {"--target_type=client"})
        end
    end)