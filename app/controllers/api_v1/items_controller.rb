class ApiV1::ItemsController < ApiController
  #get
  def index
    @items = Item.all
    render :json => @items.to_json
  end

  
end
