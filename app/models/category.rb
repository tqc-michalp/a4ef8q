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

  attr_reader :available_parents

  belongs_to :parent, class_name: 'Category'
  has_many :children, class_name: 'Category', foreign_key: "parent_id"
  has_many :category_attributes
  has_many :products

  validates :name, presence: true
  validates :name, uniqueness: true

end
