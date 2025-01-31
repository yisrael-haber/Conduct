# Conduct 
Trying to create a more controllable and optimizable minimal Apache Spark alternative. 
Replacing Spark is basically impossible, and thinking it can be easily replaced in
a pet project by an inexperienced software engineer is far more crazy than it is a viable goal. For now I treat this as an education project for myself, if you want to contribute you should acknowledge this. As this is an educational project, it will be worked on and off for a very long time before there is anything close to a viable POC. From here the text will act as if I expect it to grow to a serious system, but that is for the consistency of the following text. 

There are many challenges/obstacles that I see that need to be solved before I can declare of a viable POC:
- Testing-based development will be very hard, especially initially. `TDD` is not the goal, but the ability to have a quick `write`->`build`->`run`->`test/check` iteration loop can be massively beneficial (and not having it is really difficult, especially since performance testing will be really challenging.)
- Architecture of distributed systems is hard, especially since I do not have any experience as a distributed developer other than using Spark as an end user. This also means that the architecture will most likely be massivley prone to changes once I get more experienced, or as other experienced distributed developers might start to contribute.
- Choosing the language/frameworks involved is not a big deal, as they are most likely not the critical part, but it needs to be done.
- What does `building` or `running` even look like?

# Architecture Suggestion
The architecture that I am aiming for, as of now, will be listed here so that it is clear where are we trying to get to. There are a couple of aspects to the architecture, which are semi-related to eachother: 
- Architecture of distributed DataFrames. I think that having that the DataFrames abstraction to not be related at all to the workers is the right choice. Maybe have a local `sqlite` DB on each worker describing the sections of the Columns that they hold of the distributed columns. I think the DF abstraction should only really exist on the client and not in any part of the actual calculation.
- Architecture of the client/conductor/workers.

# TODO:
- [ ] See if I can get more than one process per worker, currently limited because the workers are started using the `ElasticManager` which calls `init_worker`. `init_worker`, for some reason, asserts that current number of processors is at most 1. This needs to be able to be adjustable, whether in my code or through a PR/MR to `Distributed.jl` or `ClusterManagers.jl`
- [ ] Get distributed arrays to work. Need to check if `DArrays`/`DTables` are relevant, might need to create own version with lazy option. 