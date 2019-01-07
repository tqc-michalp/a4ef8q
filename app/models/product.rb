# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id            :bigint(8)        not null, primary key
#  category_id   :bigint(8)
#  name          :string
#  picture       :string
#  specification :jsonb
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#


class Product < ApplicationRecord
  mount_uploader :picture, PictureUploader
  # serialize :specification, JSON
  store_accessor :specification
  belongs_to :category

  def self.search_contains_category(cat_id)
    where(category_id: [cat_id, Category.find(cat_id).child_ids].flatten)
  end

  def product_attributes; end
end
