class PropertiesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @property = Property.new
    @property.build_address
  end

  def create
    @property = Property.new(params[:property])
    if @property.save
      redirect_to root_path, :flash[:success] => "Property added successfully"
    else
      render 'new'
    end
  end

  def delete
  end

end
