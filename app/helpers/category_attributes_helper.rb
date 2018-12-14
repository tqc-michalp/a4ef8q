# frozen_string_literal: true

module CategoryAttributesHelper
  def cat_attr_data_type_humanized(val)
    CategoryAttribute.types.key(val.to_i)
  end
end
