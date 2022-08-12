class Authentication::SessionsController < ApplicationController
  skip_before_action :protect_pages

  def new
  end

  def create
    @user = User.find_by("email = :login OR username = :login", { login: params[:login] })

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to products_path, notice: t('.login')
    else
      redirect_to new_session_path, status: :unprocessable_entity, alert: t('.no_login')
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to products_path, alert: t('.destroyed')
  end
end