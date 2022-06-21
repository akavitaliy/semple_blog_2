class Admin::CategoriesController < Admin::AdminController
 
  layout "application"

  before_action :authenticate_user!
  before_action :set_category, only: [:edit, :update, :destroy]

  def index  
    @categories = Category.all
  end  

  def new
    @category = Category.new
    @categories = Category.all.order(:name)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
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
      redirect_to admin_categories_path  
      flash[:success] = 'Категория обнавлена!'
    else
      @categories = Category.where("id != #{@category.id}").order(:name)
      flash[:danger] = 'Категория не обнавлена!'
      render :edit 
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path  
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