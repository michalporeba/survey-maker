FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        make \
        curl \
        ca-certificates

# install Amazon certificate - necessary to trust cdn.proj.org for therion geo tiles
RUN curl -sf https://www.amazontrust.com/repository/Amazon-RSA-2048-M03.pem > /usr/local/share/ca-certificates/Amazon-RSA-2048-M03.crt \
    && update-ca-certificates

RUN apt-get install -y --no-install-recommends \
        texlive \
        texlive-fonts-recommended \
        texlive-humanities \
        texlive-latex-extra \
        texlive-latex-recommended \
        texlive-pictures \
        texlive-xetex \
        therion \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /survey

SHELL ["/bin/sh", "-c"]
ENTRYPOINT make -C /survey $@