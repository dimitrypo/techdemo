class StaticPagesController < ActionController::Base
  protect_from_forgery with: :exception
  layout "application"
  def home
    
  end

  def jualo
    render "static_pages/portfolio/jualo"
  end

  def testly
    render "static_pages/portfolio/testly"
  end  

end
