FROM julia:1.10.8-alpine
WORKDIR /app
ENV JULIA_PROJECT=/app

COPY *.jl .
COPY conductor/Project.toml .
RUN julia init.jl

COPY conductor . 
COPY shared .

CMD [ "julia run.jl && sleep infinity" ]