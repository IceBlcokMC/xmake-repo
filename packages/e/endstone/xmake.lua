local EndStoneDeps = {
    ["0.6.0"] = { "expected-lite 0.8.0", "fmt >=10.0.0 <11.0.0" },
    ["0.7.1"] = { "expected-lite 0.8.0", "fmt >=10.0.0 <11.0.0" }
}

package("endstone")
    set_kind("library", {headeronly = true})
    set_homepage("https://github.com/EndstoneMC/endstone")
    set_description("Endstone - High-level Plugin API for Bedrock Dedicated Servers (BDS), in both Python and C++")
    set_license("Apache-2.0")

    add_urls("https://github.com/EndstoneMC/endstone/archive/refs/tags/v$(version).tar.gz", "https://github.com/EndstoneMC/endstone.git")

    -- Versions
    add_versions("0.5.6", "2a991d4009025a10c4469f160a15ad40594f82ebd08dab510ea0f42d61b7c8dd")
    add_versions("0.5.7.1", "956d8f853d2d7d00844b8d9ac73afc35ef549c0405fc09c22fedf937c9fbe1d6")
    add_versions("0.6.0", "d9d7f865629165230b6dfcb34b359186524f6784a7655f39a7140ca998455a38")
    add_versions("0.7.1", "fb1324eae85ba2e73c1bff58c5cabe4a0821fb7b4ca9249fe31aa9c9e74a7aee")

    -- Patches
    add_patches("0.5.6", "patches/linux.patch", "1e7c6a961abf821803b42dcd43d1c88524caa8012e333b9e47ec6faa00037c74")
    add_patches("0.5.6", "patches/cxx20.patch", "547ae3d325b8deb68747179b6bc3aa8772ba4efe36263bf31f34be7a3aac2ceb")
    add_patches("0.5.7.1", "patches/cxx20.patch", "547ae3d325b8deb68747179b6bc3aa8772ba4efe36263bf31f34be7a3aac2ceb")

    -- Dependencies
    on_load(function (package)
        local version = package:version_str()
        local deps = EndStoneDeps[version]
        if deps then
            for _, dep in ipairs(deps) do
                if dep:startswith("fmt") then
                    -- fmt on linux must be header-only
                    package:add("deps", dep, { configs = { header_only = true } })
                else
                    package:add("deps", dep)
                end
            end
        else
            printf("Warning: No dependencies found for Endstone version %s. Please check the version and update the package if necessary.\n", version)
        end
    end)

    on_install("windows", "linux", function (package)
        os.cp("include", package:installdir())
    end)
