class PropertiesController < ApplicationController
  before_filter :current_property, :only => [:show, :edit, :update]

  def index
    @properties = Property.all
  end

  def show
    current_property
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

  def edit
  end

  def update
    if @property.update_attributes(params[:property])
      redirect_to property_path(@property)
    else
      render 'edit'
    end
  end

  def delete
  end

  private

  def current_property
    @property = Property.find(params[:id])
  end
end
