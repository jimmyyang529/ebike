class Admin::ItemsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!  # 這個是 devise 提供的方法，先檢查必須登入
  before_action :authenticate_admin # 再檢查是否有權限
  before_action :set_item,  :only => [ :show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
	   @item = Item.new
   end

   def create
     @item = Item.new(item_params)
     if @item.save
       redirect_to :action => :index
       flash[:notice] = "item was successfully created"
     else
 		    render :action => :new
      end
    end

    def edit
    end

    def update
      if @item.update(item_params)
        redirect_to :action => :show, :id => @item
        flash[:notice] = "item was successfully updated"
      else
        render :action => :edit
      end
    end

    def show
    end

    def destroy
      @item.destroy
      redirect_to :action => :index
    end



protected

def item_params
  params.require(:item).permit(:name,
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
                                :permalink
                                )
end


end
