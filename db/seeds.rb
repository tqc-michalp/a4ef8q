# frozen_string_literal: true

def seed_categories
  root = Category.new(name: 'Root')
  root.save(validate: false)
  %w[Samochód Telefony].each do |name|
    create_category(root.id, name)
  end
  %w[Osobowe Ciężarowe].each do |name|
    create_category(
      Category.find_by(name: 'Samochód').id,
      name
    )
  end
  %w[BMW Honda Opel Volvo].each do |name|
    create_category(
      Category.find_by(name: 'Osobowe').id,
      name
    )
  end
  %w[Apple Samsung Huawei].each do |name|
    create_category(
      Category.find_by(name: 'Telefony').id,
      name
    )
  end
end

def create_category(cat_parent_id, name)
  Category.create(
    parent_id: cat_parent_id,
    name: name
  ).id
end

def root_price_attr
  CategoryAttribute.create(
    category_id: Category.find_by(name: 'Root').id,
    name: 'cena'
  )
end

unless Category.find_by(name: 'Root')
  seed_categories
  root_price_attr
end
