require 'RMagick'
include Magick

class LogoController < ApplicationController

  def index

  end

  def image1
    list = ImageList.new("public/images/image.png")
    image = list.first
    image = image.color_floodfill(0, 0, get_fill_color)
    image = image.color_floodfill(31, 31, get_fill_color)
    render :text => image.to_blob    
  end

  protected

  def get_fill_color 
    red = rand(255)
    blue = rand(255)
    green = rand(255)
    Magick::Pixel.from_color("rgb(#{red}, #{blue}, #{green})")
  end

end
