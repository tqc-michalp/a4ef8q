class CreateCategoryHierarchies < ActiveRecord::Migration[5.2]
  def change
    create_table :category_hierarchies do |t|

      t.timestamps
    end
  end
end
