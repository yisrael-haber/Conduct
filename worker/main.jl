using Distributed, ClusterManagers, DataFrames, Parquet2
include.(filter(contains(r".jl$"), readdir("src"; join=true)))

w = @async elastic_worker("a"^16, "conductor")

while true 
    w|> println
    sleep(5) 
end