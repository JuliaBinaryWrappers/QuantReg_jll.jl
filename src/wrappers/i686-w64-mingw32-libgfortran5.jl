# Autogenerated wrapper script for QuantReg_jll for i686-w64-mingw32-libgfortran5
export librqbr, librqfnb

using CompilerSupportLibraries_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"

# Relative path to `librqbr`
const librqbr_splitpath = ["bin", "librqbr.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
librqbr_path = ""

# librqbr-specific global declaration
# This will be filled out by __init__()
librqbr_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const librqbr = "librqbr.dll"


# Relative path to `librqfnb`
const librqfnb_splitpath = ["bin", "librqfnb.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
librqfnb_path = ""

# librqfnb-specific global declaration
# This will be filled out by __init__()
librqfnb_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const librqfnb = "librqfnb.dll"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"QuantReg")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [Sys.BINDIR, joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (CompilerSupportLibraries_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (CompilerSupportLibraries_jll.LIBPATH_list,))

    global librqbr_path = normpath(joinpath(artifact_dir, librqbr_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global librqbr_handle = dlopen(librqbr_path)
    push!(LIBPATH_list, dirname(librqbr_path))

    global librqfnb_path = normpath(joinpath(artifact_dir, librqfnb_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global librqfnb_handle = dlopen(librqfnb_path)
    push!(LIBPATH_list, dirname(librqfnb_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(LIBPATH_list, ';')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

