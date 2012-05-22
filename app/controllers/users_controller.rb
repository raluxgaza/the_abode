class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index]

  def index
    @users = User.find(:all)
    @title = "All users"
  end

  def new
    @user = User.new
    @title = "Sign up"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to root_path, :flash => { :success => "Welcome to The Abode" }
    else
      @title = "Sign up"
      render 'new'
    end
  end

end
