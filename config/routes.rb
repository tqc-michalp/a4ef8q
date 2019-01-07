# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'mains#index'
  get '/search/:category_id', to: 'mains#search', as: :mains_products_search
  scope :set do
    %i[categories category_attributes products].each do |resource|
      resources resource, except: :show
    end
  end
end
