using ClusterManagers, Distributed, Sockets, DataFrames, Parquet2
include.(filter(contains(r".jl$"), readdir("src"; join=true)))

em = ElasticManager(addr = getipaddr(IPv4), cookie = "a" ^ 16)

ds = Parquet2.Dataset("/src/examples/df1"; load_initial=true)

while true 
    em |> println
    sleep(5) 
end