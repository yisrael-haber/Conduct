FROM julia:1.10.8-alpine
WORKDIR /app
ENV JULIA_PROJECT=/app

COPY src/*.jl .
COPY src/conductor/Project.toml .
RUN julia init.jl

COPY src/conductor . 
COPY src/shared .

CMD [ "julia run.jl && sleep infinity" ]