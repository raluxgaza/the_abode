class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
    @property.build_address
  end

  def create
    @property = Property.new(params[:property])
    if @property.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def delete
  end

end
