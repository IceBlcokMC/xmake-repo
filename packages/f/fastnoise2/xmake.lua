package("fastnoise2")
    add_urls("https://github.com/IceBlcokMC/FastNoise2/releases/download/v$(version)/FastNoise-windows-x64.zip")
    set_homepage("https://github.com/Auburn/FastNoise2")
    set_description("Modular node graph based noise generation library using SIMD, C++17 and templates")
    set_license("MIT")

    add_versions("0.10.0-alpha", "ab7809610f8b0cd98ffb3713741a99ef7008d57c43680f9544d9c8597df36007")

    on_install(function (package)
        os.cp("*", package:installdir())
    end)
