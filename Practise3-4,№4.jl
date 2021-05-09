import Pkg
export @pkg_str, PKGMODE_MANIFEST, PKGMODE_PROJECT, PRESERVE_ALL, PRESERVE_DIRECT, PRESERVE_NONE, PRESERVE_SEMVER, PRESERVE_TIERED, PackageMode, PackageSpec, Pkg, PreserveLevel, Registry, RegistrySpec, UPLEVEL_MAJOR, UPLEVEL_MINOR, UPLEVEL_PATCH, UpgradeLevel
Pkg.add("BenchmarkTools")

function shellsort!(a; distseries::Base.Generator=(length(a)÷2^i for i in 1:Int(floor(log2(length(a))))))
    for d in distseries
        for i in firstindex(a):lastindex(a)-d
            j=i
            while j>=firstindex(a) && a[j]>a[j+d]
                a[j],a[j+d] = a[j+d],a[j]
                j-=d
            end
        end
    end
    return a
end

a=[10  0 30
40 0 60
70 0 0
0 100 110]

@benchmark shellsort!(a;)


distseries=(2^i-1 for i in 1:isqrt(length(a)))
@benchmark shellsort!(a;distseries)

distseries=(1,4,10,23,57,132,301,701,1750)
@benchmark shellsort!(a;distseries)