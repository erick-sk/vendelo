class Authentication::SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by("email = :login OR username = :login", { login: params[:login] })

    if @user&.authenticate(params[:password])
      redirect_to products_path, notice: t('.login')
    else
      redirect_to new_session_path, status: :unprocessable_entity, alert: t('.no_login')
    end
  end
end