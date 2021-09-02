class CategoriesController < ActionController::Base
  
  layout "application"

  before_action :set_category, only: :show  

  def show   
    @posts = Post.where(category_id: [@category.id])   
  end  

  private

  def set_category
    @category = Category.find(params[:id]) 
  end        
     
end