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

end