# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'mains#index'
  %i[categories category_attributes products].each do |resource|
    resources resource
  end
end
