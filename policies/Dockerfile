FROM docker.io/openpolicyagent/opa:0.52.0-rootless

WORKDIR /app/opa/policies

COPY . .

CMD ["run", "--server", "."]
