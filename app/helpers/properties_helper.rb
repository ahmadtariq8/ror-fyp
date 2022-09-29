module PropertiesHelper

  def property_thumbnail property
    img = property.photo.present? ? property.photo.thumb.url : "logo.jpg"
    image_tag img, class: "property-thumb"
  end

  def property_photo_url property
    property.photo.present? ? property.photo.url : asset_url("logo.jpg")
  end

end
