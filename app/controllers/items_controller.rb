class ItemsController < ApplicationController

  def add_to_cart
    @item = Item.find(params[:id])
    current_cart.add_cart_item(@item)
    redirect_to root_path
    # respond_to do |format|
    #   format.js
    # end
  end

  def show
    @item = Item.find(params[:id])
  end




  def index
    @items = Item.page(params[:page]).per(5)
  end

  #POST /items/bulk_compare
  def bulk_compare
    ids = Array( params[:ids])
    items = ids.map{ |i| Item.find_by_id(i) }.compact
    if params[:commit] == "Compare"
      items.each{ |e| e.update( :is_check => "true" ) }
    end

    @items = Item.where(:is_check => "true")



  end


  private

	def item_params
 		params.require(:item).permit(
 								:name,
                :img_url,
                :manufacture_year,
                :frame,
                :fork,
                :size,
                :color,
                :price,
                :description,
                :brand_id,
                :category_id,
                :is_check,
 								:ids => []
 								)
	end






end
