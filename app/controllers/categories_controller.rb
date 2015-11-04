class CategoriesController < ApplicationController

  def index
    c = Category.all

    respond_to do |format|
      format.json {render :json => c}
    end
  end

  def create
    binding.pry
    user_categories = Category.where( {user_id: params['user_id']} ) 
    same_category = user_categories.find_by( {name: params['name']} )

    if same_category  # if category with same user_id and name exists, update icon
      same_category.update( {icon: params['icon']} )  #TODO: make it UPDATEABLE!!!!!!!!!!!!!!
      puts 'Category icon updated'
    else #if category with same user_id and name doesn't exist, create new
      c = Category.create(
        name: params['name'],
        user_id: params['user_id'],
        icon: params['icon']
      )
    end

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

  def update

  end

end