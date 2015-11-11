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
      entry_date: params['entry_date']
    )
    redirect_to '/'
  end

  def update
    e = Entry.find( params[:id] )

    e.update({
      starttime: params['starttime'],
      endtime: params['endtime'],
      category_id: params['category_id'],
      entry_date: params['entry_date']
    })

    redirect_to request.referrer
  end

  def destroy
    e = Entry.find( params[:id] )
    e.destroy

    redirect_to request.referrer
  end


end