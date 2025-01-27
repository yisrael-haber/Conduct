FROM julia:1.10.8-alpine
WORKDIR /app
ENV JULIA_PROJECT=/app

COPY src/*.jl .
COPY src/worker/Project.toml .
RUN julia init.jl

COPY src/worker . 
COPY src/shared .

CMD [ "julia run.jl && sleep infinity" ]