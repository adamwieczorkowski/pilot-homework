FROM ruby:3.0.1

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs yarn

ENV BUNDLE_JOBS 2
ENV BUNDLE_PATH /bundle
ENV APP_DIR /app

RUN mkdir -p $APP_DIR

WORKDIR $APP_DIR
