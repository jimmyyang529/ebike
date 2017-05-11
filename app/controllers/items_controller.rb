class ItemsController < ApplicationController
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
