FROM alpine:latest

RUN apk add --update python3 py3-flask

WORKDIR /app
COPY . /app

ENTRYPOINT ["python3", "/app/main.py"]
