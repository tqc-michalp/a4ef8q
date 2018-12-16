# frozen_string_literal: true

module ProductsHelper
  def product_specification(props)
    content_tag(:dl, class: 'row') do
      props.each do |key, value|
        content = content_tag(:dt, key, class: 'col-sm-3')
        content << content_tag(:dd, value, class: 'col-sm-9')
        concat content
      end
    end
  end
end
