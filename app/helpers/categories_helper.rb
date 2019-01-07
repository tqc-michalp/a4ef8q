# frozen_string_literal: true

module CategoriesHelper
  def parent_categories(record)
    content_tag :ol do
      record.ancestry_path[0..-2].each do |anc|
        concat content_tag(:li, anc)
      end
    end
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
      next unless cat.leaf?

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
