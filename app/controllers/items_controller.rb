class ItemsController < ApplicationController

  def add_to_cart
    @item = Item.find(params[:id])
    current_cart.add_cart_item(@item)
    redirect_to root_path
  end




  def index
    @items = Item.all
  end

  #POST /items/bulk_compare
  def bulk_compare
    ids = Array( params[:ids])
    items = ids.map{ |i| Item.find_by_id(i) }.compact
    if params[:commit] == "Compare"
      redir
    end
  end







end
