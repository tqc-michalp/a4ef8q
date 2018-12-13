# frozen_string_literal: true

class CreateCategoryAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :category_attributes do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
