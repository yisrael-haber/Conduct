using Distributed, ClusterManagers
include.(filter(contains(r".jl$"), readdir("src"; join=true)))

@everywhere sleep(10)

@everywhere w = @async elastic_worker("a"^16, "conductor")

@everywhere while true 
    w|> println
    sleep(5) 
end