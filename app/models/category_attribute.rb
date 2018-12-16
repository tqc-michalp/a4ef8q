# frozen_string_literal: true

class CategoryAttribute < ApplicationRecord
  belongs_to :category

  scope :grouped_by_category, -> { group(:category_id, :name, :id) }

  before_save :unification

  def unification
    self.name = name.parameterize.underscore
  end
end
