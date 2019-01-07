# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy]
  before_action :prevent_modify_root_cat, only: %i[edit update destroy]

  def index
    @categories = Category.order(:created_at)
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    # parent = Category.find(category_params[:available_parents])
    # if parent.children.create(name: category_params[:name])
    category = Category.new(category_params)
    if category.save
      redirect_to categories_url, flash: { success: 'Kategoria utworzona' }
    else
      render :new, flash: { error: 'Kategoria nie została utworzona' }
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_url, flash: { success: 'Kategoria zaktualizowana' }
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, flash: { info: 'Kategoria usunięta' }
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end

  def prevent_modify_root_cat
    if set_category.name == 'Root'
      redirect_to categories_url, flash: { warning: 'Nie można edytować: Root' }
    end
  end
end
