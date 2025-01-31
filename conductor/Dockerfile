FROM julia:1.10.8-alpine
WORKDIR /app
ENV JULIA_PROJECT=/app

COPY conductor/Project.toml . 
RUN julia -e 'using Pkg; Pkg.instantiate()'

COPY conductor . 
COPY shared ./src/

CMD ["julia -e 'while true sleep(1) end'"]