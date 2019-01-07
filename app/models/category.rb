# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  parent_id  :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  has_closure_tree

  attr_reader :available_parents

  has_many :category_attributes
  has_many :products

  validates :name, presence: true
  validates :name, uniqueness: true
end
