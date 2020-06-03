# frozen_string_literal: true

require 'sinja'
require 'sinja/sequel'

Sequel::Model.plugin :whitelist_security

DB = Sequel.connect(ENV['DB_URL'] || 'postgres://postgres@localhost/thinknetica_ads_microservice')

require_relative 'models/ad'
require_relative 'serializers/ad_serializer'

class App < Sinatra::Base
  register Sinja
  register Sinja::Sequel

  resource :ads do
    index { Ad.dataset.order(:created_at).reverse }

    create { |attr| next_pk Ad.create(attr) }
  end

  freeze_jsonapi
end
