class EntriesController < ApplicationController

  def index
    e = Entry.all

    respond_to do |format|
      format.json {render :json => e}
    end
  end

  def create
    e = Entry.create(
      name: params['name'],
      category_id: params['category_id'],
      
    )
  end

end