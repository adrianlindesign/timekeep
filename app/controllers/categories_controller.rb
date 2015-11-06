class CategoriesController < ApplicationController

  def index
    c = Category.all

    respond_to do |format|
      format.json {render :json => c}
    end
  end

  def create
    user_categories = Category.where( {user_id: params['user_id']} ) 
    same_category_name = user_categories.find_by( {name: params['name']} )

    if same_category_name  # if category with same user_id and name exists, update icon
      same_category_name.update( {
          icon: params['icon'],  
          color: params['color']
      })  
      puts 'Category icon updated'
    else #if category with same user_id and name doesn't exist, create new
      c = Category.create(
        name: params['name'],
        user_id: params['user_id'],
        icon: params['icon'],
        color: params['color']
      )
    end

    redirect_to request.referrer
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

    redirect_to request.referrer
  end

  def update
    user_categories = Category.where( {user_id: params['user_id']} ) 
    same_category_name = user_categories.find_by( {name: params['name']} )
   
    unless same_category_name
      c = Category.find( params[:id] )
      c.update({
        name: params['name'],
        icon: params['icon'],
        color: params['color']
      })
    end
    

    redirect_to request.referrer
  end

end