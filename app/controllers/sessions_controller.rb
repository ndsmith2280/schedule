class SessionsController < ApplicationController
  # skip_before_action :set_current_user
  
  def user_params
    params.require(:user).permit(:user_id, :user_first_name, :user_last_name, :email, :password, :password_confirmation, :user_administrator, :user_priority, :user_phone_number)
  end
  
  def new
    # default: render 'new' template
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password]) && user.user_administrator == true
      cookies.permanent[:session_token]= user.session_token
      flash[:notice]= 'You Have Succesfully Logged in'
      redirect_to administrator_session_path(user) and return
    elsif user && user.authenticate(params[:session][:password]) && user.user_administrator == false
      cookies.permanent[:session_token]= user.session_token
      flash[:notice]= 'You Have Succesfully Logged in'
      redirect_to employee_session_path(user) and return
    elsif !user
      flash[:notice] = 'Invalid email'
      redirect_to login_path and return
    else !user
      flash[:notice] = 'Invalid password'
      redirect_to login_path and return
    end
  end
  
  def administrator
    id = params[:id]
    @user = User.find(id)
  end
  
  def employee
    id = params[:id]
    @user = User.find(id)
  end

  def destroy
    cookies.delete(:session_token) 
    @current_user=nil
    flash[:notice]= 'You have logged out'
    redirect_to new_session and return
  end
  
end