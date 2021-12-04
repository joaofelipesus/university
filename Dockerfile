FROM elixir:1.13

ENV DEBIAN_FRONTEND=noninteractive
ENV MIX_ENV dev

RUN mkdir -p /university
COPY . /university
WORKDIR /university

RUN mix local.hex --force

RUN mix deps.get

RUN mix local.rebar --force

RUN mix deps.compile

RUN mix phx.digest

EXPOSE 4000
EXPOSE 4001

CMD mix phx.server
