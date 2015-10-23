class HomeController < ApplicationController
  def index
    @categories = Category.all
    @entries = Entry.all
    render :index
  end
end