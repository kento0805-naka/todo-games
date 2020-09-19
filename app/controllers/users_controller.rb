class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show]
  before_action :correct_user
    
  def show
    @user = User.find_by(id: params[:id])
  end
end
