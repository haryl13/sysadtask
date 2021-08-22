FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y

RUN mkdir -p /home/alphaqsetup

COPY ./alphaqsetup /home/alphaqsetup
RUN chmod 777 /home/alphaqsetup/alpha.sh

ENTRYPOINT ["/bin/sh", "/home/alphaqsetup/alpha.sh"]

