# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.string :name, index: true
      t.jsonb :payload

      t.timestamps
    end
  end
end
