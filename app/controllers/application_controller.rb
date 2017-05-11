class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  session[:cart_id] = @cart.id



  helper_method :current_item




  def current_item
    return @item if @item

  end



end
