# frozen_string_literal: true

# == Schema Information
#
# Table name: category_attributes
#
#  id          :bigint(8)        not null, primary key
#  category_id :bigint(8)
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CategoryAttribute < ApplicationRecord
  belongs_to :category

  scope :grouped_by_category, -> { group(:category_id, :name, :id) }

  enum data_type: %i[string boolean decimal integer]

  before_save :unification

  validates :name, :data_type, presence: true

  def unification
    self.name = name.parameterize.underscore
  end
end
