# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'mains#index'
  %i[categories].each do |resource|
    resources resource
  end
end
