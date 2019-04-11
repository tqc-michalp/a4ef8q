# frozen_string_literal: true

def seed_categories
  root = Category.new(name: 'Root')
  root.save(validate: false)

  %w[Samochody Telefony].each { |name| create_category(root.id, name) }
  %w[Osobowe Ciężarowe].each { |name| create_category(Category.find_by(name: 'Samochody').id, name) }
  %w[BMW Honda Mercedes Opel].each { |name| create_category(Category.find_by(name: 'Osobowe').id, name) }
  %w[Apple Samsung LG].each { |name| create_category(Category.find_by(name: 'Telefony').id, name) }
end

def create_category(cat_parent_id, name)
  Category.create(
    parent_id: cat_parent_id,
    name: name
  )
end


def seed_categories_attributes
  cat_id_root = Category.find_by(name: 'Root').id
  CategoryAttribute.create(
    category_id: cat_id_root,
    name: 'cena',
    data_type: 2
  )
  CategoryAttribute.create(
    category_id: cat_id_root,
    name: 'używany',
    data_type: 1
  )

  cat_id_osobowe = Category.find_by(name: 'Samochody').id
  [['rocznik', 3], ['przebieg', 3]].each do |item|
    CategoryAttribute.create(
      category_id: cat_id_osobowe,
      name: item[0],
      data_type: item[1]
    )
  end

  cat_id_telefony = Category.find_by(name: 'Telefony').id
  [['wersja', 3], ['system operacyjny', 0]].each do |item|
    CategoryAttribute.create(
      category_id: cat_id_telefony,
      name: item[0],
      data_type: item[1]
    )
  end
end

def create_cars
  cat_id_bmw = Category.find_by(name: 'BMW').id
  cat_id_honda =  Category.find_by(name: 'Honda').id
  cat_id_mercedes = Category.find_by(name: 'Mercedes').id
  cat_id_opel = Category.find_by(name: 'Opel').id
  cat_id_ciezarowe = Category.find_by(name: 'Ciężarowe').id

  ['M3 E92', 'BMW M4', 'BMW M6', 'M3 E46'].each do |car|
    Product.create(
      category_id: cat_id_bmw,
      name: car
    )
  end

  ['Honda NSX', 'Civic Type R'].each do |car|
    Product.create(
      category_id: cat_id_honda,
      name: car
    )
  end

  ['Mercedes A45 AMG', 'Mercedes C63 AMG', 'Mercedes SLR AMG'].each do |car|
    Product.create(
      category_id: cat_id_mercedes,
      name: car
    )
  end

  ['Astra OPC', 'Corsa OPC', 'Vectra OPC'].each do |car|
    Product.create(
      category_id: cat_id_opel,
      name: car
    )
  end

  ['Tatra'].each do |car|
    Product.create(
      category_id: cat_id_ciezarowe,
      name: car
    )
  end
end

def create_cellphones
  cat_id_apple = Category.find_by(name: 'Apple').id
  ['iPhone 6s', 'iPhone X', 'iPhone 4s'].each do |cellphone|
    Product.create(
      category_id: cat_id_apple,
      name: cellphone
    )
  end

  cat_id_lg = Category.find_by(name: 'LG').id
  ['Lg G7 Thinq'].each do |cellphone|
    Product.create(
      category_id: cat_id_lg,
      name: cellphone
    )
  end

  cat_id_samsung = Category.find_by(name: 'Samsung').id
  ['Samsung Galaxy S9'].each do |cellphone|
    Product.create(
      category_id: cat_id_samsung,
      name: cellphone
    )
  end
end

def create_products
  create_cars
  create_cellphones
end

unless Category.find_by(name: 'Root')
  seed_categories
  seed_categories_attributes
  create_products
end
