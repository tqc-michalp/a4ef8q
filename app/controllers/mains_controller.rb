# frozen_string_literal: true

class MainsController < ApplicationController
  def index
    @products = Product.all
  end

  def search
    @products = Product.search_contains_category(params[:category_id])
    puts params
    p params
  end
end
