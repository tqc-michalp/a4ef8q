# frozen_string_literal: true

class CreateCategoryAttributes < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :category_attributes do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.hstore :name_type

      t.timestamps
    end
  end
end
