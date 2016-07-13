class StaticPagesController < ActionController::Base
  protect_from_forgery with: :exception
  layout "application"
  def home
    
  end

end
