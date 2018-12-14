# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'mains#index'
  %i[categories category_attributes].each do |resource|
    resources resource, except: :show
  end
  resources :products
end
