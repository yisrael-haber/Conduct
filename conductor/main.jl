using ClusterManagers, Distributed, Sockets
include.(filter(contains(r".jl$"), readdir("src"; join=true)))

em = ElasticManager(addr = getipaddr(IPv4), cookie = "a" ^ 16)

while true 
    em |> println
    sleep(5) 
end