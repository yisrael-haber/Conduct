FROM julia:1.10.8-alpine
WORKDIR /app
ENV JULIA_PROJECT=/app

COPY worker/Project.toml .
RUN julia -e 'using Pkg; Pkg.instantiate()'

COPY worker .
COPY shared ./src/

CMD ["julia -e 'while true sleep(1) end'"]