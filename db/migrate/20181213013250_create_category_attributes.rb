class CreateCategoryAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :category_attributes do |t|

      t.timestamps
    end
  end
end
