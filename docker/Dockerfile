FROM ubuntu:22.04

LABEL maintainer="Skytem Surveys Aps"

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install -yq apt-utils \
    wget \
    build-essential \
    libreadline-dev \
    libncursesw5-dev \
    libssl-dev \
    libsqlite3-dev \
    libgdbm-dev \
    libc6-dev \
    libbz2-dev \
    libffi-dev \
    zlib1g-dev \
    libcairo2 \
    default-jre \
    unzip

# User creation
RUN useradd -m -s $(which bash) skytemdev && mkdir /app && chown skytemdev:skytemdev /app && echo "export PS1='\$(whoami)@ [\$(pwd)]# '" >> /etc/bashrc
ENV PATH="${PATH}:/home/skytemdev/.local/bin"

# Folder creation
RUN mkdir -p /opt/plantuml
RUN chown skytemdev:skytemdev /opt/plantuml

WORKDIR /tmp
RUN wget https://www.python.org/ftp/python/3.10.7/Python-3.10.7.tgz
RUN tar xzf Python-3.10.7.tgz
WORKDIR /tmp/Python-3.10.7
RUN ./configure --enable-optimizations
RUN make altinstall
WORKDIR /tmp
RUN rm -rf Python-3.10.7
RUN rm Python-3.10.7.tgz

RUN update-alternatives --install /usr/bin/python python /usr/local/bin/python3.10 10
USER skytemdev

RUN python -m pip install --user sphinx==5.3.0
RUN python -m pip install --user sphinx-issues==3.0.1
RUN python -m pip install --user sphinxcontrib-log-cabinet==1.0.1
RUN python -m pip install --user sphinxcontrib-wavedrom==3.0.4
RUN python -m pip install --user sphinxcontrib-plantuml==0.24.1
RUN python -m pip install --user sphinx-tabs==3.4.1
RUN python -m pip install --user myst-parser==0.18.1

# *** Doxygen support ***
#RUN python -m pip install breathe==4.34.0
#WORKDIR /tmp
#RUN wget https://www.doxygen.nl/files/doxygen-1.9.6.linux.bin.tar.gz
#RUN tar xzf doxygen-1.9.6.linux.bin.tar.gz
#RUN mv doxygen-1.9.6 /opt/
#RUN rm doxygen-1.9.6.linux.bin.tar.gz
#ENV PATH="${PATH}:/opt/doxygen-1.9.6/bin"

# *** Plantuml support ***
WORKDIR /tmp
RUN wget http://sourceforge.net/projects/plantuml/files/plantuml-jar-mit-1.2022.14.zip/download
RUN unzip download
RUN rm download
RUN mv plantuml.jar /opt/plantuml

USER root
RUN apt-get update \
    && apt-get remove -y wget \
    unzip

RUN apt-get autoremove -y && apt-get clean -y

ENV TERM xterm-256color
USER skytemdev
