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
end
