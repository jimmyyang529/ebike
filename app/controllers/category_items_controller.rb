class CategoryItemsController < ApplicationController
  before_action :find_category
  def index
    @items = @category.items
  end
  def show
    @item = @category.items.find( params[:id] )
  end

  protected

  def find_category
    @category = Category.find( params[:category_id] )
  end


end
