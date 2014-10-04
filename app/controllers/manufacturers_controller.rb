class ManufacturersController < ApplicationController
  def index
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new

  end
end
