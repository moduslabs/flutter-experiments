FROM ubuntu:21.10 as build

RUN apt-get update && apt-get upgrade -y && apt-get install git curl unzip xz-utils zip wget -y
RUN git clone https://github.com/flutter/flutter.git -b stable

ENV PATH=$PATH:/flutter/bin
RUN flutter doctor

WORKDIR app/
COPY . ./
RUN flutter pub get

EXPOSE 8081
CMD flutter run -d web-server --web-port=8081 --web-hostname=0.0.0.0
