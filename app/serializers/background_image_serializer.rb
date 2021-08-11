class BackgroundImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :background_image

  set_type :background_image
end
