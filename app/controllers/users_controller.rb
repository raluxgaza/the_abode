class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :the_current_user, :only => [:edit, :update]

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

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def edit
    @title = "Edit users"
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to @user, :flash => { :success => "Profile updated." }
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  private

  def the_current_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

end
