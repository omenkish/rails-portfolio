module PortfoliosHelper
  def image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end

  def portfolio_img(img, type)
    return img if img

    return image_generator(height: '225', width: '100%') if type == 'thumb'

    image_generator(height: '600', width: '400')
  end
end
