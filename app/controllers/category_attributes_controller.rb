# frozen_string_literal: true

class CategoryAttributesController < ApplicationController
  before_action :set_category_attribute, only: %i[edit update destroy]

  def index
    @category_attributes = CategoryAttribute.grouped_by_category
  end

  def new
    @category_attribute = CategoryAttribute.new
  end

  def edit; end

  def create
    @category_attribute = CategoryAttribute.new(category_attribute_params)

    if @category_attribute.save
      redirect_to category_attributes_url, flash: { success: 'Atrybut kategorii został utworzony' }
    else
      render :new, flash: { error: 'Atrybut kategorii nie został utworzony' }
    end
  end

  def update
    if @category_attribute.update(category_attribute_params)
      redirect_to category_attributes_url, flash: { success: 'Atrybut kategorii został zaktualizowany' }
    else
      render :edit
    end
  end

  def destroy
    @category_attribute.destroy
    redirect_to category_attributes_url, flash: { info: 'Atrybut kategorii zosta usunięty' }
  end

  private

  def set_category_attribute
    @category_attribute = CategoryAttribute.find(params[:id])
    @category_attribute.name_type.symbolize_keys!
    @category_attribute
  end

  def category_attribute_params
    params.require(:category_attribute).permit(:category_id, name_type: %i[name type])
  end
end
