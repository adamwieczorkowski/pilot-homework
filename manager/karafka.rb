# frozen_string_literal: true

# Ruby on Rails setup
ENV["RAILS_ENV"] ||= "development"
ENV["KARAFKA_ENV"] = ENV["RAILS_ENV"]
require ::File.expand_path("../config/environment", __FILE__)
Rails.application.eager_load!

class KarafkaApp < Karafka::App
  setup do |config|
    config.kafka.seed_brokers = %w(kafka://kafka:9092)
    config.kafka.start_from_beginning = false
    config.client_id = "manager_app"
    config.backend = :inline
    config.batch_fetching = true
    config.batch_consuming = false
    config.logger = Logger.new(STDOUT, level: :info)
  end

  consumer_groups.draw do
    topic :payments do
      consumer PaymentsConsumer
    end
  end
end

KarafkaApp.boot!
