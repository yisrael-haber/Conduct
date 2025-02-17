using Parquet2

mutable struct DistributedDF
    ds         ::Union{Parquet2.Dataset, Nothing}
    # cols       ::Vector{String}

    function DistributedDF(dataset_path::String)::DistributedDF
        ds = Parquet2.Dataset(dataset_path; load_initial=true)
        return new(ds)
    end
end

mutable struct DDFOperation
    kind                   ::Symbol
    evaluator              ::Function
    args                   ::Vector

    DDFOperation(kind, evaluator, args) = new(kind, evaluator, args)
end



function select_op(columns_to_select::Vector{Union{Symbol, String}})::DDFOperation
    return DDFOperation(:select, Parquet2.select, columns_to_select)
end

function read_parquet_op(parquet_path::String)::DDFOperation
    return DDFOperation(:read, Parquet2.Dataset, [parquet_path])
end

# function DistributedDF(parquet_path::String)::DistributedDF
#     ds = Parquet2.Dataset(parquet_path, load_initial=true)
#     worker_vec = workers()
#     chunks = Dict{Int, Int}()
#     for rgi ∈ 1:length(ds)
#         chunks[rgi] = worker_vec[rgi%length(worker_vec) + 1]
#     end

#     return DistributedDF(chunks, ds)
# end

function register(op::DDFOperation; df::DistributedDF, dsp::dataset_path, transformation)::DistributedDF
    if op.kind == :read 
        return DistributedDF(dsp)
    elseif op.kind == :select
        
    end
end