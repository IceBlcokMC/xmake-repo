package("nodejs")
    add_urls("https://github.com/IceBlcokMC/node/releases/download/v$(version)/sdk.zip")

    add_versions("16.20.2", "b4fd8ca7236237c00e8c17288381d9336b64578f04e626f337472f95280278e6")
    add_versions("22.12.0", "C957C1374293364A25ADBB05AF4326F688B5ABF7A87BBD681946DF72187EA3A1")
    add_versions("23.5.0", "a236175ff33698039217d1d94b8e98427d92275197550a112f27e91106807cf4")

    add_includedirs("include/")
    add_includedirs("include/v8/")
    add_includedirs("include/uv/")
    on_install(function (package)
        os.cp("*", package:installdir())
    end)