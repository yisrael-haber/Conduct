module conduct
# Get the current file's path
current_file = @__FILE__

# Read all files, filter for .jl files, and exclude the current file
files_to_include = filter(f -> contains(f, ".jl") && f != current_file, readdir(join=true))

# Include each file
include.(files_to_include)
end