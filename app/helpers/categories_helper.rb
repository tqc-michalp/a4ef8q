# frozen_string_literal: true

module CategoriesHelper
  def show_parent_category(record)
    content_tag :ol do
      parent_category(record)
    end
  end

  def parent_category(record)
    return if record.parent.nil?
    concat content_tag(:li, record.name)
    parent_category(record.parent)
  end

  def disabled(record)
    'disabled' if root_cat_record?(record)
  end

  def root_cat_record?(record)
    record.name == 'Root'
  end

  def deepest_categories_list
    result = []
    Category.all.each do |cat|
      next unless cat.children.empty?

      result.push [cat.name, cat.id]
    end
    result
  end

  def build_category_tree
    cat_root = Category.find_by(name: 'Root')
    content_tag(:div, class: 'nav nav-pills flex-column') do
      harvesting_branches(cat_root)
    end
  end

  private

  def harvesting_branches(input_category)
    input_category.children.each do |child|
      concat link_to(
        child.name.to_s,
        mains_products_search_path(child.id), class: 'nav-link', remote: true
      )
      harvesting_branches(child) if child.children.present?
    end
  end
end
