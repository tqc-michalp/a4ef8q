# frozen_string_literal: true

class Category < ApplicationRecord
  has_closure_tree

  attr_reader :available_parents

  has_many :category_attributes
  has_many :products

  validates :name, presence: true
  validates :name, uniqueness: true
end
