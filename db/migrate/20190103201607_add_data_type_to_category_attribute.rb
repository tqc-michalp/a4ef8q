# frozen_string_literal: true

class AddDataTypeToCategoryAttribute < ActiveRecord::Migration[5.2]
  def up
    add_column :category_attributes, :data_type, :integer, default: 0
  end

  def down
    remove_column :category_attributes, :data_type
  end
end
