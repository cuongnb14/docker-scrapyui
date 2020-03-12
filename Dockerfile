# Author: Cuong Nguyen
#
# Build: docker build -t scrapy_ui:0.1.0 .
#

FROM ubuntu:18.04
LABEL maintainer="cuongnb14@gmail.com"

RUN apt-get update -qq

RUN apt-get install locales && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip build-essential python3-dev \
    libmysqlclient-dev libxml2-dev libxslt1-dev libssl-dev libffi-dev

RUN mkdir /logs
ENV LOG_DIR /logs

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip3 install -r /app/requirements.txt

COPY . /app

VOLUME [ "/app/dbs" ]
EXPOSE 8000

RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]