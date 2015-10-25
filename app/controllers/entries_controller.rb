class EntriesController < ApplicationController

  def index
    e = Entry.all

    respond_to do |format|
      format.json {render :json => e}
    end
  end

  def create

    e = Entry.create(
      category_id: params['category_id'],
      starttime: params['starttime'],
      endtime: params['endtime'],
      created_at: Time.now.strftime("%d/%m/%Y")
    )
    redirect_to '/'
  end



end