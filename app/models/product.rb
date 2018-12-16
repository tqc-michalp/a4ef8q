# frozen_string_literal: true

class Product < ApplicationRecord
  mount_uploader :picture, PictureUploader
  serialize :specification, Hash
  store_accessor :specification
  belongs_to :category
end
