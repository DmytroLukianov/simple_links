class HomeController < ApplicationController
  def index
    @tags = Tag.all
    @links = params[:tag].present? ? Link.all : Link.all
  end
end
