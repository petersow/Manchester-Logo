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

  def manchester_logo
    list = ImageList.new("public/images/manchester_logo.png")
    image = list.first
    color_1 = get_fill_color
    color_2 = get_fill_color

    image = image.color_floodfill(100, 100, color_1)
    #M
    image = image.color_floodfill(180, 1246, color_1)
    #a
    image = image.color_floodfill(300, 1230, color_1)
    #n
    image = image.color_floodfill(380, 1200, color_1)
    #c
    image = image.color_floodfill(420, 1250, color_1)
    #h
    image = image.color_floodfill(490, 1250, color_1)
    #e
    image = image.color_floodfill(567, 1230, color_1)
    #s
    image = image.color_floodfill(650, 1230, color_1)
    #t
    image = image.color_floodfill(700, 1230, color_1)
    #e
    image = image.color_floodfill(750, 1230, color_1)
    #r
    image = image.color_floodfill(820, 1230, color_1)

    image = image.color_floodfill(5, 5, color_2)
    image = image.color_floodfill(279, 1248, color_2)
    image = image.color_floodfill(588, 1219, color_2)
    image = image.color_floodfill(766, 1216, color_2)

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
