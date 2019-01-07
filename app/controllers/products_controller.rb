# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit update destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    @product_attributes = load_category_attributes(@product)
  end

  def create
    product = if product_params[:specification].nil?
                Product.new(product_params)
              else
                parse_included_specification
              end
    if product.save
      redirect_to products_url, flash:
       { success:
         'Produkt został utworzony. Przejdź do edycji by dodać atrybuty' }
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to products_url, flash:
      { success:
        'Produkt został zaktualizowany' }
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, flash: { info: 'Produkt został usunięty' }
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def load_category_attributes(val)
    harvested = {}
    val.category.ancestors.each do |category_item|
      category_item.category_attributes.each do |category_attribute|
        harvested[category_attribute.name] = category_attribute.data_type.to_sym
      end
    end
    harvested
  end

  def product_params
    params
      .require(:product)
      .permit(:category_id, :name, :picture, :picture_cache, specification: {})
  end

  def parse_included_specification; end
end
