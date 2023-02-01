FROM python:3.8-slim-buster

COPY . /app

WORKDIR /app

RUN pip install flask

ENV ENV_01=default_01
ENV ENV_02=default_02
ENV ENV_03=default_03

CMD ["python", "app.py"]
