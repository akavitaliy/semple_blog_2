class CategoriesController < ActionController::Base

  layout "application"

  before_action :set_category, only: [:show, :edit, :update, :destroy ]

  def index  
    @categories = Category.all
  end

  def show            
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, success: 'Категория успешно создана!'
    else
      flash[:danger] = 'Категория не создана!'
      render :new
    end
  end

  def edit    
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, success: 'Категория обнавлена'
    else
      flash[:danger] = 'Категория не обнавлена!'
      render :edit 
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, success: 'Статья удалена!'
  end

  private

  def set_category
    @category = Category.find(params[:id]) 
  end

  def category_params
    params.require(:category).permit(:name)
  end
      
     
end