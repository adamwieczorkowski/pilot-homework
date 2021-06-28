FROM ruby:3.0.1
RUN apt-get update -qq && apt-get install -y nodejs

ENV BUNDLE_JOBS 2
ENV BUNDLE_PATH /bundle
ENV APP_DIR /app

RUN mkdir -p $APP_DIR

WORKDIR $APP_DIR
