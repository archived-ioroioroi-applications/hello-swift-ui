FROM python:3

WORKDIR /app

RUN pip install --upgrade pip && \
    pip install --upgrade setuptools

ADD requirements.txt /tmp

RUN pip install -q -r /tmp/requirements.txt

# FlaskでAPIサーバにするとき用
EXPOSE 5000
