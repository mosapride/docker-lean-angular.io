FROM ubuntu:16.04

ENV NODE_VERSION v6.11.2
ENV NPM_VERSION v0.33.2


EXPOSE  3000 3001 8080
WORKDIR /root
ENV WK_DIR /root

RUN apt-get update && apt-get upgrade -y

# OPTION
RUN apt-get install curl vim git bzip2 -y

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/${NPM_VERSION}/install.sh | bash

# 色が見にくいから修正
## vimの色テーマの変更
RUN echo "colorscheme koehler" >> /root/.vimrc
## directoryの色を変更 青→緑
RUN dircolors -p > /root/.dircolors
RUN sed -i -e "s/DIR 01;34 # directory/DIR 01;32 # directory/g" /root/.dircolors


RUN git clone https://github.com/angular/angular.io.git
RUN export NVM_DIR="$HOME/.nvm"  && \
      [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  && \
      nvm install ${NODE_VERSION} && \
    cd ${WK_DIR}/angular.io/ && \
      npm install && \
      ./scripts/before-install.sh && \
      ./scripts/install.sh

