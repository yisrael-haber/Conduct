FROM julia:1.10.8-alpine
WORKDIR /app
ENV JULIA_PROJECT=/app

COPY Project.toml .
COPY src/shared . 
COPY src/conductor .
COPY . /src

CMD [ "sleep infinity" ]