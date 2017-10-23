class UsersController < ApplicationController

  skip_before_action :require_login, only: :create
  before_action :user_authorization, except: [:temporary, :create]

  def create
    user = User.create(user_params)

    if user.errors.any?
      flash[:errors] = user.errors.full_messages
      redirect_to "/sessions/new"
    else
      session[:user_id] = user.id
      redirect_to "/put_main_index_path_here"
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    user = User.find(current_user)
    user.assign_attributes(user_params)

    if user.changed?
      if user.save
        #change this line
        redirect_to "/put_main_index_path_here"
      else
        flash[:errors] = user.errors.full_messages
        redirect_to "/users/#{user.id}/edit"
      end
    else
      flash[:errors] = ["No fields were changed."]
      redirect_to "/users/#{user.id}/edit"
    end
  end

  def delete
  end

  def destroy

  end

  def temporary
    #temporary method. Delete when added to project.
  end

  private

  def user_authorization
    unless current_user.id == params[:user_id].to_i
      puts '$$$$$$$$$$$$$$$$$$$'
      redirect_to "/users/#{current_user.id}"
      flash[:errors] = ["You do not have authorization to see information for that account."]
    end
  end

  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
  end
end
