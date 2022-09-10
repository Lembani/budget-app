class DealsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @deals = current_user.deals
  end

  def new
    @category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])
    @deal = @category.deals.build(deal_params)
    @deal.user = current_user
    if @deal.save
      flash[:notice] = 'Deal created successfully'
      redirect_to user_category_deals_path(current_user.id, @category.id)
    else
      flash[:alert] = 'Deal not created'
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @deal = Deal.find(params[:id])
    @deal.destroy
    redirect_to user_category_deals_path(current_user, @category)
  end

  private

  def deal_params
    params.require(:deal).permit(:name, :amount)
  end
end
