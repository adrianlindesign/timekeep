class CategoriesController < ApplicationController

  def index
    c = Category.all

    respond_to do |format|
      format.json {render :json => c}
    end
  end

  def create
    # binding.pry
    c = Category.create(
      name: params['name'],
      user_id: params['user_id'],
      icon: params['icon']
    )

    redirect_to '/'
  end

  def show
    c = Category.find( params[:id] )

    respond_to do |format|
      format.json {render :json => c}
    end
  end

  def destroy
    c = Category.find( params[:id] )
    c.destroy
  end

end