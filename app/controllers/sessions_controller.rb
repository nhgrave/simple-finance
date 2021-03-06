class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :redirect_if_authenticated, only: [ :create, :new ]

  layout "public"

  def new
  end

  def create
    @user = User.find_by email: params[:user][:email].downcase

    if @user
      if @user.authenticate params[:user][:password]
        login @user

        redirect_to root_path, notice: "Signed in."
      else
        flash.now[:alert] = "Incorrect email or password."

        render :new, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = "Incorrect email or password."

      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout

    redirect_to root_path, notice: "Signed out."
  end

end
