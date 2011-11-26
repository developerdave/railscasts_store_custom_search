class ProductsController < ApplicationController

  def index
    @products = Product.search(params[:search])
  end

  def list
    @products = Product.select("distinct name").order(:name).where("name like ?", "%#{params[:term]}%")
    render :json => @products.map(&:name)
  end
end
