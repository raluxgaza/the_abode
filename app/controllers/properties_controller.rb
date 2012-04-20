class PropertiesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(params[:property])
  end

  def delete
  end

end
