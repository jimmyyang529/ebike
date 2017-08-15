class BrandItemsController < ApplicationController
  before_action :find_brand

  def index
    @items = @brand.items
  end

  def show
    @item = @brand.items.find( params[:id] )
  end

 protected

 def find_brand
   @brand = Brand.find( params[:brand_id] )
 end

end
