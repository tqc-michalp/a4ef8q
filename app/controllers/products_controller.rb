# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    @product = load_product
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
    @product = load_product
    if @product.update(product_params)
      redirect_to products_url, flash:
      { success:
        'Produkt został zaktualizowany' }
    else
      render :edit
    end
  end

  def destroy
    @product = load_product
    @product.destroy
    redirect_to products_url, flash: { info: 'Produkt został usunięty' }
  end

  private

  def load_product
    Product.find(params[:id])
  end

  def load_category_attributes(product)
    harvested = {}
    base_category = product.category
    parent_category = lambda do |category|
      category.category_attributes.each do |ca|
        harvested[ca.name] = ca.data_type.to_sym
      end
      return if category.parent.nil?

      parent_category.(category.parent)
    end
    parent_category.call(base_category)
    harvested
  end

  def product_params
    params
      .require(:product)
      .permit(:category_id, :name, :picture, :picture_cache, specification: {})
  end

  def parse_included_specification; end
end
