package("pland")
    set_license("AGPLv3")
    set_homepage("https://github.com/IceBlcokMC/PLand")

    -- 旧方案(SDK.zip) <Version, SHA256>
    add_urls("https://github.com/IceBlcokMC/PLand/releases/download/v$(version)/SDK-PLand.zip", {alias = "A"})
    add_versions("A:0.0.3", "0e63d412242e61f20194fb3a47541e39bf42c0a04ee38edc135c868cf9d8c13d")
    add_versions("A:0.1.0", "313aeaea5296f3bdfb514f96a1d11a3d661408897d3beb8d18f3fda2afd591ae")
    add_versions("A:0.2.0", "b29b5b44560de20b84cc9c53df34c90078f3b2eb596b38b732fba92f16954bad")
    add_versions("A:0.2.1", "f4a5ee16fa2336b795f25086dfed96a7c09690dddaf4c48c4b78f100cd6ca63e")
    add_versions("A:0.2.2", "b47397a5437e1cf14d519fe3ef5ec2b7ce447368c6303f0d1c6627b601680c17")
    add_versions("A:0.2.3", "33bc973c0a70736dbd67509891a9ce3bc006c938af967111d8c8d3247465b472")
    add_versions("A:0.2.4", "499338b93650fd6da7781f747106fdb2fc623897a0b131d483c203eb45c1e0ca")
    add_versions("A:0.2.5", "0e7f350454dee04f5a3a0dbbd47ce87f7bd89c831764606e0d04dc2af3f758d6")
    add_versions("A:0.3.0", "53aa9273aa626f79ae03a63a33bd6c95f658e3c929dc91e43a9e414a2d3a815b")
    add_versions("A:0.4.0-rc.1", "819e84857b16f72ff82d01919ddb2e9d51af024f90f5e30a9550a6d5adc3bfe3")
    add_versions("A:0.5.0", "c14e16fbcebb39165f15259de67dc73ff3cff04d4b33b149a9a00f705b6bc333")
    add_versions("A:0.6.0", "f10b9f47e3840fdd1dd3e0565422ff6da3f7b7d56443333824551734c09660c3")
    add_versions("A:0.7.0", "c4cd3451ed1b6269b49caea27cd512f9093b7ef342bbc3c9e9855ab649f13154")
    add_versions("A:0.7.1", "37d2dc3d2a24d2b83bc41acd82b76f9445f8dc3c6f87a1af5c98baf3c151c2ff")
    add_versions("A:0.8.0", "ee6acac34804f95f8ea91faafc7547a0badc9410002012def466b3f0970fb123")
    add_versions("A:0.8.1", "490fbcaa3d5876bf6480769280f3c0e723953fb8850c7d47696bb7daa8622af1")
    add_versions("A:0.9.0", "7e6bd0c6c0a633164f71f7d845e83bbf17c773610c8a9383b336b0075626e2c4")
    add_versions("A:0.10.0", "2419a26e602c0466f56a5b690ffba5a644aabcfb47f90df9021f44afc4a181b6")

    -- 新方案(Git) <Version, CommitHash>
    add_urls("https://github.com/IceBlcokMC/PLand.git", {alias = "B"})
    add_versions("B:0.11.0-rc.1", "7d07b5335019df06bc1ad9b7efb830cc25c9e903")
    add_versions("B:0.11.0-rc.2", "d2652fccc90c69473a273848d4f46ffd7d9afdf2")
    add_versions("B:0.12.0-rc.1", "600fcc7448a703c0d2b94093c54ab37e6b1713b8")
    add_versions("B:0.12.0-rc.2", "abc979b3a4463d0610b0e53e3b8dafa8c7ea4e1b")
    add_versions("B:0.11.0", "53fe2a74d73ace0629b3a430257c0145ea33eae5")
    add_versions("B:0.12.0", "5f9d77a50171f02787467784006d9eadbbf53d0c")
    add_versions("B:0.13.0", "1897c338d173e05e42bea484d3703ee2b83179e3")
    add_versions("B:0.14.0", "4c5f6bcc070a81e3e7b36c178e9d8f21d1ffc43f")
    add_versions("B:0.14.1", "0fb387e17b718dd8f8df2e6d6793de932d9ef039")
    add_versions("B:0.15.0", "c7f5ee963fb0b0b7d57da38ffb5426eac5bc8cda")
    add_versions("B:0.16.0", "a729b30985efbc78ffe80d84f07f63cd483b38cf")
    add_versions("B:0.17.0", "fcc9561f5eaf4352c28960f5ff39136d65f761ec")
    add_versions("B:0.17.1", "54814c56699051d67be891a70bb4def79048fe9d")
    add_versions("B:0.17.2", "f50e3ae9f3fa6848d8aeb338aadd79a0f7b0f69a")
    add_versions("B:0.18.0", "2f19f729ccf3a70b0d5c818e5ee042eabde650ca")

    on_install(function (package)
        import("core.base.semver")
        local isLegacy = false;
        local isDevelop = false;

        local version = package:version_str()
        local sem = semver.try_parse(version)
        if sem and sem:le("0.10.0") then
            isLegacy = true;
        end

        if sem == nil then 
            isDevelop = true;
        end

        if isLegacy then 
            cprint(
                "${bright green}info: ${clear}Downloading PLand SDK for release: ${bright cyan}" .. version .. "${clear}"
            )
            os.cp("*", package:installdir())
        else
            if isDevelop then
                cprint(
                    "${bright yellow}warning: ${clear}Installing PLand SDK from development source (commit: ${bright cyan}" .. version .. "${clear})"
                )
                import("package.tools.xmake").install(package)
            else
                cprint(
                    "${bright green}info: ${clear}Downloading PLand SDK for release: ${bright cyan}" .. version .. "${clear}"
                )
                import("package.tools.xmake").install(package)
            end
        end
    end)