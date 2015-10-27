class UsersController < ApplicationController
  
  def create
    u = User.create(
      email: params['email'],
      password: params['password'] # HAS TO BE password, not password_digest
    )

    redirect_to '/'
  end

  def show
    u = User.find( params[:id] )

    respond_to do |format|
      format.json { render :json => u}
    end
  end

  def new
    render :signup
  end

  def analyses
    

    categories_activerecord_relation = Category.where(user_id: params[:id])

    @data_hash = {}

    categories_activerecord_relation.each do |cat|
      category_id = cat['id']
      # add category details
      @data_hash[ cat[:name] ] = {
        id: category_id,
        icon: cat['icon'],
        entries: []
      }

      entries = Entry.where(category_id: category_id)
      # add entry details

      entries.each do |ent|
        entry_data = {
          starttime: ent.starttime,
          endtime: ent.endtime,
          entry_date: ent.entry_date,
          entry_id: ent.id
        }

        @data_hash[ cat[:name] ][:entries] << entry_data

        
      end
      
    end




    render :analyses
  end
end