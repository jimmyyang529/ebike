class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # 注意這裡的位置是 Application Controller,
  # 由於 Cookie/Session 和瀏覽器有關,方法必須放在 controller 裡
  # 另外,在 View 裡呼叫 Controller 方法時,必須使用 helper_method
  helper_method :current_cart




protected

  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = "Not allow!"
      redirect_to root_path
    end
  end

  def current_cart
    @cart || set_cart
    # 如果 @cart 存在就回傳 @cart,否則呼叫 set_cart方法
  end

  def set_cart
    # 根據 session 來搜尋特定 Cart
    if session[:cart_id]
      @cart = Cart.find_by_id(session[:cart_id])
      return @cart if @cart
    end

    @cart ||= Cart.create
    # if session[:cart_id] exist,@cart will return True
    # or if session[:cart_id] doesn’t exist, @cart will return nil,so that we run @cart = Cart.create
    # 注意我們不使用 if..else.. 因為無論遇到任何情況,只要 @cart = nil,在這裡都能完成賦值

    session[:cart_id] = @cart.id
    return @cart
  end


end
