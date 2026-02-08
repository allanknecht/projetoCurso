class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def index
    @categories = Category.paginate(page: params[:page])
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: "Category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "You must be an admin to perform that action"
      redirect_to categories_path
    end
  end
end
