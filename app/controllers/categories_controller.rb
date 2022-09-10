class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.includes(:deals).all
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to user_categories_path(current_user.id)
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @deals = @category.deals
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = 'Category updated successfully'
      redirect_to user_categories_path(current_user.id)
    else
      render :edit
    end
  end

  def default_category
    name = params[:name]
    icon = params[:icon] + params[:format]
    @category = current_user.categories.new(name:, icon:)
    if @category.save
      redirect_to user_categories_path(current_user.id)
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to user_categories_path(current_user.id)
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon, :icon_cache)
  end
end
