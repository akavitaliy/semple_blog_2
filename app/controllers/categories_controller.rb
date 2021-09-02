class CategoriesController < ActionController::Base
  before_action :authenticate_user!, except: :show

  layout "application"

  before_action :set_category, only: [:show, :edit, :update, :destroy ]

  def index  
    @categories = Category.all
  end

  def show   
    @posts = Post.where(category_id: [@category.id])         
  end

  def new
    @category = Category.new
    @categories = Category.all.order(:name)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path 
      flash[:success] = 'Категория создана!'
    else
      @categories = Category.all.order(:name)
      flash[:danger] = 'Категория не создана!'
      render :new
    end
  end

  def edit  
    @categories = Category.where("id != #{@category.id}").order(:name)  
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path  
      flash[:success] = 'Категория обнавлена!'
    else
      @categories = Category.where("id != #{@category.id}").order(:name)
      flash[:danger] = 'Категория не обнавлена!'
      render :edit 
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path  
    flash[:success] = 'Категория удалена!'
  end

  private

  def set_category
    @category = Category.find(params[:id]) 
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
      
     
end