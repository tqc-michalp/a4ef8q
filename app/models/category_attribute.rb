# frozen_string_literal: true

class CategoryAttribute < ApplicationRecord
  belongs_to :category
  store_accessor :name_type

  enum type: %i[string integer object array boolean null]

  scope :grouped_by_category, -> { group(:category_id, :id) }
end
