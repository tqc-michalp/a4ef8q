# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :parent_id
      t.string :name, index: true

      t.timestamps
    end
  end
end
