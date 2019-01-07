# frozen_string_literal: true

# class HashJson < Virtus::Attribute
#   def coerce(value)
#     unless value.nil?
#       value.is_a?(::Hash) ? value : JSON.parse(value)
#     end
#   end
# end

class ProductForm
  include ActiveModel::Model

  # attribute :category, Integer
  # attribute :name, String
  # attribute :picture, String
  # attribute :specification, HashJson

  def initialize(product)
    retrive_attrs_from_categories(product).each do |attr|
      self.class.define_method("#{attr}=") do |val|
        instance_variable_set(
          "@#{attr}",
          assign_particular_attr(product, val)
        )
      end
    end
    super(product)
  end

  private

  def retrive_attrs_from_categories(source)
    harvested = []
    source.category.ancestors.each do |category|
      category.category_attributes.each do |category_attribute|
        harvested.push(category_attribute.name)
      end
    end
    harvested
  end

  def assign_particular_attr(source, val)
    source[val] ? val : nil
  end
end
