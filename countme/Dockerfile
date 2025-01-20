FROM tiangolo/uwsgi-nginx:latest

RUN pip install flask
ENV UWSGI_CHEAPER 0
ENV UWSGI_PROCESSES 1

COPY . /app
